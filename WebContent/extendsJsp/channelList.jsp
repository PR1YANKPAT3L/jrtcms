<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.jrtcms.web.service.NewsChannelService" %>
<%@ page import="com.jrtcms.web.model.NewsChannelMD" %>
<%@ page import="java.util.Map" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>

<%   
WebApplicationContext context = (WebApplicationContext)this.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);   
NewsChannelService channelService = (NewsChannelService)context.getBean("newsChannelService"); 

//获取频道列表
Map<String,NewsChannelMD> newschannelList = channelService.queryChannelListForMap(Long.valueOf(request.getParameter("webSiteID")));
//保存到requset
request.setAttribute("newschannelList",newschannelList);
System.out.println(newschannelList);
%>