<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="/WEB-INF/tangs.tld" prefix="tangs" %>
<!--#include virtual="/include/top_http.html"-->
<title>如意彩手机客户端下载</title>
<meta name="keywords" content="手机客户端下载，手机彩票客户端下载，如意彩手机客户端下载">
<meta name="description" content="如意彩手机客户端下载-为购彩用户提供掌上快捷的购彩平台！">
<link rel="stylesheet" type="text/css" href="/css/clientAll.css" />
<link rel="stylesheet" type="text/css" href="/css/util.css"  />
<script type="text/javascript" src="/js/jqueryJS/jquery-1.5.min.js"></script> 
<script type="text/javascript" src="/js/kuaiTouZhou.js" ></script>
</head>
<body>

<!--#include virtual="/include/top.html"-->
<div class="download_repeat_bg">
	<div class="download_contant">
		
		<div class="download_menu">
			<ul>
				<li><a href="javaScript:;"><img src="/images/btn_android_click.png" width="215" height="64" id="menubtn1" /></a></li>
				<li><a href="javaScript:;"><img src="/images/btn_iphone_normal.png" width="215" height="64" id="menubtn2" /></a></li>
				<li><a href="javaScript:;"><img src="/images/btn_symbian_normal.png" width="215" height="64" id="menubtn3" /></a></li>
				<li><a href="javaScript:;"><img src="/images/btn_kjava_normal.png" width="215" height="64" id="menubtn4" /></a></li>
			</ul>
		</div>
		<div class="dl_android" id="shouji_box1">
			<div class="dl_android_flash">
				<div id="oTransContainer" style="FILTER: progid:DXImageTransform.Microsoft.Wipe(GradientSize=1.0,wipeStyle=0, motion='forward'); WIDTH: 166px; HEIGHT: 300px">
					<img src="/images/android_01.jpg" width="166" height="300" class=pic id=oDIV1>
					<img src="/images/android_02.jpg" width="166" height="300" class=pic id=oDIV2 style="DISPLAY: none;">
					<img src="/images/android_03.jpg" width="166" height="300" class=pic id=oDIV3 style="DISPLAY: none;">
					<img src="/images/android_04.jpg" width="166" height="300" class=pic id=oDIV4 style="DISPLAY: none;">
					<img src="/images/android_05.jpg" width="166" height="300" class=pic id=oDIV5 style="DISPLAY: none;">
				</div>
			</div>
			<div class="dl_downbtn1"><a href="/downLoad/ruyicai_android_3.6.4_899_webguanwang.apk"><img src="/images/android_download.png" width="261" height="75" onmouseover="this.src='/images/android_download2.png'" onmouseout="this.src='/images/android_download.png'" /></a></div>
			<div class="dl_versiontxt">
				<p>最新版本：Android v3.6.4<br/>
					更新时间：2013-01-30</p>
				<p>适用于Android 1.6-4.3 ROM系统的机型，<br />
				包括Nexus one、HTC、Hero、MOTOMilestone等。</p>
			</div>
		</div>
		<div class="dl_apple" id="shouji_box2" style="display:none">
			<div class="dl_downbtn1"><a href="/downLoad/ruyicai_iPhone_3.6.4_793_web_ruyicai.ipa"><img src="/images/apple_download.png" width="209" height="55" onmouseover="this.src='/images/apple_download2.png'" onmouseout="this.src='/images/apple_download.png'" /></a></div>
			<div class="dl_versiontxt">
				<p>版本：3.6.4<br />
				更新日期：2013-01-30</p>
				<p>iphone,iphone 3G、
					iphone 3GS、iphone 4、iphone 5,ipod touch 3系统以上。</p>
			</div>
		</div>
		<div class="dl_symbian" id="shouji_box3" style="display:none">
			<div class="dl_downbtn1"><a href="/downLoad/ruyicai_S60_V5_1_2_web715.sisx"><img src="/images/symbian_download.png" width="209" height="55" onmouseover="this.src='/images/symbian_download2.png'" onmouseout="this.src='/images/symbian_download.png'" /></a></div>
			<div class="dl_versiontxt">
				<p>版本：1.2<br />
					更新日期：2012-08-02<br />
				</p>
				<p>s60v5版的手机，如诺基亚5230/5233/5250等机型</p>
			</div>
		</div>
		<div class="dl_kjava" id="shouji_box4" style="display:none">
			<div class="dl_downbtn1"><a href="/downLoad/ruyicai_N73.jar"><img src="/images/kjava_download.png" width="209" height="55" onmouseover="this.src='/images/kjava_download2.png'" onmouseout="this.src='/images/kjava_download.png'" /></a></div>
			<div class="dl_versiontxt">
				<p>版本：1.0<br />
				更新日期：2011-7-15</p>
				<p>诺基亚手机，如N73、E63等；
					其他品牌手机，如摩托E63，
				三星D508等；大部分国产手机。</p>
			</div>
		</div>
	</div>
</div>


<div class="download_ff2">
	<h1>方法2：通过手机上网下载安装</h1>
	<p> <strong>用手机登陆 wap.ruyicai.com 直接下载安装。</strong></p>
	<p> 打开您的手机浏览器，输入wap.ruyicai.com进入如意彩WAP网站页面，点击&ldquo;手机客户端下载&rdquo;。进入下载页面，选择与您的手机对应的手机品牌和型号，点击&ldquo;立即下载&rdquo;下载到您的手机中，安装后即可马上投注购彩。&nbsp; </p>
</div>
<script>
	var NowFrame = 1;
	var MaxFrame = 5;
	var bStart = 0;
	function fnToggle(){
		var next = NowFrame + 1;
		if(next == MaxFrame+1){NowFrame = MaxFrame;next = 1;}
		if(bStart == 0){bStart = 1;setTimeout('fnToggle()', 2000);
		return;}else{oTransContainer.filters[0].Apply();
		document.images['oDIV'+next].style.display = "";
		document.images['oDIV'+NowFrame].style.display = "none";
		oTransContainer.filters[0].Play(duration=2);
		if(NowFrame == MaxFrame){NowFrame = 1;}else{NowFrame++;}}
		setTimeout('fnToggle()', 3000);}
		$(function(){
			fnToggle();
			$("#menubtn1").click(function(){
				$("#shouji_box1").show();
				$("#shouji_box2").hide();
				$("#shouji_box3").hide();
				$("#shouji_box4").hide();
				$("#menubtn1").attr("src","/images/btn_android_click.png");
				$("#menubtn2").attr("src","/images/btn_iphone_normal.png");
				$("#menubtn3").attr("src","/images/btn_symbian_normal.png");
				$("#menubtn4").attr("src","/images/btn_kjava_normal.png");
			});
			$("#menubtn2").click(function(){
				$("#shouji_box1").hide();
				$("#shouji_box2").show();
				$("#shouji_box3").hide();
				$("#shouji_box4").hide();
				$("#menubtn1").attr("src","/images/btn_android_normal.png");
				$("#menubtn2").attr("src","/images/btn_apple_click.png");
				$("#menubtn3").attr("src","/images/btn_symbian_normal.png");
				$("#menubtn4").attr("src","/images/btn_kjava_normal.png");
			});
			$("#menubtn3").click(function(){
				$("#shouji_box1").hide();
				$("#shouji_box2").hide();
				$("#shouji_box3").show();
				$("#shouji_box4").hide();
				$("#menubtn1").attr("src","/images/btn_android_normal.png");
				$("#menubtn2").attr("src","/images/btn_iphone_normal.png");
				$("#menubtn3").attr("src","/images/btn_symbian_click.png");
				$("#menubtn4").attr("src","/images/btn_kjava_normal.png");
			});
			$("#menubtn4").click(function(){
				$("#shouji_box1").hide();
				$("#shouji_box2").hide();
				$("#shouji_box3").hide();
				$("#shouji_box4").show();
				$("#menubtn1").attr("src","/images/btn_android_normal.png");
				$("#menubtn2").attr("src","/images/btn_iphone_normal.png");
				$("#menubtn3").attr("src","/images/btn_symbian_normal.png");
				$("#menubtn4").attr("src","/images/btn_kjava_click.png");
			});
			
		});
</script> 
<!--#include virtual="/include/footer_noindex.html" -->
<!--#include virtual="/rules/setBody.html"-->