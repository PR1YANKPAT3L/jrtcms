package com.jrtcms.web.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.HasAttributeFilter;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.visitors.HtmlPage;

import com.jrtcms.web.pojo.CP_Drawalottery;
import com.jrtcms.web.service.CP_DrawalotteryService;

/**
 * 抓去外站数据的工具类
 * @author 鞠牧
 *
 */
public class HtmlCore {
	public static  CP_DrawalotteryService cp_drawalotteryService = null;

	public CP_DrawalotteryService getDrawalotteryService() {
		return cp_drawalotteryService;
	}

	public void setDrawalotteryService(CP_DrawalotteryService drawalotteryService) {
		cp_drawalotteryService = drawalotteryService;
	}

	/**
	 * 通过传入的URL地址，获取地址中指定期号的记录，此方法目前只针对500万地址
	 * @param url 例如 http://datachart.500wan.com/sd/history/inc/history.php 为3D的地址
	 * @param batchCode 要查询的期号 目前只支持最近30期以内
	 * @return 返回值是一个MAP 对照传入的URL对应的页面的开奖记录的tr td 的顺序 进行获取，tr td 的顺序作为MAP 的KEY
	 */
	@SuppressWarnings({"unchecked" })
	public static Map getHtmlCoreSplit(String url , String batchCode){
		Map reMap = new HashMap();
		
		String htmlcode = getHtmlString(url,"GBK");
			
		Parser parser = Parser.createParser(htmlcode, "GBK"); 
		HtmlPage page = new HtmlPage(parser); 
		try{ parser.visitAllNodesWith(page);}
		catch (ParserException e1)
		{ e1 = null;}
		NodeList nodelist = page.getBody();
		NodeFilter filter = new HasAttributeFilter( "class", "t_tr1" );
		nodelist = nodelist.extractAllNodesThatMatch(filter, true);
		for (int i = 0; i < nodelist.size(); i++){
		Node link= nodelist.elementAt(i);
			if(link.getChildren().toHtml().indexOf(">"+batchCode+"</td>")>=0
				||link.getChildren().toHtml().indexOf(">"+batchCode.substring(batchCode.length()-5,batchCode.length())+"</td>")>=0){
				NodeList tdlist = link.getChildren();
				for (int j = 0; j < tdlist.size(); j++){
					Node td= tdlist.elementAt(j);
					reMap.put(j, td.toPlainTextString());
				//	System.out.println(td.toPlainTextString() + "\n"); 
				}
				break;
			}
		}
	
		return reMap;
	}
	
	/**
	 * 通过传入的URL地址，获取okooo的走势图表中的开奖走势
	 * @param url 例如 http://www.okooo.com/Lottery06/SSQ7LC/index.php?LotteryType=7LC 为7乐彩的地址
	 * @param batchCode 要查询的期号 目前只支持最近30期以内
	 * @return 返回值是一个存有Map的List 每个Map 为一条开奖 对照传入的URL对应的页面的走势图的tr td 的顺序 进行获取，tr td 的顺序作为MAP 的KEY
	 */
	@SuppressWarnings({"unchecked" })
	public static List <Map<String,String>> getChartHtmlCoreSplitForOkooo(String url){
		List <Map<String,String>> reList = new ArrayList();
		
		String htmlcode = getHtmlString(url,"GBK");
		htmlcode = htmlcode.replaceAll("\\t","");
			
		Parser parser = Parser.createParser(htmlcode, "GBK"); 
		HtmlPage page = new HtmlPage(parser); 
		try{ parser.visitAllNodesWith(page);}
		catch (ParserException e1){ e1 = null;}
		
		NodeList nodelist = page.getBody();
		NodeFilter filter = new HasAttributeFilter( "id", "s2" );
		nodelist = nodelist.extractAllNodesThatMatch(filter, true);
		
		if(nodelist.size()>0){
			Node chartTable = nodelist.elementAt(0);
			NodeList chartTrList = chartTable.getChildren();
			NodeFilter filterTr = new TagNameFilter( "tr" );
			chartTrList = chartTrList.extractAllNodesThatMatch(filterTr, true);
			
			//循环tr列表
			for (int i = 0; i < chartTrList.size(); i++){
				Map lineMap = new HashMap();
				Node tr= chartTrList.elementAt(i);
				//获取所有没有样式的TR标签
				
				if(tr.toHtml().indexOf("<tr>")>=0){
					NodeList tdlist = tr.getChildren();
					
					for (int j = 0; j < tdlist.size(); j++){
						Node td= tdlist.elementAt(j);
						lineMap.put(j, td.toPlainTextString());
//					//	System.out.println(td.toPlainTextString() + "\n"); 
					}
					
					NodeFilter filterSpan = new TagNameFilter( "span" );
					NodeList spanlist = tr.getChildren().extractAllNodesThatMatch(filterSpan, true);
					for (int j = 0; j < spanlist.size(); j++){
						Node span= spanlist.elementAt(j);
						if(span.toHtml().indexOf("class=\"font_red\"")>=0){
							lineMap.put("font_red", span.toPlainTextString());
						}else if(span.toHtml().indexOf("class=\"font_blue\"")>=0){
							lineMap.put("font_blue", span.toPlainTextString());
						}
					}
					
					reList.add(lineMap);
					//System.out.println("line:"+lineMap);
				}
			}
			
		}
		
		return reList;
	}
	
	
	/**
	 * 获取指定URL的页面源代码
	 * @param url 要获取的URL的地址
	 * @return
	 */
	@SuppressWarnings("finally")
	private static String getHtmlString(String url,String bianma){
		HttpURLConnection huc = null; // 创建url连接对象
		BufferedReader bufferedReader = null; // 创建文件读对象
		String htmlcode = "";
		try {
			huc = (HttpURLConnection) new URL(url).openConnection();
		
			huc.connect();// 载入页面
			
			InputStream stream = huc.getInputStream();// 创建输入流
			/* 判断路径是否存在 不存在就自动创建 end*/
			bufferedReader = new BufferedReader(new InputStreamReader(stream, bianma));// 获取输入流
			String line;
			while ((line = bufferedReader.readLine()) != null) {
				if (line.trim().length() > 0) {
					htmlcode += line;// 把输入流写到目标文件
				}
			}
			//System.out.println("over..."); 
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			try {
				bufferedReader.close();// 关闭读状态
				huc.disconnect();// 关闭连接
			} catch (IOException e) {}
			
			return htmlcode;
		}
		
	}
	
	/**
	 * http://wap.500wan.com/info/prize/prize_open?flag=dlt&exp=11048
	 * @param url 链接地址
	 * @param lotno 彩种
	 * @param batchcode 期号
	 * @return 对应数组
	 * @throws ParserException 
	 * @throws UnsupportedEncodingException 
	 */
	@SuppressWarnings({ "serial", "unchecked"})
	public static Map getHtmlCoreMessage(String url,String lotno,String batchcode)throws Exception{
		Map map = new HashMap();
		//调用链接地址读取内容
		String htmlcode = getHtmlString(url+"type="+lotno+"&LotteryNo="+batchcode,"UTF-8");	
		htmlcode = htmlcode.replaceAll("\\t","");
		Parser parser = Parser.createParser(htmlcode, "UTF-8");
		
		//遍历所有的节点
		NodeList nodes = parser.extractAllNodesThatMatch(new NodeFilter() {
			@Override
			public boolean accept(Node arg0) {
				// TODO Auto-generated method stub
				return true;
			}
		});
		
		//过滤p节点来获取p节点中的值
		NodeFilter filterP = new TagNameFilter( "p" );
		NodeList pList = nodes.extractAllNodesThatMatch(filterP, true);
		
		int key=0;
		//获取网站内部内容（循环得到的内容设置的实体类中添加到数据库中）
		for(int i=0;i<pList.size();i++){
			Node node = pList.elementAt(i);
			if(node.toHtml().indexOf("<br/>")>=0){
				NodeList brlist = node.getChildren();
				for (int j = 0; j < brlist.size(); j++){
					Node br= brlist.elementAt(j);
					if(!br.toPlainTextString().equals("")){
						key++;
						map.put(key, br.toPlainTextString());
					}
				}
			}
		}
//		System.out.println("获取抓取页面的内容:"+map);
		return map;
	}
	
	/**
	 * 
	 * 双色球的开奖信息
	 * @param url 地址
	 * @param lotno 彩种
	 * @param batchcode 期号
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static CP_Drawalottery getSSQDrawalottery(String url,String lotno,String batchcode) throws Exception{
		CP_Drawalottery lotterySSQ = new CP_Drawalottery();
		lotterySSQ.setLotno(lotno);//彩种
		lotterySSQ.setBatchcode(batchcode);//期号
		
		//调用抓取方法查到信息
		Map map = getHtmlCoreMessage(url, lotno, batchcode);
		
		Map map1 = new HashMap();
		int key = 0;
		//截取6-17个有用数据
		for(int i=6;i<18;i++){
			String str = map.get(i).toString();
			key++;
			if(str.indexOf("|") <= -1){
				map1.put(key,getInfo(str, 5));
			}else{
				if(i!=9){
					map1.put(key,getPrizeInfo(str, "|"));
				}
			}
		}
		System.out.println("双色球获取值为:"+map1);
	    lotterySSQ.setLotteryTime(map1.get(1).toString());//开奖时间
		lotterySSQ.setLotteryCode(map1.get(2).toString()+"+"+map1.get(3).toString());//注码
		lotterySSQ.setBetTotalMoney(map1.get(11).toString());//投注总额
		lotterySSQ.setProgressive(map1.get(12).toString());//奖池累计
		//奖项等级
		String prizeInfo = "";
		for(int i=5;i<=10;i++){
			prizeInfo +=map1.get(i).toString()+";";
		}
		lotterySSQ.setPrizeInfo("["+prizeInfo+"]");
		return lotterySSQ;
	}
	public static void main(String[] args) {
		try {
//			getSSQDrawalottery("http://wap.500wan.com/info/prize/prize_open?", "ssq", "2012086");
			getSSQDrawalottery("http://wap.okooo.com/prize/fuCai/detail.php?", "ssq", "2012086");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * 3D的开奖信息
	 * @param url 地址
	 * @param url_500web 500万web地址
	 * @param lotno 彩种
	 * @param batchcode 期号
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static CP_Drawalottery getSDDrawalottery(String url,String url_500web,String lotno,String batchcode) throws Exception{
		CP_Drawalottery lotterySD = new CP_Drawalottery();
		lotterySD.setLotno(lotno);//彩种
		lotterySD.setBatchcode(batchcode);//期号
		
		//调用抓取方法查到信息
		Map map = getHtmlCoreMessage(url, lotno, batchcode);
		
		Map map1 = new HashMap();
		int key = 0;
		//截取6-13个有用数据
		for(int i=6;i<13;i++){
			String str = map.get(i).toString();
			key++;
			if(str.indexOf("|") <= -1){
				map1.put(key,getInfo(str, 5));
			}else{
				if(i>=10&&i<=12){
					map1.put(key,getPrizeInfo(str.replace("&#160;", ""), "|"));
				}
			}
		}
		System.out.println("福彩3D获取值为:"+map1);
	    lotterySD.setLotteryTime(map1.get(1).toString());//开奖时间
		lotterySD.setLotteryCode(map1.get(2).toString());//注码
		
		//由于福彩3D在500wap上没有投注总金额，所以从web上获取显示
		Map<Integer, String> rtnMap= HtmlCore.getHtmlCoreSplit(url_500web,batchcode);
		lotterySD.setBetTotalMoney(rtnMap.get(4));//投注总额
		lotterySD.setProgressive("");//奖池累计
		//奖项等级
		String prizeInfo = "";
		for(int i=5;i<=7;i++){
			prizeInfo +=map1.get(i).toString()+";";
		}
		lotterySD.setPrizeInfo("["+prizeInfo+"]");
		return lotterySD;
	}
	
	/**
	 * 
	 * 七乐彩的开奖信息
	 * @param url 地址
	 * @param lotno 彩种
	 * @param batchcode 期号
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static CP_Drawalottery getQLCDrawalottery(String url,String lotno,String batchcode) throws Exception{
		CP_Drawalottery lotteryQLC = new CP_Drawalottery();
		lotteryQLC.setLotno(lotno);//彩种
		lotteryQLC.setBatchcode(batchcode);//期号
		
		//调用抓取方法查到信息
		Map map = getHtmlCoreMessage(url, lotno, batchcode);
		
		Map map1 = new HashMap();
		int key = 0;
		//截取6-19个有用数据
		for(int i=6;i<=19;i++){
			String str = map.get(i).toString();
			key++;
			if(str.indexOf("|") <= -1){
				map1.put(key,getInfo(str, 5));
			}else{
				if(i>=11&&i<=17){
					map1.put(key,getPrizeInfo(str, "|"));
				}
			}
		}
		System.out.println("七乐彩获取值为:"+map1);
	    lotteryQLC.setLotteryTime(map1.get(1).toString());//开奖时间
		lotteryQLC.setLotteryCode(map1.get(2).toString()+"+"+map1.get(3).toString());//注码
		lotteryQLC.setBetTotalMoney(map1.get(13).toString());//投注总额
		lotteryQLC.setProgressive(map1.get(14).toString());//奖池累计
		//奖项等级
		String prizeInfo = "";
		for(int i=6;i<=12;i++){
			prizeInfo +=map1.get(i).toString()+";";
		}
		lotteryQLC.setPrizeInfo("["+prizeInfo+"]");
		return lotteryQLC;
	}
	
	/**
	 * 
	 * 大乐透的开奖详情
	 * @param url 地址
	 * @param lotno 彩种
	 * @param batchcode 期号
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static CP_Drawalottery getDLTDrawalottery(String url,String lotno,String batchcode) throws Exception{
		CP_Drawalottery lotteryDLT = new CP_Drawalottery();
		lotteryDLT.setLotno(lotno);//彩种
		lotteryDLT.setBatchcode(batchcode);//期号
		
		//调用抓取方法查到信息
		Map map = getHtmlCoreMessage(url, lotno, batchcode);
		
		Map map1 = new HashMap();
		int key = 0;
		//截取6-29个有用数据
		for(int i=6;i<=29;i++){
			String str = map.get(i).toString();
		
			key++;
			//除去不需要的内容将所需内容存放入新的map中
			if(i==6){
			   map1.put(key, getInfo(str, 5));
			   continue;
			}else if(i==7){
			   map1.put(key, getInfo(str, 7));
			   continue;
			}else if(i==8){
				map1.put(key, getInfo(str, 7));
				continue;
			}else if(i==9){
				map1.put(key, getInfo(str, 7));
				continue;
			}else if(i>10 && i<25){
				map1.put(key,getDLTPrizeInfo(str, "|"));
				continue;
			}else if(i==25){
				String prizeinfo = getInfo(str, 17);
				map1.put(key, getDLTPrizeInfo(prizeinfo,"|","八等奖"));
				continue;
			}else if(i==26){
				String prizeinfo = getInfo(str, 19);
				map1.put(key, getDLTPrizeInfo(prizeinfo,"|","12选2"));
				continue;
			}else if(i>=27 && i<=29){
				map1.put(key, getInfo(str, 10));
				continue;
			}		
		}
		System.out.println("大乐透解析后的新Map："+map1);
		
	    lotteryDLT.setLotteryTime(map1.get(1).toString().trim());//开奖时间
		lotteryDLT.setLotteryCode(map1.get(2).toString()+"+"+map1.get(3).toString()+"+"+map1.get(4).toString());//注码
		lotteryDLT.setBetTotalMoney(map1.get(22).toString().trim()+"；12选2销量："+map1.get(23).toString().trim());//投注总额
		lotteryDLT.setProgressive(map1.get(24).toString().trim());//奖池累计
		//奖项等级
		String prizeInfo = "";
		for(int i=6;i<=21;i++){
			prizeInfo +=map1.get(i).toString()+";";
		}
		lotteryDLT.setPrizeInfo("["+prizeInfo+"]");
		return lotteryDLT;
	}
	
	/**
	 * 
	 * 排列三的开奖信息
	 * @param url 地址
	 * @param lotno 彩种
	 * @param batchcode 期号
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static CP_Drawalottery getPLSDrawalottery(String url,String url_500web, String lotno,String batchcode) throws Exception{
		CP_Drawalottery lotteryPLS = new CP_Drawalottery();
		lotteryPLS.setLotno(lotno);//彩种
		lotteryPLS.setBatchcode(batchcode);//期号
		
		//调用抓取方法查到信息
		Map map = getHtmlCoreMessage(url, lotno, batchcode);
		
		Map map1 = new HashMap();
		int key = 0;
		//截取5-10个有用数据
		for(int i=5;i<=10;i++){
			String str = map.get(i).toString();
			key++;
			if(str.indexOf("|") <= -1){
				map1.put(key,getInfo(str, 5));
			}else{
				if(i==8){
					map1.put(key,getPrizeInfo(str, "|"));
				}else if(i==9){
					map1.put(key,getPLSPrizeInfo(str.replace("|320元", ""), "|","320元"));
				}else if(i==10){
					map1.put(key,getPLSPrizeInfo(str.replace(" 320元", "").replace(" 160元", ""), "|","160元"));
				}
			}
		}
		System.out.println("排列三获取值为:"+map1);
	    lotteryPLS.setLotteryTime(map1.get(1).toString());//开奖时间
		lotteryPLS.setLotteryCode(map1.get(2).toString());//注码
		//由于排列五在500wap上没有投注总金额，所以从web上获取显示
		Map<Integer, String> rtnMap= HtmlCore.getHtmlCoreSplit(url_500web,batchcode);
		lotteryPLS.setBetTotalMoney(rtnMap.get(4));//投注总额
		lotteryPLS.setProgressive("");//奖池累计
		//奖项等级
		String prizeInfo = "";
		for(int i=4;i<=6;i++){
			prizeInfo +=map1.get(i).toString()+";";
		}
		lotteryPLS.setPrizeInfo("["+prizeInfo+"]");
		return lotteryPLS;
	}
	
	/**
	 * 
	 * 排列五的开奖信息
	 * @param url 地址
	 * @param lotno 彩种
	 * @param batchcode 期号
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static CP_Drawalottery getPLWDrawalottery(String url,String url_500web,String lotno,String batchcode) throws Exception{
		CP_Drawalottery lotteryPLW = new CP_Drawalottery();
		lotteryPLW.setLotno(lotno);//彩种
		lotteryPLW.setBatchcode(batchcode);//期号
		
		//调用抓取方法查到信息
		Map map = getHtmlCoreMessage(url, lotno, batchcode);
		
		Map map1 = new HashMap();
		int key = 0;
		//截取5-8个有用数据
		for(int i=5;i<=8;i++){
			String str = map.get(i).toString();
			key++;
			if(str.indexOf("|") <= -1){
				map1.put(key,getInfo(str, 5));
			}else{
				if(i==8){
					map1.put(key,getPrizeInfo(str, "|"));
				}
			}
		}
		System.out.println("排列五获取值为:"+map1);
	    lotteryPLW.setLotteryTime(map1.get(1).toString());//开奖时间
		lotteryPLW.setLotteryCode(map1.get(2).toString());//注码
		
		//由于排列五在500wap上没有投注总金额，所以从web上获取显示
		Map<Integer, String> rtnMap= HtmlCore.getHtmlCoreSplit(url_500web,batchcode);
		if(rtnMap==null){
			lotteryPLW.setBetTotalMoney("0");//投注总额
		}else{
			lotteryPLW.setBetTotalMoney(rtnMap.get(4));//投注总额
		}
		lotteryPLW.setProgressive("");//奖池累计
		//奖项等级
		lotteryPLW.setPrizeInfo("["+map1.get(4).toString()+"]");
		return lotteryPLW;
	}
	/**
	 * 
	 * 排列五的开奖信息
	 * @param url 地址
	 * @param lotno 彩种
	 * @param batchcode 期号
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static CP_Drawalottery getEEXWDrawalottery(String url,String lotno,String batchcode) throws Exception{
		CP_Drawalottery lotteryEEXW = new CP_Drawalottery();
		lotteryEEXW.setLotno(lotno);//彩种
		lotteryEEXW.setBatchcode(batchcode);//期号
		
		//调用抓取方法查到信息
		Map map = getHtmlCoreMessage(url, lotno, batchcode);
		
		Map map1 = new HashMap();
		int key = 0;
		//截取5-8个有用数据
		for(int i=6;i<=13;i++){
			String str = map.get(i).toString();
			key++;
			if(str.indexOf("|") <= -1){
				map1.put(key,getInfo(str, 5));
			}else{
				if(i==11||i==9||i==10){
					map1.put(key,getPrizeInfo(str, "|"));
				}
			}
		}
		System.out.println("22选5获取值为:"+map1);
	    lotteryEEXW.setLotteryTime(map1.get(1).toString());//开奖时间
		lotteryEEXW.setLotteryCode(map1.get(2).toString());//注码
		lotteryEEXW.setBetTotalMoney(map1.get(7).toString());//奖池累计
		lotteryEEXW.setProgressive(map1.get(8).toString());//奖池累计
		//奖项等级
		String prizeInfo = "";
		for(int i=4;i<=6;i++){
			prizeInfo +=map1.get(i).toString()+";";
		}
		lotteryEEXW.setPrizeInfo("["+prizeInfo+"]");
		return lotteryEEXW;
	}
	
	
	/**
	 * 
	 * 七星彩的开奖信息
	 * @param url 地址
	 * @param lotno 彩种
	 * @param batchcode 期号
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static CP_Drawalottery getQXCDrawalottery(String url,String lotno,String batchcode) throws Exception{
		CP_Drawalottery lotteryQXC = new CP_Drawalottery();
		lotteryQXC.setLotno(lotno);//彩种
		lotteryQXC.setBatchcode(batchcode);//期号
		
		//调用抓取方法查到信息
		Map map = getHtmlCoreMessage(url, lotno, batchcode);
		
		Map map1 = new HashMap();
		int key = 0;
		//截取6-17个有用数据
		for(int i=6;i<18;i++){
			String str = map.get(i).toString();
			key++;
			if(str.indexOf("|") <= -1){
				map1.put(key,getInfo(str, 5));
			}else{
				if(i!=9){
					map1.put(key,getPrizeInfo(str, "|"));
				}
			}
		}
		System.out.println("七星彩获取值为:"+map1);
	    lotteryQXC.setLotteryTime(map1.get(1).toString());//开奖时间
		lotteryQXC.setLotteryCode(map1.get(2).toString());//注码
		lotteryQXC.setBetTotalMoney(map1.get(11).toString());//投注总额
		lotteryQXC.setProgressive(map1.get(12).toString());//奖池累计
		//奖项等级
		String prizeInfo = "";
		for(int i=5;i<=10;i++){
			prizeInfo +=map1.get(i).toString()+";";
		}
		lotteryQXC.setPrizeInfo("["+prizeInfo+"]");
		return lotteryQXC;
	}
	
	/**
	 * 截取字符串的公共方法
	 * @param str 需截取的字符
	 * @param i 从第几个开始截取
	 * @return
	 */
	public static String getInfo(String str,int i){
		return str.substring(i,str.length());
	}
	
	
	/**
	 * 分解排列三奖级与注数
	 * @param prizeInfo 传入的奖项等级
	 * @param tab 注数、奖金之间的分隔符
	 * @return map 串
	 */
	public static JSONObject getPLSPrizeInfo(String prizeInfo,String tab,String str){
		JSONObject map = new JSONObject();
		//分解奖项等级
		if(prizeInfo.indexOf(tab)>-1){
			String codes[] = prizeInfo.split("\\"+tab);
			map.put("jianji", codes[0]);
			map.put("zhushu", codes[1]);
		}
		map.put("money", str);
		return map;
	}
	/**
	 * 分解大乐透注数与金额
	 * @param prizeInfo 传入的奖项等级
	 * @param tab 注数、奖金之间的分隔符
	 * @return map 串
	 */
	public static JSONObject getDLTPrizeInfo(String prizeInfo,String tab,String str){
		JSONObject map = new JSONObject();
		map.put("jianji", str);
		//分解奖项等级
		if(prizeInfo.indexOf(tab)>-1){
			String codes[] = prizeInfo.split("\\"+tab);
			map.put("zhushu", codes[0]);
			map.put("money", codes[1]);
			
		}
		return map;
	}

	/**
	 * 分解双色球奖项等级
	 * @param prizeInfo 传入的奖项等级
	 * @param tab 奖级、注数、奖金之间的分隔符
	 * @return map 串
	 */
	public static JSONObject getPrizeInfo(String prizeInfo,String tab){
		JSONObject map = new JSONObject();
		//分解奖项等级
		if(prizeInfo.indexOf(tab)>-1){
			String codes[] = prizeInfo.split("\\"+tab);
			map.put("jianji", codes[0]);
			map.put("zhushu", codes[1]);
			map.put("money", codes[2]);
			
		}
		return map;
	}
	
	/**
	 * 分解大乐透奖项等级
	 * @param prizeInfo 传入的奖项等级
	 * @param tab 奖级、注数、奖金之间的分隔符
	 * @return map 串
	 */
	public static JSONObject getDLTPrizeInfo(String prizeInfo,String tab){
		JSONObject map = new JSONObject();
		//分解奖项等级
		if(prizeInfo.indexOf(tab)>-1){
			String codes[] = prizeInfo.split("\\"+tab);
			map.put("jianji", codes[0].substring(0,3));
			map.put("zhuijia", codes[0].substring(4,8));
			map.put("zhushu", codes[1]);
			map.put("money", codes[2]);
			
		}
		return map;
	}
	
	/**
	 * 将抓取到的所有彩种信息放到公共类中方便调用
	 * @param url 500wan--wap地址
	 * @param lotno 彩种
	 * @param batchcode 期号
	 * @return 返回 CP_Drawalottery 实体类
	 * @throws Exception
	 */
	public static CP_Drawalottery getAllCP_Drawalottery(String url,String url_500wanWeb,String lotno,String batchcode) throws Exception{
		CP_Drawalottery drawalottery = null;
		//http://datachart.500wan.com/ssq/history/inc/history.php?limit=30&start=12086&end=11001
		if(lotno.trim().equals("ssq")){//双色球
			drawalottery = getSSQDrawalottery(url, lotno, batchcode);
		}else if(lotno.trim().equals("sd")){//福彩3D
			drawalottery = getSDDrawalottery(url, url_500wanWeb+"sd/history/inc/history.php?limit=0&start="+batchcode+"&end=2011001", lotno, batchcode);
		}else if(lotno.trim().equals("qlc")){//七乐彩
			drawalottery = getQLCDrawalottery(url, lotno, batchcode);
		}else if(lotno.trim().equals("pls")){//排列三pls/history/inc/history.php?limit=0&start=11079&end=11001
			drawalottery = getPLSDrawalottery(url, url_500wanWeb+"pls/history/inc/history.php?limit=0&start="+batchcode+"&end=11001",lotno, batchcode);
		}else if(lotno.trim().equals("dlt")){//大乐透
			drawalottery = getDLTDrawalottery(url, lotno, batchcode);
		}else if(lotno.trim().equals("plw")){//排列五
			drawalottery = getPLWDrawalottery(url,url_500wanWeb+"plw/history/inc/history.php?limit=0&start="+batchcode+"&end=11001", lotno, batchcode);
		}else if(lotno.trim().equals("qxc")){//七星彩
			drawalottery = getQXCDrawalottery(url, lotno, batchcode);
		}else if(lotno.trim().equals("eexw")){//排列五
			drawalottery = getEEXWDrawalottery(url, lotno, batchcode);
		}
		return drawalottery;
	}
}
