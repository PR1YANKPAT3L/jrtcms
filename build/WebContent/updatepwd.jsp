<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<script src="/jquery_jar/formValidator/jquery_last.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="/jquery_jar/formValidator/style/validator.css"></link>
<script src="/jquery_jar/formValidator/formValidator.js" type="text/javascript" charset="UTF-8"></script>
<script src="/jquery_jar/formValidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript"> 
$(document).ready(function(){
	$.formValidator.initConfig({formid:"modifypwd",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
	$("#pwd").formValidator({onshow:"请输入原始密码",onfocus:"请输入原始密码",oncorrect:"输入正确"}).inputValidator({min:1,empty:{leftempty:false,rightempty:false,emptyerror:"密码两边不能有空符号"},onerror:"密码不能为空,请确认"});
	$("#changpwd").formValidator({onshow:"请输入密码",onfocus:"密码不能为空",oncorrect:"密码合法"}).inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"密码两边不能有空符号"},onerror:"密码不能为空并且为6-20个字符之间,请确认"});
	$("#confpwd").formValidator({onshow:"请输入重复密码",onfocus:"两次密码必须一致",oncorrect:"密码一致"}).inputValidator({min:1,empty:{leftempty:false,rightempty:false,emptyerror:"重复密码两边不能有空符号"},onerror:"重复密码不能为空,请输入"}).compareValidator({desid:"changpwd",operateor:"=",onerror:"重复密码不一致,请重新输入"});
		

	
});


</script>
</head>
<body>
<form action="/web/admin!modifyPwd" method="post" id="modifypwd">
<table border="0px" style="font-size:12px" width="630px">
<tr>
<td align="right">原始密码：</td>
<td ><input type="password" name="pwd" id="pwd" value="" /></td>
<td><div id="pwdTip" style="width:250px"></div></td>
</tr>
<tr>
<td align="right">新密码：</td>
<td ><input type="password" name="changpwd" id="changpwd"/></td>
<td><div id="changpwdTip" style="width:250px"></div></td>
</tr>
<tr>
<td align="right">重复密码：</td>
<td ><input type="password" name="confpwd" id="confpwd"></td>
<td><div id="confpwdTip" style="width:250px"></div></td>
</tr>
</table>
<br/>
<input type="submit" value="修改密码" name="button" id="button"/>

</form>
</body>
</html>