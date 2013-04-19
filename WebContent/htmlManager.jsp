<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page language="java"  pageEncoding="utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.util.UUID" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>生成静态页管理</title>
<style type="text/css">
<!--
body, td, th {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
}
.container {
	width:400px;
	height:30px;
	border:solid 1px #CCC;
	margin:100px auto 0 auto;
	padding:1px;
	line-height:30px;
	*line-height:32px;
	position:relative;
	color:#000000;
}
#content {
	width:1px;
	height:30px;
	background-color: #FF8604;
}
span {
	position:absolute;
	width:400px;
	text-align:center;
}
-->

</style>
<script language="javascript" type="text/javascript" src="/jquery_jar/jquery.js"></script>
<script language="javascript" type="text/javascript" src="/jquery_jar/jquery.min.js"></script>

<script  language="javascript" type="text/javascript">
function formAction(){
	    loading();
		$.ajax({   
	        url:$("#html_id").val(),   
	        type:'post', //数据发送方式   
	        dataType:'html', //接受数据格式   
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        error:function(html){alert("生成失败");},  
	        async: false ,  
	        success: function(html){
	        	loadend();
	        	alert(html);
		        } 
		});
	}
</script>

</head>
<body>
<div>
1.整站生成 会生成 首页、所有公共页、所有频道页、所有分类页、以及分类和频道关联页<br/>
2.生成首页 就是把首页和所有公共页生成<br/>
3.生成所有频道页 就是把所有频道页生成，以及频道页右侧的页面生成<br/>
4.生成所有分类页 就是把帮助中心分类 以及各种一级分类和频道关联的页生成如：双色球频道的专家推荐页面<br/><br/><br/><br/>
</div>
<div>
<select id="html_id" name="html_id" style="width:200px">
		<option value="/web/tools!jspToHtmlByIndex"  >首页</option>
		<option value="/web/tools!jspToHtmlByChannelOnlineAll"  >所有频道</option>
		<option value="/web/tools!jspToHtmlByCategoryOnlineAll"  >所有分类</option>
		<option value="/web/tools!jspToHtmlAllNews"  >所有新闻</option>
		<option value="/web/tools!jspToHtmlAllWebstie"  >整站</option>
		<option value="/web/tools!jspToHtmlAllTime"  >今日开奖</option>
		<option value="/web/tools!clearTime"  >清开奖缓存</option>
  </select> 
&nbsp;&nbsp;&nbsp;
<a href="#" onclick="formAction()">生&nbsp;&nbsp;成</a>
</div>

<br/><br/><br/>
<div id="container" style="display:none">
  正在生成 ，生成需要一些时间，请耐心等候。。<img src="/images/aloading.gif" alt="" />
</div>
<script type="text/javascript"> 
function loading(){
	document.getElementById('container').style.display='block';
}
</script>
<script type="text/javascript"> 
function loadend(){
	document.getElementById('container').style.display='none';
}
</script>
</body>
</html>
