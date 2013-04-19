<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新闻展示分类 </title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=basePath%>dtree.css"/>
<script type="text/javascript" src="<%=basePath%>jquery_jar/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>dtree.js"></script>
<script type="text/javascript">
function aa(id){
	alert(id);
}
</script>
</head>
<body> 
   <div class="dtree">
	<script type="text/javascript">
		tree = new dTree('tree');//创建一个对象.  
        $.ajax({   
                url:'web/newsCategory!selectCategory',   
                 type:'post', //数据发送方式   
                 dataType:'xml', //接受数据格式   
                error:function(json){  
                          alert( "not lived!");  
                       },  
                async: false ,  
                 success: function(xml){  
                            $(xml).find("node").each(function(){   
                                   var nodeId=$(this).attr("nodeId");    
                                   var parentId=$(this).attr("parentId");    
                                   var name_cn=$(this).attr("name_cn");    
                                   var nodeName=$(this).text();   
                                  tree.add(nodeId,parentId,nodeName,"javascript:aa("+nodeId+")","","","","",false);  
                              });  
                         }  
          });  
		document.write(tree);
	</script>
</div>
</body>
</html>