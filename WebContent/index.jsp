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
<title>如意彩_新闻管理首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="">
<meta http-equiv="description" content="">
    <style type="text/css">  
        h1{color:Green;}  
        body{ background-color:#EEEEEE ; }  
        .list{  
                background:#EEEEEE none repeat scroll 0 0;  
                border-top:1px solid #CCCCCC;  
                padding:5px 10px;  
                width:300px;  
              }  
        .del{  
                 color:Blue;  
                 display:block;  
                 float:right;  
                 width:35px;  
            }  
     </style>  
     <script type="text/javascript" src="<%=basePath%>jquery_jar/jquery.min.js"></script>  
     <script type="text/javascript">  
         $(document).ready(function() {  
             $(".del").click(function() {  
                var $p = $(this).parent();  
                 var $this = $(this);  
                $.ajax({  
                     type: "post",  
                     url: "web/newsCategory!deleteCategory",  
                     //得到id  
                    data: { code: $this.attr("id").replace('del-', '') },  
                     beforeSend: function() {  
                        //发送请求前改变背景色  
                         $p.css("backgroundColor", "#FB6C6C");  
                    },  
                     success: function() {  
                         //删除成功  
                         $p.slideUp(300, function() {  
                            //移除父级div  
                            $p.remove();  
                         });  
                     }  
                 });  
        //阻止浏览器默认事件  
         return false;  
             });  
         });  
     </script>  
</head>
<body>
 <form action="<%=basePath%>web/newsCategory!createCategory" method="post">
    <p>
            新闻父编号：
	<input type="text" name="newsCategoryMD.pcode" /></p>
    <p>
            英文名称：
	<input type="text" name="newsCategoryMD.name_zh" /></p>
    <p>
            中文名称：
	<input type="text" name="newsCategoryMD.name_cn" /></p>
    <p>
            排序：
	<input type="text" name="newsCategoryMD.sequence" /></p>
	<p>
       <input type="submit" value="提交" />
    </p>
</form>
<form action="<%=basePath%>web/newsCategory!getCategoryByPcode" method="post">
    <p>
            新闻父编号：
	<input type="text" name="pcode" /></p>
    <p>
       <input type="submit" value="提交" />
    </p>
</form>
<div>  
        <h1>jQuery ajax删除</h1>  
        <div class="list">  
             <a id="del-1" class="del" href="#">删除</a>  
            <strong>新闻标题1</strong>  
         </div>  
             <div class="list">  
            <a id="del-2" class="del" href="#">删除</a>  
             <strong>新闻标题2</strong>  
         </div>  
     </div>  

</body>
</html>