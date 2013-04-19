<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="tangs" uri="/WEB-INF/tangs.tld" %>
<%@taglib prefix="s" uri="/struts-tags" %>
 <script>$.ajax({
	    type: "get",
	    url: "/chlw/function/cooperation/index_coop_top.jsp?"+Math.random(),
	    dataType: "html",
	    success: function(msg){
		 $('#common').html(msg);
	     $(".ButtonHomePage").addClass("selected");
	}
	});</script>
 <span id="common"></span>
 