<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.UUID" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>创建管理员</title>
<script src="/jquery_jar/formValidator/jquery_last.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="/jquery_jar/formValidator/style/validator.css"></link>
<script src="/jquery_jar/formValidator/formValidator.js" type="text/javascript" charset="UTF-8"></script>
<script src="/jquery_jar/formValidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript"> 
$(document).ready(function(){
	
	$.formValidator.initConfig({formid:"addadmin",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
	$("#username").formValidator({onshow:"请输入用户名",onfocus:"用户名至少1个字符,最多20个字符",oncorrect:"该用户名可以注册"}).inputValidator({min:1,max:20,onerror:"你输入的用户名非法,请确认"}).regexValidator({regexp:"username",datatype:"enum",onerror:"用户名格式不正确"})
    .ajaxValidator({ 
    type : "get",
	url : "web/admin!validateUserName?uuid=randomUUID()+'&'+'username='username",
	datatype : "html",
	success : function(html){	
        if( html == "0" )
		{
            return true;
		}
        else
		{
            return false;
		}
	},
	buttons: $("#button"),
	error: function(){alert("服务器没有返回数据，可能服务器忙，请重试");},
	onerror : "该用户名已被占用，请更换用户名",
	onwait : "正在对用户名进行合法性校验，请稍候..."
});

	
	$("#password").formValidator({onshow:"请输入密码",onfocus:"密码不能为空",oncorrect:"密码合法"}).inputValidator({min:1,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"密码两边不能有空符号"},onerror:"密码不能为空并且为1-20个字符之间,请确认"});
	$("#confpwd").formValidator({onshow:"请输入重复密码",onfocus:"两次密码必须一致",oncorrect:"密码一致"}).inputValidator({min:1,empty:{leftempty:false,rightempty:false,emptyerror:"重复密码两边不能有空符号"},onerror:"重复密码不能为空,请确认"}).compareValidator({desid:"password",operateor:"=",onerror:"2次密码不一致,请确认"});
	$("#description").formValidator({onshow:"请输入管理员的描述信息",onfocus:"描述至少要输入1个汉字或20个字符",oncorrect:"输入正确",defaultvalue:"请输入描述信息"}).inputValidator({min:1,onerror:"你输入的描述信息长度不够,请确认"});
		

	
});


</script>
</head>
<body>
<form action="/web/admin!createAdmin" method="post" id="addadmin">
<table border="0px" style="font-size:12px" width="630px">
<tr>
<td align="right">管理员名称：</td>
<td ><input type="text" name="user.login_name" id="username"/> </td>
<td><div id="usernameTip" style="width:250px"></div></td>
</tr>
<tr>
<td align="right"> 密码：</td>
<td ><input type="password" name="user.login_password" id="password" /></td>
<td><div id="passwordTip" style="width:250px"></div></td>
</tr>
<tr>
<td align="right"> 重复密码：</td>
<td ><input type="password" name="confpwd" id="confpwd" /></td>
<td><div id="confpwdTip" style="width:250px"></div></td>
</tr>
<tr>
 <td align="right">权限选择(管理站点)：</td>
 <td ><select name="user.role_id">
	<% request.setAttribute("web_pros",com.jrtcms.listener.propertys.InitWebsitePropertys.getWpsListMap());%>
	<s:iterator id="wp" value="#request.web_pros" >
		<option value="${wp.key}">${wp.value.name_cn}</option>
	</s:iterator>
	</select>
	</td>
</tr>
<!--  
<tr>
 <td align="right">权限描述：</td>
<td> <input type="text" name="user.description" id="description" /></td>
<td><div id="descriptionTip" style="width:250px"></div></td>
</tr>
-->
<tr> 
 <td align="right" valign="top">权限描述:</td>
 <td  valign="top"> <textarea   rows="10" name="user.description" id="description"></textarea> </td>
 <td ><div id="descriptionTip" style="width:250px"></div></td>
 </tr>
</table>
<br/>
<input type="submit" value="创建" name="button" id="button"/></form>

</body>
</html>