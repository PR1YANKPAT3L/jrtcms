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
<title>index页</title>

<script language="javascript" type="text/javascript" src="/jquery_jar/jquery-1.1.3.1.js"></script>

<script language="javascript" type="text/javascript" src="/jquery_jar/jQuery.FillOptions.js"></script>
<script language="javascript" type="text/javascript" src="/jquery_jar/jQuery.CascadingSelect.js"></script>
<script language="javascript" type="text/javascript">
$(function(){
		$("#Category0").FillOptions("/web/newsCategory!getCategoryByPcode?pcode=-1",{datatype:"json",textfield:"name_cn",valuefiled:"code"});
		$("#Category0").AddOption("请选择","-2",true,0);
});
 </script>
</head>


<body>
<p id="category_select">
  <input type="hidden" id="pcode" name="pcode" value="-1" />
    <select id="Category0" name="Category0" onchange="selectLin(0)">
    </select>
  </p>
</body>
</html>