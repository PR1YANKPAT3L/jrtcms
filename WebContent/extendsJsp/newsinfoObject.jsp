<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.jrtcms.web.service.NewsService" %>

<%@ page import="java.util.List" %>
<%@ page import="com.jrtcms.web.pojo.News" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>

<%   
WebApplicationContext context = (WebApplicationContext)this.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);   
NewsService service = (NewsService)context.getBean("newsService"); 

 String id = request.getParameter("id")==null?"0":request.getParameter("id");
//获取新闻列表
News newsinfo = service.queryNewsByIdForObject(Long.valueOf(id));
//保存到requset
request.setAttribute("newsinfo",newsinfo);

%>