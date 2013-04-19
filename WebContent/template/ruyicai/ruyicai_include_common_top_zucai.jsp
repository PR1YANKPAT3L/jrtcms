<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="tangs" uri="/WEB-INF/tangs.tld" %>
<script type="text/javascript" src="/js/jcarousellite_1.0.1c5.js"></script>
<div id="header">
		<div class="maintop">
		<div class="top0">
				<ul>
					<li class="setindex"><a href="javaScript:setHomepage();" title="设为首页">设为首页</a></li>
					<li class="addfor"><a href="javaScript:addCookie();" title="加入收藏">加入收藏</a></li>
				</ul>
			</div>
			<div  id="top_user"><script>$(function(){topZuCaiLogin();});</script></div>
			<div class="top2">
				<ul>
					<li><a href="/bangzhuzhongxin.html" title="帮助中心" target="_blank">&nbsp;&nbsp;帮助中心　</a>|</li>
					<li><a href="/rules/customesService.html" title="客服中心" target="_blank">客服中心</a></li>
				</ul>
			</div>
		</div>
		<div class="title">
            <div class="tnav">
            <div class="logo"> <a href="/index.html"><img src="/images/logo1.gif" width="230" height="51" /></a></div>
            <div class="nav">
                          <div class="navbjcenter">
                       <span class="noline1" ><a href="/index.html" title="首页" ><span >首页</span></a></span>
                       <span class="line"><a href="/include/goucaidating.html" title="购彩大厅" ><span >购彩大厅</span></a></span>
                        <span class="line"><a href="/chlw/function/ryc_select_newkj!drawalottery" title="开奖公告" target="_blank"><span>开奖公告</span></a></span>
                        <span class="line"><a href="http://tbzs.ruyicai.com" title="数据图表" target="_blank"><span>数据图表</span></a></span>
                        <span class="line"><a href="/xinwenzixun.html" title="热点资讯" target="_blank" ><span >热点资讯</span></a></span>
                        <span class="line"><a href="javaScript:;" title="足彩中心" target="_blank" ><span class="navbjhover">足彩中心</span></a></span>
                    </div>
			<div class="navbjright"></div>
            </div>
            <div class="navright">
             <a href="#" title="热线电话" class="HomePageBGBox TopPhoneNumber">&#160;</a>
             <!--#include virtual="/rules/top_qq.html"--></div>
            </div>
            <div class="gundong">
                 <div class="gundongleft"></div>
                 <div class="gundongzhong">
				 	<ul class="footballNav">
			            <li><a class="light" href="" title="">即时比分</a></li>
						<li><a class="light" href="" title="">即时赔率</a></li>
						<li><a class="light" href="" title="">足球资料库</a></li>
						<li><a class="light" href="/zucai/zucai__1.html" title="">专家预测</a></li>
					</ul>

				</div>
                 <div class="gundongright"></div>
                 </div>
            <input type="hidden" value="" name="tishi" id="tishi"> 
            </div>
		</div>
<script>
var flag=0;
function add(pname,img){
 $("#"+pname).toggle();
 if( flag==1){

  $("#"+img).attr("src","/images/dhxlbtn1.gif");
    flag=0;
}else {

	  $("#"+img).attr("src","/images/dhxlbtn2.gif");
	  flag=1;
	 }
}

</script>