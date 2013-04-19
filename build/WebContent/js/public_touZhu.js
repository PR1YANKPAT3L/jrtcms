var totalMoney=0;
var totalLotteryInvest=0;
var click=0;
var betcode="";

//删除选中
function btn_ClearSelectClick() {	
	if ($("#list_LotteryNumber option").length ==0 ) {
		alert("您还没有输入投注内容。");
		return true;
	}
	if ($("#list_LotteryNumber option:selected").length ==0) {
		alert("请单击选中要删除的投注内容。");
		return true;
	}
	var selectLot=$("#list_LotteryNumber>option:selected").get(0).text;//选中框框里面的注数
	
	var a=selectLot.lastIndexOf(",");
    var b=selectLot.substring(0,a+2);
	var c=b.lastIndexOf("]");
	var delLot=b.substring(c+1,c.length);
	
	totalLotteryInvest-=Number($("#list_LotteryNumber>option:selected").get(0).getAttribute("delMoney"))/2;
	totalMoney-=Number($("#list_LotteryNumber>option:selected").get(0).getAttribute("delMoney"))*Number($("#tb_Multiple").val()); 	
	
	$("#investField").html(totalMoney);	
	$("#current_money").html(totalMoney);	
	$("#final_money").html(parseInt(($("#touzhu_money").html())-($("#current_money").html())));
	if($("#list_LotteryNumber option").length==1){
		totalMoney=0;
		totalLotteryInvest=0;
		$("#investField").html(totalMoney);
		$("#current_money").html(totalMoney);
		$("#final_money").html(parseInt(($("#touzhu_money").html())-($("#current_money").html())));
		$("#tb_Multiple").val(1);
	}
	
	$("option:selected", $("#list_LotteryNumber")).remove();
	$("#lab_Num").html(parseInt(totalLotteryInvest)); 
	//ClearSelect();	 
}

function btn_ClearClick() {
	$("option", $("#list_LotteryNumber")).remove();
	totalMoney=0;
	totalLotteryInvest=0;
	$("#lab_Num").html(0);
	$("#investField").html(0);	
	$("#current_money").html(0);	
	$("#final_money").html(parseInt(($("#touzhu_money").html())-($("#current_money").html())));
	$("#tb_Multiple").val(1);
	//ClearSelect(); 
}

/**
 * 如用户倍数框留空，光标离开倍数输入框，则倍数输入框默认为1.
 * @return
 */
function multipleBlur(){
	if($('tb_Multiple').val()==''){
		$('tb_Multiple').val(1);
	}
}

/**
*执行投注功能
*/
function touzhu(){

	//得到下拉列表的值
	var listLottery=document.getElementById("list_LotteryNumber");
	if($("#list_LotteryNumber option").length ==0){
			alert("请选择投注注码！");
			return false;
	}

	//判断协议是否选中
	if($("#xieyi")!=null||$("#xieyi")!=undefined){
		if($("#xieyi").attr('checked')==false){
			alert("请您同意用户代购合买协议！");
			return false;
		}
	}
	
	//判断单个方案不能超过2万元
	if($("#current_money").html()!=null||$("#current_money").html()!=undefined){
		if($("#current_money").html()>20000){
			alert("您好，单个方案金额不能超过2万元！");
			return false;
		}
	}
	
	//判断倍数是否是大于1小于99倍
	var multiple = $('tb_Multiple').val();
	if((Number(multiple))<1 || (Number(multiple))>99){
	   alert("您所输入的倍数不能为0，必须为大于1的整数！");
	   return false;
	}

	//判断用户是否登录
	var moneyF=/^(-?\\d+)(\\.\\d+)?$/;
	var moneyI=/^\\d+$/;
    if($("#touzhu_money").html()=="" || $("#touzhu_money").html()==null||(!moneyI.test($("#touzhu_money").html())&&!moneyF.test($("#touzhu_money").html()))){
		$("#touzhu_money").html(0);
		//弹出登录层
		divContent('login_pop');
		//alert("您尚未登录，请您登录！");
		//top.location.href="/rules/login.html";
		return false;
	  }

    //拼接注码
	var betcode="";
	for(var i=0;i<listLottery.options.length;i++){
		betcode+=listLottery.options[i].value;
	}
	var lotno=$("#lotNo").val();
	var jsonString="{betcode:\""+betcode+"\",lotno:\""+lotno+"\"}";
    
    //判断用户余额是否充足
	if($("#current_money").html() > $("#touzhu_money").html()){
		if(confirm("抱歉，您的账户余额已不足！请您充值。。。")){
			location.href="/rules/user.html?key=4&#Menu=ChildMenu1";
		}
		return false;
	 }else{
		 $("#jsonString").val(jsonString);
		 $("#form1").submit();
		 return true;
	 }
 }


function changeTab(tab){
	if ($("#list_LotteryNumber option").length !=0 ) {
		if(confirm("切换彩种将放弃你刚刚投注的票！确定更改？")){
			if(tab=="ssq"){
				toggle_nav(1,'weixuan','xuan',3);
			}
			else if(tab=="3D"){
				toggle_nav(2,'weixuan','xuan',3);
			}
			else if(tab=="dlt"){
				toggle_nav(3,'weixuan','xuan',3);
			}
			$("option", $("#list_LotteryNumber")).remove();
			totalMoney=0;
			totalLotteryInvest=0;
			$("#lab_Num").html(0);
			$("#tb_Multiple").val(1);
		}
	}else{
		if(tab=="ssq"){
			toggle_nav(1,'weixuan','xuan',3);
		}
		else if(tab=="3D"){
			toggle_nav(2,'weixuan','xuan',3);
		}
		else if(tab=="dlt"){
			toggle_nav(3,'weixuan','xuan',3);
		}
	}
}

//实现选号器的弹出
var  myAlert;
var mClose = document.getElementById("close"); 

function divContent(value) { 	
	myAlert = document.getElementById(value);
  
	myAlert.style.display = "block"; 
	myAlert.style.position = "absolute"; 
	myAlert.style.top = "100%"; 
	myAlert.style.left = "30%"; 
	myAlert.style.marginTop = "-75px"; 
	myAlert.style.marginLeft = "-150px";
	
	mybg = document.createElement("div"); 
	mybg.setAttribute("id","mybg"); 
	mybg.style.background = "#000"; 
	mybg.style.width=window.screen.width;
	mybg.style.height = Math.max(document.body.scrollHeight,document.body.clientHeight);
	 
	mybg.style.position = "absolute"; 
	mybg.style.top = "0"; 
	mybg.style.left = "0"; 
	mybg.style.zIndex = "500"; 
	mybg.style.opacity = "0.3"; 
	mybg.style.filter = "Alpha(opacity=30)"; 
	document.body.appendChild(mybg);
	document.body.style.overflow = "hidden"; 
}

function divClose() {
	 myAlert.style.display = "none"; 
	 mybg.style.display = "none"; 
} 

