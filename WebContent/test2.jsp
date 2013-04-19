<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.jrtcms.web.service.NewsInfoService" %>
<%@ page import="com.jrtcms.web.model.NewsInfoMD" %>
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

<jsp:include page="/test.jsp" flush="true" >
<jsp:param value="0" name="Status"/>
<jsp:param value="0" name="NowPage"/>
<jsp:param value="100" name="LimitCount"/>
</jsp:include>
<ul>
<s:iterator id="newsi" value="#request.newsInfoList">
<li> <a href="${newsi.call_url}">${newsi.title}${newsi.id}</a> </li>
</s:iterator>
</ul>
</body>
</html>