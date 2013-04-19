
function btn_2_RandManyClick(n) {

    	if(n==5){
            click+=5;
        }else{
            click++;
        }
		totalLotteryInvest+=n;
		totalMoney+=n*2*Number($("#tb_Multiple").val());

//		if($("#touzhu_money").html()=="<script>getBalance()</script>"){
//			$("#touzhu_money").html("");
//		}
		
		$("#investField").html(totalMoney);   
		$("#current_money").html(totalMoney);
		if(parseInt(($("#touzhu_money").html())-($("#current_money").html()))<0){
			$("#final_money").html("0");
		}else{
			$("#final_money").html(parseInt(($("#touzhu_money").html())-($("#current_money").html())));
		}
		
        var arr = rollJx1(1, 33, 1, 16, true, false, 6, 1, n);
        ClearSelect();
        var lotteryListSelect = document.getElementById("list_LotteryNumber");        
        for(var i = 0;i < n;i++){
        	var arrRed="";
        	var arrBlue="";
            var arr1 = arr[2 * i];
            var arr2 = arr[2 * i + 1];
            var lottery = arr1.join(' ') + ' ~ ' + arr2.join(' ');
            
            for(var j=0;j<arr1.length;j++){
	            if(arr1[j].substring(0,1)=="0"){
	            	arrRed+=arr1[j].substring(1,2)+",";
	            }else{
	            	arrRed+=arr1[j]+",";
	            }  
            }
            for(var k=0;k<arr2.length;k++){
	            if(arr2[k].substring(0,1)=="0"){
	            	arrBlue+=arr2[k].substring(1,2)+",";
	            }else{
	            	arrBlue+=arr2[k]+",";
	            }  
            }
            var lotteryNumber="";
            var controlRed=arrRed.lastIndexOf(",");
            var red=arrRed.substring(0,controlRed);
            var controlBlue=arrBlue.lastIndexOf(",");
            var blue=arrBlue.substring(0,controlBlue);
            lotteryNumber+=red+"~"+blue+"^";
            var lotteryView = '[普通]' + lottery + ' [1注，共2元]';
            var opt = new Option(lotteryView, lotteryNumber);
            
            var frontLot = lottery;
            opt.setAttribute('allLot',frontLot);
            opt.setAttribute('backLot',lotteryNumber);
        	opt.setAttribute('wangFang',"00");
        	opt.setAttribute('zhushu',"1");
        	opt.setAttribute('money',2);
			opt.setAttribute('delMoney', 2);
			
			lotteryListSelect.options.add(opt); 
            $("#lab_Num").html(totalLotteryInvest);
        }
    }
function updateMultipleTotalMoney(){
	var zhuShu=document.getElementById("lab_Num").innerHTML;
	var ssq_changeMoney=parseInt(2*zhuShu);
	initMultiple=Number($("#tb_Multiple").val());	
	totalMoney=parseInt(ssq_changeMoney*initMultiple);
	$("#investField").html(totalMoney);
	$("#current_money").html(totalMoney);
	if(parseInt(($("#touzhu_money").html())-($("#current_money").html()))<0){
		$("#final_money").html("0");
	}else{
		$("#final_money").html(parseInt(($("#touzhu_money").html())-($("#current_money").html())));
	}
}
function change_playType(){
	var commonType=document.getElementById("commonType");//普通
	var danTuoType=document.getElementById("danTuoType");//胆拖
    if(commonType.checked){
    	document.getElementById("commonDIV").style.display="block";
		document.getElementById("tuoMaDIV").style.display="none";
    }else{
		document.getElementById("commonDIV").style.display="none";
		document.getElementById("tuoMaDIV").style.display="block";
    }
}

function ClearSelect() {
    for (var i = 1; i <= 33; i++)
        SetBallState("r", GetBallNum(i), false);

    for (var i = 1; i <= 16; i++)
        SetBallState("b", GetBallNum(i), false);
}
function rollJx1(minRed, redCount, minBlue, blueCount, sort, order, redLottery,
		blueLottery, lotteryCount) {
	var redZero = minRed == 0 ? 1 : 0;
	var blueZero = minBlue == 0 ? 1 : 0;
	var redTable = '';
	var blueTable = '';
	var bigArray = new Array();
	for ( var a = 0; a < lotteryCount; a++) {
		redTable = GetBallNum(GetRandNumber(redCount) - redZero);
		for ( var i = 1; redCount > 0 && i < redLottery; i++) {
			var temp = GetBallNum(GetRandNumber(redCount) - redZero);
			while (!order && redTable.indexOf(temp) >= 0)
				temp = GetBallNum(GetRandNumber(redCount) - redZero);
			redTable += '|' + temp;
		}

		blueTable = GetBallNum(GetRandNumber(blueCount) - blueZero);
		for ( var i = 1; blueCount > 0 && i < blueLottery; i++) {
			var temp = GetBallNum(GetRandNumber(blueCount)
					- blueZero);
			while (!order && blueTable.indexOf(temp) >= 0)
				temp = GetBallNum(GetRandNumber(blueCount)
						- blueZero);
			blueTable += '|' + temp;
		}

		var redArray = redTable.split('|');
		var blueArray = blueTable.split('|');
		redArray.sort();
		blueArray.sort();
		bigArray.push(redArray);
		if (blueCount > 0)
			bigArray.push(blueArray);
	}
	return bigArray; 
}
