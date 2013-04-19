package com.jrtcms.web.action;

import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;

import com.jrtcms.web.service.CP_DrawalotteryService;
import com.jrtcms.web.util.BaseAction;

@SuppressWarnings("serial")
/***
 * 
 * 开奖查询方法
 *
 */
public class HtmlCodeAction extends BaseAction {
	
	private static ResourceBundle rbint = ResourceBundle.getBundle("jrtcms");
	private static String url = rbint.getString("url");
	private static String url_500wanWeb = rbint.getString("url_500wanWeb");
	private static Logger log = Logger.getLogger(HtmlCodeAction.class);
	private CP_DrawalotteryService cp_drawalotteryService = null;

	public CP_DrawalotteryService getCp_drawalotteryService() {
		return cp_drawalotteryService;
	}

	public void setCp_drawalotteryService(
			CP_DrawalotteryService cpDrawalotteryService) {
		cp_drawalotteryService = cpDrawalotteryService;
	}

//	/**
//	 * 
//	 * 去掉
//	 * 查询开奖信息
//	 */
//	public String selectDrawalottery() throws Exception{
//
//		try {
//			// 获取页面传入的彩种和期号
//			String jsonString = request.getParameter("jsonString");
//			JSONObject jsonWhere = JSONObject.fromObject(jsonString);
//			String lotno = jsonWhere.getString("lotno");
//			String batchcode = jsonWhere.getString("batchcode");
//			log.info("获取到的彩种=" + lotno + ";期号=" + batchcode);
//			if(lotno == null || batchcode == null || lotno.equals("undefined") || batchcode.equals("undefined")
//			  || lotno.trim().equals("") || batchcode.trim().equals("")){
//				response.getWriter().println("{error_code:000018}");
//				return null;
//			}
//			CP_Drawalottery cp_drawalottery = cp_drawalotteryService.selectDrawalottery(lotno,batchcode);
//			Writer w = response.getWriter();
//			//调用jackson中的方法将实体bean转换为json
//			ObjectMapper objectMapper = new ObjectMapper();
//			JsonGenerator jsonGenerator = objectMapper.getJsonFactory().createJsonGenerator(w);
//			if(cp_drawalottery==null){
//				//没有记录从500万查询到记录返回给前台并插入数据库
//				cp_drawalottery = HtmlCore.getAllCP_Drawalottery(url,url_500wanWeb, lotno, batchcode);
//				cp_drawalotteryService.toAddDrawalottery(cp_drawalottery);
//			}
//			jsonGenerator.writeObject(cp_drawalottery);			
//			return null;
//		
//
//		} catch (Exception e) {
//			e.printStackTrace();	
//			try {
//				response.getWriter().print("{error_code:000047}");
//			} catch (IOException e1) {
//				e1.printStackTrace();
//			}
//			log.error("查询开奖信息返回出Exception=" + e);
//		}
//		return null;
//	}
	
//	/**
//	 * 
//	 * 插入100条记录到开奖表中
//	 * @return
//	 */
//	public  String insertDrawalottery(){
//		
//		try {
//			//获取页面的数据
//			String jsonString = request.getParameter("jsonString");
//			JSONObject jsonWhere = JSONObject.fromObject(jsonString);
//			String lotno = jsonWhere.getString("lotno");
//			String batchcode = jsonWhere.getString("batchcode");
//			String qishu = jsonWhere.getString("qishu");
//			
//			log.info("获取到的彩种=" + lotno + ";当前期号=" + batchcode+";期数="+qishu);
//
//			//根据传入的期号调用解析500wan-wap站解析插入数据库中
//			for(int i=Integer.parseInt(batchcode);i<Integer.parseInt(batchcode)+Integer.parseInt(qishu);i--){
//				// 根据彩种和期号查询开奖信息
//				CP_Drawalottery drawalottery1 = cp_drawalotteryService.selectDrawalottery(lotno, String.valueOf(i));
//				log.info("根据彩种和期号查询开奖信息："+drawalottery1);
//				CP_Drawalottery cp_drawalottery = HtmlCore.getAllCP_Drawalottery(url,url_500wanWeb, lotno, String.valueOf(i));
//				cp_drawalotteryService.toAddDrawalottery(cp_drawalottery);
//				if(i==Integer.parseInt(batchcode)-Integer.parseInt(qishu)){
//					break;
//				}	
//			}
//		} catch (Exception e) {
//			//e.printStackTrace();
//			log.info("插入开奖信息返回出Exception=" + e);
//		}	
//		return "htmlCode";
//	}
	
	
	/**
	 * 按彩种查询所有期号
	 */
	public String selectAllBatchcodeByLotno() {

		try {
			// 获取页面传入的彩种
			String lotno = request.getParameter("lotno");
			log.info("获取到的彩种=" + lotno );
			if(lotno == null ||  lotno.equals("undefined") 
			  || lotno.trim().equals("") ){
				response.getWriter().println("{error_code:000018}");
				return null;
			}
            
			
			// 
		    List batchcodeList = cp_drawalotteryService.selectAllBatchcodeByLotno(lotno);
		    JSONArray batchcodeListJson = JSONArray.fromObject(batchcodeList);
		    response.getWriter().println(batchcodeListJson);
			return null;

		} catch (Exception e) {
			//e.printStackTrace();	
			try {
				response.getWriter().print("{error_code:000047}");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				//e1.printStackTrace();
			}
//			log.info("查询开奖信息返回出Exception=" + e.toString());
		}
		return null;
	}
	
	
	
}
