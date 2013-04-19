<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="s" uri="/struts-tags"%>
<head>
<base href="<%=basePath%>">
<title>如意彩_生成html测试</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script type="text/javascript" src="/jquery_jar/jquery.js"></script>
<script type="text/javascript">
function updateNewsTemplate(id){
	var type_input = "Tree_type_"+id;
	
	var type = $("select[name="+type_input+"]").val();

	var modelName = "newsTemplate";
	$.ajax({   
        url:'/web/newsTemplate!modify?'+modelName+'.id='+id+'&'+modelName+'.type='+type,   
        type:'post', //数据发送方式   
        dataType:'html', //接受数据格式   
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        error:function(html){alert( "保存失败!操作发生错误"+html);},  
        async: false ,  
        success: function(html){alert(html);}  
  });  
}
</script>
</head>
<body>

<table width="900px" border="0" cellspacing="3" >
  <tr>
    <td width="42%">模板名称</td>
    <td width="9%" align="center">类型</td>
    <td width="34%" align="center">操作</td>
  </tr>
  
 
<s:iterator id="nt" value="#request.newsTemplateList">
  <tr>
    <td>${nt.name}
      </td>
    <td align="center"><select name="Tree_type_<s:property value="#nt.id"/>">
      <option value="-1" <s:if test="#nt.type==-1" >selected</s:if>>默认模板</option>
      <option value="0" <s:if test="#nt.type==0" >selected</s:if>>首页模板</option>
      <option value="1" <s:if test="#nt.type==1" >selected</s:if>>频道模板</option>
      <option value="2" <s:if test="#nt.type==2" >selected</s:if>>分类模板</option>
      <option value="3" <s:if test="#nt.type==3" >selected</s:if>>新闻模板</option>
      <option value="4" <s:if test="#nt.type==4" >selected</s:if>>定时器模板</option>
      <option value="5" <s:if test="#nt.type==5" >selected</s:if>>通用模板</option>
      <option value="6" <s:if test="#nt.type==6" >selected</s:if>>引用模板</option>
      <option value="7" <s:if test="#nt.type==7" >selected</s:if>>频道分类联合模板</option>
    </select></td>
    <td><a href="/web/newsTemplate!delNewsTemplate?id=<s:property value="#nt.id"/>" onclick="return confirm('确实要删除该模板吗？')" >[ 删除  ]</a>
		<a href="javascript:updateNewsTemplate(<s:property value="#nt.id"/>)" >[ 保存  ]</a>
		 </td>
  </tr>
 </s:iterator> 
 	
</table>
<s:fielderror/>
<form name="myform" action="<%=basePath%>web/newsTemplate!uploadTemplate" enctype="multipart/form-data" method="post" >
			<input type="file" name="upload"/>
   			<input type="submit" value="上传"/>
</form>
<p><a href="/web/newsTemplate!getAllNewsTemplate">刷新查看上传的模版</a></p>
</body>
</html>