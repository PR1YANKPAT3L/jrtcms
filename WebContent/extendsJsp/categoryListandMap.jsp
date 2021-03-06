<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.jrtcms.web.model.NewsCategoryMD"%>
<%@page import="com.jrtcms.web.service.NewsCategoryService"%>
<%@ page import="com.jrtcms.web.pojo.NewsCategory" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>
<%   
WebApplicationContext context = (WebApplicationContext)this.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);   
NewsCategoryService categoryService = (NewsCategoryService)context.getBean("newsCategoryService"); 
//Long websiteId =Long.valueOf((String)session.getAttribute("ADMIN_WEBSITE"));
//站点ID
Long websiteId =Long.valueOf(request.getParameter("websiteId"));
//当前的一级分类英文名
String categoryNameZh=request.getParameter("categoryNameZh");

List categoryList = categoryService.queryCategoryByNameCn(websiteId,categoryNameZh);
Map<String,List> categorymap = categoryService.queryNewsInfByCategoryNameZhsForMap(websiteId,categoryNameZh,null,50);
request.setAttribute("categoryList1",categoryList);
request.setAttribute("categorymap1",categorymap);

%>
