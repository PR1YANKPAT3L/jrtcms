<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="/WEB-INF/tangs.tld" prefix="tangs"%>
<!--#include virtual="/include/top_http.html"-->
<title><%=new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8") %>网上买彩票-如意彩网</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/>    
<meta http-equiv="keywords" content="如意彩、彩票投注管理、账户管理、彩票赠送管理"/>
<meta http-equiv="description" content="彩票投注管理、账户管理、彩票赠送管理"/>
<link href="/css/util.css" rel="stylesheet" type="text/css"/>
<link href="/css/newsAll.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/js/jqueryJS/jquery-1.5.min.js"></script> 
<script type="text/javascript" src="/js/kuaiTouZhou.js" ></script> 
</head>
<body>
   <div id="body">
 <!--#include virtual="/include/top.html"-->
   <div id="main">
   	<div id="zhanghu"> 

  		<!--#include virtual="/include/bangzhuzhongxin_right.html" -->	
	<div class="userright">
		<div class="zh_rightbg">
	<!--<div class="zh_rt">代购</div>-->
	<div class="user_content" >
	<tangs:ryc_newslist value="7" newsId="%{#parameters.newsId[0]}"  begin="0" end="1"> 
	<div class="bz_rt_top">${title }</div>
        <div class="bz_rt_mian">
        ${content}
        </div>
	<script type="text/javascript">
    update_clickCount(${id});
   </script>
	</tangs:ryc_newslist>
		
    </div>
</div>
	</div>
	</div>
	</div>
<!--#include virtual="/include/footer_noindex.html" -->
</div>

<!--#include virtual="/rules/setBody.html"-->