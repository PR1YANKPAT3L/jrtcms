
    function SelectBallZiHe(sender) {
        var Selected = GetBallState_ziXuanHe(sender);
        if (Selected) {
        	SetBallState_ziXuanHe(sender, false);
        	CheckFull_ziXuanHe();
            return;
        }
        SetBallState_ziXuanHe(sender, true);
        CheckFull_ziXuanHe();
    }

    function GetBallObjectzh(Num) {
        var obj = document.getElementById("td_2_" + GetBallNum(Num));
        return obj;
    }

    function GetBallNum(Num) {
        var BallNum = "" + Num;
        if (BallNum.length == 1)
            BallNum = "0" + BallNum;
        return BallNum;
    }

    function GetBallSelectedNum_ziHe() {
        var Count = 0;
        for (var i = 0; i <= 27; i++) {
            var obj = GetBallObjectzh(i);
            if (GetBallState_ziXuanHe(obj))
                Count++;
        }
        return Count;
    }
    
    function GetBallState_ziXuanHe(sender) {
      return sender.getAttribute('isselected') == 'true' ? true : false;
    }


    function SetBallState_ziXuanHe(sender, SelectState) {
        if (!SelectState) {
            sender.className = 'ball_num';
            sender.setAttribute('isselected', 'false');
        } else {
            sender.className = 'ball_num_r';
            sender.setAttribute('isselected', 'true');
        }
    }

    function CheckFull_ziXuanHe() {
        var invest = GetLotteryInvestNum_ziHe();
        var p = invest * 2;
        document.getElementById("ziHeSelected").innerHTML = invest + "注，" + p.toFixed() + "元。";
        if(GetBallSelectedNum_ziHe() < 1) document.getElementById("btn_addEvent").setAttribute('isdisabled', 'true');
        else  document.getElementById("btn_addEvent").setAttribute('isdisabled', 'false');
    }

    function GetLotteryNumber_plsHeZhi() {
    	var ziXuanHeCode="";
        var LotteryNumber = "";
        var lot;
        var temp;
        for (var i = 0; i <= 27; i++) {
            var obj = GetBallObjectzh(i);
            if (GetBallState_ziXuanHe(obj))
                LotteryNumber += (i + ",");
        }
        lot=LotteryNumber.lastIndexOf(",");
        LotteryNumber=LotteryNumber.substring(0, lot);
        ziXuanHeCode+="S1"+LotteryNumber+";";
        return ziXuanHeCode;
    }
    function GetFrontZiXuanHe() {
        var LotteryNumber = "";
        for (var i = 0; i <= 27; i++) {
            var obj = GetBallObjectzh(i);
            if (GetBallState_ziXuanHe(obj))
                LotteryNumber += (i + "\n");
        }
        return LotteryNumber.trim().rtrimWithReturn();
    }

    function GetLotteryInvestNum_ziHe()	//取注数
    {
        var InvestNum = 0;
        for (var i = 0; i <= 27; i++) {
            var obj = GetBallObjectzh(i);
            if (GetBallState_ziXuanHe(obj))
                InvestNum += GetNumbersInversNum_ziHe(i);
        }
        return InvestNum;
    }

    function GetNumbersInversNum_ziHe(BallNum)	//取不同和值的可投注数
    {
    	if (BallNum == 0) return 1;
        if (BallNum == 1) return 3;
        if (BallNum == 2) return 6;
        if (BallNum == 3) return 10;
        if (BallNum == 4) return 15;
        if (BallNum == 5) return 21;
        if (BallNum == 6) return 28;
        if (BallNum == 7) return 36;
        if (BallNum == 8) return 45;
        if (BallNum == 9) return 55;
        if (BallNum == 10) return 63;
        if (BallNum == 11) return 69;
        if (BallNum == 12) return 73;
        if (BallNum == 13) return 75;
        if (BallNum == 14) return 75;
        if (BallNum == 15) return 73;
        if (BallNum == 16) return 69;
        if (BallNum == 17) return 63;
        if (BallNum == 18) return 55;
        if (BallNum == 19) return 45;
        if (BallNum == 20) return 36;
        if (BallNum == 21) return 28;
        if (BallNum == 22) return 21;
        if (BallNum == 23) return 15;
        if (BallNum == 24) return 10;
        if (BallNum == 25) return 6;
        if (BallNum == 26) return 3;
        if (BallNum == 27) return 1;
        return 0;
    }

    function ClearZiHeSelect() {
        for (var i = 0; i <= 27; i++) {
            var obj = GetBallObjectzh(i);
            SetBallState_ziXuanHe(obj, false);
        }
        document.getElementById("ziHeSelected").innerHTML= "0注，0元。"; 
    }
    
    function plsZhiHe_AddClick() {
	    var invest = GetLotteryInvestNum_ziHe();
	    if (invest < 1) {
	    	alert("投注提示：\n请至少选择一注");
	        return false;
	    }	
	    if(document.getElementById("btn_addEvent").getAttribute('isdisabled') == 'true') return false;
        
	    var lotteryView=GetFrontZiXuanHe();
	    var frontLot=lotteryView;
	    var lotteryNumber=GetLotteryNumber_plsHeZhi();
        var lotteryListSelect = document.getElementById("list_LotteryNumber");
        lotteryView = '[直选和值] ' + lotteryView + ' [' + invest + '注，共' + 2 * invest + '元]';
        var opt = new Option(lotteryView,lotteryNumber);
        opt.setAttribute('allLot',frontLot);
    	opt.setAttribute('backLot',lotteryNumber);
    	opt.setAttribute('wangFang',"10");
    	opt.setAttribute('zhushu',invest);
    	opt.setAttribute('money',2 * invest);
    	opt.setAttribute('delMoney', 2 * invest);
    	lotteryListSelect.options.add(opt);
        totalMoney+=2 * invest;
        var multiple=(Number($("#tb_Multiple").val()));
        var check_money=parseInt(2 * invest);
        var partial_money=document.getElementById("investField").innerHTML;
        totalMoney=parseInt((check_money*multiple)+partial_money*1);
        totalLotteryInvest+=invest;
		$("#investField").html(totalMoney);
		$("#current_money").html(totalMoney);
		$("#final_money").html(parseInt(($("#deposit_amount").html())-($("#current_money").html())));
		$("#lab_Num").html(totalLotteryInvest);	
		ClearZiHeSelect();
    }