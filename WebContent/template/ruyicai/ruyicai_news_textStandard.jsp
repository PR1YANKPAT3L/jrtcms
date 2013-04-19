<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="tangs" uri="/WEB-INF/tangs.tld"%> 
<%@taglib prefix="s" uri="/struts-tags" %>
<!--#include virtual="/include/top_http.html"-->
<title>如意彩-格式标准</title>
</head>
<body>
<tangs:ryc_newslist  value="7"  begin="0" end="1" newsId="%{#parameters.newsId[0]}" >
${content}
</tangs:ryc_newslist>
<!--#include virtual="/rules/setBody.html"-->
