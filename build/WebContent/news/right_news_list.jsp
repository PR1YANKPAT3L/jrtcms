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
<script type="text/javascript"
	src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript"
	src="/jquery_jar/jquery.js"></script>
<script language="javascript" type="text/javascript"
	src="/jquery_jar/jQuery.FillOptions.js"></script>
<script language="javascript" type="text/javascript"
	src="/jquery_jar/jQuery.CascadingSelect.js"></script>
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

		$("#button").click(function(){
			 var boxes = document.getElementsByName("checkbox"); 
			 for (var i = 0; i < boxes.length; i++) {
				 if (boxes[i].checked == false){
					 boxes[i].checked = true;
					 }
				 else{
					 boxes[i].checked = false; }

				 }
			
	             });
		$("#delete").click(function(){
			 var boxes = document.getElementsByName("checkbox"); 
	    	 var check=false;
	      	var newsInfo_id=new Array(); 
	      	var j=0;  
			if(confirm("确定要删除？")){
	    	for (var i = 0; i < boxes.length; i++)    {   
	    		   if (boxes[i].checked == true) 
	        	      {  
		        	      check=true;
	    		  newsInfo_id[j]=boxes[i].value;
	    		  alert(newsInfo_id[j]);
	    		  j++;
	    	   }} 
	 	   location.href="<%=basePath%>/web/newsInfo!deleteNewsInfo?newsinInfo="+ newsInfo_id;
			}else{
				for (var i = 0; i < boxes.length; i++)    {   
		    		   if (boxes[i].checked == true) 
		        	      {  
		    			   boxes[i].checked=false;
		    	   }} 

				}
	     });
		$("#examine").click(function(){
			 var boxes = document.getElementsByName("checkbox"); 
	    	 var check=false;
	      	var newsInfo_id=new Array(); 
	      	var j=0;  
			if(confirm("确定要批量审批上线吗？")){
	    	for (var i = 0; i < boxes.length; i++)    {   
	    		   if (boxes[i].checked == true) 
	        	      {  
		        	      check=true;
	    		  newsInfo_id[j]=boxes[i].value;
	    		  alert(newsInfo_id[j]);
	    		  j++;
	    	   }} 
	 	   location.href="<%=basePath%>/web/newsTemplate!jspToHtmlMoreOnline?newsinInfo="+ newsInfo_id;
			}else{
				for (var i = 0; i < boxes.length; i++)    {   
		    		   if (boxes[i].checked == true) 
		        	      {  
		    			   boxes[i].checked=false;
		    	   }} 

				}
	     })
	     

	});
</script>
<script type="text/javascript">	
	function forwardPage(url){
	//先判断输入的内容是否为空 以及输入的是否是数值类型
	var num = document.getElementById("num").value;//获取要跳转的页号
	if(isNaN(num)){
		alert("页号必须为数字");
		return;
	}else if(num > ${page.last} || num < 1){
		//如果填写的页数是负数或者是大于总的页数 显示第一页
		num = 1;
	}
	url = "<%=path%>"+"/"+url;
	window.location.href = url+num;
}
</script>
<style type="text/css">
#num
{
	width: 40px;
	height: 20px
}
</style>
 <script type="text/javascript"> 
<% String msg=(String)request.getAttribute("msg");if(msg!=null){%>
	 alert("<%=(String)request.getAttribute("msg") %>");
	<% }%>
</script>
</head>
<body>
<form name="form1" action="<%=basePath%>/web/newsInfo!getSearchList"
	method="post">
<table width="73%" border="0">
  <tr>
    <td width="9%" align="center"><a href="<%=basePath%>/web/newsInfo!BeforNewsAdd" >新建新闻</a></td>
    <td width="100%">| 搜索：<select name="select"><option value="0">选择频道</option>
  <s:iterator  value="#request.newsChannelList"  id="NewsChannel">
  <option value="<s:property value="id"/>"><s:property value="name_cn"/></option>
   </s:iterator>
</select>   <span id="category_select">
<input type="hidden" id="leaf" name="newsCategoryMD.leaf" value="0" />
  <input type="hidden" id="pcode" name="newsCategoryMD.pcode" value="-1" />
    <select id="Category0" name="Category0" onchange="selectLin(0,'Category')">
    </select></span>
    标题:
    <input type="text" name="textfield" />
    （支持模糊查询）<br/>
    |
   <select name="top_news">
   <option value="-1">选择头条</option>
   <option value="1">是</option>
   <option value="0">否</option>
   </select>
    <select name="select3">
     <option value="-1" selected="selected">审批状态</option>
      <option value="2">修改再审</option>
	  <option value="1" >上线</option>
	  <option value="0" >下线</option>
     </select> 
    <select name="select4">
      <option value="-1" selected="selected"  >类型</option>
	  <option value="0" >引用</option>
	  <option value="1" >正文</option>
     </select> <select name="select5">
       <option value="-1" selected="selected">全部</option>
       <option value="0" >Web</option>
       <option value="1" >Wap</option>
     </select> 
     创建时间:
     <input type="text"  id="strtime" class="Wdate" name="newsInfoMD.sartTime" readonly="readonly"  onClick="WdatePicker()"/>
     至
     <input type="text" id="endtime" class="Wdate" name="newsInfoMD.endTime" readonly="readonly"  onClick="WdatePicker()" />
     （时间器）
     <input type="submit" id="search" name="new2" value="搜索" /></td>
  </tr>
</table>
</form>

<hr />
<table width="900px" border="0" cellspacing="4">
	<tr>
		<td width="29" align="center"><input type="button" value="全" id="button"/></td>
		<td width="303" align="center">标题</td>
		<td width="120" align="center">创建时间</td>
		<td width="45" align="center">类型</td>
		<td width="65" align="center">分类</td>
		<td width="65" align="center">频道</td>
		<td width="57" align="center">顺序</td>
		<td width="270" align="center">操作</td>
	</tr>
	<s:iterator id="newsList" value="#request.page.result">
		<tr>
			<td align="center"><input type="checkbox" name="checkbox"
				value="${newsList.id  }" /></td>
			<td><s:if test="#newsList.top_news==1">[头条]</s:if><a href="<%=basePath%>/web/newsInfo!modifyNewsInfoById?id=${newsList.id}&code=${newsList.category_code}&codeName=${newsList.category_name_cn}">${newsList.title}</a>
			</td>
			<td align="center">${newsList.createtime}</td>
			<td align="center"><s:if test="#newsList.type==0">引用</s:if><s:elseif
				test="#newsList.type==1">正文</s:elseif></td>
			<td align="center">${newsList.category_name_cn}</td>
  			<td align="center">${newsList.channel_name_cn}</td>
			<td align="center"><select
				name="Tree_sequence_<s:property value="#newsList.id"/>">
				<option value="0"
					<s:if test="#newsList.sequence==0" >selected</s:if>>最低</option>
				<option value="1"
					<s:if test="#newsList.sequence==1" >selected</s:if>>1</option>
				<option value="2"
					<s:if test="#newsList.sequence==2" >selected</s:if>>2</option>
				<option value="3"
					<s:if test="#newsList.sequence==3" >selected</s:if>>3</option>
				<option value="4"
					<s:if test="#newsList.sequence==4" >selected</s:if>>4</option>
				<option value="5"
					<s:if test="#newsList.sequence==5" >selected</s:if>>默认</option>
				<option value="6"
					<s:if test="#newsList.sequence==6" >selected</s:if>>6</option>
				<option value="7"
					<s:if test="#newsList.sequence==7" >selected</s:if>>7</option>
				<option value="8"
					<s:if test="#newsList.sequence==8" >selected</s:if>>8</option>
				<option value="9"
					<s:if test="#newsList.sequence==9" >selected</s:if>>9</option>
				<option value="10"
					<s:if test="#newsList.sequence==10" >selected</s:if>>最高</option>
			</select></td>
			<td>[ <a
				href="<%=basePath%>/web/newsInfo!deleteNewsInfo?id=${newsList.id}" onclick="return confirm('确实要删除该新闻吗？')">删除</a>
			][ <a
				href="<%=basePath%>/web/newsInfo!modifyNewsInfoById?id=${newsList.id}&code=${newsList.category_code}&codeName=${newsList.category_name_cn}">编辑</a>
			]<br />
			[ <a
				href="<%=basePath%>/web/newsTemplate!jspToHtmlOnline?id=${newsList.id}">审批上线
			</a>][ 
			<s:if test="#newsList.audit_type==1"><a href="<%=basePath%>/web/newsInfo!modifyNewsInfoBack?id=${newsList.id}&typeCount=2" onclick="return confirm('确实要驳回吗？')">驳回</a></s:if>
   	    	<s:if test="#newsList.audit_type==2"><a href="<%=basePath%>/web/newsInfo!modifyNewsInfoBack?id=${newsList.id}&typeCount=1" onclick="return confirm('确实要再审吗？')">再审</a></s:if>][
			<a target="_blank"
				href="<%=basePath%>/web/newsTemplate!jspToHtmltest?id=${newsList.id}">预览</a>]</td>
		</tr>
	</s:iterator>
	<tr>
		<td colspan="2"><input name="button" type="button" value="批量删除" id="delete"/>
		<input name="button2" type="button" value="批量审批上线" id="examine"/></td>
		<td colspan="7">
		<%
			String url = (String) request.getAttribute("ls");
			url = url.indexOf("?") > 0 ? (url + "num=") : (url + "?num=");
			//如果有参数第一位的是？ 没有参数 直接？
		%> 
			<s:if test="empty page">
			<h2 style="color: red">没有信息</h2>
			</s:if> 
			<s:if test="#request.page.last!=0">
			<s:if test="#request.page.num !=1">
				<a href="<%=url%>${page.first }">首页</a>
				<a href="<%=url%>${page.prev }">上一页</a>
				</s:if>

			<s:iterator begin="#request.page.start" end="#request.page.end" status="i" step="1"  >
				<s:if test="#i.index==(#request.page.num-1)">
				
				 <b style="color: red">[${i.index+1}] </b>
				</s:if>
				<s:else>
				 <a href="<%=url%>${i.index+1}">[${i.index+1}]</a>
				</s:else>
			</s:iterator>
			<s:if test="#request.page.num !=#request.page.last">
				<a href="<%=url%>${page.next}">下一页</a>
				<a href="<%=url%>${page.last }">末页</a>
			</s:if>
			&nbsp;&nbsp;&nbsp;<input type="text" name="num" id="num"/>
			&nbsp;&nbsp;&nbsp;
			<a href="javascript:void(0)" onclick="forwardPage('<%=url %>')" style="color: green;font-size: 13px">跳转</a>
		</s:if>
	</td>
	</tr>
	
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