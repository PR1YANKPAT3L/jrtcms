<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.jrtcms.web.service.NewsService"%>
<%@ page import="com.jrtcms.web.service.NewsCategoryService"%>
<%@ page import="com.jrtcms.web.pojo.News"%>
<%@ page import="com.jrtcms.web.pojo.NewsCategory"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:directive.page
	import="org.springframework.web.context.WebApplicationContext" />
<%
	WebApplicationContext context = (WebApplicationContext) this
			.getServletContext()
			.getAttribute(
					WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
	NewsService newservice = (NewsService) context
			.getBean("newsService");
	NewsCategoryService categoryService = (NewsCategoryService) context
			.getBean("newsCategoryService");
	//当前的站点id
	//Long websiteId =Long.valueOf((String)session.getAttribute("ADMIN_WEBSITE"));
	Long websiteId = Long.valueOf(request.getParameter("websiteId"));
	//分类英文名
	String categoryNameZh = request.getParameter("categoryNameZh");

  	Integer topnews = Integer.valueOf(request.getParameter("topNews"));
	//最大查询新闻条数  maxNum
	Integer maxNum = Integer.valueOf(request.getParameter("maxNum"));
	//根据拼音查询分类的对象；
	NewsCategory Category = categoryService
			.queryObjectByNameZh(websiteId, categoryNameZh);
	//获取新闻列表
	List<News> newsInfoList = newservice.queryNewsInIdForList(null,
			Category.getCode(), topnews, maxNum, websiteId);
	//保存到requset
	request.setAttribute("newsInfoList", newsInfoList);
%>
