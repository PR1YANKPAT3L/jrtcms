<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="s" uri="/struts-tags"%>
<head>
<base href="<%=basePath%>">
<title>如意彩_生成html测试</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>

<form action="<%=basePath%>web/newsTemplate!jspToHtml" method="post">
	<p>
	   模板名称：<input type="text" name="templatename" /></p>
    <p>  
    <input TYPE="hidden" name="baseUrl" value="<%=basePath%>"/> 
       <input type="submit" value="提交" />
    </p>
</form>
</body>
</html>