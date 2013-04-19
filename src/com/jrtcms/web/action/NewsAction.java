package com.jrtcms.web.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

import com.jrtcms.web.model.NewsChannelMD;
import com.jrtcms.web.model.NewsMD;
import com.jrtcms.web.pojo.Admin;
import com.jrtcms.web.pojo.News;
import com.jrtcms.web.pojo.NewsTemplate;
import com.jrtcms.web.pojo.Website_Properties;
import com.jrtcms.web.service.NewsCategoryService;
import com.jrtcms.web.service.NewsChannelService;
import com.jrtcms.web.service.NewsService;
import com.jrtcms.web.service.NewsTemplateService;
import com.jrtcms.web.util.BaseAction;
import com.jrtcms.web.util.FinalVar;

public class NewsAction extends BaseAction {
	private static final long serialVersionUID = 3666018189768927656L;
	private Logger log = Logger.getLogger(NewsInfoAction.class);
	private static ResourceBundle rbint = ResourceBundle.getBundle("jrtcms");
	private News n = new News();
	private NewsMD nmd = new NewsMD();
	private NewsService newsService;
	private NewsChannelService newsChannelService;
	private NewsTemplateService newsTemplateServince;
	private NewsCategoryService newsCategoryService;
	
	public NewsCategoryService getNewsCategoryService() {
		return newsCategoryService;
	}

	public void setNewsCategoryService(NewsCategoryService newsCategoryService) {
		this.newsCategoryService = newsCategoryService;
	}

	// 获取图片生成路径的主路径 D\:/WEB
	private static String uploadLocation = rbint.getString("htmlLocal");

	public NewsMD getNmd() {
		return nmd;
	}

	public void setNmd(NewsMD nmd) {
		this.nmd = nmd;
	}

	public News getN() {
		return n;
	}

	public void setN(News n) {
		this.n = n;
	}

	public NewsService getNewsService() {
		return newsService;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	public NewsChannelService getNewsChannelService() {
		return newsChannelService;
	}

	public void setNewsChannelService(NewsChannelService newsChannelService) {
		this.newsChannelService = newsChannelService;
	}

	public NewsTemplateService getNewsTemplateServince() {
		return newsTemplateServince;
	}

	public void setNewsTemplateServince(NewsTemplateService newsTemplateServince) {
		this.newsTemplateServince = newsTemplateServince;
	}
	
	// ///////////////////////////////////前台ACTION
	
	

	// ///////////////////////////////////后台ACTION
	// 方法///////////////////////////////////////////////
	/**
	 * 创建一条新闻记录
	 * 
	 * @return
	 */
	public String create() {
		Website_Properties wp = (Website_Properties) session
				.getAttribute("WEBSITE_SESSION");
		Admin admin = (Admin) session.getAttribute("ADMIN_SESSION");
		String picName = this.uploadPic(wp);
		// 如果上传中发生异常，则直接返回msg提示使用者图片上传失败新闻发布失败
		if (picName == null) {
			request.setAttribute("msg", "由于图片上传出现错误，造成新闻创建失败！");
			return "msg";
		}
		n.setPicName(picName);
		n.setWebsiteId(wp.getId());
		n.setAdminId(admin.getLogin_id());
		n.setAuditType(0);// 将新闻的状态初始化为等待审批的状态
		n.setClickCount(0L);
		String callUrl = "";
		String categoryZh =newsCategoryService.queryCategoryByCode(n.getCategoryCode()).getName_zh();
		String categoryCn = newsCategoryService.queryCategoryByCode(n.getCategoryCode()).getName_cn();
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
		if(n.getChannelId()==0){
			callUrl="<a href=/"+categoryZh+"/"+categoryZh+"__1.html>"+newsCategoryService.queryCategoryByCode(n.getCategoryCode()).getName_cn()+"</a>";
		}else{
			
			callUrl="<a href=/"+categoryZh+"/"+categoryZh+"_"+newsChannelService.queryObject(n.getChannelId()).getName_zh()+"_1.html>"+newsChannelService.queryObject(n.getChannelId()).getName_cn()+categoryCn+"</a>";
		}
		}
		n.setCallUrl(callUrl);
		String code = newsService.add(n);
		if (FinalVar.INSERT_SUCCESS.equals(code)) {
			request.setAttribute("msg", "新闻添加成功");
			request.setAttribute("state", "1");
		} else {
			request.setAttribute("msg", "新闻添加失败");
		}
		return "msg";
	}

	/**
	 * 加载新闻的频道与模版
	 * 
	 * @return
	 */
	public String BeforNewsAdd() {
		Long webSiteId = Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE"));
		NewsTemplate nt = new NewsTemplate();
		nt.setWebsiteurl_id(webSiteId);
		nt.setShowflag(0);
		nt.setType(3);// 3新闻模板
		List<NewsChannelMD> newsChannelList = newsChannelService
				.query(webSiteId);
		List<NewsTemplate> newsTemplateList = newsTemplateServince
				.queryNewsTemplateByType(nt);
		request.setAttribute("ncList", newsChannelList);
		request.setAttribute("ntList", newsTemplateList);
		return "add";
	}

	/**
	 * 修改新闻状态，识别当前新闻是未审批 已审批 或者需要修改
	 * 
	 * @return
	 */
	public String modifyAuditType() {
		String id = request.getParameter("id");
		String auditType = request.getParameter("auditType");
		if (id == null || auditType == null) {
			request.setAttribute("msg", "请选择要操作的新闻记录！");
		} else {
			Map auditMap = new HashMap();
			auditMap.put("id", id);
			auditMap.put("auditType", auditType);
			String code = newsService.editAuditType(auditMap);
			if (FinalVar.UPDATE_SUCCESS.equals(code)) {
				request.setAttribute("msg", "操作成功！");
				request.setAttribute("state", "1");
			} else {
				request.setAttribute("msg", "操作失败！");
			}
		}
		return "msg";
	}

	/**
	 * 获取单个新闻
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String getNewsById() throws UnsupportedEncodingException {
		String code = request.getParameter("code");
		String codeName = request.getParameter("codeName");
		codeName = new String(codeName.getBytes("ISO-8859-1"), "utf-8");
		nmd.setCategoryCode(new Long(code));
		nmd.setCategoryNameCn(codeName);
		Long id = Long.valueOf((String) request.getParameter("id"));
		Long webSiteID = Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE"));
		NewsTemplate record = new NewsTemplate();
		record.setShowflag(0);
		record.setType(3);
		record.setWebsiteurl_id(webSiteID);
		n.setId(id);
		List<NewsChannelMD> newsChannelList = newsChannelService
				.query(webSiteID);
		List<NewsTemplate> newsTemplateList = newsTemplateServince
				.queryNewsTemplateByType(record);
		News newsInfo = this.newsService.queryNewsByIdForObject(id);
		request.setAttribute("newsChannelList", newsChannelList);
		request.setAttribute("newsTemplateList", newsTemplateList);
		request.setAttribute("newsInfoMD", nmd);
		request.setAttribute("news", newsInfo);
		return "edit";

	}

	/**
	 * 编辑新闻
	 * 
	 * @return
	 */
	public String modify() {
		Website_Properties wp = (Website_Properties) session
				.getAttribute("WEBSITE_SESSION");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		n.setUpdatetime(sdf.format(new Date()));
		String picName = this.uploadPic(wp);
		Long id = Long.valueOf(request.getParameter("id"));
		nmd.setPage((Integer) session.getAttribute("page"));
		// 如果上传中发生异常，则直接返回msg提示使用者图片上传失败新闻发布失败
		if (picName == null) {
			request.setAttribute("msg", "由于图片上传出现错误，造成新闻创建失败！");
			return "msg";
		}
		if (picName != null && !"".equals(picName)) {
			n.setPicName(picName);
		}
		n.setId(id);
		n.setAuditType(0);
		String callUrl = "";
		String categoryZh =newsCategoryService.queryCategoryByCode(n.getCategoryCode()).getName_zh();
		String categoryCn = newsCategoryService.queryCategoryByCode(n.getCategoryCode()).getName_cn();
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
		if(n.getChannelId()==0){
			callUrl="<a href=/"+categoryZh+"/"+categoryZh+"__1.html>"+newsCategoryService.queryCategoryByCode(n.getCategoryCode()).getName_cn()+"</a>";
		}else{
			
			callUrl="<a href=/"+categoryZh+"/"+categoryZh+"_"+newsChannelService.queryObject(n.getChannelId()).getName_zh()+"_1.html>"+newsChannelService.queryObject(n.getChannelId()).getName_cn()+categoryCn+"</a>";
		}
	    }
		n.setCallUrl(callUrl);
		String code = newsService.edit(n);
		if (FinalVar.UPDATE_SUCCESS.equals(code)) {
			request.setAttribute("msg", "操作成功！");
			request.setAttribute("state", "1");
		} else {
			request.setAttribute("msg", "操作失败！");
		}
		return "newsinfo";
	}

	/**
	 * 删除ID数组中包含的ID指定的新闻记录
	 * 
	 * @return
	 */
	public String del() {
		String idsToString = this.arrayToString();
		if (idsToString.equals("")) {
			request.setAttribute("msg", "请选择要删除的新闻记录！");
		} else {
			String code = newsService.remove(idsToString);
			if (FinalVar.DELETE_SUCCESS.equals(code)) {
				request.setAttribute("msg", "删除新闻成功！");
				request.setAttribute("state", "1");
			} else {
				request.setAttribute("msg", "删除新闻失败！");
			}
		}
		return "msg";
	}

	/**
	 * 获取相应条件的新闻列表，以及相关分页数据
	 * 
	 * @return
	 */
	public String getSearchList() {

		Website_Properties wp = (Website_Properties) session
				.getAttribute("WEBSITE_SESSION");
		nmd.setWebsiteId(wp.getId());
		// 获取当前站点中的所有频道
		List<NewsChannelMD> ncmdList = newsChannelService.query(wp.getId());
		request.setAttribute("ncmdList", ncmdList);

		// 计算当前分页条件
		Integer page = 0;
		Object object = request.getParameter("page");
		if (object == null || object.equals("")) {
			page = 1;
		} else {
			page = Integer.valueOf(request.getParameter("page"));
		}
		session.setAttribute("page", page);
		Integer limitCount = Integer.parseInt(rbint.getString("limitCount"));
		nmd.setNowPage((page - 1) * limitCount);
		nmd.setLimitCount(limitCount);
		// 获取符合条件的新闻记录
		List<NewsMD> nmdList = newsService.query(nmd);

		// 如果新闻记录不为空并且记录数量大于一页的记录数量，则进行分页获取
		if (nmdList != null && nmdList.size() > 0) {
			Integer maxLine = newsService.queryForIntThisPage(nmd);
			if (maxLine != null && maxLine > limitCount) {
				request.setAttribute("pageHtml",
						getPageToHtml(page, maxLine, limitCount, 3));
			}
			request.setAttribute("nList", nmdList);
		}
		request.setAttribute("SearchWhere", nmd);
		return "list";
	}

	public String getSearchListNews() {

		Website_Properties wp = (Website_Properties) session
				.getAttribute("WEBSITE_SESSION");
		
		nmd.setWebsiteId(wp.getId());
		// 获取当前站点中的所有频道
		List<NewsChannelMD> ncmdList = newsChannelService.query(wp.getId());
		request.setAttribute("ncmdList", ncmdList);

		// 计算当前分页条件
		Integer page = 0;
		page = (Integer) session.getAttribute("page");
		Integer limitCount = Integer.parseInt(rbint.getString("limitCount"));
		nmd.setNowPage((page - 1) * limitCount);
		nmd.setLimitCount(limitCount);
		// 获取符合条件的新闻记录
		List<NewsMD> nmdList = newsService.query(nmd);

		// 如果新闻记录不为空并且记录数量大于一页的记录数量，则进行分页获取
		if (nmdList != null && nmdList.size() > 0) {
			Integer maxLine = newsService.queryForIntThisPage(nmd);
			if (maxLine != null && maxLine > limitCount) {
				request.setAttribute("pageHtml",
						getPageToHtml(page, maxLine, limitCount, 3));
			}
			request.setAttribute("nList", nmdList);
		}
		request.setAttribute("SearchWhere", nmd);
		return "list";
	}

	/**
	 * 返回对应的页数
	 * 
	 * @param page
	 *            当前选择页数
	 * @param maxLine
	 *            当前条件下的
	 * @param limitCount
	 *            每页显示记录数
	 * @param omission
	 *            设置前后间隔几页进行省略
	 * @return
	 */
	private String getPageToHtml(Integer page, Integer maxLine,
			Integer limitCount, Integer omission) {
		String html = "";
		Integer maxPage = (maxLine + limitCount - 1) / limitCount;

		if (page != null && page > 1) {
			html += "<a href='/web/newsSearch!getSearchList?page=1'>第一页</a>";
			html += "<a href='/web/newsSearch!getSearchList?page=" + (page - 1)
					+ "'>上一页</a>";
		}
		for (int i = 0; i < maxPage; i++) {
			if ((i + 1) == page) {
				html += "[-" + (i + 1) + "-]";
			} else if ((i + omission + 1) == page || (i - omission + 1) == page) {
				html += "<a href='/web/newsSearch!getSearchList?page="
						+ (i + 1) + "'>[...]</a>";
			} else if (page != null && (page - omission - 1) < i
					&& (page + omission - 1) > i) {
				html += "<a href='/web/newsSearch!getSearchList?page="
						+ (i + 1) + "'>[-" + (i + 1) + "-]</a>";
			}
		}
		if (page == null || page < maxPage) {
			html += "<a href='/web/newsSearch!getSearchList?page=" + (page + 1)
					+ "'>下一页</a>";
			html += "<a href='/web/newsSearch!getSearchList?page=" + maxPage
					+ "'>尾页</a>";
		}

		html += "共" + maxPage + "页　" + maxLine + "行";
		return html;
	}

	private String arrayToString() {
		String[] ids = request.getParameterValues("ids");
		String idsToString = "";
		if (ids.length > 0) {
			for (int i = 0; i < ids.length; i++) {
				idsToString += ids[i] + ",";
			}
			idsToString = idsToString.substring(0, idsToString.length() - 1);
			return idsToString;
		} else {
			return "";
		}
	}

	// ==================================================公用文件上传方法
	private File upload;
	private String fileName;
	private String uploadContentType;

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return fileName;
	}

	public void setUploadFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	/**
	 * 当上传图片发生异常时，返回值将为空字符串
	 * 
	 * @param website
	 *            站点信息
	 * @return 上传文件保存的名字
	 */
	private String upFile(Website_Properties website) {
		if (fileName == null) {
			return "";
		}
		String picName = System.currentTimeMillis()
				+ fileName.substring(fileName.indexOf(".") + 1);
		try {
			BufferedInputStream in = new BufferedInputStream(
					new FileInputStream(upload));
			BufferedOutputStream out = new BufferedOutputStream(
					new FileOutputStream("../upload/"
							+ this.getUploadFileName()));
			byte[] b = new byte[(16 * 1024)];
			while (in.read(b) != -1) {
				out.write(b);
				out.flush();
			}
			in.close();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			picName = null;
		} finally {
			return picName;
		}
	}

	private String uploadPic(Website_Properties website) {
		if (fileName == null) {
			return "";
		}
		String Filepic = null;
		String picName = System.currentTimeMillis()
				+ "."
				+ fileName.substring(fileName.lastIndexOf(".") + 1)
						.toLowerCase();
		try {

			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
			String time = sf.format(date);
			String path = uploadLocation + File.separator
					+ website.getName_zh() + File.separator + "upload"
					+ File.separator + time + File.separator + picName;
			String Filepath = uploadLocation + File.separator
					+ website.getName_zh() + File.separator + "upload"
					+ File.separator + time + File.separator;
			File file = new File(Filepath);
			if (!file.exists()) {
				file.mkdir();
			}

			FileUtils.copyFile(upload, new File(path));
			Filepic = File.separator + "upload" + File.separator + time
					+ File.separator + picName;
		} catch (Exception e) {
			e.printStackTrace();
			picName = null;
		} finally {
			return Filepic.replaceAll("\\\\", "/");
		}
	}
	

}
