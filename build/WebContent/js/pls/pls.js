 function btn_2_RandManyClick (n) { 
	//ClearSelect();
 	totalLotteryInvest+=n;
	totalMoney+=n*2*Number($("#tb_Multiple").val());
	$("#investField").html(totalMoney); 
	$("#current_money").html(totalMoney);
	if(parseInt(($("#deposit_amount").html())-($("#current_money").html()))<0){
		$("#final_money").html("0");
	}else{
		$("#final_money").html(parseInt(($("#deposit_amount").html())-($("#current_money").html())));
	}
  	$("#lab_Num").html(totalLotteryInvest);
    
	var zhiXuan=document.getElementById("playTdZhiF");
	var zhiXuanHe=document.getElementById("playTdZhiXuanHe");
	
	var zuSan=document.getElementById("playTdZu3F");
	var zuLiu=document.getElementById("playTdZu6F");  
	var zu3He=document.getElementById("playTdZu3He");
	var zu6He=document.getElementById("playTdZu6He");
	
	var lotteryListSelect = document.getElementById("list_LotteryNumber");
	
	var arr = rollJx(0, 9, 3, n);
	var lottery;
	var lotteryView;
	var pls1;
	var pls2;
  		if(zhiXuan.style.display=="block" ||zhiXuan.style.display=="" || zhiXuanHe.style.display=="block"){
  			for(var i = 0;i < n;i++){
  			var lotteryNum="";
  			var arr1 = arr[i];
  			lottery = arr1+',';
  			
  			pls1=lottery;
 			var controlRed=pls1.lastIndexOf(",");
            var red=pls1.substring(0,controlRed);
            lotteryNum+="01"+red+";";
  			
  			lotteryView = '[直选] ' + lottery.substring(0,lottery.length-1) + ' [1注，共2元]';
  			var opt = new Option(lotteryView,lotteryNum);
  			var frontLot = lottery;
            opt.setAttribute('allLot',frontLot);
            opt.setAttribute('backLot',lotteryNum);
        	opt.setAttribute('wangFang',"00");
        	opt.setAttribute('zhushu',"1");
        	opt.setAttribute('money',2);
			opt.setAttribute('delMoney', 2);
			lotteryListSelect.options.add(opt); 
  		}
  		}else if(zuSan.style.display=="block"|| zu3He.style.display=="block"){
  			var c;
  			var lottery="";
  			if(n==1){
  				var lotteryNum="";
  				var a = rollJx(0, 9, 1, n);	//2 4  
  	  			var b = rollJx(0, 9, 1, n);
  	  			if(a!=b){
  	  				c = new Array(a,a,b);
  	  			}
  	  			else{
  	  				c = new Array(a,a,(b[0]*1+1));
  	  			}
	  			for(var i=0;i<c.length;i++){
				   lottery += c[i]+",";  
	  			}
	  			var endLottery=lottery.lastIndexOf(",");
	  			var lot=lottery.substring(0, endLottery);
	  			
	  			lotteryNum+="06"+lot+";";
	  			lotteryView = '[组三] ' + lot + ' [1注，共2元]';
		        var opt = new Option(lotteryView,lotteryNum);
		        opt.setAttribute('allLot',frontLot);
	            opt.setAttribute('backLot',lotteryNum);
	        	opt.setAttribute('wangFang',"00");
	        	opt.setAttribute('zhushu',"1");
	        	opt.setAttribute('money',2);
				opt.setAttribute('delMoney', 2);
				lotteryListSelect.options.add(opt); 
  		}else if(n==5){
  			var lotteryNum="";
  				var r=new Array();
  				var t;
  				var t2;
  				var t3;
  				var t4;
  				var t5;
  				var lot1="";
  				var lot2="";
  				var lot3="";
  				var lot4="";
  				var lot5="";
				   for(var k=0;k<10;k++){
					   var randArray=parseInt(Math.random()*9);
					   r.push(randArray);
				   }
				   if(r[0]!=r[1]){
					   t=r[0]+","+r[0]+","+r[1];
					   lot1 = '[组三] ' + t + ' [1注，共2元]';
				   }else{
					   t=r[0]+","+r[0]+","+(r[1]+1);
					   lot1 = '[组三] ' + t + ' [1注，共2元]';
				   }
				   lotteryNum="06"+t+";";
				   var opt = new Option(lot1,lotteryNum);
				   	opt.setAttribute('allLot',frontLot);
		            opt.setAttribute('backLot',lotteryNum);
		        	opt.setAttribute('wangFang',"00");
		        	opt.setAttribute('zhushu',"1");
		        	opt.setAttribute('money',2);
					opt.setAttribute('delMoney', 2);
					lotteryListSelect.options.add(opt);
				   if(r[1]!=r[2]){
					   t2=r[1]+","+r[1]+","+r[2];
					   lot2 = '[组三] ' + t2 + ' [1注，共2元]';
				   }else{
					   t2=r[1]+","+r[1]+","+(r[2]+1);
					   lot2 = '[组三] ' + t2 + ' [1注，共2元]';
				   }
				   lotteryNum="06"+t2+";";
			        var opt = new Option(lot2,lotteryNum);
			        opt.setAttribute('allLot',frontLot);
		            opt.setAttribute('backLot',lotteryNum);
		        	opt.setAttribute('wangFang',"00");
		        	opt.setAttribute('zhushu',"1");
		        	opt.setAttribute('money',2);
					opt.setAttribute('delMoney', 2);
					lotteryListSelect.options.add(opt);
			        
			        if(r[2]!=r[3]){
						   t3=r[2]+","+r[2]+","+r[3];
						   lot3 = '[组三] ' + t3 + ' [1注，共2元]';
					   }else{
						   t3=r[2]+","+r[2]+","+(r[3]+1);
						   lot3 = '[组三] ' + t3 + ' [1注，共2元]';
					   }
			        lotteryNum="06"+t3+";";
				        var opt = new Option(lot3,lotteryNum);
				        opt.setAttribute('allLot',frontLot);
			            opt.setAttribute('backLot',lotteryNum);
			        	opt.setAttribute('wangFang',"00");
			        	opt.setAttribute('zhushu',"1");
			        	opt.setAttribute('money',2);
						opt.setAttribute('delMoney', 2);
						lotteryListSelect.options.add(opt);
				        
				        if(r[3]!=r[4]){
							   t4=r[3]+","+r[3]+","+r[4];
							   lot4 = '[组三] ' + t4 + ' [1注，共2元]';
						   }else{
							   t4=r[3]+","+r[3]+","+(r[4]+1);
							   lot4 = '[组三] ' + t4 + ' [1注，共2元]';
						   }
				        lotteryNum="06"+t4+";";
					        var opt = new Option(lot4,lotteryNum);
					        opt.setAttribute('allLot',frontLot);
				            opt.setAttribute('backLot',lotteryNum);
				        	opt.setAttribute('wangFang',"00");
				        	opt.setAttribute('zhushu',"1");
				        	opt.setAttribute('money',2);
							opt.setAttribute('delMoney', 2);
							lotteryListSelect.options.add(opt);
					        
					        if(r[4]!=r[5]){
								   t5=r[4]+","+r[4]+","+r[5];
								   lot5 = '[组三] ' + t5 + ' [1注，共2元]';
							   }else{
								   t5=r[4]+","+r[4]+","+(r[5]+1);
								   lot5 = '[组三] ' + t5 + ' [1注，共2元]';
							   }
					        lotteryNum="06"+t5+";";
						        var opt = new Option(lot5,lotteryNum);
						        opt.setAttribute('allLot',frontLot);
					            opt.setAttribute('backLot',lotteryNum);
					        	opt.setAttribute('wangFang',"00");
					        	opt.setAttribute('zhushu',"1");
					        	opt.setAttribute('money',2);
								opt.setAttribute('delMoney', 2);
								lotteryListSelect.options.add(opt);
  			}
  		}
  			else if(zuLiu.style.display=="block"||zu6He.style.display=="block"){
  			for(var i = 0;i < n;i++){
  				var lotteryNum="";
                arr1 = arr[i];
                lottery = arr1+',';
                
               pls2=lottery;
    		   var con=pls2.lastIndexOf(",");
               var zu6=pls2.substring(0,con);
               lotteryNum+="06"+zu6+";";
                lotteryView = '[组六] ' + lottery.substring(0,lottery.length-1) + ' [1注，共2元]';
                var opt = new Option(lotteryView,lotteryNum);
                opt.setAttribute('allLot',frontLot);
	            opt.setAttribute('backLot',lotteryNum);
	        	opt.setAttribute('wangFang',"00");
	        	opt.setAttribute('zhushu',"1");
	        	opt.setAttribute('money',2);
				opt.setAttribute('delMoney', 2);
				lotteryListSelect.options.add(opt); 
            }
  		}
    }
 function ClearAll(jspIndex,tabIndex){
	 for(var i=0;i<10;i++){
		 var id="td"+jspIndex+"_2_"+tabIndex+"_"+i;
		 var ball=document.getElementById(id);
		 ball.setAttribute('isselected','false');
		 ball.className='ball_num';
		 document.getElementById("lab_2_Selected").innerHTML = "0注，0元。"; 
		 document.getElementById("lab_Zu3F_Selected").innerHTML = "0注，0元。";
		 document.getElementById("lab_Zu6F_Selected").innerHTML= "0注，0元。";
	 }
 }
 function updateMultipleTotalMoney(){
	var zhuShu=document.getElementById("lab_Num").innerHTML;
	var pls=parseInt(2*zhuShu);
 	initMultiple=Number($("#tb_Multiple").val());	
 	totalMoney=parseInt(pls*initMultiple);
 	$("#investField").html(totalMoney);
 	$("#current_money").html(totalMoney);
	$("#final_money").html(parseInt(($("#deposit_amount").html())-($("#current_money").html())));
 }

var playAllMethod=['ZhiF','Zu3F','Zu6F','ZhiXuanHe','Zu3He','Zu6He']; 
function clickPlayType0(v) {
	for(var i=0;i<playAllMethod.length;i++){
		$("#playTd"+playAllMethod[i]).css("display","none");
	}
	$("#playTd"+v).css("display","block");
	
} 
function rollJx(minNum, col, row, lotteryCount) {
	var oneOrZero = minNum == 0 ? 1 : 0;
	var bigArray = new Array();
	for ( var j = 0; j < lotteryCount; j++) {
		var tempArr = new Array();
		for ( var i = 0; i < row; i++) {
			tempArr.push(GetRandNumber(col) - oneOrZero);
		}
		bigArray.push(tempArr);
	}
	return bigArray;
}