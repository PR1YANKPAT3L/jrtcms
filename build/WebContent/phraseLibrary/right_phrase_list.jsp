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
	$("#createPhrase").click(function(){
		document.getElementById("new_channel").style.display="block";
	$("#phrase").formValidator({onshow:"请输入词组名称 ",onfocus:"词组称不能为空 ",oncorrect:"正确"}).inputValidator({empty:{leftempty:false,rightempty:false,emptyerror:"词组名称不能输入看空格"},min:1,onerror:"词组名称不能为空,请确认"});
	$("#phraseUrl").formValidator({onshow:"请输入带链接的词组   ",onfocus:"带链接的词组称必须以字母开头,只能包括字母和数字   ",oncorrect:"恭喜你输入正确"}).inputValidator({empty:{leftempty:false,rightempty:false,emptyerror:"带连接词组名称不能输入看空格"},min:1,onerror:"带连接词组名称不能为空,请确认"});
	});
		
});


</script>
</head>

<script type="text/javascript">
	function updatePhrase(id,cz) {
		var phrase = "phrase_" + id;
		var phrase_url_input = "phrase_url_" + id;
		var stateid ="state_"+id;
		var caozuo = cz;
		 var state;
		if(cz==0){
			state= $("#"+stateid).val();
		}else if(cz==1){
			state= 2;
		}else if(cz==2){
			state= 1;
		}
		var phrase = $("input[name=" + phrase + "]").attr("value");
		var phraseUrl = $("input[name=" + phrase_url_input + "]").attr("value");
		var modelName = "pl";
		$("#test").change(function(){

			});
		for(b in $.browser) if(b=='msie'){phrase = encodeURI(phrase);phraseUrl = encodeURI(phraseUrl);};	
		$.ajax( {
			url : '/web/phraseLibrary!modifyPhrase?' + modelName + '.id=' + id + '&'
					+ modelName + '.phrase=' + phrase + '&' + modelName
					+ '.phraseUrl=' + phraseUrl + '&' + modelName
					+ '.state=' + state,
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
<p><input type="button" name="new" value="创建词组"
	onclick="document.getElementById('phrase_div').style.display='block'" id="createPhrase" />
	<input type="button" value="查询停用词组"  onclick="javaScript:location.href='/web/phraseLibrary!SearchLIst?state=2'"/>
	<input type="button" value="查询启用词组" onclick="javaScript:location.href='/web/phraseLibrary!SearchLIst?state=1'"/>
</p>
<div id="phrase_div" style="display: none">
<form action="/web/phraseLibrary!creatPhrase" method="post" id="form2">
<p>词组名字： <input type="text" name="pl.phrase" id="phrase" style=" width:230px;height:23px; line-height:23px;"/>
带有链接词组 <input type="text" name="pl.phraseUrl" id="phraseUrl" value='<a href="/shuangseqiu.html" style="color:#DE0201;">双色球</a>' style=" width:380px;height:23px; line-height:23px;"/>  
</select> <input type="submit" name="new_save" value="保存" /> <input
	type="button" name="new_cancel" value="取消"
	onclick="document.getElementById('phrase_div').style.display='none'" />
</p>
</form>
</div>
<hr />
<table width="950px" border="0" cellspacing="3">
	<tr>
		<td width="30%">词组名称</td>
		<td width="34%" >词组对应的数组</td>
		<td width="34%" >操作</td>
	</tr>
	<s:iterator  value="#request.list" id="pl">
		<tr>
			<td><input type="text" name="phrase_${id}"value="${phrase}" style=" width:380px;height:23px; line-height:23px;"/> 
			<td><input type="text" name="phrase_url_${id}" value='${phraseUrl}' style=" width:380px;height:23px; line-height:23px;" /></td>
			<td>
			<s:if test="#pl.state==1">
			<input type="hidden"  value="${statr }" id="state_${id }"/>
			<a href="javascript:updatePhrase(${id},1)" onclick="return confirm('确定要停用这个词组吗？')">[ 停用 ]</a> 
			</s:if>
			<s:elseif test="#pl.state==2">
			<input type="hidden"  value="${statr }" id="state_${id }"/>
			<a href="javascript:updatePhrase(${id},2)" onclick="return confirm('确定要启用这个词组吗？')">[ 启用 ]</a> 
			</s:elseif>
			<a href="javascript:updatePhrase(${id},0)">[ 修改 ]</a> 
			</td>
		</tr>
		<tr>
		 <td colspan="3">${pageHtml}</td>
		</tr>
	</s:iterator>
</table>
</body>
</html>
