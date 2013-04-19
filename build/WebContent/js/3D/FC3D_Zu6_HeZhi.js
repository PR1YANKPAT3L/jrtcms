   
function zuLiuHeSelectBall(sender) {
        var Selected = GetBallState_zu6He(sender);
        if (Selected) {
        	SetBallState_zu6He(sender, false);
        	CheckFull_zu6();
            return;
        }
        SetBallState_zu6He(sender, true);
        CheckFull_zu6();
    }

    function GetBallObject_zu6He(Num) {
        var obj = document.getElementById("td5_2_" + GetBallNum_zu6(Num));
        return obj;
    }

    function GetBallNum_zu6(Num) {
        var BallNum = "" + Num;
        if (BallNum.length == 1)
            BallNum = "0" + BallNum;
        return BallNum;
    }

    function GetBallSelectedNum_zu6() {
        var Count = 0;
        for (var i = 3; i <= 24; i++) {
            var obj = GetBallObject_zu6He(i);
            if (GetBallState_zu6He(obj))
                Count++;
        }
        return Count;
    }

    function GetBallState_zu6He(sender) {
    	return sender.getAttribute('isselected') == 'true' ? true : false;
    }


    function SetBallState_zu6He(sender, SelectState) {
    	if (!SelectState) {
            sender.className = 'ball_num';
            sender.setAttribute('isselected', 'false');
        } else {
            sender.className = 'ball_num_r';
            sender.setAttribute('isselected', 'true');
        }
    }

    function CheckFull_zu6() {
        var invest = GetLotteryInvestNum_zu6();
        var p = invest * 2;          
        document.getElementById("zu6Select").innerHTML = invest + "注，" + p.toFixed() + "元。";
        if(GetBallSelectedNum_zu6() < 1)document.getElementById("btnZu6").setAttribute('isdisabled', 'true');
        else document.getElementById("btnZu6").setAttribute('isdisabled', 'false');
    }

    function GetZu6LotteryNumber() {
    	var zu6HeCode="";
    	var lot;
        var LotteryNumber = "";
        for (var i = 3; i <= 24; i++) {
            var obj = GetBallObject_zu6He(i);
            if (GetBallState_zu6He(obj))
                LotteryNumber += (obj.innerHTML.trim() + ",");
        }
        lot=LotteryNumber.lastIndexOf(",");
        LotteryNumber=LotteryNumber.substring(0, lot);
        zu6HeCode+="12"+LotteryNumber+"^";
        return zu6HeCode;
    }
    function GetFrontZu6He() {
        var LotteryNumber = "";
        for (var i = 3; i <= 24; i++) {
            var obj = GetBallObject_zu6He(i);
            if (GetBallState_zu6He(obj))
                LotteryNumber += (obj.innerHTML.trim() + "\n");
        }
        return LotteryNumber.trim().rtrimWithReturn();
    }

    function GetLotteryInvestNum_zu6()
    {
        var InvestNum = 0;
        for (var i = 3; i <= 24; i++) {
            var obj = GetBallObject_zu6He(i);
            if (GetBallState_zu6He(obj))
                InvestNum += GetNumbersInversNum_zu6(parseInt(obj.innerHTML.trim(), 10));
        }
        return InvestNum;
    }
    function GetNumbersInversNum_zu6(BallNum)
    {
        if (BallNum == 3) return 1;
        if (BallNum == 4) return 1;
        if (BallNum == 5) return 2;
        if (BallNum == 6) return 3;
        if (BallNum == 7) return 4;
        if (BallNum == 8) return 5;
        if (BallNum == 9) return 7;
        if (BallNum == 10) return 8;
        if (BallNum == 11) return 9;
        if (BallNum == 12) return 10;
        if (BallNum == 13) return 10;
        if (BallNum == 14) return 10;
        if (BallNum == 15) return 10;
        if (BallNum == 16) return 9;
        if (BallNum == 17) return 8;
        if (BallNum == 18) return 7;
        if (BallNum == 19) return 5;
        if (BallNum == 20) return 4;
        if (BallNum == 21) return 3;
        if (BallNum == 22) return 2;
        if (BallNum == 23) return 1;
        if (BallNum == 24) return 1;
        return 0;
    }

    function ClearSelect() {
        for (var i = 3; i <= 24; i++) {
            var obj = GetBallObject_zu6He(i);
            SetBallState_zu6He(obj, false);
        }
        document.getElementById("zu6Select").innerHTML="0注，0元。";
    }

    function btnZu6Click() {
    	if(document.getElementById("btnZu6").getAttribute('isdisabled') == 'true') return false;
    	 var invest = GetLotteryInvestNum_zu6();
         if (invest < 1) {
         	alert("投注提示：\n请至少选择一注");
             return false;
         }
        var lotteryView=GetFrontZu6He();
        var frontLot=lotteryView;
        var lotteryNumber=GetZu6LotteryNumber();
        var lotteryListSelect = document.getElementById("list_LotteryNumber");
        lotteryView = '[组选和值] ' + lotteryView + ' [' + invest + '注，共' + 2 * invest + '元]';
        var opt = new Option(lotteryView,lotteryNumber);
        opt.setAttribute('allLot',frontLot);
    	opt.setAttribute('backLot',lotteryNumber);
    	opt.setAttribute('wangFang',"11");
    	opt.setAttribute('zhushu',invest);
    	opt.setAttribute('money',2 * invest);
    	opt.setAttribute('delMoney', 2 * invest);
    	lotteryListSelect.options.add(opt);
        totalMoney+=2 * invest;
        
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
