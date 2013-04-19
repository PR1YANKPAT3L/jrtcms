<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.jrtcms.web.service.NewsInfoService" %>
<%@ page import="com.jrtcms.web.model.NewsInfoMD" %>
<%@ page import="java.util.List" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>index页</title>
</head>
<body>
<%   
WebApplicationContext context = (WebApplicationContext)this.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);   
NewsInfoService service = (NewsInfoService)context.getBean("newsInfoService"); 

//实例化对象
NewsInfoMD newsInfoMD = new NewsInfoMD();
//取参设置参数
newsInfoMD.setStatus(Integer.valueOf(request.getParameter("Status")));
newsInfoMD.setNowPage(Integer.valueOf(request.getParameter("NowPage")));
newsInfoMD.setLimitCount(Integer.valueOf(request.getParameter("LimitCount")));
//获取新闻列表
List newsInfoList = service.queryNewsInfo(newsInfoMD);
//保存到requset
request.setAttribute("newsInfoList",newsInfoList);
%>

</body>
</html>