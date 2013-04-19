var lotteryType;


//选择玩法
function selectWF(){
	if($("#dxLi").attr("class") == "mouseOver1"){
		return "DX";
	}
	if($("#yxLi").attr("class") == "mouseOver1"){
		return "YX";
	}
	if($("#exLi").attr("class") == "mouseOver1"){
		return "EX";
	}
	if($("#sxLi").attr("class") == "mouseOver1"){
		return "SX";
	}
	if($("#wxLi").attr("class") == "mouseOver1"){
		return "WX";
	}
}

function luck_stake(flag) {
//luckform
	lotteryType=$("#lotteryType").val();//获取选择的彩票类型
	if (lotteryType == "") {
		alert(decodeURI(EncodeUtf8("请选择彩票类型！")));//没有彩票类型给出提示
		return false;
	}
	var playtype = "";
	var count = "7";
	var splitCode = ",";//分割符
	var maxNum = "33";
	var balls = "";
	var string = "";
	//判断选择类型并提交到相应的action，应该是提交到一个action中
	if ("SSQ" == lotteryType) {
		playtype = "F47104";
		count = "7";
		maxNum = "33";
		splitCode = ",";
		for (var i = 0; i < count; i++) {
		var codeball = $("#code" + maxNum + i).text();
		if(codeball.substring(0,1) == "0"){
			codeball = codeball.substring(1,2);
		}
		if (i > 0) {
		if("SSQ" == lotteryType&&i==(count-1)){
			balls += "~";
			}else{
			balls += splitCode;
			}
		}
		balls += codeball;
		string+=codeball;
		
	    }
		balls=balls+"^";
	   }
	   if ("dlt" == lotteryType) {
		playtype = "T01001";
		count = "7";
		maxNum = "33";
		splitCode = ",";
		for (var i = 0; i < count; i++) {
		var codeball = $("#code" + maxNum + i).text();
		if(codeball.substring(0,1) == "0"){
			codeball = codeball.substring(1,2);
		}
		if (i > 0) {
		if("dlt" == lotteryType&&i==(count-2)){
			balls += "-";
			}else{
			balls += splitCode;
			}
		}
		balls += codeball;
		string+=codeball;
	    }
		balls=balls+";";
	   }
	if ("D3" == lotteryType) {
		playtype = "F47103";
		count = "3";
		maxNum = "9";
		splitCode = ",";
		balls="00";
		for (var i = 0; i < count; i++) {
		var codeball = $("#code" + maxNum + i).text();
		if(codeball.substring(0,1) == "0"){
			codeball = codeball.substring(1,2);
		}
		if (i > 0) {
		if("SSQ" == lotteryType&&i==(count-1)){
			balls += ":";
			}else{
			balls += splitCode;
			}
		}
		balls += codeball;
		string+=codeball;
	}
		balls=balls+"^";
		
	}
	
	if ("QLC" == lotteryType) {
		playtype = "F47102";
		count = "7";
		maxNum = "30";
		splitCode = ",";
		for (var i = 0; i < count; i++) {
		var codeball = $("#code" + maxNum + i).text();
		if(codeball.substring(0,1) == "0"){
			codeball = codeball.substring(1,2);
		}
		if (i > 0) {
		if("SSQ" == lotteryType&&i==(count-1)){
			balls += "~";
			}else{
			balls += splitCode;
			}
		}
		balls += codeball;
		string+=codeball;
	}
		balls=balls+"^";
	}
	if ("QXC" == lotteryType) {
		playtype = "T01009";
		count = "7";
		maxNum = "30";
		splitCode = ",";
		for (var i = 0; i < count; i++) {
		var codeball = $("#code" + maxNum + i).text();
		if(codeball.substring(0,1) == "0"){
			codeball = codeball.substring(1,2);
		}
		if (i > 0) {
		if("SSQ" == lotteryType&&i==(count-1)){
			balls += "~";
			}else{
			balls += splitCode;
			}
		}
		balls += codeball;
		string+=codeball;
	}
		balls=balls+";";
	}
	if ("pl3" == lotteryType) {
		playtype = "T01002";
		count = "3";
		maxNum = "9";
		splitCode = ",";
		balls="01";
		for (var i = 0; i < count; i++) {
		var codeball = $("#code" + maxNum + i).text();
		if(codeball.substring(0,1) == "0"){
			codeball = codeball.substring(1,2);
		}
		if (i > 0) {
		if("SSQ" == lotteryType&&i==(count-1)){
			balls += "~";
			}else{
			balls += splitCode;
			}
		}
		balls += codeball;
		string+=codeball;
	   }
		balls=balls+";";
	  }
	if ("pl5" == lotteryType) {
		playtype = "T01011";
		count = "5";
		maxNum = "9";
		splitCode = ",";
		balls="";
		for (var i = 0; i < count; i++) {
		var codeball = $("#code" + maxNum + i).text();
		if(codeball.substring(0,1) == "0"){
			codeball = codeball.substring(1,2);
		}
		if (i > 0) {
		if("SSQ" == lotteryType&&i==(count-1)){
			balls += ":";
			}else{
			balls += splitCode;
			}
		}
		balls += codeball;
		string+=codeball;
	}
		balls=balls+";";
		
	}	if ("SSC" == lotteryType) {
		playtype = "T01007";
		var wf = selectWF();
		if(wf == "DX"){
			count = "2";
			maxNum = "5";
		}else if(wf == "YX"){
			count = "1";
			maxNum = "9";
		}else if(wf == "EX"){
			count = "2";
			maxNum = "18";
		}else if(wf == "SX"){
			count = "3";
			maxNum = "9";
		}else if(wf == "WX"){
			count = "5";
			maxNum = "9";
		}

		splitCode = ",";
		balls="";
		for (var i = 0; i < count; i++) {
			if(wf == "SX"){
				var codeball = $("#code" + maxNum + maxNum + i).text();
			}else if(wf == "WX"){
				var codeball = $("#code" + maxNum + maxNum + maxNum + i).text();
			}else{
				var codeball = $("#code" + maxNum + i).text();
			}
		
		if(codeball.substring(0,1) == "0"){
			codeball = codeball.substring(1,2);
		}
		if (i > 0) {
		if("SSQ" == lotteryType&&i==(count-1)){
			balls += ":";
			}else{
			balls += splitCode;
			}
		}
		balls += codeball;
		string+=codeball;
	}
		balls=balls+";";
		
	}
			
	var jsonString="{betcode:\""+balls+"\",lotno:\""+playtype+"\"}";
	$("#jsonString").attr("value",jsonString);
	if(string==null||string==""){
	alert(decodeURI(EncodeUtf8("请选择幸运号码！")));}else{
		if (confirm(decodeURI(EncodeUtf8("您选择了一注幸运号，即将投注！\n投注将扣除您账户2元，确定要进行投注吗？")))) {
			if($("#user_p").val()==""||$("#user_p").val()==null){
				alert(decodeURI(EncodeUtf8("您未登录，请登录！")));
		}else{
			if(flag=="mobileFee"){
		    chargesBet(jsonString);
			
		  }else{
			  if($("#topLogin_money").text()<2){
					alert(decodeURI(EncodeUtf8("您的余额不足请充值！")));
					top.location.href="/rules/user.html?key=4"; 
					}else{$("#BettingForm").submit();}
			
			}
			}
	}
	
	
}
}
/**
*话费支付
**/
function chargesBet(jsonString){  
		var jsonString=jsonString;  
		$("#jsonString").val(jsonString);
		var params=$('#BettingForm').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值  	
		// 发送请求
		$.ajax({
			url	: '/chlw/user/bet!chargesBet',
			type:"POST",//数据发送方式
			data:params,//参数
			dataType:'json',//接受数据格式
			success:function(data){
			if(data.error_code=="000000"){
				$("#luckDiv").html("<form action='"+data.url+"' name='tzForm' target='_blank'>"  
					+"<input type='hidden' name='merId' value='"+data.merId+"'>"
					+"<input type='hidden' name='goodsId' value='"+data.goodsId+"'>"
					+"<input type='hidden' name='goodsInf' value='"+data.goodsInf+"'>"
					+"<input type='hidden' name='mobileId' value='"+data.mobileId+"'>"
					+"<input type='hidden' name='orderId' value='"+data.orderId+"'>"
					+"<input type='hidden' name='merDate' value='"+data.merDate+"'>"
					+"<input type='hidden' name='amount' value='"+data.amount+"'>"
					+"<input type='hidden' name='amtType' value='"+data.amtType+"'>"
					+"<input type='hidden' name='bankType' value='"+data.bankType+"'>"
					+"<input type='hidden' name='gateId' value='"+data.gateId+"'>"
					+"<input type='hidden' name='retUrl' value='"+data.retUrl+"'>"
					+"<input type='hidden' name='notifyUrl' value='"+data.notifyUrl+"'>"
					+"<input type='hidden' name='merPriv' value='"+data.merPriv+"'>"
					+"<input type='hidden' name='expand' value='"+data.expand+"'>"
					+"<input type='hidden' name='version' value='"+data.version+"'>"
					+"<input type='hidden' name='sign' value='"+data.sign+"'>"
					+"</form>");
				$("#tzForm").submit();
			}else if(data.error_code=="200006"){
					if(confirm(decodeURI(EncodeUtf8("您尚未订制话费购彩服务，请您先订制此项服务再进行话费购彩；或请您选择普通购买方式进行买彩。")))){             
						top.location.href="/include/phoneLottery.html";         
					} 
				}else{
					alert(data.chargesBetMessage);
				}
		    }
		});
}

