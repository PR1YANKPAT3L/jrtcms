<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.jrtcms.web.service.NewsService" %>
<%@ page import="com.jrtcms.web.service.NewsCategoryService" %>
<%@ page import="com.jrtcms.web.pojo.News" %>
<%@ page import="com.jrtcms.web.model.NewsMD" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>
<%   
WebApplicationContext context = (WebApplicationContext)this.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE); 
NewsCategoryService categoryservice=(NewsCategoryService)context.getBean("newsCategoryService");
Long channelId=Long.valueOf(request.getParameter("channelId"));
Long categoryId=Long.valueOf(request.getParameter("categoryId"));
Integer topNews=Integer.valueOf(request.getParameter("topNews"));
Integer maxNum=Integer.valueOf(request.getParameter("maxNum"));
Long websiteId=Long.valueOf(request.getParameter("websiteId"));
String categoryNameZh=request.getParameter("categoryNameZh");
//获取新闻列表
List categoryList=categoryservice.queryCategoryByNameCn(websiteId,categoryNameZh);
Map<String, List> newsMap = categoryservice.queryNewsInfByCategoryNameZhsForMap(websiteId,categoryNameZh ,null,20);
//保存到requset
request.setAttribute("categoryList",categoryList);
request.setAttribute("newsMap",newsMap);
%>