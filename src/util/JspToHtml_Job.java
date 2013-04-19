package util;

import java.net.SocketTimeoutException;
import java.util.ResourceBundle;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.jrtcms.web.util.BaseAction;

/**
 * @classname: JspToHtml_Job
 * @description 自动生成HTML定时器调用的类
 * @author 蓝生
 * @date： 2011-1-19 下午03:30:17
 */

public class JspToHtml_Job extends BaseAction {

	//html访问地址 http\://test.ruyicai.com/
	private static ResourceBundle rbint = ResourceBundle.getBundle("jrtcms");
	private static String templateUrl = rbint.getString("templateUrl");
	//获取html生成路径  D\:/WEB
	private static String htmlUrl = rbint.getString("htmlLocal");
	private static final long serialVersionUID = 6700728852312217928L;
	private SqlMapClientTemplate sqlMapClientTemplate;
	private static Logger logger = Logger.getLogger(JspToHtml.class);

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public void jspToHtmlMember() {
		Tools.makeHtml(templateUrl+"chlw/function/selectAll!batchCodeSelectTime?lotNo=F47104-F47103-F47102-T01001-T01009-T01002-T01011", 
				htmlUrl+"/ruyicai/include/", "jinrikaijiang.html");
		Tools.makeHtml(templateUrl+"chlw/function/selectAll!nowbatchCodeSelect?lotNo=F47104-F47103-F47102-T01001-T01009-T01002-T01011", 
				htmlUrl+"/ruyicai/include/", "jinrijiezhi.html");
		Tools.makeHtml(templateUrl+"chlw/function/ryc_selectAll!batchCodeSelectTime?lotNo=F47104-F47103-F47102-T01001-T01009-T01002-T01011", 
				htmlUrl+"/ruyicai/include/", "jinrikaijiangLeft.html");
	}
	public void jspToHtmllottery() {
		logger.info("生成开奖公告,高频彩开奖详情页面以及首页开奖公告  开始。。。。。");
		Tools.makeHtml(templateUrl+"chlw/function/ryc_select_newkj!drawalotteryInfo?lotno=T01007&issu=5", 
				htmlUrl+"/ruyicai/kaijiang/", "shishicaikaijiang.html");
		Tools.makeHtml(templateUrl+"chlw/function/ryc_select_newkj!drawalotteryInfo?lotno=T01010&issu=5", 
				htmlUrl+"/ruyicai/kaijiang/", "11xuan5kaijiang.html");
		Tools.makeHtml(templateUrl+"chlw/function/ryc_select_newkj!drawalotteryInfo?lotno=T01012&issu=5", 
				htmlUrl+"/ruyicai/kaijiang/", "shiyiyunduojinkaijiang.html");
		logger.info("生成开奖公告,高频彩开奖详情页面以及首页开奖公告  结束。。。。。");
		logger.info("首页中奖排行生成静态页面---------------------------开始-------------");
		Tools.makeHtml(templateUrl+"chlw/function/selectAll!getRank", 
				htmlUrl+"/ruyicai/kaijiang/", "indexWiningRanking.html");
		logger.info("首页中奖排行生成静态页面-----------------------------结束-----------");
	}
	
	public void jspToHtmllotteryG() {
		logger.info("生成福彩  体彩开奖详情页面  开始。。。。。");
				Tools.makeHtml(templateUrl+"chlw/function/ryc_select_newkj!drawalotteryInfo?lotno=F47103", 
				htmlUrl+"/ruyicai/kaijiang/", "fucai3Dkaijiang.html");
				Tools.makeHtml(templateUrl+"chlw/function/ryc_select_newkj!drawalotteryInfo?lotno=F47102", 
						htmlUrl+"/ruyicai/kaijiang/", "qilecaikaijiang.html");
				Tools.makeHtml(templateUrl+"chlw/function/ryc_select_newkj!drawalotteryInfo?lotno=T01001", 
						htmlUrl+"/ruyicai/kaijiang/", "daletoukaijiang.html");
				Tools.makeHtml(templateUrl+"chlw/function/ryc_select_newkj!drawalotteryInfo?lotno=T01009", 
						htmlUrl+"/ruyicai/kaijiang/", "qixingcaikaijiang.html");
				Tools.makeHtml(templateUrl+"chlw/function/ryc_select_newkj!drawalotteryInfo?lotno=T01002", 
						htmlUrl+"/ruyicai/kaijiang/", "pailiesankaijiang.html");
				Tools.makeHtml(templateUrl+"chlw/function/ryc_select_newkj!drawalotteryInfo?lotno=T01011", 
						htmlUrl+"/ruyicai/kaijiang/", "pailiewukaijiang.html");
				Tools.makeHtml(templateUrl+"chlw/function/ryc_select_newkj!drawalotteryInfo?lotno=F47104", 
						htmlUrl+"/ruyicai/kaijiang/", "shuangseqiukaijiang.html");
				Tools.makeHtml(templateUrl+"chlw/function/ryc_select_newkj!drawalotteryInfo?lotno=T01013", 
						htmlUrl+"/ruyicai/kaijiang/", "22xuan5kaijiang.html");
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!drawalotteryIndex", 
						htmlUrl+"/ruyicai/kaijiang/", "shouyegonggao.html");
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!drawalotteryIndex?flag=sslottery", 
						htmlUrl+"/ruyicai/kaijiang/", "kaijianginfos.html");
				logger.info("生成福彩  体彩开奖详情页面  结束。。。。。");
				logger.info("生成福彩  体彩 足彩 频道页面开奖公告 开始。。。。。");
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!drawalotteryDetail?lotno=F47103", 
				htmlUrl+"/ruyicai/kaijiang/", "fucai3D.html");
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!drawalotteryDetail?lotno=F47102", 
						htmlUrl+"/ruyicai/kaijiang/", "qilecai.html");
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!drawalotteryDetail?lotno=T01001", 
						htmlUrl+"/ruyicai/kaijiang/", "daletou.html");
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!drawalotteryDetail?lotno=T01009", 
						htmlUrl+"/ruyicai/kaijiang/", "qixingcai.html");
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!drawalotteryDetail?lotno=T01002", 
						htmlUrl+"/ruyicai/kaijiang/", "pailiesan.html");
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!drawalotteryDetail?lotno=T01011", 
						htmlUrl+"/ruyicai/kaijiang/", "pailiewu.html");
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!drawalotteryDetail?lotno=F47104", 
						htmlUrl+"/ruyicai/kaijiang/", "shuangseqiu.html");
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!drawalotteryDetail_zc?lotno=T01005", 
						htmlUrl+"/ruyicai/kaijiang/", "shisichang.html");
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!drawalotteryDetail_zc?lotno=T01004", 
						htmlUrl+"/ruyicai/kaijiang/", "renjiuchang.html");
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!drawalotteryDetail_zc?lotno=T01006", 
						htmlUrl+"/ruyicai/kaijiang/", "liuchangban.html");
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!drawalotteryDetail_zc?lotno=T01003", 
						htmlUrl+"/ruyicai/kaijiang/", "shengfu.html");
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!drawalotteryDetail?lotno=T01013", 
						htmlUrl+"/ruyicai/kaijiang/", "22xuan5.html");
		logger.info("生成福彩  体彩 足彩 频道页面开奖公告   结束。。。。。");
	}
	
	public void tojspToHtmlHeMai(){
		try {
			jspToHtmlHeMai(null);
		} catch (SocketTimeoutException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 生成合买的静态页面
	 */
	public void jspToHtmlHeMai(String lotno) throws SocketTimeoutException {
		logger.info("~~~~~~~~~~~~~~~~~~~~~~~~~~生成福彩  体彩合买详情页面  开始。。。。。");
		//首页合买推荐
		Tools.makeHtml(templateUrl+"chlw/function/hemaiCenter!getCaselotsByWhere?pageCount=10&isAjax=shouye",
				htmlUrl+"/ruyicai/hemai/", "hemaituijian.html");
		//合买中心首页
		Tools.makeHtml(templateUrl+"chlw/function/hemaiCenter!getCaseHemaiCenter",
				htmlUrl+"/ruyicai/hemai/", "hemaiCenter.html");
		
		if(lotno == null || "".equals(lotno)){
			//双色球
			Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=F47104", 
					htmlUrl+"/ruyicai/hemai/", "shuanseqiuhemai.html");
		    //3D
			Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=F47103", 
					htmlUrl+"/ruyicai/hemai/", "fucai3dhemai.html");
			//qilecai
			Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=F47102", 
					htmlUrl+"/ruyicai/hemai/", "qilecaihemai.html");
			//daletou
			Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01001", 
					htmlUrl+"/ruyicai/hemai/", "daletouhemai.html");
			//pailie3x
			Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01002", 
					htmlUrl+"/ruyicai/hemai/", "pailie3hemai.html");
			//pailie5
			Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01011", 
					htmlUrl+"/ruyicai/hemai/", "pailie5hemai.html");
			//qixingcai
			Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01009", 
					htmlUrl+"/ruyicai/hemai/", "qixingcaihemai.html");
			
			//足彩胜负14
			Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01003", 
					htmlUrl+"/ruyicai/hemai/", "zcshengfuhemai.html");
			//任选足彩9
			Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01004", 
					htmlUrl+"/ruyicai/hemai/", "zcrenxuanhemai.html");
			//足彩半全6
			Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01006", 
					htmlUrl+"/ruyicai/hemai/", "zcbanquanhemai.html");
			//足彩进球4
			Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01005", 
					htmlUrl+"/ruyicai/hemai/", "zcjinqiuhemai.html");
			//22选5
			Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01013", 
					htmlUrl+"/ruyicai/hemai/", "22xuan5hemai.html");
		}else {
			if(lotno.equals("F47104")){
				//双色球
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=F47104", 
						htmlUrl+"/ruyicai/hemai/", "shuanseqiuhemai.html");
			}else if(lotno.equals("F47103")){
				
				   //3D
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=F47103", 
						htmlUrl+"/ruyicai/hemai/", "fucai3dhemai.html");
			}else if(lotno.equals("F47102")){
				//qilecai
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=F47102", 
						htmlUrl+"/ruyicai/hemai/", "qilecaihemai.html");
			}else if(lotno.equals("T01001")){
				//daletou
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01001", 
						htmlUrl+"/ruyicai/hemai/", "daletouhemai.html");
			}else if(lotno.equals("T01002")){
				//pailie3x
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01002", 
						htmlUrl+"/ruyicai/hemai/", "pailie3hemai.html");
			}else if(lotno.equals("T01011")){
				//pailie5
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01011", 
						htmlUrl+"/ruyicai/hemai/", "pailie5hemai.html");
				
			}else if(lotno.equals("T01009")){
				//qixingcai
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01009", 
						htmlUrl+"/ruyicai/hemai/", "qixingcaihemai.html");
			}else if(lotno.equals("T01003")){
				//足彩胜负14
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01003", 
						htmlUrl+"/ruyicai/hemai/", "zcshengfuhemai.html");
			}else if(lotno.equals("T01004")){
				//任选足彩9
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01004", 
						htmlUrl+"/ruyicai/hemai/", "zcrenxuanhemai.html");
			}else if(lotno.equals("T01006")){
				//足彩半全6
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01006", 
						htmlUrl+"/ruyicai/hemai/", "zcbanquanhemai.html");
			}else if(lotno.equals("T01005")){
				//足彩进球4
				Tools.makeHtml(templateUrl+"chlw/function/selectAll!getCaselotsByWhere?lotno=T01005", 
						htmlUrl+"/ruyicai/hemai/", "zcjinqiuhemai.html");
			}
		}
	    //=====================================================================================
		logger.info("生成福彩  体彩合买详情页面  结束。。。。。");
	}
}
