<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="tangs" uri="/WEB-INF/tangs.tld" %>
<!--#include virtual="/include/top_http.html"-->
<title>
	今日开奖彩票-如意彩购彩大厅
</title>
<meta name="keywords" content="今日开奖彩票，购彩导航，彩种的截止时间倒计时，彩票走势图" />
<meta name="description" content="如意彩购彩大厅-为购彩用户提供今日开奖彩票，购彩导航，彩种的截止时间倒计时，彩票走势图"
/>
<link rel="shortcut icon" href="/images/biao-ico.ico" type="image/x-icon"
/>
<link href="/css/util.css" rel="stylesheet" type="text/css">
<link href="/css/newsAll.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jqueryJS/jquery-1.5.min.js">
</script>
<script type="text/javascript" src="/js/kuaiTouZhou.js">
</script>
<script type="text/javascript" src="/js/jqueryJS/jinrijiezhi_timeEnd.js">
</script>
</head>
<body>
<div id="body">
<!--#include virtual="/include/top_nav.html" -->
<div id="main">
	<div id="zhanghu">
		<div class="main_left">
			<div class="zuijingc" id="zuijingc">
				<!-- 最近购彩种 -->
				<script>
					$(function() {
						reHtml(46, '', 'false', 'zuijingc');
					});
				</script>
				
			</div>
			<div class="bt">
				<img src="/images/goucaitop.gif" width="190" height="29">
			</div>
			<div id="PARENT_gc">
				<div class="gcnaw">
					<img class="gc_img" src="/images/mfclogo.gif">
					<span class="gcnaw1">福彩</span>
				</div>
				<ul class="expanded_gc">
					<li><a href="/shuangseqiu.html" title="双色球"><span>双色球</span></a></li>
					<li><a href="/fucai3D.html" title="福彩3D"><span>福彩3D</span></a></li>
					<li><a href="/qilecai.html" title="七乐彩"><span>七乐彩</span></a></li>
				</ul>
				<div class="gcnaw">
					<img class="gc_img" src="/images/mtclogo.gif">
					<span class="gcnaw1">体彩
					</span>
				</div>
				<ul class="expanded_gc">
					<li><a href="/daletou.html" title="大乐透"><span>大乐透</span></a></li>
					<li><a href="/pailie3.html" title="排列三"><span>排列三</span></a></li>
					<li><a href="/pailie5.html" title="排列五"><span>排列五</span></a></li>
					<li><a href="/qixingcai.html" title="七星彩"><span>七星彩</span></a></li>
				</ul>
				<div class="gcnaw">
					<img class="gc_img" src="/images/gpclogo.gif">
					<span class="gcnaw1">高频</span>
				</div>
				<ul class="expanded_gc">
					<li><a href="/shishicai.html" title="时时彩"><span>时时彩</span></a></li>
					<li><a href="/11xuan5.html" title="江西11选5"><span>江西11选5</span></a></li>
					<li><a href="/shiyiyunduojin.html" title="十一运夺金"><span>十一运夺金</span></a></li>
				</ul>
				<div class="gcnaw">
					<img class="gc_img" src="/images/zucai.gif">
					<span class="gcnaw1">足彩</span>
				</div>
				<ul class="expanded_gc">
					<li><a href="/zucaishengfu.html" title="足彩胜负"><span>足彩胜负</span></a></li>
					<li><a href="/renxuan9chang.html" title="任选9场"><span>任选9场</span></a></li>
					<li><a href="/6changbanquan.html" title="6场半全"><span>6场半全</span></a></li>
					<li><a href="/4changjinqiu.html" title="4场进球"><span>4场进球</span></a></li>
				</ul>
				<div class="gcnaw">
					<img class="gc_img" src="/images/jclogo20.gif">
					<span class="gcnaw1">竞彩</span>
				</div>
				<ul class="expanded_gc">
					<li><a href="/jingcaizuqiu.html" title="竞彩足球"><span>竞彩足球</span></a></li>
<%-- 					<li><a href="http://jclq.ruyicai.com/jclq/touzhu/shengfu.jsp" title="竞彩篮球"><span>竞彩篮球</span></a></li> --%>
				</ul>
				<!--<span class="HomePageBGBox ListAddClass" style="position:absolute; top:31px; left:46px;"> 双色球 加奖 </span>-->
				<!--<span class="HomePageBGBox ListHotClass" style="position:absolute; top:113px; left:46px;"> 大乐透 热 --></span>
				<!--<span class="HomePageBGBox ListFanJiangClass" style="position:absolute; top:180px; left:65px;"> 时时彩 热 --></span>
				<!--<span class="HomePageBGBox ListNewClass" style="position:absolute; top:358px; left:58px;"> 竟彩足球 新 --></span>
			</div>
		</div>
		<div class="goucai_mid">
			<!-- ImageSlide start -->
			<style>
				#slidebox ul ,#slidebox ul li{width:518px;height:162px; margin:0px; padding:0px;
				overflow:hidden;}
			</style>
			<div id="slidebox">
				<div class="thumbs">
					<a href="javaScript:;" class="1 b1 thumbActive"><span class="HomePageBGBox s1">&nbsp;</span></a>
					<a href="javaScript:;" class="2 b2"><span class="HomePageBGBox s2">&nbsp;</span></a>
					<a href="javaScript:;" class="3 b3"><span class="HomePageBGBox s3">&nbsp;</span></a>
					<a href="javaScript:;" class="4 b4"><span class="HomePageBGBox s4">&nbsp;</span></a>
					<a href="javaScript:;" class="5 b5"><span class="HomePageBGBox s5">&nbsp;</span></a>
				</div>
				<ul>
					<tangs:ryc_newslist web_id="%{#parameters.website_Properties_id[0]}" value="3"
					istopNews="1" categoryCn="购彩大厅轮换" num="5">
						<li>
							<a href="${content}">
								<img src="${picName}">
							</a>
						</li>
					</tangs:ryc_newslist>
				</ul>
			</div>
			<!-- ImageSlide end -->
			<div class="goucai_list" id="goucai_list">
				<!-- 今日购彩截止 -->
				<!--#include virtual="/include/jinrijiezhi.html" -->
			</div>
		</div>
		<div class="goucai_right">
			<div class="goucai_gg">
				<div class="goucai_ggtop">
					<span class="webgg_title">公告</span>
				</div>
				<div class="goucai_ggcon">
					<ul>
						<tangs:ryc_newslist categoryCn="网站公告" value="3" web_id="%{#parameters.website_Properties_id[0]}"
						num="5">
							<li><a href="${url}" title="${title}" tyle="color:${title_color}">${title}</a></li>
						</tangs:ryc_newslist>
					</ul>
				</div>
			</div>
			<div class="goucai_zsh">
				<div class="goucai_ggtop">
					<span class="newswin_title">图表走势</span>
					<a href="http://tbzs.ruyicai.com" title="更多" target="_blank" class="web_more">更多>></a>
				</div>
				<div class="goucai_zshcon ChannelBuyCurrent">
					<ul>
						<tangs:ryc_newslist value="3" categoryCn="图表走势" web_id="%{#parameters.website_Properties_id[0]}">
							<li style="padding-left:10px;"><a href="${url }" target="_blank">${title}</a>
							</li>
						</tangs:ryc_newslist>
					</ul>
				</div>
			</div>
			<div class="goucai_gg">
				<div class="goucai_ggtop">
					<span class="goucai_title">帮助中心</span>
					<a href="http://www.ruyicai.com/cms/index.html" class="web_more" target="_blank">更多&gt;&gt;</a>
				</div>
				<div class="webgg_congc">
					<ul>
						<tangs:ryc_newslist value="3" end="10" categoryCn="帮助中心" web_id="%{#parameters.website_Properties_id[0]}">
							<li><a href="${url}" title="${title}">${title}</a>
							</li>
						</tangs:ryc_newslist>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$("#slidebox").jCarouselLite({
			vertical: false,
			hoverPause: true,
			btnPrev: ".slideboxPrev",
			btnNext: ".slideboxNext",
			visible: 1,
			start: 0,
			scroll: 1,
			circular: true,
			auto: 3000,
			speed: 500,
			btnGo: [".1", ".2", ".3", ".4", ".5"],

			afterEnd: function(a, to, btnGo) {
				if (btnGo.length <= to) {
					to = 0;
				}
				$(".thumbActive").removeClass("thumbActive");
				$(btnGo[to]).addClass("thumbActive");
			}
		});
	});
</script>
	<!--#include virtual="/include/footer_noindex.html" -->
	<input type="hidden" value="" name="tishi" id="tishi">
</div>
<!--#include virtual="/rules/setBody.html"-->