<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="tangs" uri="/WEB-INF/tangs.tld" %>
<script type="text/javascript" src="/js/jcarousellite_1.0.1c5.js"></script>
<!-- 首页头部 -->
    <div id="header">
		<!--#include virtual="/include/top_daohang.html" -->
		<div class="title">
            <div class="tnav">
           <div class="logo" id="logo"><script>$(function(){toplogo();});</script></div>
            <div class="nav">
                 <div class="navbjcenter">
                   
                     
                        <span class="noline1" ><a href="/index.html" title="首页" ><span >首页</span></a></span>
                       <span class="line"><a href="/include/goucaidating.html" title="购彩大厅" ><span >购彩大厅</span></a></span>
                        <span class="line"><a href="/chlw/function/ryc_select_newkj!drawalottery" title="开奖公告" target="_blank"><span>开奖公告</span></a></span>
                        <span class="line"><a href="http://tbzs.ruyicai.com" title="数据图表" target="_blank"><span class="navbjhover">数据图表</span></a></span>
                        <span class="line"><a href="/xinwenzixun.html" title="热点资讯" target="_blank"><span>热点资讯</span></a></span>
                        <ul class="footballList">
							<li class="light"><a class="footballListTab" href="javaScript:;" title="足彩中心">足彩中心</a>
								<ul style="z-index:999;">
									<li><a class="light" href="" title=""><b class="HomePageBGBox ListFootball">&#160;</b>即时比分<span></span></a></li>
									<li><a class="light" href="" title=""><b class="HomePageBGBox ListFootballpeilv">&#160;</b>即时赔率</a></li>
									<li><a class="light" href="" title=""><b class="HomePageBGBox ListFootballnews">&#160;</b>足球资料库</a></li>
									<li><a class="light" href="/zucai/zucai__1.html" title=""><b class="HomePageBGBox ListFootzhuanjia">&#160;</b>专家预测</a></li>
								</ul>
							</li>
						</ul>
                   
                    </div>
			<div class="navbjright"></div>
            </div>
            <div class="navright">
             <a href="#" title="热线电话" class="HomePageBGBox TopPhoneNumber">&#160;</a>
             <!--#include virtual="/rules/top_qq.html"--></div>
           </div><!--  首页顶部滑动新闻模块 start  -->
			<div class="rollingNews">
				<div class="rollingNewsLeft"></div>
				<div class="rollingNewsMiddle">
					<div class="rollingNewsSlide">
						<ul>
						<tangs:ryc_newslist web_id="2" istopNews="1" value="3" num="5" categoryCn="专家推荐">
						<li><a href="${url}" title="${title }">${title}</a></li>
							
							</tangs:ryc_newslist>
						</ul>
					</div>
				</div>
				<div class="rollingNewsRight"></div>
			</div>
			<script>
			$(function() {
				$(".rollingNewsSlide").jCarouselLite({
					speed: 600,
					visible: 3,
					auto: 5000,
					mouseWheel: true
				});
			});
			</script>
			<!--  首页顶部滑动新闻模块 end  -->
            </div>
            <input type="hidden" value="" name="tishi" id="tishi"> 
	</div>