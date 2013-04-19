<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.jrtcms.web.service.NewsChannelService" %>
<%@ page import="com.jrtcms.web.model.NewsChannelMD" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>
<%   
WebApplicationContext context = (WebApplicationContext)this.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);   
NewsChannelService channelService = (NewsChannelService)context.getBean("newsChannelService"); 
//实例化对象
NewsChannelMD channelMD=(NewsChannelMD)channelService.queryObject(Long.valueOf(request.getParameter("id")));
//获取频道列表
request.setAttribute("channelMD",channelMD);
%>