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
<title>如意彩_客户留言管理</title>
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
<script language="javascript">
$(function() {

	$("#checkedAll").click(function() {
			if ($(this).attr("checked") == true) { // 全选
				$("input[@name='ids']").each(function() {
					$(this).attr("checked", true);
				});
			} else { // 取消全选
				$("input[@name='ids']").each(function() {
					$(this).attr("checked", false);
				});
			}
		});
	
		
	$("#plspsx").click(function() {
		var ids = "";
		$("input[@name='ids']").each(function() {
			if($(this).attr("checked") == true){
				ids += $(this).val()+",";
				}
		});
		if(ids==""){
	           alert("请选中要上线的客户留言！！");
				}
		else if (confirm("确定要批量审批上线吗？")) {
				location.href = "<%=basePath%>/web/newsTemplate!jspToHtmlMoreOnline?ids="+ ids;
			}
		
	});
	$("#plsc").click(function() {
		var ids = "";
		$("input[@name='ids']").each(function() {
			if($(this).attr("checked") == true){
				ids += $(this).val()+",";
				}
		});
		if(ids==""){
	           alert("请选中要删除的客户留言！！");
				}
		else if (confirm("确定要删除选中的客户留言吗？")) {
			$("#form2").submit();
			}
		
	});

});
</script>
 <script type="text/javascript"> 
<% String msg=(String)request.getAttribute("msg");if(msg!=null){%>
	 alert("<%=(String)request.getAttribute("msg") %>");
	<% }%>
</script>
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
<table width="900px" border="0" cellspacing="4">
	<tr>
		<td width="29" align="center"><input type="checkbox"  id="checkedAll"/></td>
		<td width="103" align="center">问题类型</td>
		<td width="120" align="center">发表时间</td>
		<td width="245" align="center">部分留言内容</td>
		<td width="65" align="center">邮箱</td>
		<td width="65" align="center">手机号码</td>
		<td width="270" align="center">操作</td>
	</tr>
<!--<form id="form2" action="<%=basePath%>/web/news!del" method="POST"  >--> 
	<input type="hidden" name="${page }"/>
	<s:iterator id="nl" value="#request.nList">
		<tr>
			<td align="center"><input type="checkbox" name="ids" value="${customId}" /></td>
			<td align="center">${questionType}</td>
			<td align="center">${time}</td>
			<td align="center"><s:property value="content.substring(0,3)+'...'" /></td>
			<td align="center">${email}</td>
			<td align="center">${mobile}</td>
			
			<td align="center">
			<!--
			[ <a
				href="<%=basePath%>/web/news!del?ids=${id}" onclick="return confirm('确实要删除该新闻吗？')">删除</a>
			][ <a
				href="<%=basePath%>/web/news!getNewsById?id=${id}&code=${categoryCode}&codeName=${categoryNameCn}&page=${page}">编辑</a>
			]<br />
			<s:if test="#nl.auditType==0">
				[ <a href="<%=basePath%>/web/newsTemplate!jspToHtmlOnline?id=${id}">审批上线
			</a>]
				[ <a href="<%=basePath%>/web/news!modifyAuditType?id=${id}&auditType=2" onclick="return confirm('确实要驳回吗？')">驳回</a>]
			</s:if>
			<s:elseif test="#nl.auditType==1">
			[<a href="<%=basePath%>/web/newsTemplate!newsDownline?id=${id}">下线</a>]
			</s:elseif>
   	    	<s:elseif test="#nl.auditType==2">
   	    	[<a href="<%=basePath%>/web/news!modifyAuditType?id=${id}&auditType=0" onclick="return confirm('确实要再审吗？')">再审</a>]
   	    	</s:elseif>
   	    	--> 
			[<a href="<%=basePath%>/web/customSearch!getById?id=${customId}">预览</a>]
			
			</td>
		</tr>
	</s:iterator>
	<tr>
		<!--  <td colspan="2"><input name="button" type="button" value="批量删除" id="plsc" />
		<input id="plspsx" type="button" value="批量审批上线" /></td>--> 
		<td colspan="7">
		${pageHtml}
		</td>
	</tr>
<!--</form>--> 
</table>
		


<p>实例说明：</p>
<p>1.搜索条件时间需要使用jquery增加时间选择器功能。</p>
<p>2.每页显示留言20条。</p>
<p>3.预览，弹出新的页面，查看客户留言的详细内容。</p>
</body>
</html>