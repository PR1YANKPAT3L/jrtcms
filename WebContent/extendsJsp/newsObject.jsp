<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.jrtcms.web.service.NewsService" %>
<%@ page import="com.jrtcms.web.model.NewsMD" %>
<%@ page import="com.jrtcms.web.pojo.News" %>
<%@ page import="java.util.List" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>

<%   
WebApplicationContext context = (WebApplicationContext)this.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);   
NewsService service = (NewsService)context.getBean("newsService");
 Long websiteId =Long.valueOf(request.getParameter("websiteId"));
//获取新闻列表
List newsList = service.queryNewsByIdForPicName(websiteId);
//保存到requset
request.setAttribute("newsList",newsList);

%>