<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content") != null ? request.getParameter("content") : "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="s" uri="/struts-tags"%>
<head>
<base href="<%=basePath%>">
<title>如意彩_新闻添加管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
<!--
body,td,th {
	font-size: 14px;
}
-->
</style>
<script src="/jquery_jar/jquery.js"type="text/javascript"></script>
<script src="/jquery_jar/formValidator/jquery_last.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="/jquery_jar/formValidator/style/validator.css"></link>
<script src="/jquery_jar/formValidator/formValidator.js" type="text/javascript" charset="UTF-8"></script>
<script src="/jquery_jar/formValidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script language="javascript" type="text/javascript" src="/jquery_jar/jQuery.FillOptions.js"></script>
<script language="javascript" type="text/javascript" src="/jquery_jar/jQuery.CascadingSelect.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=basePath%>kindeditor/kindeditor.js"></script>
<script language="javascript" type="text/javascript">
$(function(){
		$("#Category0").FillOptions("/web/newsCategory!getCategoryByPcode?pcode=-1",{datatype:"json",textfield:"name_cn",valuefiled:"code"});
		$("#Category0").AddOption("请选择分类...","-1",true,0);
		//当触发一级分类的select的时候，如果选择的是值为-1的“请选择”则频道不是子分类 0为首分类 1为子分类
		$("#Category0").change(function(){if($(this).val()==-1){$("#leaf").val("0");}else{$("#leaf").val("1");}});
});
</script>
<script type="text/javascript">
$(function(){
	$.formValidator.initConfig({formid:"form2",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
	$("#title").formValidator({onshow:"请输入文章标题 ",onfocus:"文章标题 不能超过120个字符 ",oncorrect:"正确"}).inputValidator({min:1,max:120,onerror:"文章标题长度非法,请确认",empty:{leftempty:false,rightempty:false,emptyerror:"文章标题 两边不能有空符号"}});
	$("#keyword").formValidator({onshow:"请输入关键字  ",onfocus:"多个关键字用空格隔开,共计200字符  ",oncorrect:"正确"}).inputValidator({min:1,max:200,onerror:"关键字不能为空并且不能超过200字符,请确认"});
	$("#numero").formValidator({onshow:"请输入开奖期号 ",onfocus:"开奖期号不能超过16个字节 ",oncorrect:"输入正确"}).inputValidator({max:16,onerror:"开奖期号长度非法,请确认",empty:{leftempty:false,rightempty:false,emptyerror:"开奖期号 两边不能有空符号"}}).regexValidator({regexp:"^[0-9]{0}[0-9_]{0,16}$",onerror:"您的操作非法,可能有汉字，字母，空格等"});
	$("#title_as").formValidator({onshow:"请输入文章标题别名 ",onfocus:"文章标题 别名不能超过30个字符 ",oncorrect:"正确"}).inputValidator({min:1,max:120,onerror:"文章标题别名长度非法,请确认",empty:{leftempty:false,rightempty:false,emptyerror:"文章标题别名 两边不能有空符号"}});
	$("#type").change(function(){
		if( $("#type").val()=="0"){
			$("#Table0").show();$("#Table1").hide();
			$("#newsInfourl").formValidator({onshow:"请输入引用地址",onfocus:"引用地址必须以http：//开头",oncorrect:"填写正确"}).inputValidator({min:1,max:200,onerror:"引用地址不能为空最多200个字符",empty:{leftempty:false,rightempty:false,emptyerror:"引用地址两边不能有空符号"}});
			//formValidator({onshow:"请输入引用地址   ",onfocus:"引用地址必须以http：//开头   ",oncorrect:"恭喜你输入正确"}).inputValidator({}).regexValidator({regexp:"url",datatype:"enum",onerror:"引用地址格式非法"});
			 $("#upload").unFormValidator(true);
			    $("#content").unFormValidator(true);
			    $("#author").unFormValidator(true);
			    $("#editor").unFormValidator(true);
			
		}
		else if( $("#type").val()=="1"){
			$("#Table1").show();$("#Table0").hide();
			
			$("#content").formValidator({onshow:"请输入正文内容",onfocus:"正文内容不能为空",oncorrect:"正确"}).inputValidator({onerror:"正文内容不能为空"});
			$("#author").formValidator({}).inputValidator({empty:{leftempty:false,rightempty:false,emptyerror:"作者两边 两边不能有空符号"},min:1,onerror:"作者不能为空,请确认"});
			$("#editor").formValidator({}).inputValidator({empty:{leftempty:false,rightempty:false,emptyerror:"编辑者名称 两边不能有空符号"},min:1,onerror:"编辑者不能为空,请确认"});
			$("#upload").formValidator({onshow:"请选择要上传的图片   ",oncorrect:"恭喜你输入正确",empty:true}).inputValidator({onerror:"请上传图片"}).regexValidator({regexp:"picture",datatype:"enum",onerror:"图片名格式不正确"});
			$("#newsInfourl").unFormValidator(true);
			} 
		
	});
	$("Table"+$("#type").val()).hide();
	
//$("#topnews").formValidator({onshow:"请选择是否是头条 ",onfocus:"必须选择",oncorrect:"谢谢你的配合"}).inputValidator({min:1,onerror: "您忘选头条类型  !"});
	$("#pcode").formValidator({onshow:"请选择分类 ",onfocus:"必须选择分类 ",oncorrect:"正确"}).inputValidator({min:0,onerror: "您忘选分类 了  !"}).regexValidator({regexp:"^\\d+$",onerror:"您忘选分类 了  !"});
	//$("#channel").formValidator({onshow:"请选择频道 ",onfocus:"必须选择频道",oncorrect:"正确",defaultvalue:"0"}).inputValidator({min:1,onerror: "您忘选频道 了  !"});
	//$("#template").formValidator({onshow:"请选择模板 ",onfocus:"必须选择模板 ",oncorrect:"谢谢你的配合",defaultvalue:"0"}).inputValidator({min:1,onerror: "您忘选模板了  !"});
	
	$("#sequence").formValidator({onshow:"请选择文章的排列顺序 ",onfocus:"必须文章的排列顺序 ",oncorrect:"正确",defaultvalue:"5"}).inputValidator({min:1,onerror: "您忘选文章顺序  了  !"});

    if( $("#type").val()=="1"){
         $("#content").formValidator({onshow:"请输入正文内容   ",oncorrect:"恭喜你输入正确"}).inputValidator({onerror:"关键字不能为空并且不能超过200字符,请确认"});
         $("#upload").formValidator({onshow:"请选择要上传的图片   ",oncorrect:"恭喜你输入正确",empty:true}).inputValidator({onerror:"请上传图片"}).regexValidator({regexp:"picture",datatype:"enum",onerror:"图片名格式不正确"});
     	  
        $("#author").formValidator({}).inputValidator({min:1,onerror:"作者不能为空 ,请确认",empty:{leftempty:false,rightempty:false,emptyerror:"作者两边 两边不能有空符号"}});
        $("#editor").formValidator({}).inputValidator({min:1,onerror:"编辑不能为空,请确认",empty:{leftempty:false,rightempty:false,emptyerror:"作者两边 两边不能有空符号"}});
	 
}
   if( $("#type").val()=="0"){
        $("#newsInfourl").formValidator({onshow:"请输入引用地址",onfocus:"引用地址必须以http：//开头",oncorrect:"填写正确"}).inputValidator({min:1,max:200,onerror:"引用地址不能为空最多200个字符",empty:{leftempty:false,rightempty:false,emptyerror:"引用地址两边不能有空符号"}});
        //formValidator({onshow:"请输入引用地址   ",onfocus:"引用地址必须以http：//开头   ",oncorrect:"恭喜你输入正确"}).inputValidator({}).regexValidator({regexp:"url",datatype:"enum",onerror:"引用地址格式非法"});
}

});

 </script>  
<script type="text/javascript">
		KE.show({
			id : 'content',
			imageUploadJson : '<%=basePath%>kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=basePath%>kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true 
		});
	</script>
</head>
<body>
<form action="<%=basePath%>web/news!create" enctype="multipart/form-data" method="post" id="form2">
	<select name="n.channelId" id="channel">
	  	<option value="0">请选择频道...</option>
	  	<s:iterator  value="#request.ncList"  id="nclist">
	  		<option value="${id}">${name_cn}</option>
	   	</s:iterator>
	</select>
	<select name="n.templateId" id="template">
		<option value="0">默认模版</option>
		<s:iterator  value="#request.ntList"  id="ntlist">
			<option value="${id}">${name}</option>
		</s:iterator>
	</select>
	<span id="category_select">
		<input type="hidden" id="leaf" name="leaf" value="0" />
		<input type="hidden" id="pcode" name="n.categoryCode" value="-1" />
		<select id="Category0" name="Category0" onchange="selectLin(0,'Category')">
		</select>
	</span>
<table width="900px" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100" align="right"><p>文章标题：</p>    </td>
    <td width="450">
	    <input type="text" size="50" readonly="false" value="一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十"/>
	    <input name="n.title" type="text" size="50" id="title"/><div id="titleTip" style="width:250px"></div>
	</td>
    <td width="350">
	    <select name="n.topNews" id="topnews">
			<option value="0" selected="selected" >非头条</option>
			<option value="1" >头条</option>
		</select>
		<select id="type" name="n.type" >
			<option value="0" >-引用-</option>
			<option value="1" selected>-正文-</option>
	    </select>
		<select name="n.sequence" id="sequence">
			<option value="0" selected="selected">默认</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">最高</option>
		</select>
		<select id="color" name="n.title_color" >
		    <option value=" " selected>标题颜色(默认黑色)</option>
			<option value="#DE0201" >红色</option>
			<option value="#1F376D" >蓝色</option>
	    </select>
    </td>
  </tr>
  <tr>
    <td width="100" align="right"><p>开奖期号：</p>    </td>
    <td width="450">
	    <input name="n.numero" type="text" size="20" id="numero"/>
	</td>
	<td><div id="numeroTip" style="width:250px"></div>用于专家推荐和走势图表使用</td>
  </tr>
  <tr>
    <td width="100" align="right"><p>新闻别名：</p>    </td>
    <td width="450">
	    <input name="n.title_as" type="text" size="20" id="title_as"/>
	</td>
	<td><div id="title_asTip" style="width:250px"></div>用于专家推荐和走势图表使用</td>
  </tr>
  <tr>
    <td align="right">文章关键字：</td>
    <td><textarea name="n.keyword" cols="50" rows="4" id="keyword"></textarea>
    </td>
    <td><div id="keywordTip" style="width:250px"></div>关键字用于文章页面的网页关键字，也应用于文章与文章之间的相关联依据。多个关键字以空格隔开。</td>
   
  </tr>
  <tr>
    <td colspan="3"><table id="Table1" width="898px" border="1" cellpadding="0" cellspacing="0" style="display:block" cellpadding="0" cellspacing="0">
      <tr>
        <td width="99" align="right">作者：</td>
        <td width="450"><input name="n.author" type="text" size="10" value="<s:property value="#session.ADMIN" />"  id="author"/>　
        
          　编辑：
          <input name="n.compile" type="text" size="10" value="<s:property value="#session.ADMIN" />"   id="editor"/></td>
        <td width="349">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">上传图片：</td>
        <td>
          <input name="upload" type="file" size="40" src="" id="upload"/> <div id="uploadTip" style="width:250px"></div>       </td>
        <td>上传列表图片，此图片会在首页、频道页或者分类页显示。</td>
      </tr>
      <tr>
        <td align="right">文章内容：</td>
        <td colspan="2" align="left"><textarea id="content" name="n.content" cols="100" rows="10">此处内容需要使用js编辑器</textarea>
        <div id="contentTip" style="width:250px"></div>
        </td>
        </tr>
    </table>
      <table id="Table0"  style="display:none" width="898px" border="1" cellpadding="0" cellspacing="0">

        <tr>
          <td width="99">引用地址：</td>
          <td width="450"><input name="n.url" type="text" size="50" id="newsInfourl" /></td>
          <td width="349"><div id="newsInfourlTip" style="width:250px"></div>（http://xxx.xxx.xxx）</td>
        </tr>
      </table></td>
  </tr>
</table>
<table  width="898px" border="0" cellspacing="0" cellpadding="0" cellspacing="0">

        <tr>
          <td width="52">&nbsp;</td>
          <td width="393" align="right"><input name="button2" type="submit" value="保存新闻-等待审批"/></td>
          <td width="431"><input name="button22" type="button" onclick="javaScript:window.location.href='<%=basePath%>/web/newsSearch!getSearchList'" value="取消返回" /></td>
        </tr>
</table>
</form>
</body>
</html>