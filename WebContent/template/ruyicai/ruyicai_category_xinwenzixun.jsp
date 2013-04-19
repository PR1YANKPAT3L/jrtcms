<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="tangs" uri="/WEB-INF/tangs.tld"%>  
 <%@taglib prefix="s" uri="/struts-tags"%>
<!--#include virtual="/include/top_http.html"-->
<title>如意彩彩票新闻资讯</title> 
<meta http-equiv="keywords" content="福彩新闻，体彩新闻，足彩新闻，走势图">
<meta http-equiv="description" content="如意彩新闻资讯-为购彩用户及时报道彩票新闻资讯、提供幸运选号、今日开奖号码">
<link href="/css/util.css" rel="stylesheet" type="text/css">
<link href="/css/newsAll.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jqueryJS/jquery-1.5.min.js"></script>
<script type="text/javascript"	src="/js/jqueryJS/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="/js/jqueryJS/jquery.d.imagechange.min.js"></script>
<script type="text/javascript" src="/js/public_touZhu.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/luck/main_luck.js"></script>
<script type="text/javascript" src="/js/luck/luck_stake_main.js"></script>
</head>
<body>
   <div id="body">
    <!--#include virtual="/include/top_zixun.html"-->
   <div id="main">
   	<div class="zixun_left">
		<!--  ImageSlide  start  -->
		<style>
  		#slidebox,#slidebox ul,#slidebox ul li{width:268px; height:167px; margin:0px; padding:0px; overflow:hidden;}
		*html #slidebox,#slidebox ul,#slidebox ul li{height:169px;}
		#slidebox{ float:left;}
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
			<tangs:ryc_newslist web_id="%{#parameters.website_Properties_id[0]}" value="3" istopNews="1"  categoryCn="资讯轮换" num="5" >
		    	<li><a href="${content}"><img src="${picName}"></a></li>
				</tangs:ryc_newslist>
			</ul>
		</div>
		
		<!--  ImageSlide  end  -->	
		<div class="zixun_hotnews">
		<h4>热点新闻</h4>
		<tangs:ryc_newslist categoryCn="热点新闻" istopNews="1" web_id="%{#parameters.website_Properties_id[0]}" status="s1" num="1" value="3">
		<div class="zixun_t"><a href="${url}" title="${title}"  target="_blank"    >${title}</a></div>
		</tangs:ryc_newslist>
		<div class="zixun_list1">
			<ul><tangs:ryc_newslist categoryCn="热点新闻" istopNews="1" web_id="%{#parameters.website_Properties_id[0]}" status="s1" num="5" value="3" begin="1" end="4">
				<li><a href="${url}" title="${title}"  target="_blank"    >[${title_as}]  ${title}</a></li>
				
				</tangs:ryc_newslist>
			</ul>
		</div>
		</div>
		<div class="zixun_gonggong">
			<div class="zixun_ggtop"><span class="zixun_zi">双色球</span><span class="zixun_kuozhan"><a href="/fucaituijian/fucaituijian_shuangseqiu_1.html" title="推荐">推荐</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			            <a href="/fucaijiqiao/fucaijiqiao_shuangseqiu_1.html" title="技巧">技巧</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/zixunxinwen/zixunxinwen_shuangseqiu_1.html" title="新闻">新闻</a></span></div>
			<div class="zixun_list2">
			<ul>
			<tangs:ryc_newslist categoryCn="福彩资讯" channelCn="双色球" web_id="%{#parameters.website_Properties_id[0]}" value="16" num="6">
				<li><span class="index_landian"></span><a href="${url}" title="${title}" target="_blank" >[${title_as}]  ${title}</a></li>
				</tangs:ryc_newslist>
			</ul>
			</div>
		</div>
		<div class="zixun_gonggong1">
			<div class="zixun_ggtop"><span class="zixun_zi">足彩</span><span class="zixun_kuozhan"><a href="/zucai/zucai__1.html" title="更多">更多&gt;&gt;</a></span></div>
			<div class="zixun_list2">
			<ul>
				<tangs:ryc_newslist categoryCn="足彩" web_id="%{#parameters.website_Properties_id[0]}" value="16" num="6">
				<li><span class="index_landian"></span><a href="${url}" title="${title}"  target="_blank"    >[${title_as}]  ${title}</a></li>
				</tangs:ryc_newslist>
			</ul>
		  </div>
		</div>
		<div class="zixun_gonggong">
			<div class="zixun_ggtop"><span class="zixun_zi">大乐透</span><span class="zixun_kuozhan"><a href="/ticaituijian/ticaituijian_daletou_1.html" title="推荐">推荐</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			   <a href="/ticaijiqiao/ticaijiqiao_daletou_1.html" title="技巧">技巧</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/zixun/zixun_daletou_1.html" title="新闻">新闻</a></span></div>
			<div class="zixun_list2">
			<ul>
				<tangs:ryc_newslist categoryCn="体彩资讯" channelCn="大乐透" web_id="%{#parameters.website_Properties_id[0]}" value="16" num="6">
				<li><span class="index_landian"></span><a href="${url}" title="${title}"  target="_blank"    >[${title_as}]  ${title}</a></li>
				</tangs:ryc_newslist>
			</ul>
			</div>
		</div>
		<div class="zixun_gonggong1">
			<div class="zixun_ggtop"><span class="zixun_zi">焦点赛事</span><span class="zixun_kuozhan"><a href="/jiaodiansaishi/jiaodiansaishi__1.html" title="推荐">更多&gt;&gt;</a></span></div>
			<div class="zixun_list2">
			<ul>
				<tangs:ryc_newslist categoryCn="焦点赛事"  web_id="%{#parameters.website_Properties_id[0]}" value="3" num="6">
				<li><span class="index_landian"></span><a href="${url}" title="${title}"  target="_blank"    >[${title_as}]  ${title}</a></li>
				</tangs:ryc_newslist>
			</ul>
			</div>
		</div>
		<div class="zixun_gonggong">
			<div class="zixun_ggtop"><span class="zixun_zi">福彩3D</span><span class="zixun_kuozhan"><a href="/fucaituijian/fucaituijian_fucai3D_1.html" title="推荐">推荐</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/fucaijiqiao/fucaijiqiao_fucai3D_1.html" title="技巧">技巧</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			  <a href="/zixunxinwen/zixunxinwen_fucai3D_1.html" title="新闻">新闻</a></span></div>
			<div class="zixun_list2">
			<ul>
				<tangs:ryc_newslist categoryCn="福彩资讯" channelCn="福彩3D" web_id="%{#parameters.website_Properties_id[0]}" value="16" num="6">
				<li><span class="index_landian"></span><a href="${url}" title="${title}"  target="_blank"    >[${title_as}]  ${title}</a></li>
				</tangs:ryc_newslist>
			</ul>
			</div>
		</div>
		<div class="zixun_gonggong1">
			<div class="zixun_ggtop"><span class="zixun_zi">排列三</span><span class="zixun_kuozhan"><a href="/ticaituijian/ticaituijian_pailie3_1.html" title="推荐">推荐</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/ticaijiqiao/ticaijiqiao_pailie3_1.html" title="技巧">技巧</a>
			    &nbsp;&nbsp;|&nbsp;&nbsp;<a href="/zixun/zixun_pailie3_1.html" title="新闻">新闻</a></span></div>
			<div class="zixun_list2">
			<ul>
				<tangs:ryc_newslist categoryCn="体彩资讯" channelCn="排列3" web_id="%{#parameters.website_Properties_id[0]}" value="16" num="6">
				<li><span class="index_landian"></span><a href="${url}" title="${title}"  target="_blank"    >[${title_as}]  ${title}</a></li>
				</tangs:ryc_newslist>
			</ul>
			</div>
		</div>
		<div class="zixun_gonggong">
			<div class="zixun_ggtop"><span class="zixun_zi">七星彩</span><span class="zixun_kuozhan"><a href="/ticaituijian/ticaituijian_qixingcai_1.html" title="推荐">推荐</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/ticaijiqiao/ticaijiqiao_qixingcai_1.html" title="技巧">技巧</a>
			   &nbsp;&nbsp;|&nbsp;&nbsp;<a href="/zixun/zixun_qixingcai_1.html" title="新闻">新闻</a></span></div>
			<div class="zixun_list2">
			<ul>
				<tangs:ryc_newslist categoryCn="体彩资讯" channelCn="七星彩" web_id="%{#parameters.website_Properties_id[0]}" value="16" num="6">
				<li><span class="index_landian"></span><a href="${url}" title="${title}"  target="_blank"    >[${title_as}]  ${title}</a></li>
				</tangs:ryc_newslist>
			</ul>
			</div>
		</div><div class="zixun_gonggong1">
			<div class="zixun_ggtop"><span class="zixun_zi">七乐彩</span><span class="zixun_kuozhan"><a href="/fucaituijian/fucaituijian_qilecai_1.html" title="推荐">推荐</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/fucaijiqiao/fucaijiqiao_qilecai_1.html" title="技巧">技巧</a>
			  &nbsp;&nbsp;|&nbsp;&nbsp;<a href="/zixunxinwen/zixunxinwen_qilecai_1.html" title="新闻">新闻</a></span></div>
			<div class="zixun_list2">
			<ul>
				<tangs:ryc_newslist categoryCn="福彩资讯" channelCn="七乐彩" web_id="%{#parameters.website_Properties_id[0]}" value="16" num="6">
				<li><span class="index_landian"></span><a href="${url}" title="${title}"  target="_blank"    >[${title_as}]  ${title}</a></li>
				</tangs:ryc_newslist>
			</ul>
			</div>
		</div>
		<div class="zixun_gonggong">
			<div class="zixun_ggtop"><span class="zixun_zi">排列五</span><span class="zixun_kuozhan"><a href="/ticaituijian/ticaituijian_pailie5_1.html" title="推荐">推荐</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/ticaijiqiao/ticaijiqiao_pailie5_1.html" title="技巧">技巧</a>
			 &nbsp;&nbsp;|&nbsp;&nbsp;<a href="/zixun/zixun_pailie5_1.html" title="新闻">新闻</a></span></div>
			<div class="zixun_list2">
			<ul>
				<tangs:ryc_newslist categoryCn="体彩资讯" channelCn="排列5" web_id="%{#parameters.website_Properties_id[0]}" value="16" num="6">
				<li><span class="index_landian"></span><a href="${url}" title="${title}"  target="_blank"    >[${title_as}]  ${title}</a></li>
				</tangs:ryc_newslist>
			</ul>
			</div>
		</div>
		<div class="zixun_gonggong1">
			<div class="zixun_ggtop"><span class="zixun_zi">帮助中心</span><span class="zixun_kuozhan"><a href="http://www.ruyicai.com/cms/index.html" title="更多" target="_blank">更多&gt;&gt;</a></span></div>
			<div class="zixun_list2">
			<ul>
				<tangs:ryc_newslist categoryCn="帮助中心" web_id="%{#parameters.website_Properties_id[0]}" num="6" value="3">
                 <li> <span class="index_landian"></span><a href="${url }?code=${categoryCode}&id=${id }" title="${title }" target="_blank" >${title}</a></li>
                 </tangs:ryc_newslist>
			</ul>
			</div>
		</div>
	</div>
	<div class="zixun_right">
	<div class="zixun_notice">
		<div class="zixun_noticetop"><span class="webgg_title">网站公告</span></div>
	    <div class="zixun_noticecon">
			<ul>
			  <tangs:ryc_newslist categoryCn="网站公告" web_id="%{#parameters.website_Properties_id[0]}" num="5" value="3">
                  <li><a href="${url}" title="${title}" target="_blank" >  ${title}</a></li>
                 </tangs:ryc_newslist>
			</ul>
		</div></div>
		<jsp:include page="rules/index_xingyunxuanhao.jsp" ></jsp:include>
	    <div class="zixun_guanggao"><a href="/shishicai.html"><img src="/images/zixun_guanggao.jpg" /></a></div>
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
		<div class="zixun_zoushi">
			<div class="zixun_zoushitop">
			<span class="zixun_zoushuzi">走势图</span><span class="zixun_zoushugd"><a href="#" title="更多">更多&gt;&gt;</a></span>
			</div>
			<div class="zixun_zoushicon">
				<ul class="zixun_czzs">
					<li><a class="z_ssqlogo"  href="#" target="_blank"></a></li>
					<li><a class="z_3Dlogo"  href="#" target="_blank" ></a></li>
					<li><a class="z_dltlogo"  href="#" target="_blank"></a></li>
					<li><a class="z_plslogo"  href="#" target="_blank"></a></li>
				</ul>
				<ul class="zixun_czzs_zi">
					<li><a href="http://tbzs.ruyicai.com/cjwssq/view/ssqzonghe.php" title="双色球" target="_blank">双色球</a></li>
					<li><a href="http://tbzs.ruyicai.com/cjw3d/view/3d_danxuan.php" title="福彩3D" target="_blank">福彩3D</a></li>
					<li><a href="http://tbzs.ruyicai.com/cjwdlt/view/dltyqsfq.php" title="大乐透" target="_blank">大乐透</a></li>
					<li><a href="http://tbzs.ruyicai.com/cjwpl3/view/pl3_zxylzzhw.php?typeId=zuxuan" title="排列三" target="_blank">排列三</a></li>
				</ul>
				<ul class="zixun_czzs1">
					<li><a class="z_plwlogo" href="http://tbzs.ruyicai.com/cjwpl5/view/pl5_zst.php" target="_blank"></a></li>
					<li><a class="z_qlclogo" href="http://tbzs.ruyicai.com/cjwqlc/view/qlcsfq.php" target="_blank"></a></li>
					<li><a class="z_qxclogo" href="http://tbzs.ruyicai.com/cjw7xc/view/7xc_haoma.php" target="_blank"></a></li>
					<li><a class="z_syxwlogo" href="http://tbzs.ruyicai.com/cjw11x5_qs/view/11x5_danxuan.php?lotteryType=11x5" target="_blank"></a></li>
				</ul>
				<ul class="zixun_czzs_zi">
					<li><a href="http://tbzs.ruyicai.com/cjwpl5/view/pl5_zst.php" title="排列五" target="_blank">排列五</a></li>
					<li><a href="http://tbzs.ruyicai.com/cjwqlc/view/qlcsfq.php" title="七乐彩" target="_blank">七乐彩</a></li>
					<li><a href="http://tbzs.ruyicai.com/cjw7xc/view/7xc_haoma.php" title="七星彩" target="_blank">七星彩</a></li>
					<li><a href="http://tbzs.ruyicai.com/cjw11x5_qs/view/11x5_danxuan.php?lotteryType=11x5" title="江西11选5" target="_blank">江西11选5</a></li>
				</ul>
		  </div>
		</div>
		<div class="zixun_ziliao">
			<div class="zixun_zoushitop">
			<span class="zixun_zoushuzi">足球资料库</span><span class="zixun_zoushugd"><a href="" title="更多">更多&gt;&gt;</a></span>
			</div>
			<div class="zixun_ziliaoku">
				<ul>
					<li><a class="z_yingchao" href="" title=""></a></li>
					<li><a class="z_yijia" href="" title=""></a></li>
					<li><a class="z_xijia" href="" title=""></a></li>
					<li><a class="z_dejia" href="" title=""></a></li>
					<li><a class="z_fajia" href="" title=""></a></li>
					<li><a class="z_shijiebei" href="" title=""></a></li>
				</ul>
			</div>
		</div>
	</div>
	</div>
 <!--#include virtual="/include/footer_noindex.html" -->
</div>
<script type="text/javascript">
		
		$(function() {
			$("#slidebox").jCarouselLite({
				vertical: false,
				hoverPause:true,
				visible: 1,
				start: 0,
				scroll: 1,
				circular: true,
				auto:3000,
				speed:500,				
				btnGo:
				    [".1", ".2",
				    ".3", ".4",".5"],
				
				afterEnd: function(a, to, btnGo) {
						if(btnGo.length <= to){
							to = 0;
						}
						$(".thumbActive").removeClass("thumbActive");
						$(btnGo[to]).addClass("thumbActive");
				    }
			});
		});
		</script>
<!--#include virtual="/rules/setBody.html"-->