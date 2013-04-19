<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<script type="text/javascript" src="/template/ruyicai/js/jqueryJS/jquery-1.5.min.js"></script> 
<script type="text/javascript" src="/template/ruyicai/js/util.js"></script>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script>
zxkj_init();
</script>


<input type="hidden" id="endTime1"/>
<input type="hidden" id="endTime2"/>
<input type="hidden" id="endTime3"/>
<input type="hidden" id="endTime4"/>
<input type="hidden" id="endTime5"/>
<input type="hidden" id="endTime6"/>
<input type="hidden" id="endTime7"/>


<script>
window.location = "http://www.hao123.com?endTime1="
		+$("#endTime1").val()+"&endTime2="+$("#endTime2").val()+"&endTime3="+$("#endTime3").val()+
		"&endTime4="+$("#endTime4").val()+"&endTime5="+$("#endTime5").val()+
		"&endTime6="+$("#endTime6").val()+"&endTime7="+$("#endTime7").val();
</script>
<%   

String endTime1 =request.getParameter("endTime1");
String endTime2 =request.getParameter("endTime2");
String endTime3 =request.getParameter("endTime3");
String endTime4 =request.getParameter("endTime4");
String endTime5 =request.getParameter("endTime5");
String endTime6 =request.getParameter("endTime6");
String endTime7 =request.getParameter("endTime7");

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

String nowdate =sdf.format(new Date());
if(endTime1.indexOf(nowdate) > -1){
	request.setAttribute("endTime1ck","1");
}else{
	request.setAttribute("endTime1ck","0");
}
if(endTime2.indexOf(nowdate) > -1){
	request.setAttribute("endTime2ck","1");
}else{
	request.setAttribute("endTime2ck","0");
}
if(endTime3.indexOf(nowdate) > -1){
	request.setAttribute("endTime3ck","1");
}else{
	request.setAttribute("endTime3ck","0");
}
if(endTime4.indexOf(nowdate) > -1){
	request.setAttribute("endTime4ck","1");
}else{
	request.setAttribute("endTime4ck","0");
}
if(endTime5.indexOf(nowdate) > -1){
	request.setAttribute("endTime5ck","1");
}else{
	request.setAttribute("endTime5ck","0");
}
if(endTime6.indexOf(nowdate) > -1){
	request.setAttribute("endTime6ck","1");
}else{
	request.setAttribute("endTime6ck","0");
}
if(endTime7.indexOf(nowdate) > -1){
	request.setAttribute("endTime7ck","1");
}else{
	request.setAttribute("endTime7ck","0");
}


request.setAttribute("endTime1",endTime1);
request.setAttribute("endTime2",endTime2);
request.setAttribute("endTime3",endTime3);
request.setAttribute("endTime4",endTime4);
request.setAttribute("endTime5",endTime5);
request.setAttribute("endTime6",endTime6);
request.setAttribute("endTime7",endTime7);

%>
