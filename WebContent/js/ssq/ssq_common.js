function SelectBall(BallColor, BallNum) {
        var Selected = GetBallState(BallColor, BallNum);
        if (Selected) {
            SetBallState(BallColor, BallNum, false);
            ssq_CheckFull();
            return;
        }
		SetBallState(BallColor, BallNum, true);
		ssq_CheckFull();
        return;
    }

    function GetRedBallSelectedNum() {
        var Count = 0;
        for (var i = 1; i <= 33; i++) {
            if (GetBallState("r", GetBallNum(i)))
                Count++;
        }
        return Count;
    }

    function GetBlueBallSelectedNum() {
        var Count = 0;
        for (var i = 1; i <= 16; i++) {
            if (GetBallState("b", GetBallNum(i)))
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
            ball.className = BallColor == 'r' ? 'ball_num_r' : 'ball_num_b';
            ball.setAttribute('isselected','true');
        } else {
        	ball.className = 'ball_num';
            ball.setAttribute('isselected','false');
        }
    }
    var p=0;
	function ssq_CheckFull() {
		var invest = ssq_GetLotteryInvestNum();
		if(invest < 1) document.getElementById("btn_2_Add").setAttribute('isdisabled','true');
		else document.getElementById("btn_2_Add").setAttribute('isdisabled','false');
		p= invest * 2;
	    document.getElementById('lab_2_Selected').innerHTML = invest + '注，' + p.toFixed() + '元。';
	}
    function ssq_GetLotteryNumber(){
    	var ssq_code="";
        var LotteryNumber = "";
        var BallNum;
        var randBlue;
        for (var i = 1; i <= 33; i++) {
            BallNum = GetBallNum(i);
            if (GetBallState("r", BallNum)){
                LotteryNumber += (BallNum + " ");
	            if(BallNum.substring(0,1)=="0"){
	       	     ssq_code += BallNum.substring(1,2)+",";
	           }else{
	        	 ssq_code += BallNum+",";
	           }
           }
        }
        LotteryNumber += "~ ";
        ssq_code+="~";
        var red;
        for (var i = 1; i <= 16; i++) {
            BallNum = GetBallNum(i);
            if (GetBallState("b", BallNum)){
                LotteryNumber += (BallNum + " ");
            if(BallNum.substring(0,1)=="0"){
            	ssq_code += BallNum.substring(1,2)+",";
              }else{
            	  ssq_code += BallNum+",";
              }
           }
            randBlue=ssq_code;
            var conBall=randBlue.lastIndexOf("~");
            red=ssq_code.substring(0,conBall-1);
           
          var conBlue1=ssq_code.lastIndexOf("~");
          var blue1=ssq_code.substring(conBlue1,ssq_code.length);
          var conBlue=blue1.lastIndexOf(",");
          var blue=blue1.substring(0,conBlue);
        }
        ssq_code=red+blue+"^";
        return ssq_code; 
    }
    function GetFrontLot(){
        var LotteryNumber = "";
        var BallNum;
        for (var i = 1; i <= 33; i++) {
            BallNum = GetBallNum(i);
            if (GetBallState("r", BallNum)){
                LotteryNumber += (BallNum + " ");
           }
        }
        LotteryNumber += "~ ";
        for (var i = 1; i <= 16; i++) {
            BallNum = GetBallNum(i);
            if (GetBallState("b", BallNum)){
                LotteryNumber += (BallNum + " ");
           }
        }
        return LotteryNumber; 
    }
    
    function ssq_GetLotteryInvestNum()	
    {
        var RedCount = 0;
        var BlueCount = 0;
        
        for (var i = 1; i <= 33; i++) {
            if (GetBallState("r", GetBallNum(i)))
                RedCount++;
        }

        for (var j = 1; j <= 16; j++) {
            if (GetBallState("b", GetBallNum(j)))
                BlueCount++;
        }
        if ((RedCount < 6) || (BlueCount < 1)){
            return 0;
        }else if (RedCount == 6){
          var InvestNum=BlueCount;
            return InvestNum;
        }else{
	        InvestNum = 1;
	        for (var k = 7; k <= RedCount; k++)
	            InvestNum *= k; 
	
	        for (var d = 2; d <= (RedCount - 6); d++)
	            InvestNum = Math.round(InvestNum / d);
	        InvestNum *= BlueCount;   
	        
	        return InvestNum;  
        }
    }
    function ClearSelect() {
        for (var i = 1; i <= 33; i++)
            SetBallState("r", GetBallNum(i), false);

        for (var i = 1; i <= 16; i++)
            SetBallState("b", GetBallNum(i), false);
    }
    
    function clearRedSelect(){
    	 for (var i = 1; i <= 33; i++){
             SetBallState("r", GetBallNum(i), false);
    	 }
    	$("#lab_2_Selected").html("0注，0元。");
     	
    }
    
    function clearBlueSelect(){
    	for (var i = 1; i <= 16; i++){
            SetBallState("b", GetBallNum(i), false);
    	}
    	$("#lab_2_Selected").html("0注，0元。");
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
    var blueBallCount=0;
    var redBallCount=0;
    function controllRedBallCount(){
    	redBallCount=$("#redBallCount").val();
    }
    function controllBlueBallCount(){
    	blueBallCount=$("#blueBallCount").val();
    }
    function redRand(){
    	for (var i = 1; i <= 33; i+=1)
             SetBallState("r", GetBallNum(i), false);
    	var redBallArray=new Array();
    	controllRedBallCount();
		for(var i=1;i<=redBallCount;i+=1){
			var redRandNum=parseInt(Math.random()*32)+1;
			
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
    function blueRand(){
    	for (var i = 1; i <= 16; i+=1)
            SetBallState("b", GetBallNum(i), false);
    	var blueBallArray=new Array();
    	
    	controllBlueBallCount();
    	for(var i=1;i<=blueBallCount;i+=1){
    	
		var bluerandNum=parseInt(Math.random()*16)+1;
		
		if(contain(blueBallArray,bluerandNum)){
			i-=1;
			continue;
		}else{
			blueBallArray[i-1]=bluerandNum;	
		}
		
		if(bluerandNum<10){
			$("#td_b_0"+bluerandNum).click();
		}else{
			$("#td_b_"+bluerandNum).click();
		}
      }
    }  
    
    function btn_2_AddClick() {
		if(document.getElementById('btn_2_Add').getAttribute('isdisabled') == 'true') {
			alert("投注提示：\n请选择至少6个红球和至少1个蓝球，红球数+蓝球数至少为7。");
			return;
		} 
        if (ssq_GetLotteryInvestNum() < 1) {
            alert("您选择的不是一注复式或单式票！");
            return false;
        }
        if(p>100000){
        	alert("单注投注金额不能超过10万元");
        	return false;
        }
        ssq_CheckFull();
        var lotteryNumber="";
        var lotteryListSelect = document.getElementById("list_LotteryNumber");
        var lotteryInvest=ssq_GetLotteryInvestNum();
        var lotteryView= GetFrontLot(); 
        if(lotteryInvest==1)
        	lotteryView = '[直选单式] ' + lotteryView + ' [1注，共2元]';
        else
        	lotteryView = '[直选复式] ' + lotteryView + ' [' + lotteryInvest + '注，共' + 2 * lotteryInvest + '元]';
        lotteryNumber=ssq_GetLotteryNumber();
        var opt=new Option(lotteryView,lotteryNumber);
        var frontLot=lotteryView;
        if(lotteryInvest == 1){
        	opt.setAttribute('allLot',frontLot);
        	opt.setAttribute('backLot',lotteryNumber);
        	opt.setAttribute('wangFang',"00");
        	opt.setAttribute('zhushu',"1");
        	opt.setAttribute('money',1*2);
        	click++;
        }else if(lotteryInvest > 1){
        	opt.setAttribute('allLot',frontLot);
        	opt.setAttribute('backLot',lotteryNumber);
        	opt.setAttribute('wangFang',"10");
        	opt.setAttribute('zhushu',lotteryInvest);
        	opt.setAttribute('money',2 * lotteryInvest);
        }
        totalMoney+=2 * lotteryInvest;
		opt.setAttribute('delMoney', 2 * lotteryInvest);
		lotteryListSelect.options.add(opt);
        ClearSelect();
        document.getElementById("btn_2_Add").setAttribute('isdisabled', 'true');
        var multiple=(Number($("#tb_Multiple").val()));
        var check_money=parseInt(2 * lotteryInvest);
        var partial_money=document.getElementById("investField").innerHTML;
        totalMoney=parseInt((check_money*multiple)+partial_money*1);
		$("#investField").html(totalMoney);
		$("#current_money").html(totalMoney);
//		if($("#touzhu_money").html()=="<script>getBalance()</script>"){
//			$("#touzhu_money").html("");
//		}
		$("#final_money").html(parseInt(($("#touzhu_money").html())-($("#current_money").html())));
		totalLotteryInvest+=lotteryInvest;
		$("#lab_Num").html(totalLotteryInvest);		
		$("#lab_2_Selected").html("0注，0元。");
    } 
