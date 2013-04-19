<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="/WEB-INF/tangs.tld" prefix="tangs" %>
<!--#include virtual="/include/top_http.html"-->
<title>代购-玩法介绍-账户安全-注册-提现-网上买彩票-如意彩网</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/>    
<meta http-equiv="keywords" content="如意彩、彩票投注管理、账户管理、彩票赠送管理"/>
<meta http-equiv="description" content="彩票投注管理、账户管理、彩票赠送管理"/>

<link href="/css/util.css" rel="stylesheet" type="text/css"/>
<link href="/css/newsAll.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/js/jqueryJS/jquery-1.5.min.js"></script> 
<script type="text/javascript" src="/js/util.js"></script>
</head>
<body>
   <div id="body">
   <!--#include virtual="/include/top.html"-->
   <div id="main">
   	<div id="zhanghu">
  	<!--#include virtual="/include/bangzhuzhongxin_right.html" -->	
	<div class="userright">
	
	<tangs:ryc_newslist value="4" web_id="%{#parameters.website_Properties_id[0]}" categoryCn="帮助中心">
	<tangs:ryc_newslist categoryExpress="#attr['name_cn']" value="8" web_id="%{#parameters.website_Properties_id[0]}">
	<div class="zh_rightbg" id="zh_${code }" style="display:none">
	<div class="zh_rt">${name_cn}</div>
	<div class="user_content">
    	<div class="bz_daigou"> 
    	<ul>
    	<tangs:ryc_newslist categoryExpress="#attr['name_cn']" value="5" web_id="%{#parameters.website_Properties_id[0]}">
    	<li><a href="${url }?id=${id }&code1=${categoryCode}&code=${pcode}" title="${title}" >${title}</a></li>
    	
    	</tangs:ryc_newslist>
          
       </ul>
       </div>
	</div>
	
	</div>
	</tangs:ryc_newslist>
	</tangs:ryc_newslist>
	

	</div></div>
	</div>
  <!--#include virtual="/include/footer_noindex.html" -->
<!--#include virtual="/rules/setBody.html"-->