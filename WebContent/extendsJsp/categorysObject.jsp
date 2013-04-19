<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.jrtcms.web.pojo.*"%>
<%@page import="com.jrtcms.web.service.NewsCategoryService"%>
<%@ page import="java.util.List" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>

<%   
WebApplicationContext context = (WebApplicationContext)this.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);   
NewsCategoryService categoryService = (NewsCategoryService)context.getBean("newsCategoryService"); 
//获取新闻列表
NewsCategory category = categoryService.queryCategoryByCode(Long.valueOf((String)request.getParameter("pcode")));
//保存到requset
request.setAttribute("category",category);

%>
