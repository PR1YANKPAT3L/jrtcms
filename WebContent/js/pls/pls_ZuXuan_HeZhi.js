    function plsZuXuanHe_selectBall(sender) {
        var Selected = GetState_zuHe(sender);
        if (Selected) {
        	SetBallState_zuXuanHe(sender, false);
        	CheckFull_plszuXuanHe();
            return;
        }
        SetBallState_zuXuanHe(sender, true);
        CheckFull_plszuXuanHe();
    }

    function GetBallObject(Num) {
        var obj = document.getElementById("td8_2_" + GetBallNum(Num));
        return obj;
    }

    function GetBallNum(Num) {
        var BallNum = "" + Num;
        if (BallNum.length == 1)
            BallNum = "0" + BallNum;

        return BallNum;
    }

    function GetBallSelectedNum_plsZuHe() {
        var Count = 0;
        for (var i =2; i <= 25; i++) {
            var obj = GetBallObject(i);
            if (GetState_zuHe(obj))
                Count++;
        }
        return Count;
    }
    
    function GetState_zuHe(sender) {
      return sender.getAttribute('isselected') == 'true' ? true : false;
    }


    function SetBallState_zuXuanHe(sender, SelectState) {
        if (!SelectState) {
            sender.className = 'ball_num';
            sender.setAttribute('isselected', 'false');
        } else {
            sender.className = 'ball_num_r';
            sender.setAttribute('isselected', 'true');
        }
    }

    function CheckFull_plszuXuanHe() {
        var invest = GetLotteryInvestNum_plsZuHe();
        var p = invest * 2;
        document.getElementById("plsZhuShu").innerHTML = invest + "注，" + p.toFixed() + "元。";
        if(GetBallSelectedNum_plsZuHe() < 1) document.getElementById("plsZuHeAdd").setAttribute('isdisabled', 'true');
        else  document.getElementById("plsZuHeAdd").setAttribute('isdisabled', 'false');
    }

    function GetLotteryNumber_heZhi() {
        var LotteryNumber = "";
        for (var i = 2; i <= 25; i++) {
            var obj = GetBallObject(i);
            if (GetState_zuHe(obj))
                LotteryNumber += (i + "\n");
        }
        return LotteryNumber.trim().rtrimWithReturn();
    }

    function GetLotteryInvestNum_plsZuHe()
    {
        var InvestNum = 0;
        for (var i = 2; i <= 25; i++) { 
            var obj = GetBallObject(i);
            if (GetState_zuHe(obj))
                InvestNum += GetNumbersInversNum_plszuHe(i);
        }
        return InvestNum;
    }

    function GetNumbersInversNum_plszuHe(BallNum)	
    {
        if (BallNum == 2) return 2;
        if (BallNum == 3) return 2;
        if (BallNum == 4) return 4;
        if (BallNum == 5) return 5;
        if (BallNum == 6) return 6;
        if (BallNum == 7) return 8;
        if (BallNum == 8) return 10;
        if (BallNum == 9) return 11;
        if (BallNum == 10) return 13;
        if (BallNum == 11) return 14;
        if (BallNum == 12) return 14;
        if (BallNum == 13) return 15;
        if (BallNum == 14) return 15;
        if (BallNum == 15) return 14;
        if (BallNum == 16) return 14;
        if (BallNum == 17) return 13;
        if (BallNum == 18) return 11;
        if (BallNum == 19) return 10;
        if (BallNum == 20) return 8;
        if (BallNum == 21) return 6;
        if (BallNum == 22) return 5;
        if (BallNum == 23) return 4;
        if (BallNum == 24) return 2;
        if (BallNum == 25) return 2;
        return 0;
    }

    function ClearSelect() {
        for (var i = 2; i <= 25; i++) {
            var obj = GetBallObject(i);
            SetBallState_zuXuanHe(obj, false);
        }
    }
    
    function plsZuHe_AddClick() {
    	if(document.getElementById("plsZuHeAdd").getAttribute('isdisabled') == 'true') return false;
        var invest = GetLotteryInvestNum_plsZuHe();
        if (invest < 1) {
        	alert("投注提示：\n请至少选择一注");
            return false;
        }
        var str = GetLotteryNumber_heZhi().split("\n");
        var lotteryListSelect = document.getElementById("list_LotteryNumber");
        var lotteryView = '[直选和值] ' + str + ' [' + invest + '注，共' + 2 * invest + '元]';
        var lotteryMoney = str + '%' +  2*invest;
        totalMoney+=2 * invest;
        var opt = new Option(lotteryView, invest);
        lotteryListSelect.options[lotteryListSelect.options.length] = opt;

        var multiple=(Number($("#tb_Multiple").val()));
        var check_money=parseInt(2 * invest);
        var partial_money=document.getElementById("investField").innerHTML;
        totalMoney=parseInt((check_money*multiple)+partial_money*1);
        
		$("#investField").html(totalMoney);
		totalLotteryInvest+=invest;
		$("#lab_Num").html(totalLotteryInvest);	
		ClearSelect();
        return true;
    }