<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="tangs" uri="/WEB-INF/tangs.tld"%> 
<%@taglib prefix="s" uri="/struts-tags" %>
<!--#include virtual="/include/top_http.html"-->
<title><%=new String((request.getParameter("title")==null||request.getParameter("title").equals("")?"彩票资讯":request.getParameter("title")).getBytes("ISO-8859-1"),"UTF-8") %>网上买彩票-如意彩网</title>
<link href="/css/util.css" rel="stylesheet" type="text/css" />
<link href="/css/newsAll.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jqueryJS/jquery-1.5.min.js"></script> 
<script type="text/javascript" src="/js/kuaiTouZhou.js" ></script>
</head>
<body>
   <div id="body">
   <!--#include virtual="/include/top_zixun.html"-->
   <div id="main">
   <div class="zixuntop">您所在的位置：<a href="/index.html">如意彩</a> ><a href="/xinwenzixun.html">热点资讯</a>&gt; <%= new String(request.getParameter("callUrl").getBytes("ISO-8859-1"),"UTF-8") %> &gt; 正文</div>
   <div class="zixun_main">
   	<div class="zixunleft" style="border:0px;">
   		<tangs:ryc_newslist  value="7"  begin="0" end="1" newsId="%{#parameters.newsId[0]}" >
	    <div class="zixunlist" style="border:solid 1px #DBDBDB;">
			<div class="zixun_top">${title}</div>
			<div class="zixun_title">${createtime}   　　来源： ${author} 　　责编： ${compile}    　　点击： <font class="red2" id="clickCount"><script>update_clickCount(${id});getClickCount( ${id});</script>	</font></div>
			<div class="zixun_con">
			${content}
			<br />
			<br />
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
			<!--#include virtual="/rules/bshare.html"-->
			</div>
		</div>

		</tangs:ryc_newslist>
		<div class="space10">&nbsp;</div>
		<div class="ZixunBottom">
			<div class="ZixunMap_zucai">
				<div class="zucai_map_list">
					<a href="/zucaishengfu.html" title="足彩胜负"><span class="caizh_img_zucai"><img src="/images/zucai23.gif"></span></a>
					<a href="/zucaishengfu.html" title="足彩胜负"><span class="caizh_zi_zucai"><img src="/images/wenzi_shfc.gif"></span></a>
					<div><a href="/zucaishengfu.html" title="足彩胜负"><span class="caizh_gm_zucai">立即购买&gt;&gt;</span></a></div>
				</div>
				<div class="zucai_map_list">
					<a href="/6changbanquan.html" title="6场半全"><span class="caizh_img"><img src="/images/zucai23.gif"></span></a>
					<a href="/6changbanquan.html" title="6场半全"><span class="caizh_zi_zucai"><img src="/images/wenzi_6chbq.gif"></span></a>
					<div><a href="/6changbanquan.html" title="6场半全"><span class="caizh_gm_zucai">立即购买&gt;&gt;</span></a></div>
				</div>
				<div class="zucai_map_list">
					<a href="/4changjinqiu.html" title="4场进球"><span class="caizh_img"><img src="/images/zucai23.gif"></span></a>
					<a href="/4changjinqiu.html" title="4场进球"><span class="caizh_zi_zucai"><img src="/images/wenzi_4chjq.gif"></span></a>
					<div><a href="/4changjinqiu.html" title="4场进球"><span class="caizh_gm_zucai">立即购买&gt;&gt;</span></a></div>
				</div>
				<div class="zucai_map_list">
					<a href="/renxuan9chang.html" title="任选9场"><span class="caizh_img"><img src="/images/zucai23.gif"></span></a>
					<a href="/renxuan9chang.html" title="任选9场"><span class="caizh_zi_zucai"><img src="/images/wenzi_renxuanjc.gif"></span></a>
					<div><a href="/renxuan9chang.html" title="任选9场"><span class="caizh_gm_zucai">立即购买&gt;&gt;</span></a></div>
				</div></div>
			<div class="zixun_zsh1 ZixunZoushi">
			  <div class="zixun_zoushitop"><span class="zixun_zoushuzi">足球资料库</span><span class="zixun_zoushugd"><a href="" title="更多">更多&gt;&gt;</a></span> </div>
			  <div class="zucai_ziliaoku">
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
		</div>
	</div>
   	<div class="zixunright">
	<div class="jinri_kj">
				<div class="jinri_top1"><span class="jinri_zi">专家推荐</span>
				<a href="/zucai/zucai__1.html" target="_blank" class="web_more">更多>></a>
				</div>
				<div class="webgg_con">
				<ul>
				     <tangs:ryc_newslist categoryCn="足彩" web_id="%{#parameters.website_Properties_id[0]}" value="16" num="6">
				<li><a href="${url}" title="${title}"  target="_blank"   >[${title_as}]  ${title}</a></li>
				</tangs:ryc_newslist>
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
				<a href="/fucaijiqiao/fucaijiqiao_shuangseqiu_1.html" target="_blank" class="web_more">更多>></a>
				</div>
				<div class="webgg_con">
				<ul>
				     <tangs:ryc_newslist value="12" begin="0" end="6"  num="6" categoryCn="福彩技巧"  web_id="%{#parameters.website_Properties_id[0]}">
				     <li><a href="${url}" title="${title}" target="_blank">${title}</a></li>
				     </tangs:ryc_newslist>
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
