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
<script type="text/javascript" charset="utf-8" src="<%=basePath%>kindeditor/kindeditor.js"></script>
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
	$.formValidator.initConfig({formid:"form2",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
	$("#title").formValidator({onshow:"请输入文章标题 ",onfocus:"文章标题 不能超过120个字符 ",oncorrect:"恭喜你输入正确"}).inputValidator({min:1,max:120,onerror:"文章标题长度非法,请确认",empty:{leftempty:false,rightempty:false,emptyerror:"文章标题 两边不能有空符号"}});
    $("#keyword").formValidator({onshow:"请输入关键字  ",onfocus:"多个关键字用空格隔开  ",oncorrect:"恭喜你输入正确"}).inputValidator({min:1,max:200,onerror:"关键字不能为空并且不能超过,请确认"});
	$("#numero").formValidator({onshow:"请输入开奖期号 ",onfocus:"开奖期号不能超过16个字节 ",oncorrect:"输入正确"}).inputValidator({max:16,onerror:"开奖期号长度非法,请确认",empty:{leftempty:false,rightempty:false,emptyerror:"开奖期号 两边不能有空符号"}}).regexValidator({regexp:"^[0-9]{0}[0-9_]{0,16}$",onerror:"您的操作非法,可能有汉字，字母，空格等"});
	$("#type").formValidator({onshow:"请选择文章类型..."}).inputValidator({onerror: "您忘选文章类型 !"});
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
    
     if( $("#type").val()=="1"){
          $("#content").formValidator({onshow:"请输入正文内容   ",oncorrect:"恭喜你输入正确"}).inputValidator({onerror:"关键字不能为空,请确认"});
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

<script type="text/javascript">
KE.show({
	id : 'content',
	imageUploadJson : '<%=basePath%>kindeditor/jsp/upload_json.jsp',
	fileManagerJson : '<%=basePath%>kindeditor/jsp/file_manager_json.jsp',
	allowFileManager : true
});
</script>
<body>
<form action="<%=basePath%>/web/news!modify" enctype="multipart/form-data" method="post" id="form2">
<input type="hidden" name="id" value="${news.id}">
<select name="n.channelId" id="channel">
  <s:set name="channelId" value="#request.news.channelId"></s:set>
  <s:iterator  value="#request.newsChannelList"  id="NewsChannel">
  <option value="0"<s:if test="#channelId==0">selected</s:if>>选择频道</option> 
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
<span id="category_select"> 
  <input type="text" name="nmd.categoryNameCn" value="${newsInfoMD.categoryNameCn}" readonly="readonly"/>
  <input type="hidden" name="n.categoryCode" value="${newsInfoMD.categoryCode}"/>
  </span>
<table width="950px" border="1">
  <tr>
    <td width="117" align="right"><p>文章标题：</p>    </td>
    <td width="353"><input type="text" size="50" readonly="readonly" value="一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十"/>
    <input name="n.title" type="text" size="50" value="${news.title}" id="title"/><div id="titleTip" style="width:250px"></div></td>       
    <td width="420">
    <select id="top_news" name="n.topNews">
    	<s:set name="top_news" value="#request.news.topNews"></s:set>
    	<option value="0" <s:if test="#top_news==0">selected</s:if>>非头条</option>
    	<option value="1" <s:if test="#top_news==1">selected</s:if>>头条</option>
    </select>
     <select id="type" name="n.type" onchange="tableViwe()">
    <s:set name="type" value="#request.news.type"></s:set>
    <option value="0" <s:if test="#type==0">selected</s:if>>引用</option> 
    <option value="1" <s:if test="#type==1">selected</s:if>>正文</option>
    </select>
      <select name="n.sequence" id="sequence">
      	<s:set name="sequence" value="#request.news.sequence"></s:set>
        <option value="0" <s:if test="#sequence==0">selected</s:if>>默认</option>
        <option value="1" <s:if test="#sequence==1">selected</s:if>>1</option>
        <option value="2" <s:if test="#sequence==2">selected</s:if>>2</option>
        <option value="3" <s:if test="#sequence==3">selected</s:if>>3</option>
        <option value="4" <s:if test="#sequence==4">selected</s:if>>4</option>
        <option value="5" <s:if test="#sequence==5">selected</s:if>>5</option>
        <option value="6" <s:if test="#sequence==6">selected</s:if>>6</option>
        <option value="7" <s:if test="#sequence==7">selected</s:if>>7</option>
        <option value="8" <s:if test="#sequence==8">selected</s:if>>8</option>
        <option value="9" <s:if test="#sequence==9">selected</s:if>>9</option>
        <option value="10" <s:if test="#sequence==10">selected</s:if>>10</option>
        <option value="11" <s:if test="#sequence==11">selected</s:if>>11</option>
        <option value="12" <s:if test="#sequence==12">selected</s:if>>12</option>
        <option value="13" <s:if test="#sequence==13">selected</s:if>>13</option>
        <option value="14" <s:if test="#sequence==14">selected</s:if>>14</option>
        <option value="15" <s:if test="#sequence==15">selected</s:if>>15</option>
        <option value="16" <s:if test="#sequence==16">selected</s:if>>16</option>
        <option value="17" <s:if test="#sequence==17">selected</s:if>>17</option>
        <option value="18" <s:if test="#sequence==18">selected</s:if>>18</option>
        <option value="19" <s:if test="#sequence==19">selected</s:if>>19</option>
        <option value="20" <s:if test="#sequence==20">selected</s:if>>最高</option>
      </select>
     <select id="color" name="n.title_color" >
    <s:set name="title_color" value="#request.news.title_color"></s:set>
    <option value=" " <s:if test="#title_color==' '">selected</s:if>>标题颜色(默认黑色)</option> 
    <option value="#DE0201" <s:if test="#title_color=='#DE0201'">selected</s:if>>红色</option>
    <option value="#1F376D" <s:if test="#title_color=='#1F376D'">selected</s:if>>蓝色</option>
    </select>
      
      </td>
  </tr>
  <tr>
    <td width="100" align="right"><p>开奖期号：</p>    </td>
    <td width="450">
	    <input name="n.numero" type="text" size="20" id="numero" value="${news.numero}" />
	</td>
	<td><div id="numeroTip" style="width:250px"></div>用于专家推荐和走势图表使用</td>
  </tr>
  <tr>
    <td width="100" align="right"><p>新闻别名：</p>    </td>
    <td width="450">
	    <input name="n.title_as" type="text" size="20" id="title_as" value="${news.title_as}"/>
	</td>
	<td><div id="title_asTip" style="width:250px"></div>用于专家推荐和走势图表使用</td>
  </tr>
  <tr>
    <td align="right">文章关键字：</td>
    <td><textarea name="n.keyword" cols="50" rows="4" id="keyword">${news.keyword}</textarea></td>
    
    <td><div id="keywordTip" style="width:250px"></div>关键字用于文章页面的网页关键字，也应用于文章与文章之间的相关联依据。多个关键字以空格隔开。</td>
  </tr>
  <tr>
    <td colspan="3"><table id="Table1" width="898px" border="1" <s:if test="#request.news.type==0"> style="display:none" </s:if> >
      <tr>
        <td width="85" align="right">作者：</td>
        <td width="374"><input name="n.author" type="text" size="10" value="${news.author}" id="author" />　
          　编辑：
          
          <input name="n.compile" type="text" size="10" value="${news.compile}" id="editor"/></td>
        <td width="416">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">上传图片：</td>
        <td>
          <input name="upload" type="file" size="40" src="" value="" id="upload"/> </td>
        <td>${news.picName}<img src="<%=basePath%>../${news.picName}" /></td>
      </tr>
      <tr>
        <td align="right">文章内容：</td>
        <td colspan="2" align="left"><textarea id="content" name="n.content" cols="100" rows="10">${news.content}</textarea><div id="contentTip" style="width:250px"></div></td>
        </tr>
    </table>
      <table id="Table0" width="898px" border="1" <s:if test="#request.news.type==1"> style="display:none" </s:if>>

        <tr>
          <td width="85">引用地址：</td>
          <td width="374"><input name="n.url" type="text" size="50" value="${news.url}" id="newsInfourl"/></td>
          <td width="416"><div id="newsInfourlTip" style="width:250px"></div>（http://xxx.xxx.xxx）</td>
        </tr>
      </table></td>
  </tr>
</table>
<table  width="898px" border="0" cellspacing="0">
        <tr>
          <td width="52">&nbsp;</td>
          <td width="393" align="right"><input name="button2" type="submit" value="保存新闻-等待审批"/>
          </td>
          <td width="431"><input name="button22" type="button" onclick="javaScript:window.location.href='<%=basePath%>/web/newsSearch!getSearchList?page=${page }'" value="取消返回" /></td>
        </tr>
</table>
</form>
</body>
</html>