<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page language="java"  pageEncoding="utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.util.UUID" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑站点</title>

<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>
<script src="/jquery_jar/formValidator/jquery_last.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="/jquery_jar/formValidator/style/validator.css"></link>
<script src="/jquery_jar/formValidator/formValidator.js" type="text/javascript" charset="UTF-8"></script>
<script src="/jquery_jar/formValidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript"> 
$(document).ready(function(){	
	$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
	$("#webname").change(function(){
		//alert($("#name_cn").val());
		//alert("22"+$("#webname").val());
		if($("#name_cn").val()==$("#webname").val()){
			 $("#webname").unFormValidator(true);
			}else{
		$("#webname").formValidator({onshow:"请输入网站名字",onfocus:"站点名最少1个字符，最多100个字符",oncorrect:"该站点可用"}).inputValidator({min:1,max:100,empty:{leftempty:false,rightempty:false,emptyerror:"汉子两边不能有空符号"},onerror:"汉子不能为空,请确认"})
	    .ajaxValidator({ 
	    type : "get",
		url : "web/webPro!validateWebSiteById?uuid=randomUUID()+'&'+'web_pro.name_cn='webname",
		datatype : "html",
		success : function(html){	
	        if( html == "0" )
			{
	            return true;
			}
	        else
			{
	            return false;
			}
		},
		buttons: $("#button"),
		error: function(){alert("服务器没有返回数据，可能服务器忙，请重试");},
		onerror : "该站点名已被占用，请更换站点名",
		onwait : "正在对站点名进行合法性校验，请稍候..."
	  });
	  }
    });
	$("#name_zh").change(function(){
		//alert($("#webnamezh").val());
		//alert("22"+$("#name_zh").val());
		if($("#webnamezh").val()==$("#name_zh").val()){
			 $("#name_zh").unFormValidator(true);
			}else{
				$("#name_zh").formValidator({onshow:"请输入网站全拼名字",onfocus:"请输入网站全拼名字",oncorrect:"输入正确"}).inputValidator({min:1,max:200,empty:{leftempty:false,rightempty:false,emptyerror:"字符两边不能有空符号"},onerror:"不能为空,请输入"}).regexValidator({regexp:"^[0-9a-zA-Z]{1}[a-zA-Z0-9_]{1,200}$",onerror:"您的操作非法,可能有汉字，空格等"})
	    .ajaxValidator({ 
	    type : "get",
		url : "web/webPro!validateWebSiteByZhId?uuid=randomUUID()+'&'+'web_pro.name_zh='name_zh",
		datatype : "html",
		success : function(html){	
	        if( html == "0" )
			{
	            return true;
			}
	        else
			{
	            return false;
			}
		},
		buttons: $("#button"),
		error: function(){alert("服务器没有返回数据，可能服务器忙，请重试");},
		onerror : "该站点英文 名已被占用，请更换站点英文名",
		onwait : "正在对站点名进行合法性校验，请稍候..."
	  });
	  }
    });
	
	$("#logo").formValidator({empty:true}).regexValidator({regexp:"picture",datatype:"enum",onerror:"图片只能为jpg|bmp|gif|ico|pcx|jpeg|tif|png|raw|tga格式"});
	$("#watermark").formValidator({empty:true}).regexValidator({regexp:"picture",datatype:"enum",onerror:"图片只能为jpg|bmp|gif|ico|pcx|jpeg|tif|png|raw|tga格式"});
	$("#url").formValidator({onfocus:"请按http://www.sina.com的格式输入"}).inputValidator({}).regexValidator({regexp:"url",datatype:"enum",onerror:"格式不正确"});
	$("#script_text").formValidator({onfocus:"请输入统计代码,可以为空最多不超过500字符"}).inputValidator({max:500,onerror:"不能超过500个字符"});
	$("#timer").formValidator({onfocus:"请输入统计代码,可以为空最多不超过500字符"}).inputValidator({max:500,onerror:"不能超过500个字符"});
	$("#category_default_vm").formValidator({onfocus:"请输入可以为空最多不超过200字符"}).inputValidator({max:100,onerror:"不能超过200个字符"});
	$("#channel_default_vm").formValidator({onfocus:"请输入可以为空最多不超过200字符"}).inputValidator({max:100,onerror:"不能超过200个字符"});
	$("#news_default_vm").formValidator({onfocus:"请输入可以为空最多不超过200字符"}).inputValidator({max:100,onerror:"不能超过200个字符"});
	
});


</script>
</head>

<body>
<form action="/web/webPro!modify" method="post" id="form1">
<table width="900px" border="1">
  <tr>
    <td width="162" align="right">站点名称：</td>
    <td width="442">
      <input type="hidden" name="webname" value="${sessionScope.WEBSITE_SESSION.name_cn }" id="name_cn"/>
      <input type="text" name="web_pro.name_cn" value="${sessionScope.WEBSITE_SESSION.name_cn }" id="webname"/>     
    </td>
    <td width="274"><div id="webnameTip"></div></td>
  </tr>
  <tr>
    <td align="right">站点名称全拼：</td>
    <td>
    	<input type="hidden" name="webnamezh" id="webnamezh" value="${sessionScope.WEBSITE_SESSION.name_zh }"/>
    	<input type="text" name="web_pro.name_zh" value="${sessionScope.WEBSITE_SESSION.name_zh }" id="name_zh"/>    
    </td>
    <td><div id="name_zhTip"></div></td>
  </tr>
  <tr>
    <td align="right">logo：</td>
    <td><input type="text" name="web_pro.logo" value="${sessionScope.WEBSITE_SESSION.logo }" id="logo"/>    
    </td>
    <td> <span id="logoTip"></span></td>
  </tr>
  <tr>
    <td align="right">图片根目录：</td>
    <td><input type="text" name="web_pro.pictures_address" value="${sessionScope.WEBSITE_SESSION.pictures_address }" readonly="readonly"/></td>
    <td>网站后台上传的图片的根目录地址</td>
  </tr>
  <tr>
    <td align="right">缩略图根目录：</td>
    <td><input type="text" name="web_pro.thumbnail_address" value="${sessionScope.WEBSITE_SESSION.thumbnail_address}" readonly="readonly"/></td>
    <td>网站后台上传的图片的缩略图的根目录地址</td>
  </tr>
  <tr>
    <td align="right">水印图片：</td>
    <td><input type="text" name="web_pro.watermark_address" value="${sessionScope.WEBSITE_SESSION.watermark_address}" id="watermark"/>   
    </td>
    <td> <span id="watermarkTip"></span></td>
  </tr>
  <tr>
    <td align="right">网址：</td>
    <td><input type="text" name="web_pro.website_url" value="${sessionScope.WEBSITE_SESSION.website_url}" id="url"/>    
    </td>
    <td><span id="urlTip"></span></td>
  </tr>
  <tr>
    <td align="right">统计代码：</td>
    <td><textarea name="web_pro.script_text" cols="60" rows="8" id="script_text">${sessionScope.WEBSITE_SESSION.script_text}</textarea>      
    </td>
    <td><span id="script_textTip"></span></td>
  </tr>
  
  <tr>
    <td align="right">通用页生成时间：</td>
    <td><input type="text" name="web_pro.timer" value="${sessionScope.WEBSITE_SESSION.timer}" id="timer"/>     
    </td>
    <td><span id="timerTip"></span></td>
  </tr>
  <tr>
    <td align="right">分类的默认模板：</td>
    <td><input type="text" name="web_pro.category_default_vm" value="${sessionScope.WEBSITE_SESSION.category_default_vm}" id="category_default_vm"/>
    </td>
    <td><span id="category_default_vmTip"></span></td>
  </tr>
  <tr>
    <td align="right">频道的默认模版：</td>
    <td><input type="text" name="web_pro.channel_default_vm" value="${sessionScope.WEBSITE_SESSION.channel_default_vm}" id="channel_default_vm"/>    
    </td>
    <td><span id="channel_default_vmTip"></span></td>
  </tr>
  <tr>
    <td align="right">新闻的默认模版：</td>
    <td><input type="text" name="web_pro.news_default_vm" value="${sessionScope.WEBSITE_SESSION.news_default_vm}" id="news_default_vm"/>    
    </td>
    <td><span id="news_default_vmTip"></span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="center">
      <input type="submit" name="button" value="保存当前站点修改" id="button"/></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
