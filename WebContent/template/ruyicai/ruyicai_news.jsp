<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="tangs" uri="/WEB-INF/tangs.tld"%> 
<%@taglib prefix="s" uri="/struts-tags" %>
<!--#include virtual="/include/top_http.html"-->
<title><%=new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8") %>网上买彩票-如意彩网</title>
<link href="/css/util.css" rel="stylesheet" type="text/css" />
<link href="/css/newsAll.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/css/ChannelBuy.css" />
<script type="text/javascript" src="/js/jqueryJS/jquery-1.5.min.js"></script> 
<script type="text/javascript" src="/js/kuaiTouZhou.js" ></script>
<%if(request.getParameter("channelId").equals("0")){request.setAttribute("channelCheck","0");}else{request.setAttribute("channelCheck","1");};%>
</head>
<body>
   <div id="body">
   <!--#include virtual="/include/top_zixun.html"-->
   <div id="main">
   <div class="zixuntop">您所在的位置：<a href="/index.html">如意彩</a> &gt;<a href="/xinwenzixun.html">热点资讯</a>&gt; <%= new String(request.getParameter("callUrl").getBytes("ISO-8859-1"),"UTF-8") %> &gt; 正文</div>
   <div class="zixun_main">
   	<div class="zixunleft" style="border:0px;">
   		<tangs:ryc_newslist  value="7"  begin="0" end="1" newsId="%{#parameters.newsId[0]}" >
	    <div class="zixun_redList">
			<div class="zixun_top">${title}</div>
			<div class="zixun_title">
			<tangs:ryc_newslist categoryId="%{#parameters.categoryId[0]}" value="9" id="cata">
			<s:if test="#cata.nameca.indexOf('wangzhangonggao')>-1">
			${updatetime}   　
			</s:if>
			<s:else>
				${createtime}
			</s:else>
			</tangs:ryc_newslist>
			　来源： ${author} 　　责编： ${compile}    　　点击： <font class="red2" id="clickCount"><script>
				update_clickCount(${id});
				getClickCount(${id});</script></font></div>
			<div class="zixun_con">
			${content}
			<div class="space10">&nbsp;</div>
			<div class="space20">&nbsp;</div>
		    <!--#include virtual="/rules/bshare.html"-->
	    	<div class="space20"></div>
			<div class="septal_line"></div>
			<div class="space20"></div>
			<div class="RelatingArticle" >
				<h3>您也可能喜欢:</h3>
				<tangs:ryc_newslist categoryId="%{#parameters.categoryId[0]}"  web_id="%{#parameters.website_Properties_id[0]}"  newsId="%{#parameters.newsId[0]}"  value="20" num="5" status="s">
					<dl>
						<dd>
							<a href="${url }">${title}</a>
						</dd>
					</dl>
				</tangs:ryc_newslist>
			</div>
			</div>
		</div>	
		</tangs:ryc_newslist>
		<div class="space10">&nbsp;</div>

	</div>
   	<div class="zixunright">
	<div class="jinri_kj">
				<div class="jinri_top1"><span class="jinri_zi">专家推荐</span>
				<s:if test="#request.channelCheck!=0">
				<tangs:ryc_newslist channelId="%{#parameters.channelId[0]}" web_id="%{#parameters.website_Properties_id[0]}" value="14" id="s">
				<s:if test="#s.channelType==0"><a href="/fucaituijian/fucaituijian_${nameyw }_1.html" target="_blank" class="web_more">更多>></a></s:if>
				<s:elseif test="#s.channelType==1"><a href="/ticaituijian/ticaituijian_${nameyw }_1.html" target="_blank" class="web_more">更多>></a></s:elseif>
				</tangs:ryc_newslist>
				</s:if>
				<s:else>
				<a href="/fucaituijian/fucaituijian_shuangseqiu_1.html" target="_blank" class="web_more">更多>></a>
				</s:else>
				</div>
				<div class="webgg_con">
				<ul>	<s:if test="#request.channelCheck!=0">
					<tangs:ryc_newslist value="19" begin="0" end="6" num="6" categoryCn="'福彩推荐','体彩推荐'" channelId="%{#parameters.channelId[0]}" web_id="%{#parameters.website_Properties_id[0]}">
		     <li><a href="${url}" title="${title}" target="_blank">${title}</a></li>
				     </tangs:ryc_newslist>
				     </s:if><s:else>
				     <tangs:ryc_newslist value="12" begin="0" end="6" num="6" categoryCn="福彩推荐"  web_id="%{#parameters.website_Properties_id[0]}">
		     <li><a href="${url}" title="${title}"  target="_blank">${title}</a></li>
				     </tangs:ryc_newslist>
				     
				     </s:else>
		</ul>
			</div>
			</div>
			<div class="jinri_kj">
				<div class="jinri_top1"><span class="jinri_zi">最新中奖</span></div>
				<div class="webgg_con" id="webgg_con">
				<ul class="NewWinList">
					<tangs:ryc_newslist value="3" begin="0"   categoryCn="最新中奖"  web_id="%{#parameters.website_Properties_id[0]}"  num="1" >
				    ${content}
				     </tangs:ryc_newslist>
		</ul>
			</div>
		</div>
			<script>
				$(function() {
					$("#webgg_con").jCarouselLite({
						speed: 300,
						visible: 5,
						auto: 5000,
						vertical: true
					});
				});
				</script>
			<div class="jinri_kj">
				<div class="jinri_top1"><span class="jinri_zi">投注技巧</span>
				<s:if test="#request.channelCheck!=0">
				<tangs:ryc_newslist channelId="%{#parameters.channelId[0]}" web_id="%{#parameters.website_Properties_id[0]}" value="14" id="s1">
				<s:if test="#s1.channelType==0"><a href="/fucaijiqiao/fucaijiqiao_${nameyw }_1.html" target="_blank"  class="web_more">更多>></a></s:if>
				<s:elseif test="#s1.channelType==1"><a href="/ticaijiqiao/ticaijiqiao_${nameyw }_1.html" target="_blank"  class="web_more">更多>></a></s:elseif>
				</tangs:ryc_newslist>
				</s:if>
				<s:else>
				<a href="/fucaijiqiao/fucaijiqiao_shuangseqiu_1.html" target="_blank"  class="web_more">更多>></a>
				</s:else>
				</div>
				<div class="webgg_con">
				<ul><s:if test="#request.channelCheck!=0">
					<tangs:ryc_newslist value="19" begin="0" end="6"  num="6" categoryCn="'体彩技巧','福彩技巧'" channelId="%{#parameters.channelId[0]}" web_id="%{#parameters.website_Properties_id[0]}">
				     <li><a href="${url}" title="${title}"  target="_blank">${title}</a></li>
				     </tangs:ryc_newslist>
				     </s:if>
		            <s:else>
				     <tangs:ryc_newslist value="12" begin="0" end="6"  num="6" categoryCn="投注技巧"  web_id="%{#parameters.website_Properties_id[0]}">
				     <li><a href="${url}" title="${title}" target="_blank">${title}</a></li>
				     </tangs:ryc_newslist>
				     </s:else>
			</ul>
	</div>
			</div>
			<div class="zixun_gg"><a href="/11xuan5.html"><img  class="wumiiIgnore"  src="/images/11xuan5-270.jpg" width="270"  /></a></div>
	</div></div>
	</div>
	
   <!--#include virtual="/include/footer_noindex.html" -->
</div>
 <!--去掉页面上的无觅字样 -->
<script> 
function loadWindow()  
{  
   if(document.readyState == "complete") {  
      //alert($("a[href*='/widget/relatedItems.htm']").html());
      $("a[href$='/widget/relatedItems.htm']").html(" ");
       }
   else {  
       setTimeout("loadWindow()", 500);
	   }
} 
loadWindow(); 
</script> 
<!--#include virtual="/rules/setBody.html"-->
