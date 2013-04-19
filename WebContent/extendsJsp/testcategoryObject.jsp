<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="tangs" uri="/WEB-INF/tangs.tld" %>
<%@page import="com.jrtcms.web.pojo.NewsCategory"%>
<%@page import="com.jrtcms.web.service.NewsCategoryService"%>
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
<title>很据code查询分类</title>
</head>
<body>

<tangs:ryc_newslist value="6"  begin="0" end="20" web_id="2" channelId="2" categoryId="140" num="20">
	              <a href="${url}" title="${title}" target="_blank" onclick="update_clickCount(${id})">
	              <li><span class="zixun_nr">[${title_as}]${title}</span><span class="zixun_time">${createtimeFm}</span></li>
	              </a> 
	             </tangs:ryc_newslist> 
</body>
</html>