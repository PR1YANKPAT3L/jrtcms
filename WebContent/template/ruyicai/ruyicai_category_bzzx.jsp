<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="/WEB-INF/tangs.tld" prefix="tangs" %>
<!--#include virtual="/include/top_http.html"-->
<title >如意彩帮助中心</title>
<meta name="keywords" content="帮助中心，常见问题">
<meta name="description" content="如意彩帮助中心让您从购彩新手变成彩票专家。">
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/>    
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
		<div class="rumen">
			<div class="rumen_zi"><img src="/images/xinshou.gif" width="73" height="18" /></div>
			<div class="rumen_con"><img src="/images/liucheng.gif" width="694" height="33" border="0" usemap="#Map" />
			<map name="Map" id="Map">
			<area shape="rect" coords="0,1,83,32"    href="/bangzhuzhongxin/xinshourumen//zhuce//20110615111900_541.html?id=541&code1=148&code=127            " />
			<area shape="rect" coords="123,1,204,35" href="/bangzhuzhongxin/chongzhibangzhu//chongzhicaozuo//20110614173703_512.html?id=512&code1=133&code=124" />
			<area shape="rect" coords="245,1,327,33" href="/bangzhuzhongxin/xinshourumen//goucai//20110615113157_545.html?id=545&code1=149&code=127           " />
			<area shape="rect" coords="365,1,447,33" href="/bangzhuzhongxin/xinshourumen//chaxun//20110615113245_546.html?id=546&code1=150&code=127           " />
			<area shape="rect" coords="489,1,571,33" href="/bangzhuzhongxin/xinshourumen//chaxun//20110615113324_547.html?id=547&code1=150&code=127           " />
			<area shape="rect" coords="612,0,694,32" href="/bangzhuzhongxin/zhongjiangtixian//tixiancaozuo//20110615114557_558.html?id=558&code1=132&code=123 " /></map>
		  </div>

		</div>
		<div class="bzh_rightbg">
		<div class="zh_rt">常见问题</div>
		<div class="problem">
		<tangs:ryc_newslist categoryCn="常见问题" web_id="2" value="3" status="s1" num="16">
		<s:if test="#s1.odd">
		<ul class="problem_left">
			<li><a href="${url}" title="${title }" >${title }</a></li>
			</ul>
		</s:if><s:else>
		<ul class="problem_right">
			<li><a href="${url}" title="${title }" >${title }</a></li>
			
		</ul>
		
		</s:else>
			
	
	</tangs:ryc_newslist>
	</div>
</div>
		<div class="bzh_rightbg">
		<div class="zh_rt">购彩帮助</div>
		<div class="help_content">
 <tangs:ryc_newslist categoryCn="购彩帮助" web_id="2" value="4"  status="s">
	<s:if test="#s.odd">
		<div class="help_left">
			<span class="help_title">${name_cn}</span>
			<span class="help_con">
				<tangs:ryc_newslist categoryExpress="#attr['name_cn']" web_id="2" value="5" status="s1">
					<s:if test="#s1.last"><a href="${url}?id=${id }&code1=${categoryCode}&code=${pcode}" title="${title }" >${title_as}</a></s:if>
					<s:else><a href="${url}?id=${id }&code1=${categoryCode}&code=${pcode}" title="${title }" >${title_as}</a>　|　</s:else>
				</tangs:ryc_newslist>
			</span>
		</div>
	</s:if>
	<s:else>
		<div class="help_right">
			<span class="help_title">${name_cn}</span>
			<span class="help_con">
				<tangs:ryc_newslist categoryExpress="#attr['name_cn']" web_id="2" value="5" status="s2">
					
					<s:if test="#s2.last"><a href="${url}?id=${id }&code1=${categoryCode}&code=${pcode}" title="${title }" >${title_as}</a></s:if>
					<s:else><a href="${url}?id=${id }&code1=${categoryCode}&code=${pcode}" title="${title }" >${title_as}</a>　|</s:else>　
				</tangs:ryc_newslist>
			</span>
		</div>
	</s:else>
</tangs:ryc_newslist>
		</div>
</div>
	</div></div>
	</div>
    <!--#include virtual="/include/footer_noindex.html" -->
</div>
<!--#include virtual="/rules/setBody.html"-->