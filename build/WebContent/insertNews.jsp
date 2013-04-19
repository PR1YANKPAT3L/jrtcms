<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>如意彩_新闻频道管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="">
<meta http-equiv="description" content="">
<script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>

<p>
        <label for="">生成时间从：</label>
        <input type="text"  class="Wdate" name="datestart" readonly="readonly"  onClick="WdatePicker()">
        到<input type="text" class="Wdate" name="dateend" readonly="readonly"  onClick="WdatePicker()">
      </p>
 <form action="<%=basePath%>web/newsInfo!insertNewsInfo" method="post">
    <p>      
            新闻标题：
	<input type="text" name="newsInfo.title" /></p>
    <p>
            新闻内容：
	<input type="text" name="newsInfo.content" /></p>
    <p>
            分类id：
	<input type="text" name="newsInfo.category_code" /></p>
    <p>
            频道id：
	<input type="text" name="newsInfo.channel_id" /></p>
	<p>
       <input type="submit" value="提交" />
    </p>
</form>
 <form action="<%=basePath%>web/newsInfo!getNewsInfoList" method="post">
    <p>      
            当前页数：
	<input type="text" name="nowPage" /></p>
    <p>
           显示条数：
	<input type="text" name="limitCount" /></p>
	<p>
       <input type="submit" value="提交" />
    </p>
</form>
</body>
</html>