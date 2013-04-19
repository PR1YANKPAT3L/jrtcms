<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>如意彩_新闻管理登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="">
<meta http-equiv="description" content="">
</head>
<body>
 <form action="<%=basePath%>web/admin!login" method="post">
    <p>
           用户名：
	<input type="text" name="name" /></p>
    <p>
            密码：
	<input type="password" name="password" /></p>
    <p>
           选择站点：
	<select name="web_pro_id">
	<% request.setAttribute("web_pros",com.jrtcms.listener.propertys.InitWebsitePropertys.getWpsListMap());%>
	<s:iterator id="wp" value="#request.web_pros" >
		<option value="${wp.key}">${wp.value.name_cn}</option>
	</s:iterator>
	</select></p>
	<p>
       <input type="submit" value="提交" />
    </p>
</form>
</body>
</html>