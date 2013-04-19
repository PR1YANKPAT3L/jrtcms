<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>如意彩-投注</title>
<link href="/template/ruyicai/css/css.css" rel="stylesheet" type="text/css" />
<link href="/template/ruyicai/css/home.css" rel="stylesheet" type="text/css" />
<link href="/template/ruyicai/css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jqueryJS/jquery-1.5.min.js"></script>
</head>
<body>
<jsp:include page="/extendsJsp/newsObject.jsp" flush="true" >
<jsp:param value="2" name="websiteId"/>
</jsp:include>
<jsp:include page="/extendsJsp/categoryList.jsp" flush="true">
	<jsp:param value="2" name="websiteId" />
	<jsp:param value="bangzhuzhongxin" name="categoryNameZh"/>
</jsp:include>
<jsp:include page="/extendsJsp/categoryMap.jsp" flush="true">
	<jsp:param value="0" name="channelId"/>
	<jsp:param value="2" name="websiteId"/>
	<jsp:param value="500" name="maxNum"/>
	<jsp:param value="bangzhuzhongxin" name="categoryNameZh"/>
</jsp:include>
<div id="body">
<!--#include virtual="/rules/top_index.html"-->
  <div class="end">
 	 <s:iterator id="nl" value="#request.newsList" begin="0" step="1" end="0">
		${nl.picName}<img src="${nl.picName}" alt="图片" />
	  </s:iterator>
	 	<input type="text" name="text" id=""/>
	 	<s:iterator id="cl" value="#request.categoryList" begin="0" step="1" end="0">
		<div id="account_issue">		
			<div class="account_head">			
				<div class="account_head_zi">${cl.name_cn}</div>
			</div>
			<div class="account_con">
			 <ul>
				<s:set name="namezh" value="#request.name_zh"></s:set>
				<s:iterator id="categorymap" value="#request.categorymap[#namezh]" >
     	      		 <li><a target="_blank" href="${categorymap.url}"><s:property value="#categorymap.title" escape="false" default="" /></a></li>   
      		    </s:iterator>
      	 	 </ul>
			</div>			
		</div>
		</s:iterator>
  </div>
</div>
</body>
</html>
