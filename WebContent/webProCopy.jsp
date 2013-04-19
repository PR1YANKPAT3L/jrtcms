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
function allAction(){
	    loading();
		$.ajax({   
	        url:'/web/webProCopy!copyAllWebsite?copyWebstite_Id='+$("#web_pro_id").val(),   
	        type:'post', //数据发送方式   
	        dataType:'html', //接受数据格式   
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        error:function(html){alert("拷贝失败");},  
	        async: false ,  
	        success: function(html){
	        	loadend();
	        	alert(html);
		        } 
		});
	}
function onlyAction(){
	    loading();
		$.ajax({   
	        url:'/web/webProCopy!copyWebsite?copyWebstite_Id='+$("#web_pro_id").val(),   
	        type:'post', //数据发送方式   
	        dataType:'html', //接受数据格式   
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        error:function(html){alert("拷贝失败");},  
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
<br/><br/>
<div>
1.只拷贝结构 就是 只拷贝所选的站点的频道和分类<br/>
2.拷贝结构和数据 就是把所选的站点的频道和分类以及新闻全部拷贝<br/>
</div>
<br/><br/><br/>
<div>
  <select id="web_pro_id" name="web_pro_id" style="width:200px">
	<% request.setAttribute("web_pros",com.jrtcms.listener.propertys.InitWebsitePropertys.getWpsListMap());
	%>
	<s:iterator id="wp" value="#request.web_pros" >
		<option value="${wp.key}">${wp.value.name_cn}</option>
	</s:iterator>
  </select>
  
<input type="button" value="只拷贝结构" onclick="onlyAction();"/>
<input type="button" value="拷贝结构和数据" onclick="allAction();"/>
</div>

<br/><br/><br/>
<div id="container" style="display:none">
  正在拷贝 ，拷贝需要一些时间，请耐心等候。。<img src="/images/aloading.gif" alt="" />
</div>
<script type="text/javascript"> 
function loading(){
	$('#container').show();
}
</script>
<script type="text/javascript"> 
function loadend(){
	$('#container').hide();
}
</script>
</body>
</html>
