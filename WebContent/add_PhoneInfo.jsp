<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加手机信息</title>
</head>
<body>
<form action="<%=basePath%>web/phoneInfo!create" method="post">
<input type="hidden" name="Mac" value="0a81c405c6b78c047fa08e76a4f2a72c"/>
<table>
	<tr>
		<td>手机号</td>
		<td><input type="text" name="phoneInfo.phoneCode"/></td>
	</tr>
	<tr>
		<td>接收时间</td>
		<td><input type="text" name="phoneInfo.acceptTime"/></td>
	</tr>
	<tr>
		<td>描述</td>
		<td><input type="text" name="phoneInfo.remark"/></td>
	</tr>
	<tr>
		<td><input type="submit" name="submit" value="保   存"/></td>
	</tr>
</table>
</form>
</body>
</html>