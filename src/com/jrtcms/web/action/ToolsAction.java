
package com.jrtcms.web.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import org.apache.log4j.Logger;

import util.JspToHtml_Job;
import util.Tools;

import com.jrtcms.listener.propertys.InitWebsitePropertys;
import com.jrtcms.web.model.NewsChannelMD;
import com.jrtcms.web.pojo.CP_Drawalottery;
import com.jrtcms.web.pojo.Channel_Template;
import com.jrtcms.web.pojo.News;
import com.jrtcms.web.pojo.NewsCategory;
import com.jrtcms.web.pojo.NewsTemplate;
import com.jrtcms.web.pojo.Website_Properties;
import com.jrtcms.web.service.CP_DrawalotteryService;
import com.jrtcms.web.service.Channel_TemplateService;
import com.jrtcms.web.service.NewsCategoryService;
import com.jrtcms.web.service.NewsChannelService;
import com.jrtcms.web.service.NewsService;
import com.jrtcms.web.service.NewsTemplateService;
import com.jrtcms.web.service.Website_PropertiesService;
import com.jrtcms.web.util.BaseAction;
import com.jrtcms.web.util.FinalVar;
import com.jrtcms.web.util.HtmlCore;
import com.jrtcms.web.util.URLEncoder;

/**
 * @classname: ToolsAction
 * @description 生成html工具action
 * @author 蓝生
 * @date： 2011-3-25 下午03:28:16
 */

public class ToolsAction extends BaseAction {
	private Logger log = Logger.getLogger(ToolsAction.class);
	private static final long serialVersionUID = 6700728852176234928L;
	
	private Map contMap=new HashMap();
	private NewsTemplateService newsTemplateService;
	private NewsTemplate newsTemplate;
	private NewsService newsService;
	private NewsChannelService newsChannelService;
	private NewsCategoryService newsCategoryService;
	private Channel_TemplateService channel_TemplateService;
	private Website_PropertiesService web_proService;
	private CP_DrawalotteryService cp_drawalotteryService = null;

	private static ResourceBundle rbint = ResourceBundle.getBundle("jrtcms");
	private static String templateUrl = rbint.getString("templateUrl");
	//模版文件夹  template
	private static String templateLocal = rbint.getString("templateLocal");
	//获取html生成路径  D\:/WEB
	private static String htmlUrl = rbint.getString("htmlLocal");
	private static String url = rbint.getString("url");
	private static String url_500wanWeb = rbint.getString("url_500wanWeb");
	
	public NewsTemplateService getNewsTemplateService() {
		return newsTemplateService;
	}

	public void setNewsTemplateService(NewsTemplateService newsTemplateService) {
		this.newsTemplateService = newsTemplateService;
	}
	

	public NewsTemplate getNewsTemplate() {
		return newsTemplate;
	}

	public void setNewsTemplate(NewsTemplate newsTemplate) {
		this.newsTemplate = newsTemplate;
	}


	public NewsService getNewsService() {
		return newsService;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	public Channel_TemplateService getChannel_TemplateService() {
		return channel_TemplateService;
	}

	public void setChannel_TemplateService(
			Channel_TemplateService channel_TemplateService) {
		this.channel_TemplateService = channel_TemplateService;
	}


	public NewsChannelService getNewsChannelService() {
		return newsChannelService;
	}

	public void setNewsChannelService(NewsChannelService newsChannelService) {
		this.newsChannelService = newsChannelService;
	}

	public NewsCategoryService getNewsCategoryService() {
		return newsCategoryService;
	}

	public void setNewsCategoryService(NewsCategoryService newsCategoryService) {
		this.newsCategoryService = newsCategoryService;
	}

	public Website_PropertiesService getWeb_proService() {
		return web_proService;
	}

	public void setWeb_proService(Website_PropertiesService web_proService) {
		this.web_proService = web_proService;
	}

	public CP_DrawalotteryService getCp_drawalotteryService() {
		return cp_drawalotteryService;
	}

	public void setCp_drawalotteryService(
			CP_DrawalotteryService cpDrawalotteryService) {
		cp_drawalotteryService = cpDrawalotteryService;
	}

	private File upload;
	private String fileName;
	private String uploadContentType;

	public String getUploadFileName() {
		return fileName;
	}

	public void setUploadFileName(String fileName) {
		this.fileName = fileName;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadContentType(String contentType) {
		this.uploadContentType = contentType;

	}

	public String getUploadContentType() {
		return this.uploadContentType;
	}
	/**
	 * 今日开奖
	 * @throws IOException
	 */
	public void jspToHtmlAllTime() throws IOException{
		
		//获取html生成路径
		String htmlUrl = rbint.getString("htmlLocal");
		
		String msg = "生成今日开奖成功！";
		String str = "true";
		//获取站点
		Website_Properties website_Properties = (Website_Properties)session.getAttribute("WEBSITE_SESSION");
		String website_Properties_name_zh = "ruyicai";	
		if(website_Properties != null){
			website_Properties_name_zh = website_Properties.getName_zh();
		}
		
		Tools.makeHtml(templateUrl+"chlw/function/selectAll!batchCodeSelectTime;jsessionid="+request.getSession().getId()+"?lotNo=F47104-F47103-F47102-T01001-T01009-T01002-T01011", 
				htmlUrl+"/"+website_Properties_name_zh+"/include/", "jinrikaijiang.html");
		Tools.makeHtml(templateUrl+"chlw/function/selectAll!nowbatchCodeSelect;jsessionid="+request.getSession().getId()+"?lotNo=F47104-F47103-F47102-T01001-T01009-T01002-T01011", 
				htmlUrl+"/"+website_Properties_name_zh+"/include/", "jinrijiezhi.html");
		Tools.makeHtml(templateUrl+"chlw/function/ryc_selectAll!batchCodeSelectTime;jsessionid="+request.getSession().getId()+"?lotNo=F47104-F47103-F47102-T01001-T01009-T01002-T01011", 
				htmlUrl+"/"+website_Properties_name_zh+"/include/", "jinrikaijiangLeft.html");
		//生成开奖公告合买页面
		new JspToHtml_Job().jspToHtmllottery();
		new JspToHtml_Job().jspToHtmllotteryG();
		new JspToHtml_Job().jspToHtmlHeMai("");
		PrintWriter out = response.getWriter();
		out.print(msg);
	}
	/**
	 * 清空缓存
	 * @throws Exception 
	 */
	public void clearTime() {
		
		
		try{
//		清空 库表里的数据
		//获取当前时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		//执行清空 chlw 的map
		Tools.makeHtml(templateUrl+"chlw/function/selectAll!removLotteryMapAll", htmlUrl+"/ruyicai/include/", "removeMap.html");
		String nowDate =sdf.format(new Date());
		List lotno_bathcode = cp_drawalotteryService.selectByDate();
		String lotno_bathcodeStr = "";
		int count=0;
		//获取当天的
		if(lotno_bathcode != null && lotno_bathcode.size()>0){
			for (int i = 0; i < lotno_bathcode.size(); i++) {
				CP_Drawalottery cd = (CP_Drawalottery)lotno_bathcode.get(i);
				lotno_bathcodeStr =cd.getBetTotalMoney();
				if(lotno_bathcodeStr==null||"0".equals(lotno_bathcodeStr)||"".equals(lotno_bathcodeStr)){
					count+=cp_drawalotteryService.removeLotteryById(cd.getId());
					CP_Drawalottery 	cp_drawalottery = HtmlCore.getAllCP_Drawalottery(url,url_500wanWeb, cd.getLotno(), cd.getBatchcode());
					cp_drawalotteryService.toAddDrawalottery(cp_drawalottery);
				}
			}
		}
		//int k = cp_drawalotteryService.removeLottery(nowDate);
		String msg = "清空"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+" 的数据成功！清掉了"+count+"条数据";
		System.out.println("delete success number:"+count+"  delete time:"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		out.print(msg);
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}
	/**
	 * 所有新闻生成
	 * @throws IOException
	 */
	public void jspToHtmlAllNews() throws IOException{
		Long sart = System.currentTimeMillis();
		String templateLocal = rbint.getString("templateLocal");
		//获取html生成路径
		String htmlUrl = rbint.getString("htmlLocal");
		
		String msg = "所有新闻生成成功！";
		String str = "true";
		//获取站点
		Website_Properties website_Properties = (Website_Properties)session.getAttribute("WEBSITE_SESSION");
		String website_Properties_name_zh = "ruyicai";	
		Long website_Properties_id = 0l;
		if(website_Properties != null){
			website_Properties_name_zh = website_Properties.getName_zh();
			website_Properties_id = website_Properties.getId();
		}
		List newsList = newsService.queryNewsListByOnline(website_Properties_id);
		if(newsList != null && newsList.size() > 0){
			for (int i = 0; i < newsList.size(); i++) {
				News news = (News)newsList.get(i);
				if(news != null){
					newsOnlineOrDown(news.getId()+"",1,0);
				}
			}
			
		}
		PrintWriter out = response.getWriter();
		out.print(msg);
	}
	/**
	 * 生成整站
	 * @return
	 * @throws IOException 
	 */
	public void jspToHtmlAllWebstie() throws IOException{
		Long sart = System.currentTimeMillis();
		String templateLocal = rbint.getString("templateLocal");
		//获取html生成路径
		String htmlUrl = rbint.getString("htmlLocal");
		
		String msg = "整站生成成功！";
		String str = "true";
		//获取站点
		Website_Properties website_Properties = (Website_Properties)session.getAttribute("WEBSITE_SESSION");
		String website_Properties_name_zh = "ruyicai";	
		Long website_Properties_id = 0l;
		if(website_Properties != null){
			website_Properties_name_zh = website_Properties.getName_zh();
			website_Properties_id = website_Properties.getId();
		}
		
		
		List newsList = newsService.queryNewsListByOnline(website_Properties_id);
		if(newsList != null && newsList.size() > 0){
			for (int i = 0; i < newsList.size(); i++) {
				News news = (News)newsList.get(i);
				if(news != null){
					newsOnlineOrDown(news.getId()+"",1,0);
				}
			}
			
		}
		
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
		
		NewsTemplate newsTemplate2 = new NewsTemplate();
		newsTemplate2.setType(0);
		newsTemplate2.setWebsiteurl_id(website_Properties_id);
		List newstemList = newsTemplateService.queryNewsTemplate(newsTemplate2);
		if(newstemList != null && newstemList.size()>0){
			newsTemplate2 =  (NewsTemplate)newstemList.get(0);
			if(!Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_index.jsp;jsessionid="+request.getSession().getId()+"?website_Properties_id="+website_Properties_id, 
					htmlUrl+"/"+website_Properties_name_zh, "index.html")
			){
				msg += "首页模板"+website_Properties_name_zh+"_index.jsp没有找到，";
			}
		}else{
			if(!Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_index.jsp;jsessionid="+request.getSession().getId()+"?website_Properties_id="+website_Properties_id, 
					htmlUrl+"/"+website_Properties_name_zh, "index.html")
			){
				
				msg += "默认首页模板"+website_Properties_name_zh+"_index.jsp没有找到，";
			}
			
		}
		//生成头部和各种公共页
		NewsTemplate newsTemplate5 = new NewsTemplate();
		newsTemplate5.setWebsiteurl_id(website_Properties_id);
		List newstemByTopList = newsTemplateService.queryNewsTemplate(newsTemplate5);
		if(newstemByTopList != null && newstemByTopList.size()>0){
			for (int i = 0; i < newstemByTopList.size(); i++) {
				NewsTemplate newsTemp = (NewsTemplate)newstemByTopList.get(i);
				if(newsTemp.getName()!=null){
					if(newsTemp.getName().indexOf("include_common_")>-1){
						String name = newsTemp.getName().replaceAll(website_Properties_name_zh+"_include_common_", "").replaceAll(".jsp", "");
						Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+newsTemp.getName()+";jsessionid="+request.getSession().getId()+"?website_Properties_id="+website_Properties_id, 
								htmlUrl+"/"+website_Properties_name_zh+"/include/", name+".html");
					}
					
				}
			}
		}
		//获取该站点所有频道
		List<NewsChannelMD> newsChannelLst =newsChannelService.query(website_Properties_id);
		if(newsChannelLst != null && newsChannelLst.size() > 0){
			for (int i = 0; i < newsChannelLst.size(); i++) {
				NewsChannelMD nMD  = (NewsChannelMD)newsChannelLst.get(i);
				if(nMD !=null ){
					channelToOnline(nMD.getId()+"");
				}
			}
			
		}
		//获取分类map
		Map<Long,NewsCategory> map = InitWebsitePropertys.getCategooryListMap();
		Iterator it = map.entrySet().iterator();   
		    while (it.hasNext()) {   
		        Map.Entry entry = (Map.Entry) it.next();   
		        Long key = (Long)entry.getKey();   
		        NewsCategory value = (NewsCategory)entry.getValue();  
		        if(value.getWebsite_id().equals(website_Properties_id) && (value.getLeaf() == 0 || "3gcaipiao".equals(website_Properties_name_zh))){
		    		String fileUrl2 = getCategoryFile2((NewsCategory)map.get(key),map);
		    		//生成html页面
		    		if(fileUrl2.indexOf("/")<0 && fileUrl2.indexOf("\\")<0){
						fileUrl2 = "";
					}
		    		categoryToOnline(key+"",fileUrl2);
		        }
		} 
		    //今日开奖
		    Tools.makeHtml(templateUrl+"chlw/function/selectAll!batchCodeSelectTime;jsessionid="+request.getSession().getId()+"?lotNo=F47104-F47103-F47102-T01001-T01009-T01002-T01011", 
					htmlUrl+"/"+website_Properties_name_zh+"/include/", "jinrikaijiang.html");
		    Long end = System.currentTimeMillis();
		    System.out.println("生成整站时间："+(end-sart));
		    contMap = new HashMap();
		PrintWriter out = response.getWriter();
		out.print(msg);
		
	}
	/**
	 * 生成首页
	 * @return
	 * @throws IOException 
	 */
	public void jspToHtmlByIndex() throws IOException{
    	String templateLocal = rbint.getString("templateLocal");
		//获取html生成路径
		String htmlUrl = rbint.getString("htmlLocal");
		
		String msg = "首页生成html成功！";
		String str = "true";
		//获取站点
		Website_Properties website_Properties = (Website_Properties)session.getAttribute("WEBSITE_SESSION");
		String website_Properties_name_zh = "ruyicai";	
		Long website_Properties_id = 0l;
		if(website_Properties != null){
			website_Properties_name_zh = website_Properties.getName_zh();
			website_Properties_id = website_Properties.getId();
		}
		
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";

		NewsTemplate newsTemplate2 = new NewsTemplate();
		newsTemplate2.setType(0);
		newsTemplate2.setWebsiteurl_id(website_Properties_id);
		List newstemList = newsTemplateService.queryNewsTemplate(newsTemplate2);
		if(newstemList != null && newstemList.size()>0){
			newsTemplate2 =  (NewsTemplate)newstemList.get(0);
			if(!Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_index.jsp;jsessionid="+request.getSession().getId()+"?website_Properties_id="+website_Properties_id, 
					htmlUrl+"/"+website_Properties_name_zh, "index.html")
			){
				msg += "首页模板"+website_Properties_name_zh+"_index.jsp没有找到，";
			 }
		}else{
			if(!Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_index.jsp;jsessionid="+request.getSession().getId()+"?website_Properties_id="+website_Properties_id, 
					htmlUrl+"/"+website_Properties_name_zh, "index.html")
			){
				
				msg += "默认首页模板"+website_Properties_name_zh+"_index.jsp没有找到，";
			 }
			
		}
		//生成头部和各种公共页
		NewsTemplate newsTemplate5 = new NewsTemplate();
		newsTemplate5.setWebsiteurl_id(website_Properties_id);
		List newstemByTopList = newsTemplateService.queryNewsTemplate(newsTemplate5);
		if(newstemByTopList != null && newstemByTopList.size()>0){
			for (int i = 0; i < newstemByTopList.size(); i++) {
				NewsTemplate newsTemp = (NewsTemplate)newstemByTopList.get(i);
				if(newsTemp.getName()!=null){
					if(newsTemp.getName().indexOf("include_common_")>-1){
						String name = newsTemp.getName().replaceAll(website_Properties_name_zh+"_include_common_", "").replaceAll(".jsp", "");
						Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+newsTemp.getName()+";jsessionid="+request.getSession().getId()+"?website_Properties_id="+website_Properties_id, 
								htmlUrl+"/"+website_Properties_name_zh+"/include/", name+".html");
					}
					
				}
			}
		}
		PrintWriter out = response.getWriter();
		out.print(msg);
	}
	/**
	 * 频道上线
	 * @return
	 * @throws IOException
	 */
	public void jspToHtmlByChannelOnlineAll() throws IOException {
		String msg ="频道生成成功";
		//获取站点
		Website_Properties website_Properties = (Website_Properties)session.getAttribute("WEBSITE_SESSION");
		Long website_Properties_id = 0l;
		if(website_Properties != null){
			website_Properties_id = website_Properties.getId();
		}
		//获取该站点所有频道
		List<NewsChannelMD> newsChannelLst =newsChannelService.query(website_Properties_id);
		if(newsChannelLst != null && newsChannelLst.size() > 0){
			for (int i = 0; i < newsChannelLst.size(); i++) {
				NewsChannelMD nMD  = (NewsChannelMD)newsChannelLst.get(i);
				if(nMD !=null ){
					channelToOnline(nMD.getId()+"");
				}
			}
			
		}
		PrintWriter out = response.getWriter();
		out.print(msg);
	}
	
	/**
	 * 新闻分类生成上线
	 * @return
	 * @throws IOException
	 */
	public void jspToHtmlByCategoryOnlineAll() throws IOException {
		
		Website_Properties website_Properties = (Website_Properties)session.getAttribute("WEBSITE_SESSION");
		String website_Properties_name_zh = "ruyicai";	
		Long website_Properties_id = 0l;
		if(website_Properties != null){
			website_Properties_name_zh = website_Properties.getName_zh();
			website_Properties_id = website_Properties.getId();
		}
		//获取分类map
		Map<Long,NewsCategory> map = InitWebsitePropertys.getCategooryListMap();
		Iterator it = map.entrySet().iterator();   
	  
		    while (it.hasNext()) {
		        Map.Entry entry = (Map.Entry) it.next();   
		        Long key = (Long)entry.getKey();   
		        NewsCategory value = (NewsCategory)entry.getValue();  
		        if((value.getWebsite_id().equals(website_Properties_id) && (value.getLeaf() == 0 || "3gcaipiao".equals(website_Properties_name_zh))) ){
		    		String fileUrl2 = getCategoryFile2((NewsCategory)map.get(key),map);
		    		//生成html页面
		    		if(fileUrl2.indexOf("/")<0 && fileUrl2.indexOf("\\")<0){
						fileUrl2 = "";
					}
		    		categoryToOnline(key+"",fileUrl2);
		        }
		} 
		//获取分类的目录路径
		PrintWriter out = response.getWriter();
		out.print("新闻分类生成成功");
	}
	/**
	 * 分类的html生成
	 * @param id 分类的编号
	 * @param file 分类的路径关系
	 */
	private String categoryToOnline(String id,String file){
		String msg = "";
		Long idToLong = new Long(id);
		NewsCategory newsCategory = (NewsCategory)InitWebsitePropertys.getCategooryListMap().get(idToLong);
		String name_zh="";
		if(newsCategory != null ){
			name_zh = newsCategory.getName_zh();
		}
		//获取站点
		Website_Properties website_Properties = (Website_Properties)session.getAttribute("WEBSITE_SESSION");
		String website_Properties_name_zh = "ruyicai";
		Long website_Properties_id = 0l;
		if(website_Properties != null){
			website_Properties_name_zh = website_Properties.getName_zh();
			website_Properties_id = website_Properties.getId();
		}
		//获取该站点所有频道
		List<NewsChannelMD> newsChannelLst =newsChannelService.query(website_Properties_id);
		
		String path = request.getContextPath();
		String callPath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
		Channel_Template channel_Template2 = new Channel_Template();
		channel_Template2.setCategory_code(idToLong);
		List category_templateList = channel_TemplateService.query(channel_Template2);
		if(category_templateList != null && category_templateList.size()>0){
			for (int i = 0; i < category_templateList.size(); i++) {
				Channel_Template channel_Tem = (Channel_Template)category_templateList.get(i);
				Long templateId = channel_Tem.getTemplate_id();
				NewsTemplate newsTemplate1 = new NewsTemplate();
				newsTemplate1.setId(templateId);
				NewsTemplate newstem = newsTemplateService.queryNewsTemplateById(newsTemplate1);
				if(newstem != null){
					//模板名称
					String jspname = newstem.getName();
					if(jspname != null ){
						//模板路径
						String jspUrl = newstem.getAdderss()==null?"/":newstem.getAdderss()+"/";
						//站点id
						Long websiteurl_id = newstem.getWebsiteurl_id();
						Website_Properties web_pro = web_proService.quiryInId(websiteurl_id);
						if(web_pro != null){
							website_Properties_name_zh = web_pro.getName_zh();
						}
						//生成分类页
						if(!Tools.makeHtml(callPath+jspUrl+"/"+jspname+";jsessionid="+request.getSession().getId()+"?categoryId="+id+"&website_Properties_id="+website_Properties_id, 
								htmlUrl+"/"+website_Properties_name_zh+"/"+file, name_zh+".html")){
						}
						
					}
				}else{
					/*if(!Tools.makeHtml(callPath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_category.jsp;jsessionid="+request.getSession().getId()+"?categoryId="+id+"&website_Properties_id="+website_Properties_id,
							htmlUrl+"/"+website_Properties_name_zh+"/"+file, name_zh+".html")){
					}*/
				}
			}
		}else{
			/*if(!Tools.makeHtml(callPath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_category.jsp;jsessionid="+request.getSession().getId()+"?categoryId="+id+"&website_Properties_id="+website_Properties_id,
					htmlUrl+"/"+website_Properties_name_zh+"/"+file, name_zh+".html")){
			}*/
		}
		/*if(newsChannelLst != null && newsChannelLst.size()>0){
			for (int i = 0; i < newsChannelLst.size(); i++) {
				NewsChannelMD newsChannelMD = (NewsChannelMD) newsChannelLst.get(i);
				if(newsChannelMD.getWebsite_id().equals(website_Properties_id) ){
					   if(!Tools.makeHtml(callPath+templateLocal+"/"+website_Properties_name_zh+"/"+
								website_Properties_name_zh+"_channel_category_"+newsChannelMD.getName_zh()+"_"+name_zh+".jsp;jsessionid="+request.getSession().getId()+
								"?code="+id+"&website_Properties_id="+website_Properties_id+"&channel_id="+newsChannelMD.getId(),
								htmlUrl+"/"+website_Properties_name_zh+"/", newsChannelMD.getName_zh()+"_"+name_zh+".html")){
						}
				}
			}
		}*///暂时不需要
		return msg;
	}
	/**
	 * 获取分类的文件夹关系路径
	 * @param nc 当前分类对象
	 * @param m 所有的分类map
	 * @return 返回拼接的文件夹相关路径
	 */
	private String getCategoryFile(NewsCategory nc,Map<Long,NewsCategory> m){
		
		if(nc.getLeaf()==0){
			return nc.getName_zh()+"/";
		}else{
			NewsCategory myNc = m.get(nc.getPcode());
			if(myNc==null){
				return "";
			}else{
				//当前分类的路径
				String files = getCategoryFile(myNc, m);
				if(files.lastIndexOf("/")>-1){
					files=files.substring(0, files.length()-1);
				}
				String file = files+"/"+(nc.getName_zh()== null?"":(nc.getName_zh()+"/"));
				//上一级路径
				String file2 = file.substring(0, file.length()-1);
				int intsun = file2.lastIndexOf("/");
				if(intsun >-1 ){
					file2 = file2.substring(0, intsun);
				}else{
					file2="";
				}
				//调用生成html方法
				categoryToOnline(myNc.getCode()+"",file2);
				return file;
			}
		}
	}
	/**
	 * 获取分类的文件夹关系路径
	 * @param nc 当前分类对象
	 * @param m 所有的分类map
	 * @return 返回拼接的文件夹相关路径
	 */
	private String getCategoryFile2(NewsCategory nc,Map<Long,NewsCategory> m){
		
		if(nc.getLeaf()==0){
			return nc.getName_zh();
		}else{
			NewsCategory myNc = (NewsCategory)m.get(nc.getPcode());
			if(myNc==null){
				return nc.getName_zh();
			}else{
				//当前分类的路径
				String file = getCategoryFile2(myNc, m)+"/";
				return file;
			}
		}
	}
	/**
	 * 获取分类的文件夹关系路径
	 * @param nc 当前分类对象
	 * @param m 所有的分类map
	 * @return 返回拼接的文件夹相关路径
	 */
	private String getCategoryFile3(NewsCategory nc,Map<Long,NewsCategory> m){
		
		if(nc.getLeaf()==0){
			return nc.getName_zh();
		}else{
			NewsCategory myNc = m.get(nc.getPcode());
			if(myNc==null){
				return nc.getName_zh();
			}else{
				//当前分类的路径
				String file = getCategoryFile3(myNc, m)+"/"+(nc.getName_zh()== null?"":(nc.getName_zh()+"/"));
				return file;
			}
		}
	}
	/**
	 * 频道页上线html生成
	 * @param id
	 */
	private String channelToOnline(String id){
		String msg = "";
		Long idToLong = new Long(id);
		NewsChannelMD newsChannel = newsChannelService.queryObject(idToLong);
		String name_zh = "";
		String name_cn = "";
		if( newsChannel != null){
			name_zh = newsChannel.getName_zh();
			name_cn = newsChannel.getName_cn();
		}
		//获取模板生成的地址
		//获取模板文件夹名称
		String templateLocal = rbint.getString("templateLocal");
		
		String htmlUrl = rbint.getString("htmlLocal");
		//获取站点
		Website_Properties website_Properties = (Website_Properties)session.getAttribute("WEBSITE_SESSION");
		String website_Properties_name_zh = "ruyicai";
		Long website_Properties_id = 0l;
		if(website_Properties != null){
			website_Properties_name_zh = website_Properties.getName_zh();
			website_Properties_id = website_Properties.getId();
		}
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
		String basepath = request.getSession().getServletContext()
		.getRealPath("/");
		Channel_Template channel_Template2 = new Channel_Template();
		channel_Template2.setChannel_id(idToLong);
		List channel_templateList = channel_TemplateService.query(channel_Template2);
		if(channel_templateList != null && channel_templateList.size()>0){
			for (int i = 0; i < channel_templateList.size(); i++) {
				Channel_Template channel_Tem = (Channel_Template)channel_templateList.get(i);
				Long templateId = channel_Tem.getTemplate_id();
				NewsTemplate newsTemplate1 = new NewsTemplate();
				newsTemplate1.setId(templateId);
				NewsTemplate newstem = newsTemplateService.queryNewsTemplateById(newsTemplate1);
				if(newstem != null){
					//模板名称
					String jspname = newstem.getName();
					if(jspname != null ){
						//模板路径
						String jspUrl = newstem.getAdderss()==null?"/":newstem.getAdderss()+"/";
						//站点id
						//生成频道页
						if(!Tools.makeHtml(basePath+jspUrl+jspname+";jsessionid="+request.getSession().getId()+"?channel_id="+id+"&website_Properties_id="+website_Properties_id,
								htmlUrl+"/"+website_Properties_name_zh+"/", name_zh+".html")){
						}
						
					}
				}else{
					/*if(Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_channel.jsp;jsessionid="+request.getSession().getId()+"?id="+id+"&website_Properties_id="+website_Properties_id, 
							htmlUrl+"/"+website_Properties_name_zh+"/",name_zh+".html")){
					}*/
				}
			}
		}else{
			/*if(!Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_channel.jsp;jsessionid="+request.getSession().getId()+"?id="+id+"&website_Properties_id="+website_Properties_id, 
					htmlUrl+"/"+website_Properties_name_zh+"/",name_zh+".html")){
			}*/
		}
		
		return msg;
		
	}
	
	/**
	 * 新闻审批上线
	 * @return
	 * @throws IOException
	 */
	public String jspToHtmlOnline() throws IOException {
		String id = request.getParameter("id")== null?"0":request.getParameter("id");
		//只执行一次
		String msg = newsOnlineOrDown(id,1,0);
		
		request.setAttribute("state",1);
		request.setAttribute("msg",	msg);
		return "msg";
	}
	
	/**
	 * 新闻批量审批上线
	 * @return
	 * @throws IOException
	 */
	public String jspToHtmlMoreOnline() throws IOException {
		String infoId=request.getParameter("ids");
		String msg ="新闻完成批量审批上线";
		if(infoId!=null){
			String[] newsID = infoId.split(",");
			for(int i=0;i<newsID.length;i++){
				 msg += newsOnlineOrDown(newsID[i],1,i);
			}
		}
		request.setAttribute("state",1);
		request.setAttribute("msg",	msg);
		return "msg";
	}
	 /**
	 * 新闻下线 
	 * @return
	 */
	public String newsDownline(){
		String id = request.getParameter("id")== null?"0":request.getParameter("id");
		String msg = newsOnlineOrDown(id,0,0);
		
		request.setAttribute("msg",msg);
		request.setAttribute("state",1);
		return "msg";
	}
	/**
	 * 新闻生成html 或者 下线
	 * @param id
	 * @param type 0为下线 1为上线
	 * @param forID 批量生成时 限制公共页生成次数
	 * @return
	 */
    private String newsOnlineOrDown(String id,int type,int forID){
    	Long idToLong = new Long(id);
    	String templateLocal = rbint.getString("templateLocal");
		//获取html生成路径
		String htmlUrl = rbint.getString("htmlLocal");
		//获取新闻对象
		News newsInfo=this.newsService.queryNewsByIdForObject(idToLong);
		//新闻创建时间
		String createtime = newsInfo.getCreatetime()==null?"20110101010101":newsInfo.getCreatetime();
		newsInfo.setAuditType(type);
		
		createtime = createtime.replaceAll("-", "").replaceAll(" ", "").replaceAll(":", "").replaceAll("\\.", "");
		String msg = "新闻模板 和相关模板生成html成功！";
		String str = "true";
		//获取站点
		Website_Properties website_Properties = (Website_Properties)session.getAttribute("WEBSITE_SESSION");
		String website_Properties_name_zh = "ruyicai";	
		Long website_Properties_id = 0l;
		if(website_Properties != null){
			website_Properties_name_zh = website_Properties.getName_zh();
			website_Properties_id = website_Properties.getId();
		}
		
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
		
		/*新闻分类code生成  begin*/
		Long category_code = newsInfo.getCategoryCode()==null?0:newsInfo.getCategoryCode();
		String newsChannelname="";
		if(category_code != 0){
			//获取分类map
			Map<Long,NewsCategory> map = InitWebsitePropertys.getCategooryListMap();
			NewsCategory nc = map.get(category_code);
			//获取分类的目录路径
			String fileUrl = getCategoryFile(nc,map);
			//生成html页面
			/*新闻分类code生成      end*/
			if(newsInfo.getType() ==1 ){
				newsInfo.setUrl("/"+fileUrl+createtime+"_"+id+".html");
				this.newsService.edit(newsInfo);
			}
			
			//if(newsInfo.getCallUrl()==null || newsInfo.getCallUrl().equals("")){
				String callUrl = "";
				String categoryZh =newsCategoryService.queryCategoryByCode(newsInfo.getCategoryCode()).getName_zh();
				String categoryCn = newsCategoryService.queryCategoryByCode(newsInfo.getCategoryCode()).getName_cn();
				if(categoryCn.indexOf("资讯")>-1){
					categoryCn="新闻";
					
				}else if(categoryCn.indexOf("彩技巧")>-1){
					categoryCn="技巧";
				}else if(categoryCn.indexOf("彩推荐")>-1){
					
					categoryCn="推荐";
				}
				if(categoryCn.indexOf("足彩")>-1 || categoryCn.indexOf("媒体推荐")>-1){
					categoryCn="足彩";
					callUrl="<a href=\"/zucai/zucai__1.html\">"+categoryCn+"</a>";
			    }else if(categoryCn.indexOf("焦点赛事")>-1 ){
					categoryCn="焦点赛事";
					callUrl="<a href=\"/jiaodiansaishi/jiaodiansaishi__1.html\">"+categoryCn+"</a>";
			    }else{
				if(newsInfo.getChannelId()==0){
					callUrl="<a href=/"+categoryZh+"/"+categoryZh+"__1.html>"+newsCategoryService.queryCategoryByCode(newsInfo.getCategoryCode()).getName_cn()+"</a>";
				}else{
					
					callUrl="<a href=/"+categoryZh+"/"+categoryZh+"_"+newsChannelService.queryObject(newsInfo.getChannelId()).getName_zh()+"_1.html>"+newsChannelService.queryObject(newsInfo.getChannelId()).getName_cn()+categoryCn+"</a>";
				}
			   // }
			newsInfo.setCallUrl(callUrl);
			this.newsService.edit(newsInfo);
			}
			
			//修改为已上线
			
			//生成新闻页 如果type == 1 则是上线
				if(newsInfo.getTemplateId() == null || newsInfo.getTemplateId() == 0 ){ 
					//调用默认新闻模板生成html
					if(category_code != 0 ){
						//获取分类map
							String name = getCategoryFile3(nc,map);
							if(name.indexOf("bangzhuzhongxin") > -1){
								if(!"3gcaipiao".equals(website_Properties_name_zh)){
								Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_news_bangzhuzhongxin.jsp;jsessionid="+request.getSession().getId()+"?newsId="+id+"&website_Properties_id="+website_Properties_id+"&title="+URLEncoder.encode(newsInfo.getTitle())+"-", 
										htmlUrl+"/"+website_Properties_name_zh+"/"+fileUrl, createtime+"_"+id+".html");
								}
							}else{
								
								NewsChannelMD newsChannel = newsChannelService.queryObject(newsInfo.getChannelId()==null?0l:newsInfo.getChannelId());
								
								if(newsChannel != null ){
									if(!"3gcaipiao".equals(website_Properties_name_zh)){
										Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_news.jsp;jsessionid="+request.getSession().getId()+"?newsId="+id+"&website_Properties_id="+website_Properties_id+"&channelCn="+URLEncoder.encode(newsChannel.getName_cn())+"&channelId="+(newsInfo.getChannelId()==null?0:newsInfo.getChannelId())+"&callUrl="+URLEncoder.encode(newsInfo.getCallUrl())+"&categoryId="+newsInfo.getCategoryCode()+"&title="+URLEncoder.encode(newsInfo.getTitle())+"-", 
												htmlUrl+"/"+website_Properties_name_zh+"/"+fileUrl, createtime+"_"+id+".html");
									}else{
									Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_news_"+newsChannel.getName_zh()+".jsp;jsessionid="+request.getSession().getId()+"?newsId="+id+"&website_Properties_id="+website_Properties_id+"&channelCn="+URLEncoder.encode(newsChannel.getName_cn())+"&channelId="+(newsInfo.getChannelId()==null?0:newsInfo.getChannelId())+"&callUrl="+URLEncoder.encode(newsInfo.getCallUrl())+"&title="+URLEncoder.encode(newsInfo.getTitle())+"-", 
											htmlUrl+"/"+website_Properties_name_zh+"/"+fileUrl, createtime+"_"+id+".html");
									}
									newsChannelname = newsChannel.getName_zh();
								}else{
									Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_news.jsp;jsessionid="+request.getSession().getId()+"?newsId="+id+"&website_Properties_id="+website_Properties_id+"&channelCn="+URLEncoder.encode("资讯")+"&channelId=0"+"&callUrl="+URLEncoder.encode(newsInfo.getCallUrl())+"&categoryId="+newsInfo.getCategoryCode()+"&title="+URLEncoder.encode(newsInfo.getTitle())+"-", 
											htmlUrl+"/"+website_Properties_name_zh+"/"+fileUrl, createtime+"_"+id+".html");
								}
							}
						
					
					}
					else {
								if(!Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_news.jsp;jsessionid="+request.getSession().getId()+"?newsId="+id+"&website_Properties_id="+website_Properties_id+"&categoryId="+newsInfo.getCategoryCode()+"&channelCn="+URLEncoder.encode("资讯")+"&channelId=0"+"&callUrl="+URLEncoder.encode(newsInfo.getCallUrl())+"&categoryId="+newsInfo.getCategoryCode()+"&title="+URLEncoder.encode(newsInfo.getTitle())+"-", 
									htmlUrl+"/"+website_Properties_name_zh+"/"+fileUrl, createtime+"_"+id+".html")){
								str = "false";
								msg="";
								msg += "默认新闻模板没有找到,";
								}
							}
				}else{
					NewsTemplate newsTemplate1 = new NewsTemplate();
					newsTemplate1.setId(new Long(newsInfo.getTemplateId()));
					NewsTemplate newstem = newsTemplateService.queryNewsTemplateById(newsTemplate1);
					
					NewsChannelMD newsChannel = newsChannelService.queryObject(newsInfo.getChannelId()==null?0l:newsInfo.getChannelId());
					if(newstem != null){
						//模板名称
						String jspname = newstem.getName();
						if(jspname != null){
							//模板路径
							String jspUrl = newstem.getAdderss()==null?"/":newstem.getAdderss()+"/";
							
							if(newsChannel != null ){
								if(!"3gcaipiao".equals(website_Properties_name_zh)){
									Tools.makeHtml(basePath+jspUrl+jspname+";jsessionid="+request.getSession().getId()+"?newsId="+id+"&website_Properties_id="+website_Properties_id+"&categoryId="+newsInfo.getCategoryCode()+"&channelCn="+URLEncoder.encode(newsChannel.getName_cn())+"&channelId="+(newsInfo.getChannelId()==null?0:newsInfo.getChannelId())+"&callUrl="+URLEncoder.encode(newsInfo.getCallUrl())+"&title="+URLEncoder.encode(newsInfo.getTitle())+"-", 
											htmlUrl+"/"+website_Properties_name_zh+"/"+fileUrl, createtime+"_"+id+".html");
								}else{
								Tools.makeHtml(basePath+jspUrl+jspname+";jsessionid="+request.getSession().getId()+"?newsId="+id+"&website_Properties_id="+website_Properties_id+"&categoryId="+newsInfo.getCategoryCode()+"&channelCn="+URLEncoder.encode(newsChannel.getName_cn())+"&channelId="+(newsInfo.getChannelId()==null?0:newsInfo.getChannelId())+"&callUrl="+URLEncoder.encode(newsInfo.getCallUrl())+"&title="+URLEncoder.encode(newsInfo.getTitle())+"-", 
										htmlUrl+"/"+website_Properties_name_zh+"/"+fileUrl, createtime+"_"+id+".html");
								}
								newsChannelname = newsChannel.getName_zh();
							}else{
								Tools.makeHtml(basePath+jspUrl+jspname+";jsessionid="+request.getSession().getId()+"?newsId="+id+"&website_Properties_id="+website_Properties_id+"&categoryId="+newsInfo.getCategoryCode()+"&channelCn="+URLEncoder.encode("资讯")+"&channelId=0"+"&callUrl="+URLEncoder.encode(newsInfo.getCallUrl())+"&title="+URLEncoder.encode(newsInfo.getTitle())+"-", 
										htmlUrl+"/"+website_Properties_name_zh+"/"+fileUrl, createtime+"_"+id+".html");
							}
							

						}
					}else{
						if(!Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_news.jsp;jsessionid="+request.getSession().getId()+"?newsId="+id+"&website_Properties_id="+website_Properties_id+"&categoryId="+newsInfo.getCategoryCode()+"&callUrl="+URLEncoder.encode(newsInfo.getCallUrl())+"&title="+URLEncoder.encode(newsInfo.getTitle())+"-", 
								htmlUrl+"/"+website_Properties_name_zh+"/"+fileUrl, createtime+"_"+id+".html")){
							str = "false";
							msg="";
							msg += "默认新闻模板没有找到,";
						}
					}
				}
				
				
				
				//////////////
				String keys =String.valueOf(newsInfo.getCategoryCode())+"_"+String.valueOf(newsInfo.getChannelId());
			         if(contMap.size()==0||!keys.equals(contMap.get(keys))){
						contMap.put(keys, keys);
						//分页
						int count = 0; 
						int count2 = 0;
						if(newsInfo.getChannelId()==null || newsInfo.getChannelId() ==0){
							
							count = newsService.queryNewsCountById(null, new Long(newsInfo.getCategoryCode()), new Long(website_Properties_id));
						}else{
							count = newsService.queryNewsCountById(new Long(newsInfo.getChannelId()), new Long(newsInfo.getCategoryCode()), new Long(website_Properties_id));
						}
						if(nc.getPcode()!=null){
							
							count2 = newsService.queryNewsCountById(new Long(newsInfo.getChannelId()), nc.getPcode(), new Long(website_Properties_id));
						}
						int total = count/20 +(count%20 == 0?0:1);
						int total2 = count2/20 +(count2%20 == 0?0:1);
						int total3 = count/5 +(count%5 == 0?0:1);
						if(nc.getName_zh().equals("huodongzhuanti")){
							total=total3;
						}
						String title="";
						
						NewsChannelMD newsChannel = newsChannelService.queryObject(newsInfo.getChannelId()==null?0l:newsInfo.getChannelId());
						if(newsChannel!=null){
							if(nc.getName_zh().equals("zucai")){
								title=URLEncoder.encode("足彩资讯|胜负彩推荐|胜负彩开奖查询|胜负彩奖池|任选9场奖金|胜负彩冷门");
							}else if(nc.getName_zh().equals("jiaodiansaishi")){
								title=URLEncoder.encode("竞彩专家预测|竞彩资讯|竞彩推荐|竞彩玩法技巧|北单预测|北单推荐");
							}else{
								title=URLEncoder.encode(newsChannel.getName_cn()+"资讯|"+newsChannel.getName_cn()+"加奖|"+newsChannel.getName_cn()+"开奖查询|"+newsChannel.getName_cn()+"推荐|"+newsChannel.getName_cn()+"中奖故事|"+newsChannel.getName_cn()+"奖池 如意彩");
							}
						}else {
							title=URLEncoder.encode("彩票资讯-网上买彩票-如意彩网");
						}
						
						for (int j = 1; j <= total; j++) {
							 
							if(nc.getName_zh().equals("zhuanjiazhanji")||nc.getName_zh().equals("redianxinwen")){
								Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_category_zjdxList.jsp"+";jsessionid="+request.getSession().getId()+"?" +
										"website_Properties_id="+website_Properties_id+"&cpage="+j+"&num=20&total="+total+"&url=/"+nc.getName_zh()+"/"+nc.getName_zh()+"_"+newsChannelname+"_"
										+"&begin="+((j-1)*20)+"&channelId="+(newsInfo.getChannelId()==null?0:newsInfo.getChannelId())+"&categoryId="+newsInfo.getCategoryCode()+"&callUrl="+URLEncoder.encode(newsInfo.getCallUrl())+"&categoryCN="+title+"-",
										htmlUrl+"/"+website_Properties_name_zh+"/"+nc.getName_zh()+"/", nc.getName_zh()+"_"+newsChannelname+"_"+j+".html");
							} else if(nc.getName_zh().equals("zucai")||nc.getName_zh().equals("jiaodiansaishi")||nc.getName_zh().equals("wangzhangonggao")||nc.getName_zh().equals("meitituijian")||nc.getName_zh().equals("huodonggonggao")){
								Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_category_zckjggList.jsp"+";jsessionid="+request.getSession().getId()+"?" +
										"website_Properties_id="+website_Properties_id+"&cpage="+j+"&num=20&total="+total+"&url=/"+nc.getName_zh()+"/"+nc.getName_zh()+"__"
										+"&begin="+((j-1)*20)+"&channelId=0&categoryId="+newsInfo.getCategoryCode()+"&callUrl="+URLEncoder.encode(newsInfo.getCallUrl())+"&pcode="+(nc.getPcode()==null?-1:nc.getPcode())+"&categoryCN="+title+"-",
										htmlUrl+"/"+website_Properties_name_zh+"/"+nc.getName_zh()+"/", nc.getName_zh()+"__"+j+".html");
							}else if(nc.getName_zh().equals("huodongzhuanti")){
								Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_category_activityList.jsp"+";jsessionid="+request.getSession().getId()+"?" +
										"website_Properties_id="+website_Properties_id+"&cpage="+j+"&num=5&total="+total+"&url=/activity/activity__"
										+"&begin="+((j-1)*5)+"&channelId=0&categoryId="+newsInfo.getCategoryCode()+"&callUrl="+URLEncoder.encode(newsInfo.getCallUrl())+"&pcode="+(nc.getPcode()==null?-1:nc.getPcode())+"&categoryCN="+title+"-",
										htmlUrl+"/"+website_Properties_name_zh+"/activity/", "activity__"+j+".html");
							}else{
								Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_channel_xwzx.jsp"+";jsessionid="+request.getSession().getId()+"?" +
										"website_Properties_id="+website_Properties_id+"&cpage="+j+"&num=20&total="+total+"&url=/"+nc.getName_zh()+"/"+nc.getName_zh()+"_"+newsChannelname+"_"
										+"&begin="+((j-1)*20)+"&channelId="+(newsInfo.getChannelId()==null?0:newsInfo.getChannelId())+"&categoryId="+newsInfo.getCategoryCode()+"&callUrl="+URLEncoder.encode(newsInfo.getCallUrl())
										+"&pcode="+(nc.getPcode()==null?-1:nc.getPcode())+"&categoryCN="+title+"-",
										htmlUrl+"/"+website_Properties_name_zh+"/"+nc.getName_zh()+"/", nc.getName_zh()+"_"+newsChannelname+"_"+j+".html");
							}
							
						}
						/*if(nc.getPcode()!= null && !nc.getPcode().toString().equals("-1")){
							NewsCategory newsc = (NewsCategory)newsCategoryService.queryCategoryByCode(nc.getPcode());
							if(newsc != null){
								if(nc.getName_zh().equals("meitituijian")){
									for (int j = 1; j <= total2; j++) {
										Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_category_zckjggList.jsp"+";jsessionid="+request.getSession().getId()+"?" +
												"website_Properties_id="+website_Properties_id+"&cpage="+j+"&num=20&total="+total+"&url=/"+nc.getName_zh()+"/"+nc.getName_zh()+"__"
												+"&begin="+((j-1)*20)+"&channelId=0&categoryId="+newsInfo.getCategoryCode()+"&callUrl="+URLEncoder.encode(newsInfo.getCallUrl())+"&pcode="+(nc.getPcode()==null?-1:nc.getPcode())+"&categoryCN="+title+"-",
												htmlUrl+"/"+website_Properties_name_zh+"/"+nc.getName_zh()+"/", nc.getName_zh()+"__"+j+".html");
									
								}
									
								}else{
								for (int j = 1; j <= total2; j++) {
										Tools.makeHtml(basePath+templateLocal+"/"+website_Properties_name_zh+"/"+website_Properties_name_zh+"_channel_xwzx.jsp"+";jsessionid="+request.getSession().getId()+"?" +
												"website_Properties_id="+website_Properties_id+"&cpage="+j+"&num=20&total="+total2+"&url=/"+newsc.getName_zh()+"/"+newsc.getName_zh()+"_"+newsChannelname+"_"
												+"&begin="+((j-1)*20)+"&channelId="+(newsInfo.getChannelId()==null?0:newsInfo.getChannelId())+"&categoryId="+nc.getPcode()+"&callUrl="+URLEncoder.encode(newsInfo.getCallUrl())
												+"&pcode="+(nc.getPcode()==null?-1:nc.getPcode())+"&categoryCN="+title+"-",
												htmlUrl+"/"+website_Properties_name_zh+"/"+newsc.getName_zh()+"/", newsc.getName_zh()+"_"+newsChannelname+"_"+j+".html");
									
								}
								}
							}
						}*///生成父分类的列表，暂不需要
						
						////
						
					}
				}
				
		
		return msg;
    	
    }
   
	
	/**
	 * 删除指定新闻模板 
	 * @return
	 */
	public String delNewsTemplate(){
		//获取要删除的新闻模板的ID，如果新闻模板ID为null 或者 0 则认为是错误的ID。
		Long id = (request.getParameter("id")==null?0:Long.valueOf((String)request.getParameter("id")));
		if(id>0){
			NewsTemplate record = new NewsTemplate();
			record.setId(id);
			NewsTemplate newsTemplate = newsTemplateService.queryNewsTemplateById(record);
			String fileName = newsTemplate.getCode()+"/"+newsTemplate.getName();
			String delcode = newsTemplateService.remove(id);
			if(FinalVar.UPDATE_SUCCESS.equals(delcode)){
				if(deleteFile(fileName)){
					request.setAttribute("msg",	"删除新闻模板成功！");
				}
				else{
					request.setAttribute("msg",	"删除新闻模板文件没被删除！");
				}
				request.setAttribute("state","1");
			}else{
				request.setAttribute("msg",	"删除新闻模板失败！");
			}	
		}else{
			request.setAttribute("msg",	"没有找到要删除的新闻模板！");
		}
		
		return "msg";
	}
	/**
	 * 修改指定的新闻模板
	 * @return
	 * @throws IOException 
	 */
	public void modify() throws IOException{
		//获取要删除的新闻模板的ID，如果新闻模板ID为null 或者 0 则认为是错误的ID。
		String updatecode = newsTemplateService.eidt(newsTemplate);
		PrintWriter out = response.getWriter(); 
		if(FinalVar.UPDATE_SUCCESS.equals(updatecode)){
			out.print("保存成功！");
		}else if(FinalVar.UPDATE_THERE.equals(updatecode)){
			out.print("保存失败！找不到对应的新闻模板！");
		}else{
			out.print("保存失败！");
		}	
	}
	
	/**
	* 删除单个文件
	* @param fileName 要删除的文件的文件名
	* @return 单个文件删除成功返回true，否则返回false
	*/
	public static boolean deleteFile(String fileName) {
		File file = new File(fileName);
		// 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
		if(file.exists() && file.isFile()) {
				if(file.delete()) {
				System.out.println("删除单个文件" + fileName + "成功！");
				return true;
			} else {
				System.out.println("删除单个文件" + fileName + "失败！");
				return false;
			}
		} else {
			System.out.println("删除单个文件失败：" + fileName + "不存在！");
			return false;
		}
	}
	/**
	* 删除目录及目录下的文件
	* @param dir 要删除的目录的文件路径
	* @return 目录删除成功返回true，否则返回false
	*/
	public static boolean deleteDirectory(String dir) {
		// 如果dir不以文件分隔符结尾，自动添加文件分隔符
		if(!dir.endsWith(File.separator))
			dir = dir + File.separator;
			File dirFile = new File(dir);
		// 如果dir对应的文件不存在，或者不是一个目录，则退出
		if((!dirFile.exists()) || (!dirFile.isDirectory())) {
			System.out.println("删除目录失败：" + dir + "不存在！");
			return false;
		}
		boolean flag = true;
		// 删除文件夹中的所有文件包括子目录
		File[] files = dirFile.listFiles();
		for(int i = 0; i < files.length; i++) {
			// 删除子文件
			if(files[i].isFile()) {
				flag = deleteFile(files[i].getAbsolutePath());
				if(!flag)
				break;
			}
			// 删除子目录
			else if(files[i].isDirectory()) {
				flag = deleteDirectory(files[i].getAbsolutePath());
				if(!flag)
				break;
			}
		}
		if(!flag) {
			System.out.println("删除目录失败！");
			return false;
		}
		//删除当前目录
		if(dirFile.delete()) {
			System.out.println("删除目录" + dir + "成功！");
			String str="_";
			for (int i = 0; i < 20; i++) {
				str += str;
				System.out.println(str);
			}
			return true;
		} else {
			return false;
		}
	}


}
