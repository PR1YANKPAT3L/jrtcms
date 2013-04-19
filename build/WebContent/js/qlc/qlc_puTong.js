    function SelectBall(BallColor, BallNum) {
        var Selected = GetBallState(BallColor, BallNum);
        if (Selected) {
            SetBallState(BallColor, BallNum, false);
            CheckFull();
            return;
        }
		SetBallState(BallColor, BallNum, true);
        if(GetLotteryInvestNum() > 10000){
			alert('单票金额不能超过20000元。');
			SetBallState(BallColor, BallNum, false);
		}
        CheckFull();
        return;
    }

    function GetRedBallSelectedNum() {
        var Count = 0;
        for (var i = 1; i <= 30; i++) {
            if (GetBallState("r", GetBallNum(i)))
                Count++;
        }
        return Count;
    }

    function GetBallNum(i) {
        var BallNum = "" + i;
        if (BallNum.length == 1)
            BallNum = "0" + BallNum;

        return BallNum;
    }
    function GetBallState(BallColor, BallNum) {
      var isSelectedAttr = document.getElementById("td_" + BallColor + "_" + BallNum).getAttribute('isselected');
      var isSelected = isSelectedAttr == 'true' ? true : false;
      return isSelected;
    }

    function SetBallState(BallColor, BallNum, SelectState) {
    	var ball = document.getElementById("td_" + BallColor + "_" + BallNum);
        if (SelectState) {
        	if(BallColor=='r'){
        		ball.className='ball_num_r';
        	}
            ball.setAttribute('isselected','true');
        } else {
        	ball.className = 'ball_num';
            ball.setAttribute('isselected','false');
        }
    }
function CheckFull() {
	var invest = GetLotteryInvestNum();
	if(invest < 1) document.getElementById("btn_2_Add").setAttribute('isdisabled','true');
	else document.getElementById("btn_2_Add").setAttribute('isdisabled','false');
	var p = invest * 2;
  document.getElementById('qlc_lot').innerHTML = invest + '注，' + p.toFixed() + '元。';
}
    function GetLotteryNumber(){
    	var qlc_code="";
        var LotteryNumber = "";
        var BallNum;
        for (var i = 1; i <= 30; i++) {
            BallNum = GetBallNum(i);
            if (GetBallState("r", BallNum)){
            	LotteryNumber += (BallNum + " ");
        	if(BallNum.substring(0,1)=="0"){
        		qlc_code += BallNum.substring(1,2)+",";
  	           }else{
  	        	qlc_code += BallNum+",";
  	           }
            }
            var controlRed=qlc_code.lastIndexOf(",");
            var red=qlc_code.substring(0,controlRed);
        }
        qlc_code=red+"^";
        return qlc_code; 
    }
    function getCommonFrontLot(){
    	var LotteryNumber = "";
        var BallNum;
        for (var i = 1; i <= 30; i++) {
            BallNum = GetBallNum(i);
            if (GetBallState("r", BallNum))
                LotteryNumber += (BallNum + " ");
        }
        return LotteryNumber; 
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
    function GetLotteryInvestNum()	
    {
        var RedCount = 0;

        for (var i = 1; i <= 30; i++) {
            if (GetBallState("r", GetBallNum(i)))
                RedCount++;
        }

        if ((RedCount < 7))
            return 0;

        var InvestNum = 1;
        
        for (var i = 7; i <= RedCount; i++) 
        	InvestNum=zuhe(7,RedCount);

        return InvestNum;  
    }
    function contain(array,o){
    	if(array!=null){
    		for(var i=0;i<array.length;i+=1){
    			if(array[i]==o){
    				return true;
    			}
    		}
    	}
    	return false;
    }
    var qlc_redBallCount=0;
    function qlc_controllRedBallCount(){
    	qlc_redBallCount=$("#qlc_redBallCount").val();
    }
    function qlc_redRand(){
    	for (var i = 1; i <= 30; i+=1)
            SetBallState("r", GetBallNum(i), false);
    	var redBallArray=new Array();
    	qlc_controllRedBallCount();
		for(var i=1;i<=qlc_redBallCount;i+=1){
			var redRandNum=parseInt(Math.random()*29)+1;
			
			if(contain(redBallArray,redRandNum)){
				i-=1;
				continue;
			}else{
				redBallArray[i-1]=redRandNum;	
			}
			if(redRandNum<10){
				$("#td_r_0"+redRandNum).click();
			}else{
				$("#td_r_"+redRandNum).click();
			}
		}
    }
    function qlc_clearRedSelect(){
      	 for (var i = 1; i <= 30; i++){
               SetBallState("r", GetBallNum(i), false);
      	 }
      	  $("#qlc_lot").html("0注，0元。");
       }
      
    function ClearSelect() {
        for (var i = 1; i <= 30; i++)
            SetBallState("r", GetBallNum(i), false);
    }
    
    function btn_2_AddClick() {
		if(document.getElementById('btn_2_Add').getAttribute('isdisabled') == 'true') {
			alert("投注提示：\n请你至少选择7个号码");
			return;
		} 
        if (GetLotteryInvestNum() < 1) {
            alert("您选择的不是一注复式或单式票！");
            return false;
        }
        if(GetLotteryInvestNum()>10000){
	        alert("单次投注不能大于10000注！");
	        return;
        }
        var lotteryListSelect = document.getElementById("list_LotteryNumber");
        var lotteryInvest = GetLotteryInvestNum();
        var lotteryNumber = GetLotteryNumber();
        var lotteryView = getCommonFrontLot();
        var frontLot=lotteryView;
        if(lotteryInvest == 1){
        	lotteryView = '[普通]' + lotteryView + '[1注，共2元]';
        	click++;
        }else{
        	lotteryView='[普通]'+lotteryView+'['+lotteryInvest+'注,'+'共'+2 * lotteryInvest+'元]';
        }
        var opt = new Option(lotteryView, lotteryNumber);
        opt.setAttribute('allLot',frontLot);
    	opt.setAttribute('backLot',lotteryNumber);
    	opt.setAttribute('wangFang',"00");
    	opt.setAttribute('zhushu',"1");
    	opt.setAttribute('money',1*2);
		opt.setAttribute('delMoney', 2 * lotteryInvest);
		lotteryListSelect.options.add(opt);
		
		totalMoney+=2 * lotteryInvest;
        ClearSelect();
        document.getElementById("btn_2_Add").setAttribute('isdisabled', 'true');
        var multiple=(Number($("#tb_Multiple").val()));
        var check_money=parseInt(2 * lotteryInvest);
        var partial_money=document.getElementById("investField").innerHTML;
        totalMoney=parseInt((check_money*multiple)+partial_money*1);
		$("#investField").html(totalMoney);
		$("#current_money").html(totalMoney);
		$("#final_money").html(parseInt(($("#deposit_amount").html())-($("#current_money").html())));
		totalLotteryInvest+=lotteryInvest;
		$("#lab_Num").html(totalLotteryInvest);	
		$("#qlc_lot").html("0注，0元。");
    }    
