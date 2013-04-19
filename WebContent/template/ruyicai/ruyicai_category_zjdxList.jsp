<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="tangs" uri="/WEB-INF/tangs.tld"%>  
 <%@ taglib prefix="page" uri="/WEB-INF/pageTang.tld"%> 
<!--#include virtual="/include/top_http.html"-->
<title>如意彩专家战绩</title>
<meta name="keywords" content="专家战绩，战绩新闻" />
<meta name="description" content="如意彩专家战绩展示专家们的以往战绩让您提供购彩更有信心" />
<link type="text/css" href="/css/util.css" rel="stylesheet"/>
<link type="text/css" href="/css/newsAll.css" rel="stylesheet"/>
<script type="text/javascript" src="/js/jqueryJS/jquery-1.5.min.js"></script> 
<script type="text/javascript" src="/js/util.js"></script>
</head>

<body>
   <div id="body">
    <!--#include virtual="/include/top_zjdx.html"-->
   <div id="main">
   <div class="zixun_main">
   <div class="zixuntop">您所在的位置：<a href="/index.html">如意彩</a> > <a href="/zhuanjiaduanxin.html">专家短信</a> > <tangs:ryc_newslist value="9" begin="0" end="1" categoryId="%{#parameters.categoryId[0]}">${name_cn}</tangs:ryc_newslist></div>
   
   	<div class="zixunleft">
		 
		  <div class="zixunlist">
			  <div class="zixunlist1">
	            <ul>
	            <tangs:ryc_newslist value="6" num="%{#parameters.begin[0]}" begin="0" end="20" web_id="%{#parameters.website_Properties_id[0]}" categoryId="%{#parameters.categoryId[0]}">
	             
	              <li><span class="zixun_nr"> <a href="${url}" title="${title}" target="_blank" >[${title_as}] ${title}</a></span><span class="zixun_time">${createtimeFm}</span></li>
	               
	             </tangs:ryc_newslist> 
	            </ul>
			    <div id="fenye"> 
			    <page:pages cpage="%{#parameters.cpage[0]}" total="%{#parameters.total[0]}" url="%{#parameters.url[0]}"  />
			    </div>
		      </div>
	      </div>
	      
		</div>
      
   <div class="zixunright">
	<div class="jinri_kj">
				<div class="jinri_top"><span class="inhelp_zi">热点资讯</span><a href="/redianxinwen/redianxinwen__1.html" title="更多" target="_blank"><span class="inhelp_more">更多>></span></a></div>
				<div class="webgg_con">
				<ul>
					<tangs:ryc_newslist value="3" begin="0" end="6" categoryCn="热点新闻"  web_id="%{#parameters.website_Properties_id[0]}">
				     <li><a href="${url}" title="${title}"  target="_blank">${title}</a></li>
				     </tangs:ryc_newslist>
				</ul>
			</div>
			</div>
			<div class="jinri_kj">
				<div class="jinri_top"><span class="inhelp_zi">双色球专家推荐</span><a href="/fucaituijian/fucaituijian_shuangseqiu_1.html" title="更多"><span class="inhelp_more">更多>></span></a></div>
				<div class="webgg_con">
				<ul>
					<tangs:ryc_newslist value="3" begin="0" end="6" categoryCn="福彩推荐" channelCn="双色球" web_id="%{#parameters.website_Properties_id[0]}">
				     <li><a href="${url}" title="${title}"  target="_blank">${title}</a></li>
				     </tangs:ryc_newslist>
				</ul>
			</div>
			</div>
			<div class="jinri_kj">
				<div class="jinri_top"><span class="inhelp_zi">3D专家推荐</span><a href="/fucaituijian/fucaituijian_fucai3D_1.html" title="更多"><span class="inhelp_more">更多>></span></a></div>
				<div class="webgg_con">
				<ul>
					<tangs:ryc_newslist value="3" begin="0" end="6" categoryCn="福彩推荐" channelCn="福彩3D" web_id="%{#parameters.website_Properties_id[0]}">
				     <li><a href="${url}" title="${title}"  target="_blank">${title}</a></li>
				     </tangs:ryc_newslist>
				</ul>
			</div>
			</div>
			<div class="zixun_gg"><img src="/images/zixun_gg.gif" width="270"  /></div>
	</div></div>
	</div>
 
   <!--#include virtual="/include/footer_noindex.html" -->
</div>
<!--#include virtual="/rules/setBody.html"-->
