<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>左边菜单</title>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style></head>

<body>
<s:if test="#session.ADMIN != 'kefu'">
<p><a href="/web/newsSearch!getSearchList" target="mainFrame">新闻管理</a></p>
<p><a href="/web/newsCategory!getCategory" target="mainFrame">分类管理</a></p>
<p><a href="/web/newsChannel!getNewsChannelList" target="mainFrame">频道管理</a></p>
<p><a href="add_right_website.jsp" target="mainFrame">站点管理</a></p>
<p><a href="/web/newsTemplate!getAllNewsTemplate" target="mainFrame">模版管理</a></p>
<p><a href="/web/news!getSearchList" target="mainFrame">测试连接</a></p>
<s:if test="#session.ADMIN_SESSION.role_id==-1"> <p><a href="adminadd.jsp" target="mainFrame">创建管理员</a></p></s:if>
<p><a href="htmlManager.jsp" target="mainFrame">静态页生成管理</a></p>
<p><a href="webProCopy.jsp" target="mainFrame">站点拷贝管理</a></p>
<p><a href="/web/customSearch!getCustomSearchList" target="mainFrame">客户留言管理</a></p>
<p><a href="/web/phraseLibrary!SearchLIst" target="mainFrame">词组管理</a></p>
</s:if>
<s:else>
<p><a href="/web/newsChannel!getNewsChannelList" target="mainFrame">频道管理(客服同事不要操作)</a></p>
<p><a href="/web/customSearch!getCustomSearchList" target="mainFrame">客户留言管理</a></p>
</s:else>
</body>
</html>
