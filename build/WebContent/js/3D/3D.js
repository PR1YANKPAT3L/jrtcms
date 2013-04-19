 function btn_2_RandManyClick (n) { 
	 //debugger;
 	totalLotteryInvest+=n;
	totalMoney+=n*2*Number($("#tb_Multiple").val());
	$("#investField").html(totalMoney); 
	$("#current_money").html(totalMoney);
  	$("#lab_Num").html(totalLotteryInvest);
  	if(parseInt(($("#touzhu_money").html())-($("#current_money").html()))<0){
  		$("#final_money").html("0");
  	}else{
  		$("#final_money").html(parseInt(($("#touzhu_money").html())-($("#current_money").html())));
  	}
  	
	var zhiXuan=document.getElementById("playTdZhiF");
	//var zhiXuanHe=document.getElementById("playTdZhiXuanHe");
	var zuSan=document.getElementById("playTdZu3F");
	var zuLiu=document.getElementById("playTdZu6F");
	var playTdZu3HeZhi=document.getElementById("playTdZu3HeZhi");	
	var playTdZu6HeZhi=document.getElementById("playTdZu6HeZhi");
	
	var lotteryListSelect = document.getElementById("list_LotteryNumber");
	var lottery;
	var lotteryView;
	var sd1;
	var sd2;
	var sd3;
		if(zhiXuan==null){
		var arr = rollJx(0, 9, 3, n);
  			for(var i = 0;i < n;i++){
  			var lotteryNumber="";
  			var arr1 = arr[i];
  			lottery = arr1+',';
  			
  			 sd1=lottery;
  			 var controlRed=sd1.lastIndexOf(",");
             var red=sd1.substring(0,controlRed);
             lotteryNumber+="00"+red+"^";
             
  			lotteryView = '[直选] ' + lottery.substring(0,lottery.length-1) + ' [1注，共2元]';
  			var opt = new Option(lotteryView,lotteryNumber);
  			var frontLot = lottery;
            opt.setAttribute('allLot',frontLot);
            opt.setAttribute('backLot',lotteryNumber);
        	opt.setAttribute('wangFang',"00");
        	opt.setAttribute('zhushu',"1");
        	opt.setAttribute('money',2);
			opt.setAttribute('delMoney', 2);
			lotteryListSelect.options.add(opt); 
			}
		}
  		if(zhiXuan.style.display=="block"||zhiXuan.style.display==""){
  			var arr = rollJx(0, 9, 3, n);
  			for(var i = 0;i < n;i++){
  			var lotteryNumber="";
  			var arr1 = arr[i];
  			lottery = arr1+',';
  			
  			 sd1=lottery;
  			 var controlRed=sd1.lastIndexOf(",");
             var red=sd1.substring(0,controlRed);
             lotteryNumber+="00"+red+"^";
             
  			lotteryView = '[直选] ' + lottery.substring(0,lottery.length-1) + ' [1注，共2元]';
  			var opt = new Option(lotteryView,lotteryNumber);
  			var frontLot = lottery;
            opt.setAttribute('allLot',frontLot);
            opt.setAttribute('backLot',lotteryNumber);
        	opt.setAttribute('wangFang',"00");
        	opt.setAttribute('zhushu',"1");
        	opt.setAttribute('money',2);
			opt.setAttribute('delMoney', 2);
			lotteryListSelect.options.add(opt); 
  		}
  		}else if(zuSan.style.display=="block"|| playTdZu3HeZhi.style.display=="block"){
  			var c;
  			var lottery="";
  			if(n==1){
  				var lotteryNumber="";
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
	  			
	  			lotteryNumber+="01"+lot+"^";
	  			lotteryView = '[组三] ' + lot + ' [1注，共2元]';
		        var opt = new Option(lotteryView,lotteryNumber);
		        opt.setAttribute('allLot',frontLot);
	            opt.setAttribute('backLot',lotteryNumber);
	        	opt.setAttribute('wangFang',"00");
	        	opt.setAttribute('zhushu',"1");
	        	opt.setAttribute('money',2);
				opt.setAttribute('delMoney', 2);
				lotteryListSelect.options.add(opt); 
  			}else if(n==5){
  				var lotteryNumber="";
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
				   lotteryNumber="01"+t+"^";
				   var opt = new Option(lot1,lotteryNumber);
				    opt.setAttribute('allLot',frontLot);
		            opt.setAttribute('backLot',lotteryNumber);
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
				   lotteryNumber="01"+t2+"^";
			        var opt = new Option(lot2,lotteryNumber);
			        opt.setAttribute('allLot',frontLot);
		            opt.setAttribute('backLot',lotteryNumber);
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
			        lotteryNumber="01"+t3+"^";
				        var opt = new Option(lot3,lotteryNumber);
				        opt.setAttribute('allLot',frontLot);
			            opt.setAttribute('backLot',lotteryNumber);
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
				        lotteryNumber="01"+t4+"^";
					        var opt = new Option(lot4,lotteryNumber);
					        opt.setAttribute('allLot',frontLot);
				            opt.setAttribute('backLot',lotteryNumber);
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
				        	lotteryNumber="01"+t5+"^";
					        var opt = new Option(lot5,lotteryNumber);
					        opt.setAttribute('allLot',frontLot);
				            opt.setAttribute('backLot',lotteryNumber);
				        	opt.setAttribute('wangFang',"00");
				        	opt.setAttribute('zhushu',"1");
				        	opt.setAttribute('money',2);
							opt.setAttribute('delMoney', 2);
							lotteryListSelect.options.add(opt);
  			}
  		}else if(zuLiu.style.display=="block" || playTdZu6HeZhi.style.display=="block"){
  			var arr = rollJx(0, 9, 3, n);
  			for(var i = 0;i < n;i++){
  				var lotteryNumber="";
                arr1 = arr[i];
                lottery = arr1+',';
                sd2=lottery;
     			var con=sd2.lastIndexOf(",");
                var zu6=sd2.substring(0,con);
                lotteryNumber+="02"+zu6+"^";
                
                lotteryView = '[组六] ' + lottery.substring(0,lottery.length-1) + ' [1注，共2元]';
                var opt = new Option(lotteryView,lotteryNumber);
                opt.setAttribute('allLot',frontLot);
	            opt.setAttribute('backLot',lotteryNumber);
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
		 document.getElementById("3D_lab_2_Selected").innerHTML = "0注，0元。"; 
		 if($("#3D_invert")){
			$("#3D_invert").html("0注，0元。");
		}
		 //document.getElementById("lab_Zu3F_Selected").innerHTML = "0注，0元。";
		 //document.getElementById("lab_Zu6F_Selected").innerHTML= "0注，0元。";
	 }
 }
 function updateMultipleTotalMoney(){
	var zhuShu=document.getElementById("lab_Num").innerHTML;
	var fc3d=parseInt(2*zhuShu);
 	initMultiple=Number($("#tb_Multiple").val());
 	
 	totalMoney=parseInt(fc3d*initMultiple);
 	$("#investField").html(totalMoney);
 	$("#current_money").html(totalMoney);
 	$("#final_money").html(parseInt(($("#touzhu_money").html())-($("#current_money").html())));
 }
var playAllMethod=['ZhiF','Zu3F','Zu6F','ZhiXuanHe','Zu3HeZhi','Zu6HeZhi']; 
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