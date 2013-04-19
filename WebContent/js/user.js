var basepath = "/chlw";//项目地址
var pageArrayNum = 0;
var urlArray=new Array();
urlArray[0]= basepath + "/user/selectAll!betSelect"; //投注记录
urlArray[1]= basepath + "/user/selectAll!trackingNumberSelectAll";//追号记录
urlArray[2]= basepath + "/user/selectAll!giftSelect";//赠送记录
urlArray[3]= basepath + "/user/selectAll!giftedSelect";//获赠记录
urlArray[4]= basepath + "/function/charge/chargeIndex.jsp";//充值*
urlArray[5]= basepath + "/user/tuserinfoAction!selectCashState";//提款记录
urlArray[6]= basepath + "/user/selectAll!accountDetail";//账户明细
urlArray[7]= basepath + "/function/user/personalMessage.jsp";//个人中心*
urlArray[8]= basepath + "/function/user/updatePassword.jsp";//修改密码*
urlArray[9]= basepath + "";//帐户变动记录*
urlArray[10]= basepath + "/function/user/phoneServes.jsp";//手机服务*
urlArray[11]= basepath + "/user/tuserinfoAction!toCash";//提现
urlArray[12]= basepath + "/user/tuserinfoAction!selectCashState";//提现向导
urlArray[13]= basepath + "/user/tuserinfoAction!cash";//提现向导
urlArray[14]= basepath + "/user/tuserinfoAction!updateCashDetail";//提现修改
urlArray[15]= basepath + "/user/selectAll!winSelect";//中奖记录	
urlArray[16]= basepath + "/user/tuserinfoAction!doUpdateCashDetail";//提现修改执行
urlArray[17]= basepath + "/user/tuserinfoAction!cancelTcashDetail";//提现撤销
urlArray[18]= basepath + "/function/user/tkxd.html";//提现向导
urlArray[19]= basepath + "/function/selectAll!drawalotterySelectAll";//开奖信息查询
urlArray[20]= basepath + "/function/tuserinfoAction!register";//实名认证
urlArray[21]= basepath + "/function/tuserinfoAction!certification";//实名认证成功
urlArray[22]= basepath + "/function/user/updateMessage.jsp";//修改个人信息*
urlArray[23]= basepath + "/function/user/userIndex.jsp";//用户中心首页
urlArray[24]= basepath + "/function/selectAll!drawalottery";//彩票开奖
urlArray[25]= basepath + "/user/tuserinfoAction!changeTuserinfo";//修改个人信息使用的ACTION地址
urlArray[26]= basepath + "/function/selectAll!drawalotteryleft";//左侧开奖信息
urlArray[27]= basepath + "/user/tuserinfoAction!changePassword";//修改密码使用的ACTION地址
urlArray[28]= basepath + "/function/selectAll!drawalotteryDetail";//开奖详细
urlArray[29]= basepath + "/user/selectAll!betSelectCount";//投注查询查询1-7条
urlArray[30]= basepath + "/function/selectAll!drawalotteryTwo";//开奖历史页面
urlArray[31]= basepath + "/function/selectAll!nightdrawalottery";//3G彩票各彩种页面开奖信息
urlArray[32]= basepath + "/function/selectAll!batchCodeHtmlCore";//3G彩票各彩种左侧页面开奖公告
function reHtml(key,parameters,loading,divId){
	if(key=='' || key=='0'){//从URL中获取参数
		var keyP = GetQueryString("key");
		if(key=='0'){keyP='0';key='0';}
		if(keyP!=null && keyP!="undefined"){
			key = keyP;
		}else{
			key = 23;
			findBalance();
		}
	}
	if(divId==null){
		divId = "right_text";
	}
	//alert(urlArray[key]+"?"+parameters);
	pageArrayNum = key;//将当前页面的数组值更新为当前页面的值
	for(b in $.browser) if(b=='msie'){parameters=encodeURI(parameters);}
	//alert(urlArray[key]+"?"+parameters);
	$.ajax({
		url:urlArray[key],//后台处理程序
		type:"POST",//数据发送方式
		data:parameters,//参数
		dataType:'html',//接受数据格式
		beforeSend:function(){if(loading!=false){$("#"+divId).html('<img src="/images/loading.gif"  />');}},
		success:function(data){
					$("#"+divId).html(data);
				}		
	});
	return false;
}
//key为数组对应的数组编号，lotNo 为彩种编号 startDate stopDate 为开始和结束时间 order 为其他条件，注意order需要写“参数名=值”
//与此同时记录用的搜索条件，以便分页使用
var pageLotNo=pageStartDate=pageStopDate=pageOrder="";
function reHtmlInParameters(lotNo,startDate,stopDate,order,i){
	pageLotNo=lotNo;
	pageStartDate=startDate;
	pageStopDate=stopDate;
	pageOrder=order;
	
	var param = "";
	//alert(lotNo.value+"|"+(lotNo.value!=""));
	if(lotNo!=""){param=param+"lotNo="+lotNo+"&";}
	if(startDate!=""){param=param+"startDate="+startDate+"&";}
	if(stopDate!=""){param=param+"stopDate="+stopDate+"&";}
	param=param+order;
	if(i!=null){param=param+"&pageIndex="+i;}
	if(param.substring(param.length-1, param.length)=="&"){param = param.substring(0, param.length-1);}
	//alert(param);
	reHtml(pageArrayNum , param);
	return false;
	
}
//选择彩种时动态查询用户用户数据
function toLotNo(lotNo){
	reHtml(pageArrayNum, "lotNo="+lotNo.value);
}
//分页调用
function toPageList(i){
	reHtmlInParameters(pageLotNo,pageStartDate,pageStopDate,pageOrder,i);
}



//获取URL地址中的参数
function GetQueryString(name){ 
var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); 
var r = window.location.search.substr(1).match(reg); 
if (r!=null) return unescape(r[2]); return null; 
}

//将彩种作为参数获取的js包装
function forLotNo(key,loading,divId){
	var lotno = GetQueryString("lotno");
	if(lotno!=null && lotno!="undefined"){
		lotno = "lotno="+lotno;
	}else{
		lotno = "";
	}
	reHtml(key,lotno,loading,divId);
}



