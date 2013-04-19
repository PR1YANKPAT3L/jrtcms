function daiGou_heMai(){
	//$("#daiGou").attr('checked')==undefined
	if($("#daiGou").attr('checked')==true){
		$("#zuiHaoDIV").hide();
	}
	else if($("#zuiHao").attr('checked')==true){
		$("#zuiHaoDIV").show();
	}
}


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

	function setTab(name,cursel,n){
		for(i=1;i<=n;i++){
		  var menu=document.getElementById(name+i);
		  var con=document.getElementById("con_"+name+"_"+i);
		  menu.className=i==cursel?"hover":"";
		  con.style.display=i==cursel?"block":"none";
		}
     }
  function funCommon(){
	    document.getElementById("commonDIV").style.display='block';
		document.getElementById("tuoMaDIV").style.display='none';
  }
  function funDantuo(){
    document.getElementById("commonDIV").style.display='none';
	document.getElementById("tuoMaDIV").style.display='block';
  }
  
  
  
  //选择采种，获取期号
  function getBatchCode (lotNo){
	  var quanJu;
	  $.ajax({
		   type: "POST",
		   url: "/chlw/function/selectAll!batchCodeSelect",
		   data: "lotNo="+lotNo,
		   success: function(msg){
		     document.getElementById("qihao").innerHTML=msg;
		   }
		});
  }
  
//查询余额
  function getBalance(){
	  if(isLogin()){
	  $.ajax({
		   type: "POST",
		   url: "/chlw/ajax/selectAll!findBalance",
		   dataType:'json',
		   success: function(json){
				$("#touzhu_money").html(json.deposit_amount/100);
        		$("#final_money").html(json.deposit_amount/100);
        		$("#this_username").html(json.userName);
				//alert("查询账户余额="+json.deposit_amount+";"+$("#touzhu_money").html()+";");
		   }
		});
	  }
  }
  
 /*
  * 登陆
  * 
  */ 
  
  function getLoginUser(){
	    $.ajax({
			   type: "post",
			   url: "/chlw/function/tuserinfoAction!ajaxLogin",
			   success: function(data){
	    	alert(data);
			      $('#username').html(data.userName);
			   }
			});
	}
  
  
 //成功页面显示相应的猜中以及图片
  function getCaiZhong(divname1,divname2){
	  	var key = GetQueryString("cai");
	  	var div1 = $("#"+divname1);
	  	var div2 = $("#"+divname2);
		  switch(key){
		  case "F47103":
			  div1.html('<span class="ssq_logo"><img src="/images/3D_tu.gif" alt="福彩3D" /></span><span class="bet_head_zi">福彩3D投注</span>');
			  div2.html('<a href="/fucai3D.html"><span class="jxtz_btn"><img src="/images/jxtz.gif" alt="继续投注" /></span></a>');
			  break;
		  case "T01001":
			  div1.html('<span class="ssq_logo"><img src="/images/dlt_tu.gif" alt="大乐透" /></span><span class="bet_head_zi">大乐透投注</span>');
			  div2.html('<a href="/daletou.html"><span class="jxtz_btn"><img src="/images/jxtz.gif" alt="继续投注" /></span></a>');
			  break;
		  case "F47102":
			  div1.html('<span class="ssq_logo"><img src="/images/qlc_tu.gif" alt="七乐彩" /></span><span class="bet_head_zi">七乐彩投注</span>');
			  div2.html('<a href="/qilecai.html"><span class="jxtz_btn"><img src="/images/jxtz.gif" alt="继续投注" /></span></a>');
			  break;
		  case "T01002":
			  div1.html('<span class="ssq_logo"><img src="/images/pls_tu.gif" alt="排列三" /></span><span class="bet_head_zi">排列三投注</span>');
			  div2.html('<a href="/pailie3.html"><span class="jxtz_btn"><img src="/images/jxtz.gif" alt="继续投注" /></span></a>');
			  break;
		  default:
			  div1.html('<span class="ssq_logo"><img src="/images/ssq_tu.gif" alt="双色球" /></span><span class="bet_head_zi">双色球投注</span>');
		  	  div2.html('<a href="/shuangseqiu.html"><span class="jxtz_btn"><img src="/images/jxtz.gif" alt="继续投注" /></span></a>');  
		  	  break;
		  }
		  

  }
//获取URL地址中的参数
  function GetQueryString(name){ 
  var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); 
  var r = window.location.search.substr(1).match(reg); 
  if (r!=null) return unescape(r[2]); return null; 
  }
  
  
  
  