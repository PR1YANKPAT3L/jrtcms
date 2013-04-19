<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.jrtcms.web.service.NewsService" %>
<%@ page import="com.jrtcms.web.pojo.News" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>

<%   
WebApplicationContext context = (WebApplicationContext)this.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);   
NewsService newservice = (NewsService)context.getBean("newsService"); 
//当前的站点id
//Long websiteId =Long.valueOf((String)session.getAttribute("ADMIN_WEBSITE"));
Long websiteId =Long.valueOf(request.getParameter("websiteId"));
String categoryNameZh=request.getParameter("categoryNameZh");

//News news= newservice.queryNewsByIdForObject(Long.valueOf(request.getParameter("Id")));news.getChannelId()
//获取新闻列表
//List<News> newsInfoList = service.queryNewsInIdForList(channelId, categoryId,null,12,websiteId);

//查询分类的新闻信息的集合;
List newsPicList = newservice.queryNewsByIdForPicNameList(websiteId,categoryNameZh);
//保存到requset
//request.setAttribute("newsInfoList",newsInfoList);
request.setAttribute("newsPicList",newsPicList);
%>