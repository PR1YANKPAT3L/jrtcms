
function danTuo_selectBall(BallColor, BallNum, BallType) {
	var Selected = danTuo_getBallState(BallColor, BallNum, BallType);
	if (Selected) {
		danTuo_setBallState(BallColor, BallNum, false, BallType);
		danTuo_checkFull();
		return;
	}
	danTuo_setBallState(BallColor, BallNum, true, BallType);
	if(BallColor=="r"){
		if(BallType=="danMa"){
			danTuo_setBallState(BallColor, BallNum, false, "tuoMa");
		}else{
			danTuo_setBallState(BallColor, BallNum, false, "danMa");
		}
	}
	danTuo_checkFull(); 
	return;
}
function danTuo_getBallState(BallColor, BallNum, BallType) {
	var isSelectedAttr;
	if (BallType != "") { //danMa or tuoMa
		isSelectedAttr = document.getElementById(
				"td_" + BallColor + "_" + BallNum + "_" + BallType)
				.getAttribute('isselected');
	} 
	var isSelected = isSelectedAttr == 'true' ? true : false;

	return isSelected;
}
function danTuo_setBallState(BallColor, BallNum, SelectState, BallType) {
	var ball = document.getElementById("td_" + BallColor + "_" + BallNum + "_" + BallType);
	if (SelectState) {
		if (BallColor == 'r' && (BallType == 'danMa' || BallType == 'tuoMa')) {
			ball.className = 'ball_num_r';
		}
	    ball.setAttribute('isselected', 'true');
	} else {
		ball.className = 'ball_num';
		ball.setAttribute('isselected', 'false');
	}
}
function danTuo_checkFull() {
	var invest = getZhuShu();
	var p = invest * 2;
	document.getElementById('change_zhuShu_money').innerHTML = invest + '注，'
			+ p.toFixed() + '元。';
}
function jiec(a){
	var b=1;
	for (var i = 1; i <= a; i++) {
		b = b*i;
	}
	return b;
}
function zuhe(m,n){
	var a = 0;
	a = jiec(n)/((jiec(n-m)*(jiec(m))));
	return a;
}
function getZhuShu() 
{
	var firstRedCount = 0; 
	var secondRedCount = 0;
	var InvestNum = 1;
	for ( var i = 1; i <= 30; i++) {
		if (danTuo_getBallState("r", danTuo_getBallNum(i), 'danMa'))
			firstRedCount++;
	}
	for ( var i = 1; i <= 30; i++) {
		if (danTuo_getBallState("r", danTuo_getBallNum(i), 'tuoMa'))
			secondRedCount++;
	}
	if(firstRedCount>6){
		alert("胆码不能大于6个");
		return 0;
	}
	if(firstRedCount < 1){
		return 0;
	}
	if (firstRedCount < 1  || firstRedCount>6 || (firstRedCount + secondRedCount) < 8 ||(firstRedCount + secondRedCount) >20){
		return 0;
	}
	
	InvestNum=zuhe(7-firstRedCount,secondRedCount);
	
	return InvestNum;
}
function danTuo_getBallNum(i) {
	var BallNum = "" + i;
	if (BallNum.length == 1)
		BallNum = "0" + BallNum;
	return BallNum;
}
function getCheck_ballNumber() {
	var LotteryNumber = "";
	var danMa_BallNum;
	var tuoMa_BallNum;
	var dan;
	var qlc_danTuo_code="";
	for ( var i = 1; i <= 30; i++) {
		danMa_BallNum = danTuo_getBallNum(i);
		if (danTuo_getBallState('r', danMa_BallNum,'danMa')){
			LotteryNumber += (danMa_BallNum + " ");
			if(danMa_BallNum.substring(0,1)=="0"){
				qlc_danTuo_code += danMa_BallNum.substring(1,2)+",";
  	           }else{
  	        	qlc_danTuo_code += danMa_BallNum+",";
  	           }
		}
			
	}
	LotteryNumber += "* ";
	qlc_danTuo_code+="*";
	for ( var i = 1; i <= 30; i++) {
		tuoMa_BallNum = danTuo_getBallNum(i);
		if (danTuo_getBallState('r', tuoMa_BallNum,'tuoMa')){
			LotteryNumber += (tuoMa_BallNum+' ');
			if(tuoMa_BallNum.substring(0,1)=="0"){
				qlc_danTuo_code += tuoMa_BallNum.substring(1,2)+",";
 	           }else{
 	        	qlc_danTuo_code += tuoMa_BallNum+",";
 	           }
		}
		dan=qlc_danTuo_code;
        var conBall=dan.lastIndexOf("*");
        red=qlc_danTuo_code.substring(0,conBall-1);
       
      var conBlue1=qlc_danTuo_code.lastIndexOf("*");
      var blue1=qlc_danTuo_code.substring(conBlue1,qlc_danTuo_code.length);
      var conBlue=blue1.lastIndexOf(",");
      var blue=blue1.substring(0,conBlue);
	}
	qlc_danTuo_code=red+blue+"^";
	return qlc_danTuo_code;
}
function getFrontLot() {
	var LotteryNumber = "";
	var danMa_BallNum;
	var tuoMa_BallNum;
	for ( var i = 1; i <= 30; i++) {
		danMa_BallNum = danTuo_getBallNum(i);
		if (danTuo_getBallState('r', danMa_BallNum,'danMa')){
			LotteryNumber += (danMa_BallNum + " ");
		}
	}
	LotteryNumber += "* ";
	for ( var i = 1; i <= 30; i++) {
		tuoMa_BallNum = danTuo_getBallNum(i);
		if (danTuo_getBallState('r', tuoMa_BallNum,'tuoMa')){
			LotteryNumber += (tuoMa_BallNum+' ');
 	       }
		}
	return LotteryNumber;
}
function ClearCheck() {
	for ( var i = 1; i <= 30; i++)
		danTuo_setBallState("r", danTuo_getBallNum(i), false,"danMa");
	for ( var i = 1; i <= 30; i++)
		danTuo_setBallState("r", danTuo_getBallNum(i), false,"tuoMa");
	 $("#change_zhuShu_money").html("0注，0元。");
}
function addDanTuo() {
	 var firstRedCount = 0;
	 var secondRedCount = 0;
	 for ( var i = 1; i <= 30; i++) {
	 	if (danTuo_getBallState("r", danTuo_getBallNum(i), 'danMa'))
	 		firstRedCount++;
	 }
	 for ( var i = 1; i <= 30; i++) {
	 	if (danTuo_getBallState("r", danTuo_getBallNum(i), 'tuoMa'))
	 		secondRedCount++;
	 }
	 if(firstRedCount<1 || firstRedCount>6){
		alert("投注提示：\n胆码：至少选择1个，最多6个");
		return false;
	}
	if((firstRedCount+secondRedCount)<8 ||(firstRedCount+secondRedCount)>20 ){
		alert("投注提示:\n胆码加拖码总数不能小于8；不能大于25");
		return false;
	}
	var lotteryNumber = getCheck_ballNumber(); //hou
	var lotteryView =getFrontLot();
	var frontLot=lotteryView;
	var lotteryListSelect = document.getElementById("list_LotteryNumber");
	var zhuShu = getZhuShu();
	if (zhuShu > 1) {
		lotteryView = '[胆拖]' + lotteryView + ' [' + zhuShu + '注，共' + 2
				* zhuShu + '元]';
	}
	var opt = new Option(lotteryView,lotteryNumber);
	opt.setAttribute('allLot',frontLot);
	opt.setAttribute('backLot',lotteryNumber);
	opt.setAttribute('wangFang',"00");
	opt.setAttribute('zhushu',"1");
	opt.setAttribute('money',1*2);
	opt.setAttribute('delMoney', 2 * zhuShu);
	lotteryListSelect.options.add(opt);
	
	totalMoney += 2 * zhuShu;
	ClearCheck();
	var multiple=(Number($("#tb_Multiple").val()));
    var check_money=parseInt(2 * zhuShu);
    var partial_money=document.getElementById("investField").innerHTML;
    totalMoney=parseInt((check_money*multiple)+partial_money*1);
	$("#investField").html(totalMoney);
	$("#current_money").html(totalMoney);
	$("#final_money").html(parseInt(($("#deposit_amount").html())-($("#current_money").html())));
	totalLotteryInvest += zhuShu;
	
	$("#lab_Num").html(totalLotteryInvest);
	return true;
}
