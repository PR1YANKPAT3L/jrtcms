<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.jrtcms.web.pojo.News"%>
<%@page import="com.jrtcms.web.service.NewsService"%>
<%@page import="java.util.List,java.util.Map" %>
<%@page import="org.springframework.web.context.WebApplicationContext" %>
<%   
WebApplicationContext context = (WebApplicationContext)this.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);   
NewsService newsService = (NewsService)context.getBean("newsService"); 
Long WEBSITE_ID = session.getAttribute("ADMIN_WEBSITE")==null?0l:Long.valueOf(session.getAttribute("ADMIN_WEBSITE").toString());
//获取新闻列表
Map<String,List> newsMap = newsService.queryNewsInCategoryNameZhsByChannelIdForMap(WEBSITE_ID,"'zhuanjiajianhao'",null,5);
//保存到requset
request.setAttribute("newsMap",newsMap);

%>