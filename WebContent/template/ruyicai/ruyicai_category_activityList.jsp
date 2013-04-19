<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="tangs" uri="/WEB-INF/tangs.tld"%>  
 <%@taglib prefix="s" uri="/struts-tags"%>
 <%@ taglib prefix="page" uri="/WEB-INF/pageTang.tld"%> 
<!--#include virtual="/include/top_http.html"-->
<title>历史活动回顾</title> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta http-equiv="keywords" content="节日专题活动，双色球专题活动，大乐透专题活动，七乐彩专题活动 3D专题活动，七星彩专题活动，足彩专题活动，竞彩专题活动">
<meta http-equiv="description" content="如意彩喜迎2012年推出节日专题活动，双色球专题活动，大乐透专题活动，七乐彩专题活动 3D专题活动，七星彩专题活动，足彩专题活动，竞彩专题活动等优惠活动让您购彩更快乐！">
<link href="/css/util.css" rel="stylesheet" type="text/css">
<link href="/css/newsAll.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jqueryJS/jquery-1.5.min.js"></script>
<script type="text/javascript" src="/js/kuaiTouZhou.js"></script>
</head>
<body>
<!--#include virtual="/include/top.html"-->
<!--中间-->
<div id="main">
<!--左边-->
	<div class="ChannelBuyPannel specialActivities_left">
		<div class="ChannelBuyPannelHead"><h3>活动专题</h3></div>
		<div class="ChannelBuyPannelBody">
		<tangs:ryc_newslist categoryCn="活动专题"  web_id="%{#parameters.website_Properties_id[0]}" value="21">
			<tangs:ryc_newslist   value="6"  num="%{#parameters.begin[0]}" begin="0" end="5" web_id="%{#parameters.website_Properties_id[0]}"  categoryId="#attr['code']" channelId="%{#parameters.channelId[0]}">
				    ${content}
		     </tangs:ryc_newslist>
	     </tangs:ryc_newslist>
			<div class="specialActivities_page">
				 <page:pages cpage="%{#parameters.cpage[0]}" total="%{#parameters.total[0]}" url="%{#parameters.url[0]}"  />
			</div>
		
		</div>
	</div>
<!--左边end-->

<!--右边-->
<div class="specialActivities_right">
	<div class="ChannelBuyPannel ">
			<div class="ChannelBuyPannelHead"><h3>活动公告</h3></div>
			<div class="ChannelBuyPannelBody">
				<ul class="specialActivities_tuiJian">
					<tangs:ryc_newslist value="3"  num="7" categoryCn="活动公告" channelId="%{#parameters.channelId[0]}" web_id="%{#parameters.website_Properties_id[0]}">
		     			<li><a href="${url}" title="${title}" target="_blank" tyle="color:${title_color}">${title}</a></li>
				     </tangs:ryc_newslist>
				</ul>
			</div>
	</div>
		<div class="space10">&#160;</div>
		<div class="share_img"><a href="/rules/customMessage.html"><img src="/images/share_pic.gif" width="270" height="120" /></a></div>
		<div class="space10">&#160;</div>
		<div class="specialActivities_news">
		<iframe width="268" height="504" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?language=&width=268&height=504&fansRow=2&ptype=1&speed=0&skin=2&isTitle=1&noborder=0&isWeibo=1&isFans=0&uid=1734676075&verifier=eb816cbb&dpc=1"></iframe>
		</div>
		
</div>
<!--右边end-->
<!--中间end-->
</div>
<div class="space10"></div>
  <!--#include virtual="/include/footer_noindex.html" -->
<!--#include virtual="/rules/setBody.html"-->