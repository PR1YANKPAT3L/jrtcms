<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="s" uri="/struts-tags"%>
<head>
<base href="<%=basePath%>">
<title>如意彩_客户留言详细页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="">
<meta http-equiv="description" content="">
<style type="text/css">
<!--
body,td,th {
	font-size: 14px;
}
-->
</style>
<script type="text/javascript"	src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript"	src="/jquery_jar/jquery.js"></script>
<script language="javascript" type="text/javascript"	src="/jquery_jar/jQuery.FillOptions.js"></script>
<script language="javascript" type="text/javascript"	src="/jquery_jar/jQuery.CascadingSelect.js"></script>
</head>
<body>

<form name="form1" action="<%=basePath%>/web/customSearch!getCustomSearchList" method="post">


<s:set name="sw" value="#request.SearchWhere"></s:set>


<table width="73%" border="0">
  <tr>
    <td width="9%" align="center"><a href="<%=basePath%>/web/customSearch!getCustomSearchList" >客户留言</a></td>
    <td width="100%">| 
搜索：	手机号码:
		<input type="text" name="cmd.mobile" value="<s:property value="#sw.mobile"/>" />
		邮箱:
		<input type="text" name="cmd.email" value="<s:property value="#sw.email"/>" />
		<br />|
     留言发表时间:	<input type="text"  id="strtime" class="Wdate" name="cmd.sartTime" readonly="readonly" value="<s:property value="#sw.sartTime"/>" onClick="WdatePicker()"/>
     至		  	<input type="text" id="endtime" class="Wdate" name="cmd.endTime" readonly="readonly" value="<s:property value="#sw.endTime"/>" onClick="WdatePicker()" />
   			<input type="submit" id="search" name="new2" value="搜索" />
   	</td>
  </tr>
</table>

</form>

<hr />

<table width="800px" border="0" cellspacing="4">
	<tr>
		<td colspan="2"><h3>客户留言详细页面</h3></td>
	</tr>
	<tr>
		<td colspan="2"><hr /></td>
	<tr>
	<tr>
		<td width="100">问题类型</td>
		<td>${customMdInfo.questionType}</td>
	</tr>
	<tr>
		<td>发表时间</td>
		<td>${customMdInfo.time}</td>
	</tr>
	<tr>
		<td>邮箱</td>
		<td>${customMdInfo.email}</td>
	</tr>
	<tr>
		<td>手机号码</td>
		<td>${customMdInfo.mobile}</td>
	</tr>
	<tr>
		<td>ip 地址</td>
		<td>${customMdInfo.ip}</td>
	</tr>
	<tr>
		<td>留言内容</td>
		<td>${customMdInfo.content}</td>
	</tr>	
</table>

</body>
</html>