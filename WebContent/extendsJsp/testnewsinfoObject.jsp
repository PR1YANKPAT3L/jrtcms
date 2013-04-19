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
<jsp:include page="/extendsJsp/newsinfoObject.jsp" flush="true" >
<jsp:param value="12" name="id"/>
</jsp:include>
<ul>
<s:iterator id="nl" value="#request.newsinfo">
<li> <a href="${nl.id}">${nl.category_code}|${nl.type}|${nl.title}</a> </li>
${nl.content}
</s:iterator>
</ul>
</body>
</html>