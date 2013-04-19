<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.jrtcms.web.service.NewsChannelService" %>
<%@ page import="com.jrtcms.web.model.NewsChannelMD" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="/js/util.js"></script>
</head>
<body>
<!-- 右侧频道列表功能页 -->
<jsp:include page="/extendsJsp/channelList.jsp" flush="true" >
<jsp:param value="<%=request.getParameter("website_Properties_id")%>" name="webSiteID"/>
</jsp:include>
  <div class="shsq_btn"><img src="/images/touzhu.gif" width="155" height="41" /><img src="/images/hemai1.gif" width="156" height="41" /></div>
	<div class="sjdb_content">
		<div><img src="/images/sjdb.gif" width="330" height="32" border="0" /></div>
		<div class="sjdb_list">
		     <s:set name="mapn1" value="#request.newschannelList[\"zucaiwshengfu\"]"></s:set>
            <s:set name="mapn2" value="#request.newschannelList[\"zucaidanchang\"]"></s:set>
            <s:set name="mapn3" value="#request.newschannelList[\"jingcaizuqiu\"]"></s:set>
          
            <s:set name="mapn4" value="#request.newschannelList[\"jingcailanqiu\"]"></s:set>
            
           <p><span>竞猜彩票</span> <span class="cp_list"><s:property value="#mapn1.name_cn"/> <s:property value="#mapn2.name_cn"/>   <s:property value="#mapn3.name_cn"/>
          <s:property value="#mapn4.name_cn"/></span></p>
            <s:set name="mapn5" value="#request.newschannelList[\"shuangseqiu\"]"></s:set>
            
            <s:set name="mapn6" value="#request.newschannelList[\"fucai3D\"]"></s:set>
          
            <s:set name="mapn7" value="#request.newschannelList[\"qilecai\"]"></s:set>
           
			<p><span>福利彩票</span> <span class="cp_list"><a href="/shuangseqiu.html"><s:property value="#mapn5.name_cn"/></a>  <a href="/fucai3D.html"><s:property value="#mapn6.name_cn"/></a> 
			<a href="/qilecai.html"><s:property value="#mapn7.name_cn"/></a></span></p>
			<s:set name="mapn9" value="#request.newschannelList[\"daletou\"]"></s:set>
            
            <s:set name="map1" value="#request.newschannelList[\"pailie3\"]"></s:set>
          
            <s:set name="map2" value="#request.newschannelList[\"pailie5\"]"></s:set>
           
            <s:set name="map3" value="#request.newschannelList[\"qixingcai\"]"></s:set>
          
			<p><span>体育彩票</span> <span class="cp_list"><a href="/daletou.html"><s:property value="#mapn9.name_cn"/></a>   <a href="/pailie3.html"><s:property value="#map1.name_cn"/></a> <s:property value="#map2.name_cn"/>
			  <s:property value="#map3.content"/></span></p>
			 <s:set name="map4" value="#request.newschannelList[\"shishicai\"]"></s:set>
            
            <s:set name="map5" value="#request.newschannelList[\"huanle8\"]"></s:set>
           
            <s:set name="map6" value="#request.newschannelList[\"qunyinghui\"]"></s:set>
            
             <s:set name="map7" value="#request.newschannelList[\"shiyiyunduojin\"]"></s:set>
           
			<p><span>十一运夺金</span> <span class="cp_list"><s:property value="#map7.name_cn"/>  <s:property value="#map4.name_cn"/> <s:property value="#map5.name_cn"/>  <s:property value="#map6.name_cn"/></span></p>
		</div>
	</div>
    
	
</body>
</html>
