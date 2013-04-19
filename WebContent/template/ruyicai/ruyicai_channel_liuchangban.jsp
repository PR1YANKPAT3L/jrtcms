<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="tangs" uri="/WEB-INF/tangs.tld"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!--#include virtual="/include/top_http.html"-->
<title>如意彩六场半全投注、开奖公告、赛事前瞻、预测汇总</title>
<meta http-equiv="keywords" content="六场半全投注，开奖公告，赛事前瞻，预测汇总"/>
<meta http-equiv="description" content="如意彩六场半全集投注、开奖公告、赛事前瞻、预测汇总为一体是六场半全一站式服务平台。"/>
<link type="text/css" href="/css/util.css" rel="stylesheet" />
<link type="text/css" href="/css/touzhuAll.css" rel="stylesheet" />
<script type="text/javascript" src="/js/jqueryJS/jquery-1.5.min.js"></script>
<script type="text/javascript" src="/js/jqueryJS/ajaxfileupload.js"></script>
<script type="text/javascript" src="/js/jqueryJS/jquery.jmpopups-0.5.1.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/public_touZhu.js"></script>
<script type="text/javascript" src="/js/jqueryJS/timeEnd.js"></script>
<script type="text/javascript" src="/js/zucai/zucai.js"></script>
<script type="text/javascript" src="/js/upload.js"></script>
<%/**	
<script type="text/javascript">
	var i = 1000 * 60 * 60; //总刷新的局限
	var j = 1000; //初始多少毫秒刷新
	var k = 1000 * 60 * 3; //间隔多少毫秒后刷新
	 function flashLottery() {
		reHtml(45, 'lotno=T01006', false, 'batchCodeHtmlCore', 'false');
		reHtml(30, 'lotno=T01006&inssuenum=10', false, 'nightdrawalottery',
				'false');

	}
	for (j = 1000; j <= i;) {
		setTimeout("flashLottery()", j);
		j = j + k;
	}
</script>*/ %>
<script type="text/javascript">
$(document).ready(function () {
	//cleanReady6();
	getIssueByLotNo('T01006');
});
</script>
</head>

<body>
<div id="body">
	<!--#include virtual="/include/top_nav.html"-->
	<div id="main">
		<div class="touzhu">
			<div class="zucai_left">
			<div class="footballgonggao" id="footballgonggao">
				<%/* <script>$(function(){reHtml(54,'lotno=T01006',false,'footballgonggao','true');});</script>*/ %>	
				<!--#include virtual="/kaijiang/liuchangban.html"-->	
            </div>
        
        
				<div class="footballgonggao">
				<div class="gonggao_top">本轮赛事前瞻</div>
          		<div class="footballtext">
                  <tangs:ryc_newslist web_id="2" categoryCn="赛事前瞻" channelCn="6场半全" value="3" num="1">
					${content}
					</tangs:ryc_newslist>
                </div>		
                </div>
                
                <%/** <div class="footballgonggao">
				<div class="gonggao_top">预测汇总</div>
          		<div class="footballtext">
                    <ul>
                    < tangs:ryc_newslist web_id="2" categoryCn="媒体推荐" channelCn="6场半全" value="3" num="10">
					<li><a href="${url}" title="${title}"  target="_blank"    >${title}</a></li>
					</ tangs:ryc_newslist>
                    </ul>
          		</div>	
                	
	</div>  */ %>
    <div class="footballpic"><img src="/images/footballpic.gif" width="211" height="125" /></div>
          </div>
          
		<div class="ChannelBuyHandleZC">
			<!--  ChannelBuyBanner start  -->
			<div class="ChannelBuyBanner">
				<ol style="background:url(/images/logo_zc_b.gif) no-repeat 15px 15px;">
			<li>
				<!-- 期号 截至时间  倒计时    开始 -->
				<script>$(function(){getZCBatchCode('T01006');});</script>
				<img src="/images/word_lcbq.gif" /><i>当前期第<strong id="qihao3">000000</strong><strong id="qihao2"></strong><strong id="qihao1"></strong>期　过程和结果同样重要　</i><span id="jinrikaijiangId"><!-- 此处会显示今日开奖小图标 --></span>
			</li>
			<li>
				截止时间：<font id="endTime"></font><em>还剩:<strong><font id="day">0</font>天<font id="hour">0</font>时<font id="minute">0</font>分<font id="second">0</font>秒</strong></em>
				<span class="qihaoSelectBox">期号查询
					<select id="issueSelect" name="" onchange="getFldate('T01006',this.options[this.options.selectedIndex].value,'cleanLiuchang','checkZhumaLiuchang','0','');setQiHao1();">
					</select>
					<span id="qihao" style="display: none;"></span>
					<script>
					$(function(){
						if($("#qihao3").text()!=""){
							$("#qihao").html($("#qihao3").text());
						}else if($("#qihao2").text()!=""){
							$("#qihao").html($("#qihao2").text());
						}else{
							$("#qihao").html($("#qihao1").text());
						}
						
					});
					function setQiHao1(){
						if(($("#qihao3").text()+","+$("#qihao2").text()+","+$("#qihao1").text()).indexOf($("#issueSelect").val())==-1){
							$("#qihao").html($("#qihao3").val());
						}else{
							$("#qihao").html($("#issueSelect").val());
						}
					};
					function setQiHao2(n){$("#qihao").html($("#qihao"+n).text());};
					</script>
				</span>
			</li>
		</ol>
		
		<div class="space10">&nbsp;</div>
		
		<!--  Tab start  -->
		<div class="ChannelBuyHandleMainTab" id="zucainavcon">
			<dl class="ChannelBuyTab">
				<dt class="light" onclick="window.location.href='/hemai/zcbanquanhemai.html'">参与合买</dt>
				<dt class="light selected" ControlTarget="BuyChoice" id="standard" onclick="switchDiv('zucai_area','zucai_danshi','T01006');">标准投注</dt>
				<dt class="light" ControlTarget="ChannelBuyUpload" onclick="switchDiv('zucai_danshi','zucai_area','T01006');">单式上传</dt>
				<dt class="light" onclick="window.location.href='/rules/user.html?key=0&view=ChildMenu2&style=menu2'">我的方案</dt>
				<dd>
					<a style="border:0px;" onmouseover="PopupOn($(this));" onmouseout="PopupOff($(this));" Offset="br,0,0" BoxStyle="width:200px;line-height:20px;" Content="<tangs:ryc_newslist categoryCn="玩法简介" channelCn="6场半全" value="3" web_id="%{#parameters.website_Properties_id[0]}" num="1"> <h3 style='line-height:26px;'>${title}</h3>${content}</tangs:ryc_newslist>" target="_blank" href='http://www.ruyicai.com/cms/a/bangzhuzhongxin/wanfajieshao/2012/0329/39.html?fid=36&id=39'>玩法介绍</a>
				</dd>
			</dl>
		</div>
		<!--  Tab end  -->
			
			</div>
		
		<!--  ChannelBuyBanner end  -->
		<div class="ChannelBuyHandleTabContent" style="width:728px;">
			<div class="space10"></div>
			<div class="BuyChoice none selected" id="zucai_area">
			<!--#include virtual="/chlw/function/zucai!getFlData?lotno=T01006"-->
			</div>
		
			<div id="zucai_danshi" class="ChannelBuyUpload none">
				<jsp:include page="/function/ruyicai_liuchangban/lcb_danshiUpload.jsp"/>
			</div>
		
			
		<form name="BettingForm" id="BettingForm" action="/chlw/user/bet!bettingByDipin" method="post">
			<div id="zucai_money" class="zucai_money">
				您选择了<span id="two" class="red">0</span>场双选，<span id="all" class="red">0</span>场全包，共
				<span id="lab_Num_standrad" class="red">0</span>注，
				<input onkeyup="checkZhumaLiuchang();" class="zucai_input" id="tb_Multiple_standrad" type="text" value="1"/>倍
				 金额：¥<span id="investField_standrad" class="red">0</span>元 <span
					class="zucai_xuan"><a href="javascript:void(0);" id="cleanSelect" title="清空所选" onclick="cleanLiuchang();">清空所选</a>
				</span>
			</div>
			<!--选号框-->
			<div id="xuanhaokuang" style="display: none;">
				<jsp:include page="/function/public_rtz.jsp"/>
			</div>
			<input type="hidden" id="lotNo" value="T01006" name="lotNo" />
			<input type="hidden" id="jsonString" name="jsonString" value="" /> 
			<input type="hidden" id="caiZhong" value="liuchangban" /> 
			<input type="hidden" id="path" name="path" value=""/> 
	        <input type="hidden" id="errorCode" name="errorCode" value=""/>
			<input type="hidden" id="dangqianwanfa" value="六场半"  />
			<input type="hidden" id="erjiwanfa" value="普通投注"  />
			<input type="hidden" id="goumaifangshi" value="代购"  />
			<input type="hidden" id="daiGouHemai" name="daiGou" value="daigou"  />
			<input type="hidden" id="jsonStringCLR" name="jsonStringCLR" value="" />
		</form>
		</div>	
			<!-- 六场半选号-->
		</div>
		<jsp:include page="/function/public_hemai_zuihao_zc.jsp"/>
		</div>
	</div>
    <!--#include virtual="/include/footer_noindex.html" -->
<!-- 弹出框 开始 -->
<jsp:include page="/function/public_touZhuAlert_liuchangban.jsp"></jsp:include>
<script type="text/javascript">hemaiInit();</script>
<!-- 弹出框 结束 -->
</div>
<script>
		//动态改变遮罩层的高度
		var tempHeight = $("#zucai_area").height() + $(".zucai_money").height() + $(".FollowNubFootball").height();
		$(".zucaitableceng").css("height",tempHeight);
	</script>
<!--#include virtual="/rules/setBody.html"-->