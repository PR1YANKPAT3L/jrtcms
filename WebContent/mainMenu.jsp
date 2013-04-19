<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻发布系统菜单</title>
<style type="text/css">
*{margin:0;padding:0;border:0;}
body {
 font-family: arial, 宋体, serif;
 font-size:12px;
}
#nav {
 width:209px;
    line-height: 24px; 
 list-style-type: none;
    /*定义整个ul菜单的行高和背景色*/
}
/*==================一级目录===================*/
#nav a {
 width: 189px; 
 display: block;
 padding-left:20px;
 /*Width(一定要)，否则下面的Li会变形*/
}
#nav li {
text-align:left;
 background:#CCC; /*一级目录的背景色*/
 border-bottom:#FFF 1px solid; /*下面的一条白边*/
 width:209px;
 float:left;
 /*float：left,本不应该设置，但由于在Firefox不能正常显示
 继承Nav的width,限制宽度，li自动向下延伸*/
}
#nav li a:hover{
 background:#CC0000; /*一级目录onMouseOver显示的背景色*/
}
#nav a:link  {
 color:#666; text-decoration:none;
}
#nav a:visited  {
 color:#666;text-decoration:none;
}
#nav a:hover  {
 color:#FFF;text-decoration:none;font-weight:bold;
}
/*==================二级目录===================*/
#nav li ul {
 list-style:none;
 text-align:left;
}
#nav li ul li{ 
 background: #EBEBEB; /*二级目录的背景色*/
}
#nav li ul a{
         padding-left:20px;
         width:189px;
 /* padding-left二级目录中文字向右移动，但Width必须重新设置=(总宽度-padding-left)*/
}
/*下面是二级目录的链接样式*/
#nav li ul a:link  {
 color:#666; text-decoration:none;
}
#nav li ul a:visited  {
 color:#666;text-decoration:none;
}
#nav li ul a:hover {
 color:#F3F3F3;
 text-decoration:none;
 font-weight:normal;
 background:#CC0000;
 /* 二级onmouseover的字体颜色、背景色*/
}
/*==============================*/
#nav li:hover ul {
 left: auto;
}
#nav li.sfhover ul {
 left: auto;
}
#content {
 clear:both; 
}
#nav ul.collapsed {
 display: none;
}
</style>
<script type="text/javascript" >
var LastLeftID = "";

function menuFix()
{
    var obj = document.getElementById("nav").getElementsByTagName("li");

    for (var i=0; i<obj.length; i++)
    {
        obj[i].onmouseover=function()
            {
                this.className+=(this.className.length>0? " ": "") + "sfhover";
            }
        obj[i].onMouseDown=function()
            {
                this.className+=(this.className.length>0? " ": "") + "sfhover";
            }
        obj[i].onMouseUp=function()
            {
                this.className+=(this.className.length>0? " ": "") + "sfhover";
            }
        obj[i].onmouseout=function()
            {
                this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
            }
    }
}

function DoMenu(emid)
{
    var obj = document.getElementById(emid); 
    obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
    LastLeftID = emid;
}

function GetMenuID()
{
    var MenuID="";
    var _paramStr = new String(window.location.href);
    var _sharpPos = _paramStr.indexOf("#");
    
    if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
    {
        _paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
    }
    else
    {
        _paramStr = "";
    }

    if (_paramStr.length > 0)
    {
        var _paramArr = _paramStr.split("&");
        if (_paramArr.length>0)
        {
            var _paramKeyVal = _paramArr[0].split("=");
            if (_paramKeyVal.length>0)
            {
                MenuID = _paramKeyVal[1];
            }
        }
    }

    if(MenuID!="")
    {
        DoMenu(MenuID)
    }
}
GetMenuID(); //*这两个function的顺序要注意一下，不然在Firefox里GetMenuID()不起效果
menuFix();
DoMenu('ChildMenu2');
</script>
</head>
<body >
<ul id="nav">
        <li><a href="javascript:DoMenu('ChildMenu2')"><b>后台管理</b></a>
            <ul id="ChildMenu2" class="collapsed">
            	<li><a href="index.jsp" target="content">新闻频道管理</a></li>
            	<li><a href="index.jsp" target="content">新闻分类管理</a></li>
            	<li><a href="index.jsp" target="content">新闻分类和频道关联</a></li>
                <li><a href="index.jsp" target="content">新闻管理</a></li>
                <li><a href="index.jsp" target="content">生成THML静态页管理</a></li>
                <li><a href="index.jsp" target="content">模板管理</a></li>
                <li><a href="index.jsp" target="content">系统属性管理</a></li>
                <li><a href="index.jsp" target="content">站点URL管理</a></li>
            </ul>
        </li>
        
    </ul>
</body>
</html>