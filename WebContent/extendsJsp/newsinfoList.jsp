<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.jrtcms.web.service.NewsService" %>
<%@ page import="com.jrtcms.web.pojo.News" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>

<%   
WebApplicationContext context = (WebApplicationContext)this.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);   
NewsService newservice = (NewsService)context.getBean("newsService"); 
//当前的站点id
//Long websiteId =Long.valueOf((String)session.getAttribute("ADMIN_WEBSITE"));
Long websiteId =Long.valueOf(request.getParameter("websiteId"));
//分类数组字符串
//String categoryzhs1="";
//News news= newservice.queryNewsByIdForObject(Long.valueOf(request.getParameter("Id")));

//获取新闻列表     	List<News> queryNewsInIdForList(Long channelId,Long categoryId,Integer topNews,Integer maxNum,Long websiteId);
List<News> newsInfoList = newservice.queryNewsInIdForList(Long.valueOf(request.getParameter("channel")), Long.valueOf(request.getParameter("category")),null,12,websiteId);

//查询分类的新闻信息的集合;
//Map<String, List> newsMap = service.queryNewsInCategoryNameZhsByChannelIdForMap(websiteId,categoryzh1 ,channelId,12);

//保存到requset
request.setAttribute("newsInfoList",newsInfoList);

//request.setAttribute("newsMap",newsMap);

%>