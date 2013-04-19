<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="s" uri="/struts-tags"%>
<head>
<base href="<%=basePath%>">
<title>如意彩_新闻添加管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="">
<meta http-equiv="description" content="">
<script src="/jquery_jar/jquery.js"type="text/javascript"></script>
<script src="/jquery_jar/formValidator/jquery_last.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="/jquery_jar/formValidator/style/validator.css"></link>
<script src="/jquery_jar/formValidator/formValidator.js" type="text/javascript" charset="UTF-8"></script>
<script src="/jquery_jar/formValidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
</head>
 <script type="text/javascript"> 
<% String msg=(String)request.getAttribute("msg");if(msg!=null){%>
	 alert("<%=(String)request.getAttribute("msg") %>");
	<% }%>
function tableViwe()
{
	var typeSelect = document.getElementById("type");
	var id = typeSelect.options[typeSelect.options.selectedIndex].value;
	var Obj = document.getElementById("Table"+id).style.display='block';
	var noneObj = document.getElementById("Table"+((Number(id)+1)%2)).style.display='none';
}
</script>
<script type="text/javascript" src="<%=basePath%>fckeditor/fckeditor.js"></script>
<script language="javascript" type="text/javascript" src="/jquery_jar/jQuery.FillOptions.js"></script>
<script language="javascript" type="text/javascript" src="/jquery_jar/jQuery.CascadingSelect.js"></script>
<script language="javascript" type="text/javascript">
$(function(){
		$("#Category0").FillOptions("/web/newsCategory!getCategoryByPcode?pcode=-1",{datatype:"json",textfield:"name_cn",valuefiled:"code"});
		$("#Category0").AddOption("选择分类","-1",true,0);
		//当触发一级分类的select的时候，如果选择的是值为-1的“请选择”则频道不是子分类 0为首分类 1为子分类
		$("#Category0").change(function(){if($(this).val()==-1){$("#leaf").val("0");}else{$("#leaf").val("1");}});
});
</script>
<script type="text/javascript">
$(function(){
	$.formValidator.initConfig({formid:"form2",onerror:function(msg){alert(msg)},onsuccess:function(){alert('success');return true;}});
	$("#title").formValidator({onshow:"请输入文章标题 ",onfocus:"文章标题 不能超过30个字 ",oncorrect:"恭喜你输入正确"}).inputValidator({min:1,max:30,onerror:"文章标题长度非法,请确认",empty:{leftempty:false,rightempty:false,emptyerror:"文章标题 两边不能有空符号"}});
    $("#keyword").formValidator({onshow:"请输入关键字  ",onfocus:"多个关键字用空格隔开  ",oncorrect:"恭喜你输入正确"}).inputValidator({min:1,max:30,onerror:"关键字不能为空,请确认"});
    $("#type").formValidator({onshow:"请选择文章类型..."}).inputValidator({min:1,onerror: "您忘选文章类型 !"});
    $("#type").change(function(){
	   if( document.getElementById("Table0").style.display=="block"){
	       $("#newsInfourl").formValidator({onshow:"请输入引用地址   ",onfocus:"引用地址必须以http：//开头   ",oncorrect:"恭喜你输入正确"}).inputValidator({}).regexValidator({regexp:"url",datatype:"enum",onerror:"引用地址格式非法"});
		    }
	   else if( document.getElementById("Table1").style.display=="block"){
		   $("#upload").formValidator({onshow:"请选择要上传的图片   ",oncorrect:"恭喜你输入正确"}).inputValidator({onerror:"请上传图片"}).regexValidator({regexp:"picture",datatype:"enum",onerror:"图片名格式不正确"});;
    	   $("#content").formValidator({onshow:"请输入正文内容   ",onfocus:"正文内容要大于150字   ",oncorrect:"恭喜你输入正确"}).inputValidator({onerror:"关键字不能为空,请确认"});
    	   $("#author").formValidator({}).inputValidator({empty:{leftempty:false,rightempty:false,emptyerror:"作者两边 两边不能有空符号"},min:1,onerror:"作者不能为空,请确认"});
    	   $("#editor").formValidator({}).inputValidator({empty:{leftempty:false,rightempty:false,emptyerror:"编辑者名称 两边不能有空符号"},min:1,onerror:"bianz者不能为空,请确认"});    
		    	  
     } });
 
   $("#topnews").formValidator({onshow:"请选择是否是头条 ",onfocus:"必须选择",oncorrect:"谢谢你的配合",defaultvalue:[0,1]}).inputValidator({min:1,onerror: "您忘选头条类型  !"});
   $("#channel").formValidator({onshow:"请选择频道 ",onfocus:"必须选择频道",oncorrect:"谢谢你的配合",defaultvalue:"0"}).inputValidator({min:1,onerror: "您忘选频道 了  !"});
   $("#template").formValidator({onshow:"请选择模板 ",onfocus:"必须选择模板 ",oncorrect:"谢谢你的配合",defaultvalue:"0"}).inputValidator({min:1,onerror: "您忘选模板了  !"});
   $("Category0").formValidator({onshow:"请选择分类 ",onfocus:"必须选择分类 ",oncorrect:"谢谢你的配合"}).inputValidator({min:1,onerror: "您忘选分类 了  !"});
   $("#sequence").formValidator({onshow:"请选择文章的排列顺序 ",onfocus:"必须文章的排列顺序 ",oncorrect:"谢谢你的配合",defaultvalue:"0"}).inputValidator({min:1,onerror: "您忘选文章顺序  了  !"});
	 
		   
  

	
});

 </script>  
<script > 
		window.onload = function() 
		{ 
			var oFCKeditor = new FCKeditor( 'newsInfo.content' ) ;
			oFCKeditor.BasePath	= "fckeditor/"; 
			oFCKeditor.ReplaceTextarea() ; 
		}
			
</script>


<body>
<form action="<%=basePath%>web/newsInfo!createNewsInfo" enctype="multipart/form-data" method="post" id="form2">
<select name="select" id="channel">
  <option value="0">选择频道</option>
  <s:iterator  value="#request.newsChannelList"  id="NewsChannel">
  <option value="<s:property value="id"/>"><s:property value="name_cn"/></option>
   </s:iterator>
 
</select>
<select name="select2" id="template">
  <option value="0">默认模版</option>
  <s:iterator  value="#request.newsTemplateList"  id="NewsTemplate">
  <option value="<s:property value="id"/>"><s:property value="name"/></option>
   </s:iterator>
</select>
<span id="category_select">
<input type="hidden" id="leaf" name="newsCategoryMD.leaf" value="0" />
  <input type="hidden" id="pcode" name="newsCategoryMD.pcode" value="-1" />
    <select id="Category0" name="Category0" onchange="selectLin(0,'Category')">
    </select></span>
<table width="900px" border="1">
  <tr>
    <td width="117" align="right"><p>文章标题：</p>    </td>
    <td width="353"><input type="text" size="50" readonly="false" value="一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十"/>
    <input name="newsInfo.title" type="text" size="50" id="title"/><div id="titleTip" style="width:250px"></div></td>
    <td width="408">
    <select name="newsInfo.top_news" id="topnews">
	   <option value="0">非头条</option>
	   <option value="1">头条</option>
	  </select>
	  <!-- <label><input type="checkbox" name="newsInfo.top_news" value="1" />头条</label -->
      <select id="type" name="newsInfo.type" onchange="tableViwe()">
      <option value="-1" selected="selected" >请选择类型...</option>
      <option value="0" >引用</option>
      <option value="1" >正文</option>
    </select>
      <select name="newsInfo.sequence" id="sequence">
	  	<option value="-1">请选择排序...</option>
        <option value="0">最低</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5" selected>默认</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">最高</option>
      </select>
      </td>
  </tr>
  <tr>
    <td align="right">文章关键字：</td>
    <td><textarea name="newsInfo.keyword" cols="50" rows="4" id="keyword"></textarea>
    </td>
    <td><div id="keywordTip" style="width:250px">关键字用于文章页面的网页关键字，也应用于文章与文章之间的相关联依据。多个关键字以空格隔开。</td>
   
  </tr>
  <tr>
    <td colspan="3"><table id="Table1" width="898px" border="1" style="display:none">
      <tr>
        <td width="85" align="right">作者：</td>
        <td width="374"><input name="newsInfo.author" type="text" size="10" value="<s:property value="#session.ADMIN" />"  id="author"/>　
        
          　编辑：
          <input name="newsInfo.compile" type="text" size="10" value="<s:property value="#session.ADMIN" />"  id="editor"/></td>
        <td width="416">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">上传图片：</td>
        <td>
          <input name="upload" type="file" size="40" src="" id="upload"/> </td>
        <td><div id="uploadTip" style="width:250px"></div> 上传列表图片，此图片会在首页、频道页或者分类页显示。</td>
      </tr>
      <tr>
        <td align="right">文章内容：</td>
        <td colspan="2" align="left"><textarea id="content" name="newsInfo.content" cols="100" rows="10">此处内容需要使用js编辑器</textarea>
        <div id="contentTip" style="width:250px"></div>
        </td>
        </tr>
    </table>
      <table id="Table0"  style="display:none" width="898px" border="1">

        <tr>
          <td width="85">引用地址：</td>
          <td width="374"><input name="newsInfo.url" type="text" size="50" id="newsInfourl" /></div></td>
          <td width="416"><div id="newsInfourlTip" style="width:250px"></td>
        </tr>
      </table></td>
  </tr>
</table>
<table  width="898px" border="0" cellspacing="0">

        <tr>
          <td width="52">&nbsp;</td>
          <td width="393" align="right"><input name="button2" type="submit" value="保存新闻-等待审批"/></td>
          <td width="431"><input name="button22" type="reset" value="取消返回" onclick="javaScript:window.history .go(-1)"/></td>
        </tr>
</table>
</form>
</body>
</html>