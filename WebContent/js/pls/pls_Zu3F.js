
    function SelectBallZu3F(sender) {
    	var Selected = GetBallStateZu3F(sender);
        if (Selected) {
            SetBallStateZu3F(sender, false);
            CheckFullZu3F();
            return;
        }
        SetBallStateZu3F(sender, true);
        CheckFullZu3F();
    }
    function GetBallObjectZu3F(row, col) {
        var obj = document.getElementById("td2_2_" + row + "_" + col);
        return obj;
    }

    function GetBallSelectedNumZu3F(row) {
        var Count = 0;
        for (var i = 0; i < 10; i++) {
            var obj = GetBallObjectZu3F(row, i);
            if (GetBallStateZu3F(obj))
                Count++;
        }
        return Count;
    }


    function GetBallStateZu3F(sender) {
        return sender.getAttribute('isselected') == 'true' ? true : false;
    }

    function SetBallStateZu3F(sender, SelectState) {
    	if (!SelectState) {
            sender.className = 'ball_num';
            sender.setAttribute('isselected', 'false');
        } else {
            sender.className = 'ball_num_r';
            sender.setAttribute('isselected', 'true');
        }
    }

    function CheckFullZu3F() {
        var Num = GetBallSelectedNumZu3F(0);
        var invest = GetLotteryInvestNumZu3F();
        var p = invest * 2;
        document.getElementById("lab_Zu3F_Selected").innerHTML = invest + "注，" + p.toFixed() + "元。";
        if(invest < 2)document.getElementById("btn_Zu3F_Add").setAttribute('isdisabled', 'true');
        else document.getElementById("btn_Zu3F_Add").setAttribute('isdisabled', 'false');
    }

    function GetLotteryNumberZu3F() {
    	var zu3FuShiCode="";
        var LotteryNumber = "";
        var lot;
        for (var i = 0; i < 1; i++) {
            var temp = " ";
            for (var j = 0; j < 10; j++) {
                var obj = GetBallObjectZu3F(i, j);
                if (GetBallStateZu3F(obj))
                    temp += obj.innerHTML.trim()+",";
            }
            temp = temp.trim();
            LotteryNumber += temp;
        }
        lot=LotteryNumber.lastIndexOf(",");
        LotteryNumber=LotteryNumber.substring(0, lot);
        zu3FuShiCode+="F3"+LotteryNumber+"^";
        return zu3FuShiCode;
    }
    function GetFrontZu3Fu() {
        var LotteryNumber = "";
        for (var i = 0; i < 1; i++) {
            var temp = " ";
            for (var j = 0; j < 10; j++) {
                var obj = GetBallObjectZu3F(i, j);
                if (GetBallStateZu3F(obj))
                    temp += obj.innerHTML.trim();
            }
            temp = temp.trim();
            LotteryNumber += temp;
        }
        return LotteryNumber.trim();
    }

    function GetLotteryInvestNumZu3F() {
        var Count = GetBallSelectedNumZu3F(0);
        if (Count < 2)
            return 0;
        if (Count == 2)
            return 2;

        var InvestNum = 1;
        for (var i = 3; i <= Count; i++)
            InvestNum *= i;
        for (var i = 2; i <= (Count - 2); i++)
            InvestNum = Math.round(InvestNum / i);
        
        return InvestNum * 2;
    }
    
    function btn_2_AddClickZu3F() {
		
    	var invest = GetLotteryInvestNumZu3F();
        if (invest < 2) {
            alert("您的选择有误！\n应至少选择2个号码。请检查您选择的号码。");
            return false;
        }		
        if(document.getElementById('btn_Zu3F_Add').getAttribute('isdisabled') == 'true') return;			
       	var lotteryListSelect = document.getElementById("list_LotteryNumber");
       	var lotteryView=GetFrontZu3Fu();
       	var frontLot=lotteryView;
        var lotteryNumber = GetLotteryNumberZu3F();
        lotteryView = '[组三] ' + lotteryView + ' [' + invest + '注，共' + 2 * invest + '元]';
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
		$("#investField").html(totalMoney);
		totalLotteryInvest+=invest;
		$("#lab_Num").html(totalLotteryInvest);	
		ClearAll(2,0);
        return true;
    }