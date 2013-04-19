<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.jrtcms.web.service.NewsChannelService" %>
<%@ page import="com.jrtcms.web.model.NewsChannelMD" %>
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
<jsp:include page="/extendsJsp/channelObject.jsp" flush="true" >
<jsp:param value="12" name="id"/>
</jsp:include>
<ul>
<s:set name="cmd" value="#request.channelMD"></s:set>
<li> 
	<a href="${cmd.url}">${cmd.name_zh}&nbsp;&nbsp;${cmd.name_cn}&nbsp;&nbsp;${cmd.sequence}&nbsp;&nbsp;${cmd.website_id}&nbsp;&nbsp;${cmd.state}&nbsp;&nbsp;${cmd.showflag}&nbsp;&nbsp;${cmd.id}</a>
</li>
</ul>
</body>
</html>