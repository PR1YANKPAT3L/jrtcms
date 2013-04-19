<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.jrtcms.web.service.NewsChannelService" %>
<%@ page import="com.jrtcms.web.model.NewsChannelMD" %>
<%@ page import="java.util.List" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="s" uri="/struts-tags"%>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>include页</title>
</head>
<body>
<jsp:include page="/extendsJsp/channelList.jsp" flush="true" >
<jsp:param value="1" name="webSiteID"/>
</jsp:include>
<ul>
<li> <a href="#">${request.newschannelList[0].name_cn}</a> </li>
<s:iterator id="nl" value="#request.newschannelList">
<li> <a href="${nl.url}">${nl.name_cn}${nl.id}</a> </li>
</s:iterator>
</ul>
</body>
</html>