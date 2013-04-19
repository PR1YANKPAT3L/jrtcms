<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="/jquery_jar/formValidator/jquery_last.js" type="text/javascript"></script>
<script type="text/javascript" src="/jquery_jar/jquery.js"></script>
<link type="text/css" rel="stylesheet" href="/jquery_jar/formValidator/style/validator.css"></link>
<script src="/jquery_jar/formValidator/formValidator.js" type="text/javascript" charset="UTF-8"></script>
<script src="/jquery_jar/formValidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<title>无标题文档</title>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>
<script type="text/javascript">
$(function(){
	
	$.formValidator.initConfig({formid:"form2",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
	$("#createChannel").click(function(){
		document.getElementById("new_channel").style.display="block";
	$("#channelnameCn").formValidator({onshow:"请输入频道名称 ",onfocus:"频道名称不能为空 ",oncorrect:"正确"}).inputValidator({empty:{leftempty:false,rightempty:false,emptyerror:"频道名称不能输入看空格"},min:1,onerror:"频道名称不能为空,请确认"});
	$("#newsInfourl").formValidator({empty:true,onshow:"请输入频道的拼音名称   ",onfocus:"频道拼音名称必须以字母开头,只能包括字母和数字   ",oncorrect:"恭喜你输入正确"}).inputValidator({}).regexValidator({regexp:"^[a-z]{1}[a-z0-9_]{3,15}$",onerror:"频道名称必须以字母开头,只能包括字母和数字  "});

	});
		
});


</script>
</head>

<script type="text/javascript">
	function updateChannel(id) {
		var name_cn_input = "Tree_name_cn_" + id;
		var name_zh_input = "Tree_name_zh_" + id;
		var template_id_input = "Tree_template_id_" + id;
		var sequence_input = "Tree_sequence_" + id;
		var mark_input = "Tree_mark_" + id;
		var channelType_input = "Tree_channelType_" + id;

		var name_cn = $("input[name=" + name_cn_input + "]").attr("value");
		var name_zh = $("input[name=" + name_zh_input + "]").attr("value");
		var template_id = $("select[name=" + template_id_input + "]").val();
		var sequence = $("select[name=" + sequence_input + "]").val();
        var mark = $("select[name=" + mark_input + "]").val();
        var type = $("select[name=" + channelType_input + "]").val();
		var modelName = "newsChannelMD";
		$("#test").change(function(){

			});
		for(b in $.browser) if(b=='msie'){name_cn = encodeURI(name_cn)};	
		$.ajax( {
			url : '/web/newsChannel!modify?' + modelName + '.id=' + id + '&'
					+ modelName + '.name_cn=' + name_cn + '&' + modelName
					+ '.name_zh=' + name_zh + '&' + modelName + '.template_id='
					+ template_id + '&' + modelName + '.sequence=' + sequence+'&'+modelName+'.mark='+mark+'&'+modelName+'.channelType='+type,
			type : 'post', //数据发送方式   
			dataType : 'html', //接受数据格式   
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			error : function(html) {
				alert("保存失败!操作发生错误" + html);
			},
			async : false,
			success : function(html) {
				alert(html);
			}
		});
	}
</script>

<body>
<p><input type="button" name="new" value="创建频道"
	onclick="document.getElementById('new_channel').style.display='block'" id="createChannel" />
</p>
<div id="new_channel" style="display: none">
<form action="/web/newsChannel!createNewsChannel" method="post" id="form2">
<p>频道名字： <input type="text" name="newsChannelMD.name_cn" id="channelnameCn"/>{拼音（可选）} <input type="text" name="newsChannelMD.name_zh" id="newsInfourl"/>  
 频道标识：<select
	name="newsChannelMD.mark">
	<option value="0">默认</option>
	<option value="1">加奖</option>
	<option value="2"> 热 </option>
	<option value="3"> 加奖 热</option>
</select>
频道类型：<select
	name="newsChannelMD.channelType">
	<option value="0">福彩</option>
	<option value="1">体彩</option>
	<option value="2">高频彩</option>
	<option value="3">足彩</option>
	<option value="4">竞彩</option>
</select>

 
 排序： <select
	name="newsChannelMD.sequence">
	<option value="0">最低</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5" selected="selected">默认</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">最高</option>
</select>
 	模版： <select name="newsChannelMD.template_id">
	
	 <option value="0" <s:if test="#newsChannelMD.template_id==0" >selected</s:if>>默认</option>
		<s:iterator value="#request.lists" id="str">
		<option value="${str.id }">${str.name}</option>
	</s:iterator>


</select> <input type="submit" name="new_save" value="保存" /> <input
	type="button" name="new_cancel" value="取消"
	onclick="document.getElementById('new_channel').style.display='none'" />
</p>
</form>
</div>
<hr />
<table width="950px" border="0" cellspacing="3">
	<tr>
		<td width="30%">频道名称｛拼音｝</td>
		<td width="10%" align="center">频道标识</td>
		<td width="10%" align="center">频道类型</td>
		<td width="15%" align="center">模版</td>
		<td width="9%" align="center">优先级<br />
		[低0-10高]</td>
		<td width="34%" align="center">操作</td>
	</tr>


	<s:iterator id="nl" value="#request.nList">
		<tr>
			<td><input type="text" name="Tree_name_cn_${nl.id}"value="${nl.name_cn}" /> 
			{${nl.name_zh}}
			<input type="hidden"
				name="Tree_name_zh_${nl.id}" value="${nl.name_zh}" /></td>
			<td align="center"><select
				name="Tree_mark_<s:property value="#nl.id"/>">
				<option value="0" <s:if test="#nl.mark==0" >selected</s:if>>默认</option>
				<option value="1" <s:if test="#nl.mark==1" >selected</s:if>>加奖</option>
				<option value="2" <s:if test="#nl.mark==2" >selected</s:if>>热</option>
				<option value="3" <s:if test="#nl.mark==3" >selected</s:if>>加奖 热</option>
				
			</select></td>
			<td align="center"><select
				name="Tree_channelType_<s:property value="#nl.id"/>">
				<option value="0" <s:if test="#nl.channelType==0" >selected</s:if>>福彩</option>
				<option value="1" <s:if test="#nl.channelType==1" >selected</s:if>>体彩</option>
				<option value="2" <s:if test="#nl.channelType==2" >selected</s:if>>高频彩</option>
				<option value="3" <s:if test="#nl.channelType==3" >selected</s:if>>足彩</option>
				<option value="3" <s:if test="#nl.channelType==4" >selected</s:if>>竞彩</option>
				
			</select></td>
			<td align="center">
			<select name="Tree_template_id_${nl.id}">
			 <option value="0" >默认</option>
				<s:iterator id="ls" value="#request.lists">
					<option value="${ls.id}"
						<s:if test="#nl.template_id==#ls.id" >selected</s:if>>${ls.name}</option>
				</s:iterator>
			</select></td>
			<td align="center"><select
				name="Tree_sequence_<s:property value="#nl.id"/>">
				<option value="0" <s:if test="#nl.sequence==0" >selected</s:if>>最低</option>
				<option value="1" <s:if test="#nl.sequence==1" >selected</s:if>>1</option>
				<option value="2" <s:if test="#nl.sequence==2" >selected</s:if>>2</option>
				<option value="3" <s:if test="#nl.sequence==3" >selected</s:if>>3</option>
				<option value="4" <s:if test="#nl.sequence==4" >selected</s:if>>4</option>
				<option value="5" <s:if test="#nl.sequence==5" >selected</s:if>>默认</option>
				<option value="6" <s:if test="#nl.sequence==6" >selected</s:if>>6</option>
				<option value="7" <s:if test="#nl.sequence==7" >selected</s:if>>7</option>
				<option value="8" <s:if test="#nl.sequence==8" >selected</s:if>>8</option>
				<option value="9" <s:if test="#nl.sequence==9" >selected</s:if>>9</option>
				<option value="10" <s:if test="#nl.sequence==10" >selected</s:if>>最高</option>
			</select></td>
			<td><a href="/web/newsChannel!del?id=${nl.id}" onclick="return confirm('确实要删除该频道吗？')">[ 删除 ]</a> <a
				href="javascript:updateChannel(${nl.id})">[ 保存 ]</a> 
				 [ 上线 ][ <a href="/web/newsTemplate!jspToHtmlByChannelOnline?id=${nl.id}">生成  </a>]
				 [
			<a target="_blank" href="/web/newsTemplate!jspToHtmlByChannel?id=${nl.id}">预览</a> ]</td>
		</tr>
	</s:iterator>
</table>
</body>
</html>
