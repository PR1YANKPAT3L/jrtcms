	
function prnav(num){
for(var id = 0;id<=20;id++)
{
if(id==num)
{
document.getElementById("pr_nav"+id).className="pr_navon";
}
}
}
function outprnav(num){
for(var id = 0;id<=20;id++)
{
if(id==num)
{
document.getElementById("pr_nav"+id).className="pr_navoff";
}
}
}

function tabChange(obj,id)
{
var arrayli = obj.parentNode.getElementsByTagName("li"); //获取li数组
var arrayul = document.getElementById(id).getElementsByTagName("ul"); //获取ul数组
for(i=0;i<arrayul.length;i++)
{
if(obj==arrayli[i])
{
arrayli[i].className = "cli";
arrayul[i].className = "";
}
else
{
arrayli[i].className = "";
arrayul[i].className = "hidden";
}
}
}