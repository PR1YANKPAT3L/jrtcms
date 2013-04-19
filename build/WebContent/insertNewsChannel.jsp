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
<title>如意彩_新闻频道管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="">
<meta http-equiv="description" content="">
</head>
<body>
 <form action="<%=basePath%>web/newsChannel!insertNewsChannel" method="post">
    <p>      
            英文名称：
	<input type="text" name="newsChannel.name_zh" /></p>
    <p>
            中文名称：
	<input type="text" name="newsChannel.name_cn" /></p>
    <p>
            排序：
	<input type="text" name="newsChannel.sequence" /></p>
    <p>
            是否显示：
	<input type="text" name="newsChannel.showflag" /></p>
	<p>
       <input type="submit" value="提交" />
    </p>
</form>
</body>
</html>