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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>插入开奖信息测试</title>
<script type="text/javascript" src="<%=basePath%>js/jqueryJS/jquery-1.5.min.js"></script>
<script type="text/javascript">
function selectDrawalottery(){
	var jsonString="{lotno:\""+$("#lotno").val()+"\",batchcode:\""+$("#batchcode").val()+"\",qishu:\""+$("#qishu").val()+"\"}"; 
	$("#jsonString").val(jsonString);
	$("#myform").submit();
}
</script>
</head>
<body>
<form action="web/htmlCodeAction!insertDrawalottery" method="post" id="myform">
<input type="hidden" id="jsonString" name="jsonString"/>
<br/>
<table width="400" border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td width="135" align="right">彩种：</td>
     <td width="265"><select name="lotno" id="lotno">
       <option value="ssq">双色球</option>
       <option value="sd">福彩3D</option>
       <option value="qlc">七乐彩</option>
       <option value="dlt">大乐透</option>
       <option value="pls">排列三</option>
       <option value="plw">排列五</option>
       <option value="qxc">七星彩</option>
     </select></td>
   </tr>
   <tr>
     <td align="right">请输入当前期号： </td>
     <td><input name="batchcode" type="text" id="batchcode" value="11089"/></td>
   </tr>
   <tr>
     <td align="right">期数：</td>
     <td>
       <input type="text" name="qishu" id="qishu" />
     </td>
   </tr>
   <tr>
     <td align="right">&nbsp;</td>
     <td><input name="lottery" type="button" value="插入开奖信息" onClick="selectDrawalottery();"/></td>
   </tr>
 </table>
 <br/>
</form>
</body>
</html>