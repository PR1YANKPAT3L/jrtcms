package com.jrtcms.web.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.jrtcms.web.model.NewsCategoryMD;
import com.jrtcms.web.model.NewsChannelMD;
import com.jrtcms.web.model.NewsInfoMD;
import com.jrtcms.web.pojo.Channel_Template;
import com.jrtcms.web.pojo.NewsChannel;
import com.jrtcms.web.pojo.NewsInfo;
import com.jrtcms.web.pojo.NewsTemplate;
import com.jrtcms.web.pojo.Website_Properties;
import com.jrtcms.web.service.Channel_TemplateService;
import com.jrtcms.web.service.NewsCategoryService;
import com.jrtcms.web.service.NewsChannelService;
import com.jrtcms.web.service.NewsInfoService;
import com.jrtcms.web.service.NewsTemplateService;
import com.jrtcms.web.util.BaseAction;
import com.jrtcms.web.util.FinalVar;
import com.jrtcms.web.util.Page;

/**
 * @classname: NewsInfoAction
 * @description 新闻Action
 * @author 蓝生
 * @date： 2011-2-14 上午11:31:02
 */

public class NewsInfoAction extends BaseAction {
	private Logger log = Logger.getLogger(NewsInfoAction.class);
	private static final long serialVersionUID = 670072335376247928L;
	private static final int BUFFER_SIZE = 16 * 1024;
	private NewsInfoService newsInfoService;
	private NewsInfo newsInfo = new NewsInfo();
	private NewsInfoMD newsInfoMD = new NewsInfoMD();
	private NewsInfoMD newsInfoMD2 = new NewsInfoMD();
	private NewsChannelService newsChannelService;
	private Website_Properties websitePropertity = new Website_Properties();
	private NewsTemplateService newTemplateServince;
	private NewsTemplate newTemplate = new NewsTemplate();
	private NewsCategoryMD newsCategoryMD = new NewsCategoryMD();
	private NewsCategoryService newsCategoryServince;
	private NewsChannel newsChannel = new NewsChannel();
	private Channel_TemplateService channelTemplate;
	private Channel_Template channel_Template = new Channel_Template();

	public Channel_Template getChannel_Template() {
		return channel_Template;
	}

	public void setChannel_Template(Channel_Template channel_Template) {
		this.channel_Template = channel_Template;
	}

	public NewsInfoMD getNewsInfoMD2() {
		return newsInfoMD2;
	}

	public void setNewsInfoMD2(NewsInfoMD newsInfoMD2) {
		this.newsInfoMD2 = newsInfoMD2;
	}

	private File upload;
	private String fileName;
	private String uploadContentType;

	public NewsTemplateService getNewTemplateServince() {
		return newTemplateServince;
	}

	public void setNewTemplateServince(NewsTemplateService newTemplateServince) {
		this.newTemplateServince = newTemplateServince;
	}

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

	public NewsInfo getNewsInfo() {
		return newsInfo;
	}

	public void setNewsInfo(NewsInfo newsInfo) {
		this.newsInfo = newsInfo;
	}

	public NewsInfoMD getNewsInfoMD() {
		return newsInfoMD;
	}

	public void setNewsInfoMD(NewsInfoMD newsInfoMD) {
		this.newsInfoMD = newsInfoMD;
	}

	public NewsInfoService getNewsInfoService() {
		return newsInfoService;
	}

	public void setNewsInfoService(NewsInfoService newsInfoService) {
		this.newsInfoService = newsInfoService;
	}

	public NewsChannelService getNewsChannelService() {
		return newsChannelService;
	}

	public void setNewsChannelService(NewsChannelService newsChannelService) {
		this.newsChannelService = newsChannelService;
	}

	/**
	 * @description: 添加新闻
	 * @return
	 */
	public String createNewsInfo() {
		// 调用接口方法实现添加
		try {
			BufferedInputStream in = new BufferedInputStream(
					new FileInputStream(upload));
			BufferedOutputStream out = new BufferedOutputStream(
					new FileOutputStream(ServletActionContext
							.getServletContext().getRealPath("/")
							+ "../upload/" + this.getUploadFileName()));
			byte[] b = new byte[BUFFER_SIZE];
			while (in.read(b) != -1) {
				out.write(b);
				out.flush();
			}
			in.close();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		Long channel_id = Long.valueOf((String) request.getParameter("select"));
		Long webSiteID = Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE"));
		Long category_code = Long.valueOf(request
				.getParameter("newsCategoryMD.pcode"));
		Integer template_id = Integer.valueOf((String) request
				.getParameter("select2"));
		newsInfo.setTemplate_id(template_id);
		newsInfo.setPic_name("upload/" + fileName);
		newsInfo.setChannel_id(channel_id);
		newsInfo.setCategory_code(category_code);
		newsInfo.setStatus(0);
		newsInfo.setAudit_type(1);
		newsInfo.setWebsite_id(webSiteID);
		String insertcode = newsInfoService.add(newsInfo);
		String channelCode = channelTemplate
				.addChannel_TemplateService(channel_Template);
		if (FinalVar.INSERT_SUCCESS.equals(insertcode)
				&& FinalVar.INSERT_SUCCESS.equals(channelCode)) {
			request.setAttribute("msg", "新闻添加成功");
			return "insertnewsinfo";
		} else {
			request.setAttribute("msg", "新闻添加失败");
			return "msg";
		}
	}

	/**
	 * 新闻编辑前的方法
	 * 
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public String modifyNewsInfoById() throws UnsupportedEncodingException{
		String code=request.getParameter("code");
		String codeName=request.getParameter("codeName");
		codeName= new String(codeName.getBytes("ISO-8859-1"), "utf-8");
		newsInfoMD.setCategory_code(new Long(code));
		newsInfoMD.setCategory_name_cn(codeName);
		Long id = Long.valueOf((String)request.getParameter("id"));
		Long webSiteID = Long.valueOf((String)session.getAttribute("ADMIN_WEBSITE"));
        NewsTemplate record = new NewsTemplate();
		record.setShowflag(0);
		record.setType(3);
		newsInfo.setId(id);
		List<NewsChannelMD> newsChannelList = newsChannelService
				.query(webSiteID);
		List<NewsTemplate> newsTemplateList = newTemplateServince
				.queryNewsTemplateByType(record);
		NewsInfo newsInfo = this.newsInfoService.queryNewsInfoById(id);
		request.setAttribute("ncList", newsChannelList);

		request.setAttribute("ntList", newsTemplateList);	
		request.setAttribute("newsInfoMD",newsInfoMD);
		request.setAttribute("n",newsInfo);
			return "editSuccess";

	}

	/**
	 * 新闻编辑
	 * 
	 * @return
	 */
	public String modifyNewsInfo() {
		try {
			BufferedInputStream in = new BufferedInputStream(
					new FileInputStream(upload));
			BufferedOutputStream out = new BufferedOutputStream(
					new FileOutputStream(ServletActionContext
							.getServletContext().getRealPath("/")
							+ "../upload/" + this.getUploadFileName()));
			byte[] b = new byte[BUFFER_SIZE];
			while (in.read(b) != -1) {
				out.write(b);
				out.flush();
			}
			in.close();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		Long id = Long.valueOf((String)request.getParameter("id"));
		newsInfo.setId(id);
		Integer num = Integer.parseInt(request.getParameter("top_news"));
		if (num == 0) {
			newsInfo.setTop_news(0);
		} else if (num == 1) {
			newsInfo.setTop_news(1);
		}
		Integer flag = Integer.parseInt(request.getParameter("type"));
		System.out.println(newsInfo.getType());
		if (flag == 0) {
			newsInfo.setType(0);
			newsInfo.setPic_name("upload/" + fileName);
			String channelCode = channelTemplate
					.addChannel_TemplateService(channel_Template);
			String editCount = newsInfoService.editNewsInfo(newsInfo);
			if (FinalVar.UPDATE_SUCCESS.equals(editCount)) {
				log.info("新闻更新成功");
				request.setAttribute("msg", "新闻更新成功");
				request.setAttribute("state", "1");
				return "editnewsinfo";
			} else {
				request.setAttribute("msg", "更新新闻失败！");
				return "editnewsinfo";
			}
		} else if (flag == 1) {
			newsInfo.setType(1);
			newsInfo.setPic_name("upload/" + fileName);
			String channelCode = channelTemplate
					.addChannel_TemplateService(channel_Template);
			String editCount = newsInfoService.editNewsInfo(newsInfo);
			if (FinalVar.UPDATE_SUCCESS.equals(editCount)) {
				log.info("新闻更新成功");
				request.setAttribute("msg", "新闻更新成功");
				request.setAttribute("state", "1");
				return "editnewsinfo";
			} else {
				request.setAttribute("msg", "更新新闻失败！");
				return "editnewsinfo";
			}
		}
		return "msg";
	}

	/**
	 * 新闻删除
	 * 
	 * @return
	 */
	public String deleteNewsInfo(){
			String infoId=request.getParameter("newsinInfo");
			Long newsInfo_id=(long) 0;
			if(infoId!=null){
				String[] newsID = infoId.split(",");
				
				for(int i=0;i<newsID.length;i++){
					
					newsInfo_id =Long.valueOf( newsID[i]);
					if(newsInfo_id>0){
						NewsInfo newsInfo = this.newsInfoService.queryNewsInfoById(newsInfo_id);
						newsInfo.setStatus(1);
						String delcode = newsInfoService.editNewsInfo(newsInfo);
						if(FinalVar.UPDATE_SUCCESS.equals(delcode)){
							request.setAttribute("msg",	"删除新闻成功！");
							request.setAttribute("state","1");
						}else{
							request.setAttribute("msg",	"删除新闻失败！");
						}	
					}else{
						request.setAttribute("msg",	"没有找到要删除的新闻！");
					}
				}
			}else{
				Long id = (request.getParameter("id")==null?newsInfo_id:Long.valueOf((String)request.getParameter("id")));
				if(id>0){
					NewsInfo newsInfo = this.newsInfoService.queryNewsInfoById(id);
					newsInfo.setStatus(1);
					String delcode = newsInfoService.editNewsInfo(newsInfo);
					if(FinalVar.UPDATE_SUCCESS.equals(delcode)){
						request.setAttribute("msg",	"删除新闻成功！");
						request.setAttribute("state","1");
					}else{
						request.setAttribute("msg",	"删除新闻失败！");
					}	
				}else{
					request.setAttribute("msg",	"没有找到要删除的新闻！");
				}
				
				
			}
			
	
		return "msg";
	}

	/**
	 * 新闻驳回
	 * 
	 * @return
	 */
	public String modifyNewsInfoBack() {
		Long id = (request.getParameter("id") == null ? 0 : Long
				.valueOf((String) request.getParameter("id")));
		NewsInfo newsInfo1 = this.newsInfoService.queryNewsInfoById(id);
		if (id > 0) {
			newsInfo1.setId(id);
			Integer num = Integer.parseInt(request.getParameter("typeCount"));
			newsInfo1.setAudit_type(num);
			String msg = "";
			if (num == 2) {
				msg = "驳回";
			}
			if (num == 1) {
				msg = "再审";
			}
			String editBack = newsInfoService.editNewsInfo(newsInfo1);
			if (FinalVar.UPDATE_SUCCESS.equals(editBack)) {
				request.setAttribute("msg", msg + "新闻成功！");
				request.setAttribute("state", "1");
			} else {
				request.setAttribute("msg", "已审批的新闻！");
			}
		} else {
			request.setAttribute("msg", "未审批的新闻！");
		}
		return "msg";
	}

	/**
	 * 新闻查询
	 * 
	 * @return
	 */
	public String getNewsInfoList() {
		// 传递的页
		// String nowPage = request.getParameter("nowPage");
		// //显示的行数
		// String limitCount = request.getParameter("limitCount");
		// //起始位置
		// int limitStart =
		// (Integer.parseInt(nowPage)-1)*Integer.parseInt(limitCount);
		// newsInfoMD.setStatus(0);
		// newsInfoMD.setNowPage(0);
		// newsInfoMD.setLimitCount(100);
		// newsInfoMD.setTitle("a");//测试模糊查询
		// 测试生成时间范围查询

		if(newsInfoMD2.getSartTime()==null){
			newsInfoMD2.setSartTime("2011-01-01 00:00:00");
		}
		if(newsInfoMD2.getEndTime()==null){
			 String nowtime = new Timestamp(new Date().getTime()).toString();
			newsInfoMD2.setEndTime(nowtime);
		}
		Long webSiteID = Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE"));
		
		List<NewsChannelMD> newsChannelList = newsChannelService
				.query(webSiteID);
		request.setAttribute("newsChannelList", newsChannelList);
		int count = newsInfoService.queryAllNewsInfoCount(newsInfoMD);
		Page page = null;
		if (count > 0) {
			String num = request.getParameter("num");
			if(num==null){
				num="1";
			}
			// 测试用设置website_id
			newsInfoMD.setWebsite_id(Long.valueOf("3"));
			newsInfoMD.setNowPage((Integer.valueOf(num) - 1)
					* newsInfoMD.getLimitCount());
			page = newsInfoService.queryNewsInfoOnpage(count, newsInfoMD);

			String ls = "web/newsInfo!getNewsInfoList?";
			request.setAttribute("ls", ls);
			request.setAttribute("page", page);


			// System.out.println(url);
		}

		// List<NewsInfoMD> newsInfoList =
		// newsInfoService.queryNewsInfo(newsInfoMD);
		// for(NewsInfo temp:newsInfoList){
		// temp.setCreatetime(temp.getCreatetime().substring(0,10));
		// }
		// request.setAttribute("newsInfoList", newsInfoList);
		//
		return "newsinfolist";

	}

	/**
	 * 添加新闻前的方法
	 * 
	 * @return
	 */
	public String BeforNewsAdd() {
		Long webSiteID = Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE"));
		NewsTemplate record = new NewsTemplate();
		record.setShowflag(0);
		record.setType(3);
		List<NewsChannelMD> newsChannelList = newsChannelService
				.query(webSiteID);
		List<NewsTemplate> newsTemplateList = newTemplateServince
				.queryNewsTemplateByType(record);
		request.setAttribute("newsChannelList", newsChannelList);
		request.setAttribute("newsTemplateList", newsTemplateList);
		return "channelList";
	}
	
	/**
	 * 新闻的多条件查询
	 * @return
	 */
	public String getSearchList(){
		//传递的页
		//String nowPage = request.getParameter("nowPage");
		//显示的行数
		//String limitCount = request.getParameter("limitCount");
        //起始位置
		//int limitStart = (Integer.parseInt(nowPage)-1)*Integer.parseInt(limitCount);
		
		Long webSiteID = Long.valueOf((String)session.getAttribute("ADMIN_WEBSITE"));
		List<NewsChannelMD> newsChannelList = newsChannelService.query(webSiteID);
		request.setAttribute("newsChannelList", newsChannelList);
		if(request.getAttribute("newsInfoMD1")==null){	
		newsInfoMD2.setCategory_code(newsCategoryMD.getPcode());
		
		if(newsInfoMD2.getSartTime()==null || newsInfoMD2.getSartTime().equals("")){
			newsInfoMD2.setSartTime("2011-01-01 00:00:00");
		}
		if(newsInfoMD2.getEndTime()==null||newsInfoMD2.getEndTime().equals("")){
			newsInfoMD2.setEndTime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		}
		if(newsInfoMD2.getTop_news()==null || newsInfoMD2.getTop_news()== -1){
			newsInfoMD2.setTop_news(null);
			System.out.println(newsInfoMD2.getTop_news());
		}
		if(newsInfoMD2.getChannel_id()==null || newsInfoMD2.getChannel_id()==0){
			newsInfoMD2.setChannel_id(null);
		}
		if(newsInfoMD2.getCategory_code() ==null || newsInfoMD2.getCategory_code()==-1){
			newsInfoMD2.setCategory_code(null);
			
		}
		if(newsInfoMD2.getContent()==null || newsInfoMD2.getContent()==""){
			newsInfoMD2.setContent(null);
		}
		if(newsInfoMD2.getAudit_type()==null || newsInfoMD2.getAudit_type()==-1){
			newsInfoMD2.setAudit_type(null);
		}
		if(newsInfoMD2.getType()==null|| newsInfoMD2.getType()==-1){
			newsInfoMD2.setType(null);
		}
		if(newsInfoMD2.getWap_state()==null || newsInfoMD2.getWap_state()==-1){
			newsInfoMD2.setWap_state(null);
		}
	}else{
			NewsInfoMD newsInfoMD2 = new NewsInfoMD();
			newsInfoMD2 = (NewsInfoMD) request.getAttribute("newsInfoMD1");
		}
		
		int count = newsInfoService.queryAllNewsInfoCount(newsInfoMD2);
		Page page = null;
		if (count > 0) {
			String num = request.getParameter("num");
			if(num==null){
				num = "1";
			}
			newsInfoMD2.setNowPage(Integer.valueOf(num));
			page = newsInfoService.queryNewsInfoOnpage(count, newsInfoMD2);
			String ls = "web/newsInfo!getSearchList?";
			request.setAttribute("ls", ls);
			request.setAttribute("page", page);
		}
		
		request.setAttribute("newsInfoMD1", newsInfoMD2);
		
		return "newsinfolist";
		
	}
	/**
	 * 模板调用方法，获取新闻信息
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String getNewsInfoById() throws UnsupportedEncodingException {
		Long id = Long.valueOf((String) request.getParameter("id"));
		NewsInfo newsInfo = this.newsInfoService.queryNewsInfoById(id);
		request.setAttribute("newsInfo", newsInfo);
		return "news";
	}

	public NewsTemplate getNewTemplate() {
		return newTemplate;
	}

	public void setNewTemplate(NewsTemplate newTemplate) {
		this.newTemplate = newTemplate;
	}

	public void setWebsitePropertity(Website_Properties websitePropertity) {
		this.websitePropertity = websitePropertity;
	}

	public Website_Properties getWebsitePropertity() {
		return websitePropertity;
	}

	public void setNewsCategoryServince(NewsCategoryService newsCategoryServince) {
		this.newsCategoryServince = newsCategoryServince;
	}

	public NewsCategoryService getNewsCategoryServince() {
		return newsCategoryServince;
	}

	public void setChannelTemplate(Channel_TemplateService channelTemplate) {
		this.channelTemplate = channelTemplate;
	}

	public Channel_TemplateService getChannelTemplate() {
		return channelTemplate;
	}

	public void setNewsChannel(NewsChannel newsChannel) {
		this.newsChannel = newsChannel;
	}

	public NewsChannel getNewsChannel() {
		return newsChannel;
	}

	public void setNewsCategoryMD(NewsCategoryMD newsCategoryMD) {
		this.newsCategoryMD = newsCategoryMD;
	}

	public NewsCategoryMD getNewsCategoryMD() {
		return newsCategoryMD;
	}

}
