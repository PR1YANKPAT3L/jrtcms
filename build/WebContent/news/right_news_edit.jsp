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
<title>如意彩_新闻修改管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="">
<meta http-equiv="description" content="">
<script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/jquery_jar/jquery.js"></script>
<script language="javascript" type="text/javascript" src="/jquery_jar/jQuery.FillOptions.js"></script>
<script language="javascript" type="text/javascript" src="/jquery_jar/jQuery.CascadingSelect.js"></script>
<script src="/jquery_jar/formValidator/jquery_last.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="/jquery_jar/formValidator/style/validator.css"></link>
<script src="/jquery_jar/formValidator/formValidator.js" type="text/javascript" charset="UTF-8"></script>
<script src="/jquery_jar/formValidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script language="javascript" type="text/javascript">
//$(function(){
//		$("#Category0").FillOptions("/web/newsCategory!getCategoryByPcode?pcode=-1",{datatype:"json",textfield:"name_cn",valuefiled:"code"});
//		$("#Category0").AddOption("选择分类","-1",true,0);
		//当触发一级分类的select的时候，如果选择的是值为-1的“请选择”则频道不是子分类 0为首分类 1为子分类
//		$("#Category0").change(function(){if($(this).val()==-1){$("#leaf").val("0");}else{$("#leaf").val("1");}});
//});
 </script>
 <script type="text/javascript">
$(function(){
	$.formValidator.initConfig({formid:"form2",onerror:function(msg){alert(msg)},onsuccess:function(){alert('success');return true;}});
	$("#title").formValidator({onshow:"请输入文章标题 ",onfocus:"文章标题 不能超过120个字 ",oncorrect:"恭喜你输入正确"}).inputValidator({min:1,onerror:"文章标题长度非法,请确认",empty:{leftempty:false,rightempty:false,emptyerror:"文章标题 两边不能有空符号"}});
    $("#keyword").formValidator({onshow:"请输入关键字  ",onfocus:"多个关键字用空格隔开  ",oncorrect:"恭喜你输入正确"}).inputValidator({min:1,max:30,onerror:"关键字不能为空,请确认"});
    $("#type").formValidator({onshow:"请选择文章类型..."}).inputValidator({onerror: "您忘选文章类型 !"});

   $("#type").change(function(){
	   if( document.getElementById("Table0").style.display=="block"){
		    $("#upload").unFormValidator(true);
		    $("#content").unFormValidator(true);
		    $("#author").unFormValidator(true);
		    $("#editor").unFormValidator(true);
            $("#newsInfourl").formValidator({onshow:"请输入引用地址   ",onfocus:"引用地址必须以http：//开头   ",oncorrect:"恭喜你输入正确"}).inputValidator({min:1,max:30,onerror:"地址长度非法 ,请确认"}).regexValidator({regexp:"url",datatype:"enum",onerror:"引用地址格式非法"});         
			    }
	   if( document.getElementById("Table1").style.display=="block"){
		   $("#newsInfourl").unFormValidator(true);
    	   $("#upload").formValidator({onshow:"请选择要上传的图片   ",oncorrect:"恭喜你输入正确",empty:true}).inputValidator({onerror:"请上传图片"}).regexValidator({regexp:"picture",datatype:"enum",onerror:"图片名格式不正确"});
           $("#content").formValidator({onshow:"请输入正文内容   ",onfocus:"正文内容要大于150字   ",oncorrect:"恭喜你输入正确"}).inputValidator({onerror:"关键字不能为空,请确认"});
    	   $("#author").formValidator({}).inputValidator({empty:{leftempty:false,rightempty:false,emptyerror:"作者两边 两边不能有空符号"},min:1,onerror:"作者不能为空,请确认"});
    	   $("#editor").formValidator({}).inputValidator({empty:{leftempty:false,rightempty:false,emptyerror:"编辑者名称 两边不能有空符号"},min:1,onerror:"bianz者不能为空,请确认"});         
	     }  });
    
     if( $("#type").val()=="1"){
          $("#content").formValidator({onshow:"请输入正文内容   ",onfocus:"正文内容要大于150字   ",oncorrect:"恭喜你输入正确"}).inputValidator({onerror:"关键字不能为空,请确认"});
          $("#upload").formValidator({onshow:"请选择要上传的图片   ",oncorrect:"恭喜你输入正确",empty:true}).inputValidator({onerror:"请上传图片"}).regexValidator({regexp:"picture",datatype:"enum",onerror:"图片名格式不正确"});
      	  
         $("#author").formValidator({}).inputValidator({min:1,onerror:"作者不能为空 ,请确认",empty:{leftempty:false,rightempty:false,emptyerror:"作者两边 两边不能有空符号"}});
         $("#editor").formValidator({}).inputValidator({min:1,onerror:"编辑不能为空,请确认",empty:{leftempty:false,rightempty:false,emptyerror:"作者两边 两边不能有空符号"}});
	 
}
    if( $("#type").val()=="0"){
         $("#newsInfourl").formValidator({onshow:"请输入引用地址   ",onfocus:"引用地址必须以http：//开头   ",oncorrect:"恭喜你输入正确"}).inputValidator({}).regexValidator({regexp:"url",datatype:"enum",onerror:"引用地址格式非法"});
}

	 
    alert($("#upload").val());		   
  

	
});

 </script>  
</head>


<script>
function tableViwe()
{
	var typeSelect = document.getElementById("type");
	var id = typeSelect.options[typeSelect.options.selectedIndex].value;
	var Obj = document.getElementById("Table"+id).style.display='block';
	var noneObj = document.getElementById("Table"+((Number(id)+1)%2)).style.display='none';
}
</script>
<script type="text/javascript" src="<%=basePath%>fckeditor/fckeditor.js"></script>
<script type="text/javascript"> 
		window.onload = function() 
		{ 
			var oFCKeditor = new FCKeditor( 'content' ) ;
			oFCKeditor.BasePath	= "fckeditor/"; 
			oFCKeditor.ReplaceTextarea() ; 
		} 
</script>
<body>
<form action="<%=basePath%>/web/newsInfo!modifyNewsInfo" enctype="multipart/form-data" method="post" id="form2">
<input type="hidden" name="id" value="${newsInfo.id}">
<select name="newsInfo.channel_id" id="channel">
  <s:set name="channelId" value="#request.newsInfo.channel_id"></s:set>
  <s:iterator  value="#request.newsChannelList"  id="NewsChannel"> 
  <option value="<s:property value="id"/>"<s:if test="#channelId==#NewsChannel.id">selected</s:if>><s:property value="name_cn"/></option>
   </s:iterator>
</select>
<select name="n.templateId" id="template">
<s:set name="templateId" value="#request.news.templateId"></s:set>
	<option value="0"  <s:if test="#templateId==0">selected</s:if>>默认模板</option>
  <s:iterator  value="#request.newsTemplateList"  id="NewsTemplate">
  <option value="<s:property value="id"/>" <s:if test="#templateId==#NewsTemplate.id">selected</s:if>><s:property value="name"/></option>
   </s:iterator>
</select>
<span id="category_select"> <input type="hidden" id="leaf" name="newsCategoryMD.leaf" value="0" />
  <input type="text" name="newsInfoMD.category_name_cn" value="${newsInfoMD.category_name_cn}" readonly="true"/>
  <input type="hidden" name="newsInfoMD.category_code" value="${newsInfoMD.category_code}"/>
  </span>
<table width="900px" border="1">
  <tr>
    <td width="117" align="right"><p>文章标题：</p>    </td>
    <td width="353"><input type="text" size="50" readonly="false" value="一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十"/>
    <input name="newsInfo.title" type="text" size="50" value="${newsInfo.title}" id="title"/><div id="titleTip" style="width:250px"></div></td>       
    <td width="408">
    <select id="top_news" name="top_news">
    	<s:set name="top_news" value="#request.newsInfo.top_news"></s:set>
    	<option value="0" <s:if test="#top_news==0">selected</s:if>>非头条</option>
    	<option value="1" <s:if test="#top_news==1">selected</s:if>>头条</option>
    </select>
     <select id="type" name="type" onchange="tableViwe()">
    <s:set name="type" value="#request.newsInfo.type"></s:set>
    <option value="0" <s:if test="#type==0">selected</s:if>>引用</option> 
    <option value="1" <s:if test="#type==1">selected</s:if>>正文</option>
    </select>
      <select name="newsInfo.sequence" id="sequence">
      	<s:set name="sequence" value="#request.newsInfo.sequence"></s:set>
        <option value="0" <s:if test="#sequence==0">selected</s:if>>最低</option>
        <option value="1" <s:if test="#sequence==1">selected</s:if>>1</option>
        <option value="2" <s:if test="#sequence==2">selected</s:if>>2</option>
        <option value="3" <s:if test="#sequence==3">selected</s:if>>3</option>
        <option value="4" <s:if test="#sequence==4">selected</s:if>>4</option>
        <option value="5" <s:if test="#sequence==5">selected</s:if>>默认</option>
        <option value="6" <s:if test="#sequence==6">selected</s:if>>6</option>
        <option value="7" <s:if test="#sequence==7">selected</s:if>>7</option>
        <option value="8" <s:if test="#sequence==8">selected</s:if>>8</option>
        <option value="9" <s:if test="#sequence==9">selected</s:if>>9</option>
        <option value="10" <s:if test="#sequence==10">selected</s:if>>最高</option>
      </select></td>
  </tr>
  <tr>
    <td align="right">文章关键字：</td>
    <td><textarea name="newsInfo.keyword" cols="50" rows="4" id="keyword">${newsInfo.keyword}</textarea><div id="keywordTip" style="width:250px"></div></td>
    
    <td>关键字用于文章页面的网页关键字，也应用于文章与文章之间的相关联依据。多个关键字以空格隔开。</td>
  </tr>
  <tr>
    <td colspan="3"><table id="Table1" width="898px" border="1" <s:if test="#request.newsInfo.type==0"> style="display:none" </s:if> >
      <tr>
        <td width="85" align="right">作者：</td>
        <td width="374"><input name="newsInfo.author" type="text" size="10" value="${newsInfo.author}" id="author" />　
          　编辑：
          
          <input name="newsInfo.compile" type="text" size="10" value="${newsInfo.compile}" id="editor"/></td>
        <td width="416">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">上传图片：</td>
        <td>
          <input name="upload" type="file" size="40" src="" value="" id="upload"/> </td>
        <td>${newsInfo.pic_name}<img src="<%=basePath%>../${newsInfo.pic_name}" /></td>
      </tr>
      <tr>
        <td align="right">文章内容：</td>
        <td colspan="2" align="left"><textarea id="content" name="newsInfo.content" cols="100" rows="10">${newsInfo.content}</textarea><div id="contentTip" style="width:250px"></div></td>
        </tr>
    </table>
      <table id="Table0" width="898px" border="1" <s:if test="#request.newsInfo.type==1"> style="display:none" </s:if>>

        <tr>
          <td width="85">引用地址：</td>
          <td width="374"><input name="newsInfo.url" type="text" size="50" value="${newsInfo.url}" id="newsInfourl"/><div id="newsInfourlTip" style="width:250px"></div></td>
          <td width="416">（http://xxx.xxx.xxx）</td>
        </tr>
      </table></td>
  </tr>
</table>
<table  width="898px" border="0" cellspacing="0">
        <tr>
          <td width="52">&nbsp;</td>
          <td width="393" align="right"><input name="button2" type="submit" value="保存新闻-等待审批"/></td>
          <td width="431"><input name="button22" type="button" value="取消返回" onclick="javaScript:window.history .go(-1)"/></td>
        </tr>
</table>
</form>
</body>
</html>