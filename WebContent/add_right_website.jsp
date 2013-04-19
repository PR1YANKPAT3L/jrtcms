<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java"  pageEncoding="utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.util.UUID" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script src="/jquery_jar/formValidator/jquery_last.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="/jquery_jar/formValidator/style/validator.css"></link>
<script src="/jquery_jar/formValidator/formValidator.js" type="text/javascript" charset="UTF-8"></script>
<script src="/jquery_jar/formValidator/formValidatorRegex.js" ></script>

<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
	$("#webname_cn").formValidator({onshow:"请输入网站名字",onfocus:"站点名最少1个字符，最多100个字符",oncorrect:"该站点可以创建"}).inputValidator({min:1,max:100,empty:{leftempty:false,rightempty:false,emptyerror:"汉子两边不能有空符号"},onerror:"汉子不能为空,请确认"})
	 .ajaxValidator({ 
    type : "get",
	url : "web/webPro!validateWebSiteName?uuid=randomUUID()+'&'+'webname_cn='webname_cn",
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
		
	$("#webname_zh").formValidator({onshow:"网站中文名字的全拼",onfocus:"请输入字符数在(1-200)的字母、数字",oncorrect:"该站点英文名可以创建"}).inputValidator({empty:{leftempty:false,rightempty:false,emptyerror:"字母两边不能有空符号"},onerror:"汉子不能为空,请确认"}).regexValidator({regexp:"^[a-zA-Z0-9]{1}[a-zA-Z0-9_]{0,200}$",onerror:"您的操作非法,可能有汉字，空格等"})
		 .ajaxValidator({ 
    type : "get",
	url : "web/webPro!validateWebSiteName_zh?uuid=randomUUID()+'&'+'webname_zh='webname_zh",
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
	onerror : "该站点的英文名已被占用，请更换其他英文名",
	onwait : "正在对站点英文名进行合法性校验，请稍候..."
	});
	$("#website_url").formValidator({onshow:"这个网站的网址",onfocus:"请按http://www.sina.com的格式输入"}).inputValidator({}).regexValidator({regexp:"url",datatype:"enum",onerror:"格式不正确"});
	$("#web_logo").formValidator({onshow:"网站logo所在的系统目录地址",onfocus:"输入最多200个字符"}).inputValidator({max:200,onerror:"您的操作非法，请重新操作"});
	$("#web_pictures").formValidator({onshow:"网站后台上传的图片的根目录地址",onfocus:"输入最多200个字符"}).inputValidator({max:200,onerror:"您的操作非法，请重新操作"});
	$("#web_thumbnail").formValidator({onshow:"网站后台上传的图片的缩略图的根目录地址",onfocus:"输入最多200个字符"}).inputValidator({max:200,onerror:"您的操作非法，请重新操作"});
	$("#web_watemark").formValidator({onshow:"上传图片时使用的水印图",onfocus:"输入最多200个字符"}).inputValidator({max:200,onerror:"您的操作非法，请重新操作"});
	$("#web_script").formValidator({onshow:"第三方生成的统计代码。直接复制粘贴到此处",onfocus:"输入最多400个字符"}).inputValidator({max:400,onerror:"您的操作非法，请重新操作"});
	$("#web_timer").formValidator({onshow:"	多个时间逗号分隔，格式为（23:50:00）",onfocus:"输入最多200个字符"}).inputValidator({max:200,onerror:"您的操作非法，请重新操作"});
	$("#web_category").formValidator({onshow:"********模版管理做好后需要修改********",onfocus:"输入最多200个字符"}).inputValidator({max:200,onerror:"您的操作非法，请重新操作"});
	$("#web_channel").formValidator({onshow:"********模版管理做好后需要修改********",onfocus:"输入最多200个字符"}).inputValidator({max:200,onerror:"您的操作非法，请重新操作"});
	$("#web_defaul").formValidator({onshow:"********模版管理做好后需要修改********",onfocus:"输入最多200个字符"}).inputValidator({max:200,onerror:"您的操作非法，请重新操作"});
});
</script>

</head>

<body>
<form action="/web/webPro!create" method="post" id="form1">
<table width="900px" border="1">
  <tr>
    <td width="162" align="right">站点名称：</td>
    <td width="442">
      <input type="text" name="web_pro.name_cn" value="" id="webname_cn"/>      
    </td>    
    <td width="274"><span id="webname_cnTip" ></span> </td>
  </tr>
  <tr>
    <td align="right">站点名称全拼：</td>
    <td><input type="text" name="web_pro.name_zh" value="" id="webname_zh"/>    
    </td>
    <td><span id="webname_zhTip" ></span></td>
  </tr>
  <tr>
    <td align="right">logo：</td>
    <td><input type="text" name="web_pro.logo" value="" id="web_logo"/> 
    </td>
    <td><span id="web_logoTip" ></span> </td>
  </tr>
  <tr>
    <td align="right">图片根目录：</td>
    <td><input type="text" name="web_pro.pictures_address" value="" id="web_pictures"/>      
    </td>
    <td><span id="web_picturesTip" ></span></td>
  </tr>
  <tr>
    <td align="right">缩略图根目录：</td>
    <td><input type="text" name="web_pro.thumbnail_address" value="" id="web_thumbnail"/>     
    </td>
    <td><span id="web_thumbnailTip" ></span> </td>
  </tr>
  <tr>
    <td align="right">水印图片：</td>
    <td><input type="text" name="web_pro.watermark_address" value="" id="web_watemark"/>     
    </td>
    <td><span id="web_watemarkTip" ></span> </td>
  </tr>
  <tr>
    <td align="right" width="100">网址：</td>
    <td><input type="text" name="web_pro.website_url" value="" id="website_url"/>     
    </td>
    <td><span id="website_urlTip" ></span></td>
  </tr>
  <tr>
    <td align="right">统计代码：</td>
    <td><textarea name="web_pro.script_text" cols="60" rows="8" id="web_script"></textarea>     
    </td>
    <td><span id="web_scriptTip" ></span> </td>
  </tr>
  <tr>
    <td align="right">通用页生成时间：</td>
    <td><input type="text" name="web_pro.timer" value="" id="web_timer"/>      
    </td>
    <td><span id="web_timerTip" ></span></td>
  </tr>
  <tr>
    <td align="right">分类的默认模板：</td>
    <td><input type="text" name="web_pro.category_default_vm" value="" id="web_category"/>     
    </td>
    <td><span id="web_categoryTip" ></span> </td>
  </tr>
  <tr>
    <td align="right">频道的默认模版：</td>
    <td><input type="text" name="web_pro.channel_default_vm" value="" id="web_channel"/>     
    </td>
    <td><span id="web_channelTip" ></span> </td>
  </tr>
  <tr>
    <td align="right">新闻的默认模版：</td>
    <td><input type="text" name="web_pro.news_default_vm" value="" id="web_defaul"/>    
    </td>
    <td><span id="web_defaulTip" ></span> </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="center">
      <input type="submit" name="Submit2"  id="button" value="创建新站点" /></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
