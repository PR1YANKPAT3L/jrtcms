<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.jrtcms.web.service.NewsService" %>
<%@ page import="com.jrtcms.web.pojo.News" %>
<%@ page import="com.jrtcms.web.model.NewsMD" %>
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
//当前的频道id
Long channelId=Long.valueOf(request.getParameter("channelId"));
//当前的分类id
String categoryNameZh=request.getParameter("categoryNameZh");
//获取显示专家数
Integer limitCount=Integer.valueOf(request.getParameter("limitCount"));

//获取新闻列表     
List<News> newsList = newservice.queryNewsListByChannelAndCategory(websiteId,channelId,categoryNameZh,limitCount);
//保存到requset
request.setAttribute("newsList",newsList);

//request.setAttribute("newsMap",newsMap);

%>