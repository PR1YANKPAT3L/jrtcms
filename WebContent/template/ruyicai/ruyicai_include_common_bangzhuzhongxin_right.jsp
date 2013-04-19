<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="/WEB-INF/tangs.tld"  prefix="tangs"%>
<div class="main_left">
  	<div class="bt"><img src="/images/bangzhutop.gif" width="190" height="29"></div>
		<div id="PARENT">
			<ul id="nav">
			<tangs:ryc_newslist web_id="2" categoryCn="帮助中心" value="4">
			<li><a href="javascript:;" onclick="bangzhuTree(${code})" id="${code}"><span class="nochoose" id="choose_${code }">${name_cn}</span></a>
			 <ul id="ul_${code}" style="display:none" class="expanded">
			 <tangs:ryc_newslist categoryExpress="#attr['name_cn'] " web_id="2" value="5">
			 <li><a href="${url }?code1=${id }&code=${code}"   title="${title}" ><span id="title_${id }"   >${title}</span></a></li>
			 </tangs:ryc_newslist>
			 <tangs:ryc_newslist categoryExpress="#attr['name_cn'] " web_id="2" value="8">
			 <li><a href="/include/bangzhuzhongxin_list.html?code1=${code }&code=${pcode}"   title="${name_cn}" ><span id="title_${code }"   >${name_cn}</span></a></li>
			 
			 </tangs:ryc_newslist>
			 </ul>
			</li>
			</tangs:ryc_newslist>
			</ul>
	  </div>
       <div id="left_foot"><img src="/images/bangzhukefu.gif" width="190" height="95" /></div>
	</div>
<script type="text/javascript">
var flg="1";
function bangzhuTree(treeId){
	$("#ul_"+treeId).toggle();
	if($("#choose_"+treeId).attr("class")=="choose"){
		$("#choose_"+treeId).attr("class","nochoose");
		
	}else{
		$("#choose_"+treeId).attr("class","choose");
		;
	}};
	
$(function(){
		$("#ul_"+GetQueryString("code")).css("display","block");
		$("#choose_"+GetQueryString("code")).attr("class","choose");
		$("#zh_"+GetQueryString("code1")).css("display","block");
		$("#title_"+GetQueryString("code1")).attr("class","zhj_hover");
		flg="0";
	 });
  
	  
	  
</script>