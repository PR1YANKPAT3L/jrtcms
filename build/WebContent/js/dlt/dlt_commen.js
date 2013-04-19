    function dlt_common_selectBall(BallColor, BallNum) {
        var Selected = dlt_common_getBallState(BallColor, BallNum);
        if (Selected) {
            dlt_common_setBallState(BallColor, BallNum, false);
            dlt_common_CheckFull();
            return;
        }
        dlt_common_setBallState(BallColor, BallNum, true);
        dlt_common_CheckFull();
        return;
    }

    function GetRedBallSelectedNum() {
        var Count = 0;
        for (var i = 1; i <= 33; i++) {
            if (dlt_common_getBallState("r", dlt_common_GetBallNum(i)))
                Count++;
        }
        return Count;
    }
    function dlt_clearRedSelect(){
   	 for (var i = 1; i <= 33; i++){
   		dlt_common_setBallState("r", dlt_common_GetBallNum(i), false);
   	 }
   	  $("#dlt_lab_2_Selected").html("0注，0元。");
    }
   
   function dlt_clearBlueSelect(){
   	for (var i = 1; i <= 16; i++){
   		dlt_common_setBallState("b", dlt_common_GetBallNum(i), false);
   	}
   	 $("#dlt_lab_2_Selected").html("0注，0元。");
  }

    function GetBlueBallSelectedNum() {
        var Count = 0;
        for (var i = 1; i <= 16; i++) {
            if (dlt_common_getBallState("b", dlt_common_GetBallNum(i)))
                Count++;
        }
        return Count;
    }

    function dlt_common_GetBallNum(i) {
        var BallNum = "" + i;
        if (BallNum.length == 1)
            BallNum = "0" + BallNum;

        return BallNum;
    }
    function dlt_common_getBallState(BallColor, BallNum) {
      var isSelectedAttr = document.getElementById("td9_" + BallColor + "_" + BallNum).getAttribute('isselected');
      var isSelected = isSelectedAttr == 'true' ? true : false;
      return isSelected;
    }

    function dlt_common_setBallState(BallColor, BallNum, SelectState) {
    	var ball = document.getElementById("td9_" + BallColor + "_" + BallNum);
        if (SelectState) {
            ball.className = BallColor == 'r' ? 'ball_num_r' : 'ball_num_b';
            ball.setAttribute('isselected','true');
        } else {
        	ball.className = 'ball_num';
            ball.setAttribute('isselected','false');
        }
    }
    var p=0;
function dlt_common_CheckFull() {
	var invest = dlt_GetLotteryInvestNum();
	if(invest < 1) document.getElementById("dlt_btn_2_Add").setAttribute('isdisabled','true');
	else document.getElementById("dlt_btn_2_Add").setAttribute('isdisabled','false');
	 p= invest * 2;
  document.getElementById('dlt_lab_2_Selected').innerHTML = invest + '注，' + p.toFixed() + '元。';
}
    function dlt_GetLotteryNumber(){
    	var dlt_commonCode="";
        var LotteryNumber = "";
        var BallNum;
        var randBlue;
        for (var i = 1; i <= 35; i++) {
            BallNum = dlt_common_GetBallNum(i);
            if (dlt_common_getBallState("r", BallNum)){
            	LotteryNumber += (BallNum + " ");
            	if(BallNum.substring(0,1)=="0"){
            		dlt_commonCode += BallNum.substring(1,2)+",";
   	           }else{
   	        	    dlt_commonCode += BallNum+",";
   	           }
            }
        }
        LotteryNumber += "- ";
        dlt_commonCode+="-";
        var red;
        for (var i = 1; i <= 12; i++) {
            BallNum = dlt_common_GetBallNum(i);
            if (dlt_common_getBallState("b", BallNum)){
            	LotteryNumber += (BallNum + " ");
            	if(BallNum.substring(0,1)=="0"){
            		dlt_commonCode += BallNum.substring(1,2)+",";
                 }else{
                	dlt_commonCode += BallNum+",";
                 }
            }
            randBlue=dlt_commonCode;
            var conBall=randBlue.lastIndexOf("-");
            red=dlt_commonCode.substring(0,conBall-1);
           
          var conBlue1=dlt_commonCode.lastIndexOf("-");
          var blue1=dlt_commonCode.substring(conBlue1,dlt_commonCode.length);
          var conBlue=blue1.lastIndexOf(",");
          var blue=blue1.substring(0,conBlue);
        }
        dlt_commonCode=red+blue+";";
        return dlt_commonCode; 
    }
    function GetDLT_FrontLot(){
        var LotteryNumber = "";
        var BallNum;
        for (var i = 1; i <= 35; i++) {
            BallNum = dlt_common_GetBallNum(i);
            if (dlt_common_getBallState("r", BallNum)){
            	LotteryNumber += (BallNum + " ");
            }
        }
        LotteryNumber += "+ ";
        for (var i = 1; i <= 12; i++) {
            BallNum = dlt_common_GetBallNum(i);
            if (dlt_common_getBallState("b", BallNum)){
            	LotteryNumber += (BallNum + " ");
            }
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

    function dlt_GetLotteryInvestNum()
    {
        var RedCount = 0;
        var BlueCount = 0;
        
        for (var i = 1; i <= 35; i++) {
            if (dlt_common_getBallState("r", dlt_common_GetBallNum(i)))
                RedCount++;
        }

        for (var i = 1; i <= 12; i++) {
            if (dlt_common_getBallState("b", dlt_common_GetBallNum(i)))
                BlueCount++;
        }
        if ((RedCount < 5) || (BlueCount < 2)|| (RedCount>15))
        return 0;	
        var InvestNum = 1;
        var red = zuhe(5,RedCount);
		var blue = zuhe(2,BlueCount);
	    InvestNum=(red*blue);       
        return InvestNum;  
    }
    

    function ClearSelect() {
        for (var i = 1; i <= 35; i++)
        	dlt_common_setBallState("r", dlt_common_GetBallNum(i), false);

        for (var i = 1; i <= 12; i++)
        	dlt_common_setBallState("b", dlt_common_GetBallNum(i), false);
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
    var houQuBall=0;
    var qianQuBall=0;
    function controllQianQuBall(){
    	qianQuBall=$("#qianQuBall").val();
    }
    function controllHouQuBall(){
    	houQuBall=$("#houQuBall").val();
    }
    function qianQuRand(){
    	for (var i = 1; i <= 35; i+=1)
    		dlt_common_setBallState("r", dlt_common_GetBallNum(i), false);
    	var redBallArray=new Array();
    	controllQianQuBall();
		for(var i=1;i<=qianQuBall;i+=1){
			var redRandNum=parseInt(Math.random()*34)+1;
			
			if(contain(redBallArray,redRandNum)){
				i-=1;
				continue;
			}else{
				redBallArray[i-1]=redRandNum;	
			}
			if(redRandNum<10){
				$("#td9_r_0"+redRandNum).click();
			}else{
				$("#td9_r_"+redRandNum).click();
			}
		}
    }
    function houQuRand(){
    	for (var i = 1; i <= 12; i+=1)
    		dlt_common_setBallState("b", dlt_common_GetBallNum(i), false);
    	var blueBallArray=new Array();
    	
    	controllHouQuBall();
    	for(var i=1;i<=houQuBall;i+=1){
    	
		var bluerandNum=parseInt(Math.random()*11)+1;
		
		if(contain(blueBallArray,bluerandNum)){
			i-=1;
			continue;
		}else{
			blueBallArray[i-1]=bluerandNum;	
		}
		if(bluerandNum<10){
			$("#td9_b_0"+bluerandNum).click();
		}else{
			$("#td9_b_"+bluerandNum).click();
		}
      }
    }  
	
    function dlt_btn_2_AddClick() {
		var RedCount = 0;
        var BlueCount = 0;
        for (var i = 1; i <= 35; i++) {
            if (dlt_common_getBallState("r", dlt_common_GetBallNum(i)))
                RedCount++;
        }
        for (var i = 1; i <= 12; i++) {
            if (dlt_common_getBallState("b", dlt_common_GetBallNum(i)))
                BlueCount++;
        }
        if(RedCount<5){
        	alert("前区号码至少选择5个；最多选择16个");
        	return false;
        }
        if(BlueCount<2){
        	alert("后区号码至少选择2个");
        	return false;
        }
        if(RedCount>16){
        	alert("前区号码最多选择16个;\n单注投注金额不能超过2万元");
        	return false;
        }
        if (dlt_GetLotteryInvestNum() < 1) {
            alert("请正确选择号码进行投注");
            return false;
        }
        if(p>20000){
        	alert("您好，单个方案金额不能超过2万元！");
        	return false;
        }
        var lotteryListSelect = document.getElementById("list_LotteryNumber");
        var lotteryInvest = dlt_GetLotteryInvestNum();
        var lotteryNumber = dlt_GetLotteryNumber();//hou
        var lotteryView=GetDLT_FrontLot();
        var frontLot=lotteryView;
        if(lotteryInvest == 1){
        	lotteryView = '[普通] ' + lotteryView + ' [1注，共2元]';
        }else if(lotteryInvest > 1){
        	content='普通';
        	lotteryView = '[普通] ' + lotteryView + ' [' + lotteryInvest + '注，共' + 2 * lotteryInvest + '元]';
        }
		var opt = new Option(lotteryView,lotteryNumber);
		 	opt.setAttribute('allLot',frontLot);
	    	opt.setAttribute('backLot',lotteryNumber);
	    	opt.setAttribute('wangFang',"00");
	    	opt.setAttribute('zhushu',"1");
	    	opt.setAttribute('money',1*2);
			opt.setAttribute('delMoney', 2 * lotteryInvest);
			lotteryListSelect.options.add(opt);
			
        totalMoney+=2 * lotteryInvest;
        ClearSelect();
        
        document.getElementById("dlt_btn_2_Add").setAttribute('isdisabled', 'true');
        var multiple=(Number($("#tb_Multiple").val()));
        var check_money=parseInt(2 * lotteryInvest);
        var partial_money=document.getElementById("investField").innerHTML;
        totalMoney=parseInt((check_money*multiple)+partial_money*1);
		$("#investField").html(totalMoney);
		if($("#touzhu_money").html()=="<script>getBalance()</script>"){
			$("#touzhu_money").html("");
		}
		$("#current_money").html(totalMoney);
		$("#final_money").html(parseInt(($("#touzhu_money").html())-($("#current_money").html())));
		totalLotteryInvest+=lotteryInvest;
		$("#lab_Num").html(totalLotteryInvest);		
		$("#dlt_lab_2_Selected").html("0注，0元。");
        return true;
    }    