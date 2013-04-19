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
<title>如意彩_新闻管理</title>
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
		$("#Category0").FillOptions(
				"/web/newsCategory!getCategoryByPcode?pcode=-1", {
					datatype : "json",
					textfield : "name_cn",
					valuefiled : "code"
				});
		$("#Category0").AddOption("请选择", "-1", true, 0);
		//当触发一级分类的select的时候，如果选择的是值为-1的“请选择”则频道不是子分类 0为首分类 1为子分类
		$("#Category0").change(function() {
			if ($(this).val() == -1) {
				$("#leaf").val("0");
			} else {
				$("#leaf").val("1");
			}
		});

     
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
	           alert("请选中要上线的新闻！！");
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
	           alert("请选中要删除的新闻！！");
				}
		else if (confirm("确定要删除选中的新闻么吗？")) {
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
<form name="form1" action="<%=basePath%>/web/newsSearch!getSearchList" method="post">


<s:set name="sw" value="#request.SearchWhere"></s:set>


<table width="73%" border="0">
  <tr>
    <td width="9%" align="center"><a href="<%=basePath%>/web/news!BeforNewsAdd.action" >新建新闻</a></td>
    <td width="100%">| 
搜索：	<select name="nmd.channelId">
			<option value="0">选择频道</option>
			<s:iterator  value="#request.ncmdList"  id="ncmdList">
			<option value="${id}" <s:if test="#sw.channelId==#ncmdList.id">selected</s:if>>${name_cn}</option>
			</s:iterator>
	  	</select>
		<span id="category_select">
			<input type="hidden" id="leaf" name="leaf" value="0" />
  			<input type="hidden" id="pcode" name="nmd.categoryCode" value="-1" />
		    <select id="Category0" name="Category0" onchange="selectLin(0,'Category')">
		    </select>
		</span>
标题:
		<input type="text" name="nmd.title" value="<s:property value="#sw.title"/>" />（支持模糊查询）<br/>|
		<select name="nmd.topNews">
			<option value="-1">选择头条</option>
			<option value="1" <s:if test="#sw.topNews==1">selected</s:if>>是</option>
			<option value="0" <s:if test="#sw.topNews==0">selected</s:if>>否</option>
		</select>
	    <select name="nmd.auditType">
			<option value="-1" selected="selected">新闻状态</option>
			<option value="2" <s:if test="#sw.auditType==2">selected</s:if>>需要修改</option>
			<option value="1" <s:if test="#sw.auditType==1">selected</s:if>>已上线</option>
			<option value="0" <s:if test="#sw.auditType==0">selected</s:if>>需要审核</option>
		</select> 
	    <select name="nmd.type">
			<option value="-1" selected="selected"  >类型</option>
			<option value="0" <s:if test="#sw.type==0">selected</s:if>>引用</option>
			<option value="1" <s:if test="#sw.type==1">selected</s:if>>正文</option>
	    </select>
		<!-- select name="nmd.wapState">
			<option value="-1" selected="selected">全部</option>
			<option value="0" >Web</option>
			<option value="1" >Wap</option>
		</select --> 
     创建时间:	<input type="text"  id="strtime" class="Wdate" name="nmd.sartTime" readonly="readonly" value="<s:property value="#sw.sartTime"/>" onClick="WdatePicker()"/>
     至		  	<input type="text" id="endtime" class="Wdate" name="nmd.endTime" readonly="readonly" value="<s:property value="#sw.endTime"/>" onClick="WdatePicker()" />
   			<input type="submit" id="search" name="new2" value="搜索" />
   	</td>
  </tr>
</table>

</form>

<hr />
<table width="900px" border="0" cellspacing="4">
	<tr>
		<td width="29" align="center"><input type="checkbox"  id="checkedAll"/></td>
		<td width="303" align="center">标题</td>
		<td width="120" align="center">创建时间</td>
		<td width="45" align="center">类型</td>
		<td width="65" align="center">分类</td>
		<td width="65" align="center">频道</td>
		<td width="57" align="center">顺序</td>
		<td width="270" align="center">操作</td>
	</tr>
<form id="form2" action="<%=basePath%>/web/news!del" method="POST"  >
	<input type="hidden" name="${page }"/>
	<s:iterator id="nl" value="#request.nList">
		<tr>
			<td align="center"><input type="checkbox" name="ids" value="${id}" /></td>
			<td><s:if test="#nl.topNews==1">[头条]</s:if><a href="<%=basePath%>/web/news!getNewsById?id=${id}&code=${categoryCode}&codeName=${categoryNameCn}">${title}</a>
			</td>
			<td align="center">${createtime}</td>
			<td align="center"><s:if test="#nl.type==0">引用</s:if><s:elseif
				test="#nl.type==1">正文</s:elseif></td>
			<td align="center">${categoryNameCn}</td>
  			<td align="center">${channelNameCn}</td>
			<td align="center"><select
				name="Tree_sequence_<s:property value="#nl.id"/>">
				<option value="0"
					<s:if test="#nl.sequence==0" >selected</s:if>>默认</option>
				<option value="1"
					<s:if test="#nl.sequence==1" >selected</s:if>>1</option>
				<option value="2"
					<s:if test="#nl.sequence==2" >selected</s:if>>2</option>
				<option value="3"
					<s:if test="#nl.sequence==3" >selected</s:if>>3</option>
				<option value="4"
					<s:if test="#nl.sequence==4" >selected</s:if>>4</option>
				<option value="5"
					<s:if test="#nl.sequence==5" >selected</s:if>>5</option>
				<option value="6"
					<s:if test="#nl.sequence==6" >selected</s:if>>6</option>
				<option value="7"
					<s:if test="#nl.sequence==7" >selected</s:if>>7</option>
				<option value="8"
					<s:if test="#nl.sequence==8" >selected</s:if>>8</option>
				<option value="9"
					<s:if test="#nl.sequence==9" >selected</s:if>>9</option>
				<option value="10"
					<s:if test="#nl.sequence==10" >selected</s:if>>10</option>
				<option value="11"	
					<s:if test="#nl.sequence==11" >selected</s:if>>11</option>
				<option value="12"
					<s:if test="#nl.sequence==12" >selected</s:if>>12</option>
				<option value="13"
					<s:if test="#nl.sequence==13" >selected</s:if>>13</option>
				<option value="14"
					<s:if test="#nl.sequence==14" >selected</s:if>>14</option>
				<option value="15"
					<s:if test="#nl.sequence==15" >selected</s:if>>15</option>
				<option value="16"
					<s:if test="#nl.sequence==16" >selected</s:if>>16</option>
				<option value="17"
					<s:if test="#nl.sequence==17" >selected</s:if>>17</option>
				<option value="18"
					<s:if test="#nl.sequence==18" >selected</s:if>>18</option>
				<option value="19"
					<s:if test="#nl.sequence==19" >selected</s:if>>19</option>
				<option value="20"
					<s:if test="#nl.sequence==20" >selected</s:if>>最高</option>
			</select></td>
			<td>[ <a
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
			[<a target="_blank"	href="<%=basePath%>/web/newsTemplate!jspToHtmltest?id=${id}">预览</a>]</td>
		</tr>
	</s:iterator>
	<tr>
		<td colspan="2"><input name="button" type="button" value="批量删除" id="plsc" />
		<input id="plspsx" type="button" value="批量审批上线" /></td>
		<td colspan="7">
		${pageHtml}
		</td>
	</tr>
</form>
</table>
		


<p>实例说明：</p>
<p>1.搜索条件时间需要使用jquery增加时间选择器功能。</p>
<p>2.每页显示新闻20条。</p>
<p>3.可以全选并批量操作，批量审批，则需要批量生成相应的文章的相关页面。可以for循环操作，重用普通审批方法，此处不考虑效率。批量审批或者批量删除时，用ajax实现，操作成功后刷新此页面</p>
<p>4.顺序优先级可以直接在列表中选择下拉列表，ajax请求修改。</p>
<p>5.点击标题，进入查看详细信息页面。</p>
<p class="STYLE1">6.删除为假删除，所以需要增加state字段标识。</p>
<p>7.审批上线，则生成对应的静态页面和相关的分类、频道、首页、相关通用页面的生成。</p>
<p>8.驳回时，文章状态变为【修改再审】状态，功能名字变为【再审】，当修改完成后，点再审，可以继续审批上线。</p>
<p>9.预览，弹出新的页面到指定的模版，查看上线后的实际效果。</p>
<p>10.编辑，进入修改页面。</p>
</body>
</html>