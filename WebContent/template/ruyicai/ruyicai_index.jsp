<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib prefix="s" uri="/struts-tags"%>
 <%@taglib prefix="tangs" uri="/WEB-INF/tangs.tld"%>
  <!--#include virtual="/include/top_http.html"-->
<title>如意彩彩票网提供中彩网双色球中奖号码分布图，大乐透开奖结果查询，中国体育彩票七星彩开奖结果查询，体育彩票七位数开奖结果，今天中国福彩双色球开奖结果</title>
<meta name="keywords" content="中彩网双色球中奖号码分布图，中彩网双色球中奖号码分布图，大乐透开奖结果查询，体育彩票七星彩开奖结果查询，今天中国福彩双色球开奖结果，体彩七位数开奖结果，体育彩票7位数,七位数">
<meta name="description" content="如意彩彩票网提供中彩网双色球中奖号码分布图，大乐透开奖结果查询，中国体育彩票七星彩开奖结果查询，今天中国福彩双色球开奖结果，双色球基本走势图，体育彩票七位数开奖结果，中彩网双色球中奖号码分布图，大乐透开奖结果查询，体育彩票七星彩开奖结果查询，体彩七位数开奖结果，今天中国福彩双色球开奖结果等服务的专业彩票网站">
<meta name="baidu-site-verification" content="VlHNihv8kSBeWcFl" />
<script type="text/javascript" src="/js/jqueryJS/jquery-1.5.min.js"></script> 
<script type="text/javascript" src="/js/jcarousellite_1.0.1c5.js"></script>
<script type="text/javascript" src="/js/kuaiTouZhou.js" ></script>
<!--#include virtual="/css/Css_HomeOnly.html"-->
</head>
<body>
  <!--#include virtual="/include/top_index.html"-->
<div class="space10"></div>
<div class="FirstScreen">
	<div class="FirstScreenLeft">
		<%//--- 彩种选择 star-------%>
		<div class="Pannel SelectLottery">
			<div class="PannelHead">
				<h3>购买彩票</h3>
			</div>
			 <!--#include virtual="/rules/goucaiSelect.html"-->
		</div>
		<%//--- 彩种选择 end-------%>
	</div>
	
	<div class="FirstScreenCenter">
		<%//----图片轮换开始 ------- %>
		<div id="slidebox">
			<ul>
				<tangs:ryc_newslist web_id="%{#parameters.website_Properties_id[0]}" value="3" istopNews="1"  categoryCn="轮换广告" num="5" >
		    	<li><a href="${content}" target="_blank"><img src="${picName}" width="450px" height="159px" /></a></li>
				</tangs:ryc_newslist>
			</ul>
			<div class="thumbs">
				<a class="1 b1 thumbActive"><span class="HomePageBGBox s1">&nbsp;</span></a> 
				<a class="2 b2"><span class="HomePageBGBox s2">&nbsp;</span></a> 
				<a class="3 b3"><span class="HomePageBGBox s3">&nbsp;</span></a> 
				<a class="4 b4"><span class="HomePageBGBox s4">&nbsp;</span></a> 
				<a class="5 b5"><span class="HomePageBGBox s5">&nbsp;</span></a> 
			</div>
		</div>
		<%//----图片轮换结束------- %>
		
		<div class="space10"></div>
		
		<!--  FastBuy  start  -->
		<%//首页双色球和大乐透快速投注 %>
		<jsp:include page="rules/rules_ssq_dlt_touzhu.jsp"></jsp:include>
		<!--  FastBuy  end  -->
	</div>
	
	<div class="FirstScreenRight">
		
		<div id="top_right" class="LoginAndRegisterBox">
			<script>$(function() {indexRight();});</script>
		</div>
		
		<div class="space10"></div>
		
		<%// 网站公告||购彩帮助	start%>
		<div class="Pannel BulletinAndHelp">
			<div class="PannelHead">
			
				<table class="TabM"><tr>
					<th  onmouseover="BaseTab($(this))" ControlTarget=".WebBulletin">网站公告</th>
					<td onmouseover="BaseTab($(this))" ControlTarget=".BuyHelp" class="selected">手机购彩</td></tr>
				</table>
				
			</div>
			<div class="PannelBody">
			
				<ul class="WebBulletin none ">
					<tangs:ryc_newslist categoryCn="网站公告" web_id="%{#parameters.website_Properties_id[0]}" num="6" value="3">
					<li><a href="${url}" style="color:${title_color}" target="_blank">${title}</a></li>
					</tangs:ryc_newslist>
				</ul>
				<div class="BuyHelp none selected" style="border-bottom: 1px solid rgb(204, 204, 204);">
					<div style="padding:45px 10px 0px 10px; border-bottom:1px solid #ccc; line-height:30px; background:url(/images/indexphonebg.jpg) no-repeat 10px 10px">
			            <p> <a href="/downLoad/ruyicai_android_3.6.4_899_webguanwang.apk"><img src="/images/indexandroid_normal.gif" width="118" height="29" /></a></p><p style="margin-top:6px"><a href="/downLoad/ruyicai_iPhone_3.6.4_793_web_ruyicai.ipa"><img src="/images/indexios_normal.gif" width="118" height="29" /></a></p>
						<p style="line-height:40px">您还可以点击：<a href="http://wap.ruyicai.com" style="color:#0066cc; text-decoration:underline">wap.ruyicai.com</a>进行购彩
						</p>    
                	</div>
                </div>

			</div>
			<div class="PannelBody ProcessShow">
				<img src="/images/ProcessShow.gif" usemap="#ProcessShow" />
				<map name="ProcessShow" id="ProcessShow">
					<area shape="rect" coords="0,0,40,40" href="/bangzhuzhongxin/xinshourumen//zhuce//20110615111900_541.html?id=541&code1=148&code=127 " title="快速注册"  target="_blank" />
					<area shape="rect" coords="70,0,110,40" href="/bangzhuzhongxin/chongzhibangzhu//chongzhicaozuo//20110614173703_512.html?id=512&code1=133&code=124" title="安全充值" target="_blank" />
					<area shape="rect" coords="140,0,180,40" href="/bangzhuzhongxin/xinshourumen//goucai//20110615113157_545.html?id=545&code1=149&code=127" title="便捷投注"  target="_blank" />
					<area shape="rect" coords="210,0,250,40" href="/bangzhuzhongxin/zhongjiangtixian//tixiancaozuo//20110615114557_558.html?id=558&code1=132&code=123" title="安全提款"  target="_blank" />
				</map>
			</div>
		</div>
		<%// 网站公告||购彩帮助	end%>
		
		<div class="space10"></div>
		
		<%// 客户端下载	star%>
		<div class="PhoneClient"><a href="/rules/customMessage.html" target="_blank"><img src="/images/PhoneClient.gif" width="270px" height="80px"/></a></div>
		<%// 客户端下载	end%>
	</div>
</div>

<div class="space10"></div>

<div class="SecondScreen">

	<div class="SecondScreenLeft">
		
		<%//--  开奖公告  start  --%>
		<div class="Pannel NumberShow" id="result">
					<!--#include virtual="/kaijiang/shouyegonggao.html" -->
		</div>
		<%//--  开奖公告  end  --%>
		
	</div>
	
	<div class="SecondScreenCenter">
	
		<%//--  新闻资讯   start  --%>
		<div class="Pannel LotteryNews">
			<div class="PannelHead">
				<h3>彩票资讯</h3>
				<table class="TabM"><tr>
					<th><a href="/fucaituijian/fucaituijian_shuangseqiu_1.html" target="_blank">双色球</a></th>
					<td><a href="/ticaituijian/ticaituijian_daletou_1.html" target="_blank">大乐透</a></td>
					<td><a href="/fucaituijian/fucaituijian_fucai3D_1.html" target="_blank">福彩3D</a></td></tr>
				</table>
			</div>
			<div class="PannelBody LotteryNewsList">
				<table>
					<thead>
						<tr>
							<tangs:ryc_newslist categoryCn="热点新闻" istopNews="1" web_id="%{#parameters.website_Properties_id[0]}" status="s1" num="1" value="3">
							<th colspan="3"><a href="${url}" style="color:${title_color}" target="_blank">${title}</a></th>
							</tangs:ryc_newslist>
						</tr>
					</thead>
					<tbody>
						<tangs:ryc_newslist categoryCn="热点新闻" istopNews="1" web_id="%{#parameters.website_Properties_id[0]}" status="s1" num="3" value="3" begin="1" end="2">
						<tr><th width="40" >[${title_as}]</th><td><a href="${url}" style="color:${title_color}" target="_blank">${title}</a></td><th width="80">[${createtimeFm}]</th></tr>
						</tangs:ryc_newslist>
					</tbody>
				</table>
				<div class="space10"></div>
				<table>
					<thead>
						<tr>
							<th>福彩</th>
							<tangs:ryc_newslist categoryCn="福彩资讯" web_id="%{#parameters.website_Properties_id[0]}" num="1" value="13">
							<td colspan="2"><a href="${url}" style="color:${title_color}" target="_blank">${title}</a></td>
							</tangs:ryc_newslist>
						</tr>
					</thead>
					<tbody>
						<tangs:ryc_newslist categoryCn="福彩资讯" web_id="%{#parameters.website_Properties_id[0]}" num="6" value="13" begin="1" end="5">
						<tr><th width="40">[${title_as}]</th><td><a href="${url}" style="color:${title_color}" target="_blank">${title}</a></td><th width="80">[${createtimeFm}]</th></tr>
						</tangs:ryc_newslist>
					</tbody>
				</table>
				<div class="space10"></div>
				<table>
					<thead>
						<tr>
							<th>体彩</th>
							<tangs:ryc_newslist categoryCn="体彩资讯" web_id="%{#parameters.website_Properties_id[0]}" num="1" value="13">
							<td colspan="2"><a href="${url}" target="_blank" style="color:${title_color}">${title}</a></td>
							</tangs:ryc_newslist>
						</tr>
					</thead>
					<tbody>
						<tangs:ryc_newslist categoryCn="体彩资讯" web_id="%{#parameters.website_Properties_id[0]}" num="6" value="13" begin="1" end="5">
							<tr><th width="40">[${title_as}]</th><td><a href="${url}" target="_blank" style="color:${title_color}">${title}</a></td><th width="80">[${createtimeFm}]</th></tr>
						</tangs:ryc_newslist>
					</tbody>
				</table>
			</div>
		</div>
		<%//--  新闻资讯  end  --%>
		
	</div>

	<div class="SecondScreenRight">
	

		<div class="specialActivities_news" style="border: 1px solid #ccc;">
		<iframe width="268" height="475" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?language=&width=268&height=475fansRow=2&ptype=1&speed=0&skin=2&isTitle=1&noborder=0&isWeibo=1&isFans=0&uid=1734676075&verifier=eb816cbb&dpc=1"></iframe>
		</div>
	</div>
	
</div>
<div class="space10"></div>

<div class="Streamer">
<tangs:ryc_newslist web_id="%{#parameters.website_Properties_id[0]}" value="3" istopNews="1"  categoryCn="首页横幅" num="1" >
	<a href="${content}"><img src="${picName}" alt="如意彩"  height="60px" width="950px"/></a>
</tangs:ryc_newslist>

</div>

<div class="space10"></div>
<!-- 足彩对阵 -->
<div class="ThirdScreen">

	<div class="ThirdScreenLeft" style="overflow:hidden;">
		<!-- FootballFight start -->
		<jsp:include page="/function/ruyicai_shengfucai/shengfucai_standrad_shouye.jsp"></jsp:include>	
		<!-- FootballFight end -->
	</div>
	<div class="ThirdScreenRight">
		<!-- MatchAdvance start -->
		<div class="Pannel MatchAdvance">
			<div class="PannelHead"><h3>赛事前瞻</h3><a href="/zucaishengfu.html">详情&gt;&gt;</a></div>
			<div class="PannelBody">
				<tangs:ryc_newslist web_id="2" categoryCn="赛事前瞻" channelCn="足彩胜负" value="3" num="1">
				    ${content}
				</tangs:ryc_newslist>
			</div>
		</div>
		<!-- MatchAdvance end -->
		
		<div class="space10"></div>
		
		<!-- MatchAdvance start -->
		<div class="Pannel FootballData">
			<div class="PannelHead"><h3>足球资料</h3></div>
			<div class="PannelBody">
				<img src="/images/FootballTeamData.gif" usemap="#FootballTeamData" />
				<map name="FootballTeamData" id="FootballTeamData">
					<area shape="rect" coords="0,0,60,78" alt="英超"/>
					<area shape="rect" coords="70,0,110,40" alt="意甲"/>
					<area shape="rect" coords="140,0,180,40" alt="德甲"/>
					<area shape="rect" coords="210,0,250,40" alt="西甲"/>
				</map>
				<table>
					<tr><th colspan="3">赔率指数</th></tr>
					<tr><td>澳彩赔率</td>
					<td>进球彩赔率</td>
					<td>半全场赔率</td></tr>
					<tr><td colspan="2">胜负彩(任九)赔率</td>
					<td>北京单场</td></tr>
				</table>
			</div>
		</div>
		<!-- MatchAdvance end -->
		
		<div class="space10"></div>
		
		<!-- MatchAdvance start -->
		<div class="ExpertNote"><a href="/zhuanjiaduanxin.html" target="_blank"><img src="/images/ExpertNote.gif" width="270px" height="120px"/></a></div>
		<!-- MatchAdvance end -->
	</div>

</div>
<div class="space10"></div>

<div class="LastScreen">
	
	<div class="LastScreenLeft" style=" margin:0px;">
		<div class="index_togetherBuy" style="margin:0px;">
			<div class="index_buyPannelHead"><span>合买推荐</span><a href="/hemai/hemaiCenter.html" title="查看更多合买"	target="_blank">查看更多合买</a></div>
			<div class="index_buyPannelBody" id="shouyeHemai">
			<!--#include virtual="/hemai/hemaituijian.html"-->
			</div>
		</div>
	</div>
	
	<div class="LastScreenRight">
		<!-- 合买中奖排行 start -->
		<!--#include virtual="/kaijiang/indexWiningRanking.html" -->
		<!-- 合买中奖排行 end -->
		<div class="space10"></div>
		<!-- CustomerService start -->
		<div class="CustomerService">
			<img src="/images/CustomerService.gif" usemap="#CustomerService" />
			<map name="CustomerService" id="CustomerService">
				<area shape="rect" coords="60,40,150,60" href ="http://wpa.qq.com/msgrd?v=3&uin=1427872305&site=qq&menu=yes" alt="在线客服" /target="_blank">
				<area shape="rect" coords="170,40,260,60" href ="/rules/customMessage.html" alt="留言咨询" target="_blank"/>
			</map>
		</div>
		<!-- CustomerService end -->
	</div>
	
</div> 
<!--#include virtual="/include/footer.html" -->
<jsp:include page="/function/public_touZhuAlert_shengfucai_shouye.jsp"></jsp:include>
<jsp:include page="rules/yue_tishi.jsp"></jsp:include>
<script type="text/javascript">
//首页图片轮滑js:#slidebox
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
		btnGo:[".1",".2",".3",".4",".5"],
		afterEnd: function(a, to, btnGo) {
				if(btnGo.length <= to){
					to = 0;
				}
				$(".thumbActive").removeClass("thumbActive");
				$(btnGo[to]).addClass("thumbActive");
			}
	});
});
//首页图片轮滑js:#NumberShow
$(function() {
	$(".LotteryQuickEnterSlide").jCarouselLite({
		vertical: true,
		hoverPause:true,
		btnPrev: ".LotteryQuickEnterPrev",
		btnNext: ".LotteryQuickEnterNext", 
		visible: 2,
		start: 0,
		scroll: 1,
		circular: true,
		speed:500
	});
});

//首页图片轮滑js:#NewAndTodayWin
$(function() {
	$(".NewWin").jCarouselLite({
		vertical: true,
		hoverPause:true,
		visible: 6,
		start: 0,
		scroll: 1,
		circular: true,
		auto:3000,
		speed:500
	});
});
</script>
<!--#include virtual="/rules/setBody.html"-->