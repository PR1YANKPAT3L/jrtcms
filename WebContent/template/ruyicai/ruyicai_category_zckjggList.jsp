<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="tangs" uri="/WEB-INF/tangs.tld"%>  
 <%@ taglib prefix="page" uri="/WEB-INF/pageTang.tld"%> 
 <%@ taglib prefix="s" uri="/struts-tags" %>
<!--#include virtual="/include/top_http.html"-->
<title><%=new String(request.getParameter("categoryCN").getBytes("ISO-8859-1"),"UTF-8") %>网上买彩票-如意彩网</title>
<link type="text/css" href="/css/util.css" rel="stylesheet"/>
<link href="/css/newsAll.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/js/jqueryJS/jquery-1.5.min.js"></script> 
<script type="text/javascript" src="/js/util.js"></script>
<%if(request.getParameter("channelId").equals("0")){request.setAttribute("channelCheck","0");}else{request.setAttribute("channelCheck","1");};%>
<% String str=request.getParameter("categoryId");
	request.setAttribute("catId",str);
%>
</head>

<body>
   <div id="body">
    <!--#include virtual="/include/top_zixun.html"-->
   <div id="main">
   <div class="zixun_main">
   <div class="zixuntop">您所在的位置：<a href="/index.html">如意彩</a> &gt; <a href="/xinwenzixun.html">热点资讯</a>  &gt; 
    <tangs:ryc_newslist categoryId="%{#parameters.categoryId[0]}" value="9" >
    ${name_cn}
    </tangs:ryc_newslist></div>
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
	<!--  test  start  -->
		<div class="Pannel NewAndTodayWin">
			<div class="PannelHead">
				<h3>今日开奖</h3>
			</div>
			<div class="PannelBody">
				<div class="TodayWin">
					<!--#include virtual="/include/jinrikaijiang.html"-->
				</div>
			</div>
		</div>
		<!--  test  end  -->
			<div class="jinri_kj">
				<div class="jinri_top1"><span class="jinri_zi">其他资讯</span></div>
				<div class="webgg_con">
				<ul><s:if test="#request.channelCheck!=0">
				     <tangs:ryc_newslist value="15" begin="0" end="6" categoryId="%{#parameters.categoryId[0]}"  web_id="%{#parameters.website_Properties_id[0]}"  channelId="%{#parameters.channelId[0]}" num="6" pcodeId="%{#parameters.pcode[0]}">
				    <li> <a href="${url}" title="${title}"  target="_blank">[${title_as}]${title}</a></li>
				     </tangs:ryc_newslist>
				     </s:if>
				     <s:else>
				      <tangs:ryc_newslist value="16" begin="0" end="6"  channelCn="双色球" web_id="%{#parameters.website_Properties_id[0]}" num="6"  categoryCn="福彩资讯" >
				    <li> <a href="${url}" title="${title}"  target="_blank">[${title_as}]${title}</a></li>
				     </tangs:ryc_newslist>
				     </s:else>
				</ul>
			</div>
			</div>
			<div class="zixun_ziliao">
			<div class="zixun_zoushitop">
			<span class="zixun_zoushuzi">足球资料库</span><span class="zixun_zoushugd"><a href="" title="更多">更多&gt;&gt;</a></span>
			</div>
			<div class="zixun_ziliaoku">
				<ul>
					<li><a href="" title=""><img src="/images/yingchao.gif" /></a></li>
					<li><a href="" title=""><img src="/images/yijia.gif" /></a></li>
					<li><a href="" title=""><img src="/images/xijia.gif" /></a></li>
					<li><a href="" title=""><img src="/images/dejia.gif" /></a></li>
					<li><a href="" title=""><img src="/images/fajia.gif" /></a></li>
					<li><a href="" title=""><img src="/images/shijiebei.gif" /></a></li>
				</ul>
			</div>
		</div>
	</div></div>
	</div>
 
   <!--#include virtual="/include/footer_noindex.html" -->
</div>
<!--#include virtual="/rules/setBody.html"-->
