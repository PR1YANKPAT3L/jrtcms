<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
body,td,th {
	font-size: 12px;
}
-->
</style>
</head>
<script language="javascript" type="text/javascript" src="/jquery_jar/jquery.js"></script>
<script  language="javascript" type="text/javascript">
$(function(){
	$("#web_pro_id").change(function(){
		//alert('/web/webPro!transferWebSite?web_pro_id='+$("#web_pro_id").val());S
		var role_id = $("#admin_role").val();
		if(role_id == -1){
			$.ajax({   
		        url:'/web/webPro!transferWebSite?web_pro_id='+$("#web_pro_id").val(),   
		        type:'post', //数据发送方式   
		        dataType:'html', //接受数据格式   
		        contentType: "application/x-www-form-urlencoded; charset=utf-8",
		        error:function(html){alert("切换站点失败");},  
		        async: false ,  
		        success: function(html){parent.mainFrame.location.reload();} 
			});
		}else{
			alert("您不是超级管理员，不能切换站点");
			parent.mainFrame.location.reload();
		}
	});
});
</script>
<body>
<input type="hidden" id="admin_role" value="<s:property value="#session.ADMIN_SESSION.role_id"/>"/>
<p>管理员：${sessionScope.ADMIN}&nbsp;&nbsp;<a href="/updatepwd.jsp" target="mainFrame">[修改密码]</a> &nbsp;&nbsp;<a href="update_right_website.jsp" target="mainFrame">[编辑站点]</a> &nbsp;&nbsp;&nbsp;<a href="/web/admin!logout"/ target="_top"> [退出]</a><br />
  <s:if test="#session.ADMIN_SESSION.role_id==-1"> <select id="web_pro_id" name="web_pro_id">
	<% request.setAttribute("web_pros",com.jrtcms.listener.propertys.InitWebsitePropertys.getWpsListMap());
	%>
	<s:iterator id="wp" value="#request.web_pros" >
		${wp.key}
		<option value="${wp.key}" <s:if test="#session.ADMIN_WEBSITE==#wp.key">selected</s:if> >${wp.value.name_cn}</option>
	</s:iterator>
  </select> 
  </s:if>
  <br />
事例解说：每个管理员进入管理后台后，需要设置要管理的站点，将其保存到session中，在每次操作时所需站点数据时，直接从session中读取管理员管理的站点信息。 <br/>
<span class="STYLE1">注意：1.此演示中的javascript在开发时要转换为jquery。2.所有的请求（访问Action）都需要带操作参数，例如修改一个分类，在参数中要带有Operation=]001[。</span></p>

</body>

</html>
