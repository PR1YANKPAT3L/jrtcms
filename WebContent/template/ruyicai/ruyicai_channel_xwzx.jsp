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
    <tangs:ryc_newslist channelId="%{#parameters.channelId[0]}" value="14" web_id="%{#parameters.website_Properties_id[0]}">
    ${namech}
    </tangs:ryc_newslist></div>
   	<div class="zixunleft">
		<div class="zixun_nav">
		 <span class="ziXun_titleArrow">
		 	<tangs:ryc_newslist channelId="%{#parameters.channelId[0]}" value="14" web_id="%{#parameters.website_Properties_id[0]}">
    			${namech}
    		</tangs:ryc_newslist>
		 </span>
		<ul>
		 <tangs:ryc_newslist channelId="%{#parameters.channelId[0]}" value="14" web_id="%{#parameters.website_Properties_id[0]}">
		 	<tangs:ryc_newslist categoryId="%{#parameters.categoryId[0]}" value="9">
				 	 <tangs:ryc_newslist categoryExpress="#attr['pcode']" value="18" web_id="%{#parameters.website_Properties_id[0]}">
				
						<s:if test="#request.catId==#request.code">
							<li><a href="/${nameca }/${nameca}_${nameyw }_1.html" title="${namech }${namezg }" >
									<span  class="zixun_hover">
									<s:if test="#request.nameca.indexOf('tuijian')>-1">
									${namech }推荐
									</s:if><s:elseif test="#request.nameca.indexOf('jiqiao')>-1">
									${namech }技巧
									</s:elseif>
									<s:elseif test="#request.nameca.indexOf('zixun')>-1">
									${namech }新闻
									</s:elseif>
									</span></a></li>
									</s:if>	
									<s:else>
								<li><a href="/${nameca }/${nameca}_${nameyw }_1.html" title="${namech }${namezg }" >
									<s:if test="#request.nameca.indexOf('tuijian')>-1">
									${namech }推荐
									</s:if><s:elseif test="#request.nameca.indexOf('jiqiao')>-1">
									${namech }技巧
									</s:elseif>
									<s:elseif test="#request.nameca.indexOf('zixun')>-1">
									${namech }新闻
									</s:elseif>
							</a></li>	</s:else>
						</tangs:ryc_newslist>
						
				</tangs:ryc_newslist>	
		</tangs:ryc_newslist>
		</ul>
		</div>
		  <div class="zixunlist">
			  <div class="zixunlist1">    
	            <tangs:ryc_newslist  value="6" num="%{#parameters.begin[0]}" begin="0" end="20" web_id="%{#parameters.website_Properties_id[0]}" channelId="%{#parameters.channelId[0]}" categoryId="%{#parameters.categoryId[0]}" status="s1">
	              <ul class="ziXun_list">
	              <li>
	             <span class="zixun_nr"><font>[${title_as}]</font> <a href="${url}" title="${title}" target="_blank"  >${title}</a></span><span class="zixun_time">${createtimeFm}</span>
	             </li>
	                <s:if test="(#s1.getIndex()+1)%5==0 && !(#s1.last)">
	                </ul>
	                <div class="septalLine_spacing"></div>
	              </s:if><s:else></ul></s:else>
	             </tangs:ryc_newslist> 	            
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
				      <tangs:ryc_newslist value="3" begin="0" end="6"  channelCn="双色球" web_id="%{#parameters.website_Properties_id[0]}" num="6"  >
				    <li> <a href="${url}" title="${title}"  target="_blank">[${title_as}]${title}</a></li>
				     </tangs:ryc_newslist>
				     </s:else>
				</ul>
			</div>
			</div>
			<div class="jinri_kj1 ChannelBuyCurrent">
				<div class="jinri_top1"><span class="jinri_zi">图表走势</span><span class="web_more"><a href="http://tbzs.ruyicai.com">更多>></a></span></div>
				<div class="jinri_con">
				<ul style="overflow:hidden; padding:0 0 0 10px;">
				<s:if test="#request.channelCheck==0">
					 <tangs:ryc_newslist value="3" categoryCn="图表走势" web_id="%{#parameters.website_Properties_id[0]}"   num="6">
				  
						<li><a href="${url }" target="_blank">${title}</a></li>
						   </tangs:ryc_newslist>
						   </s:if>
						   <s:else>
						   <tangs:ryc_newslist value="12" categoryCn="频道走势图" web_id="%{#parameters.website_Properties_id[0]}"  channelId="%{#parameters.channelId[0]}" num="6">
				  
						<li><a href="${url }" target="_blank">${title}</a></li>
						   </tangs:ryc_newslist>
						  
						   </s:else>
						
				</ul>
			</div>
			</div>
	</div></div>
	</div>
 
   <!--#include virtual="/include/footer_noindex.html" -->
   </div>
<!--#include virtual="/rules/setBody.html"-->
