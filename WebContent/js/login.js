//加入收藏
function addCookie(){
	if (document.all){
		window.external.addFavorite(location.href,document.title);
	}else if (window.sidebar){
		window.sidebar.addPanel(document.title, location.href, "");
		}
	}
//设为首页
function setHomepage(){
	if (document.all){
		document.body.style.behavior='url(#default#homepage)';
		document.body.setHomePage('http://www.ruyicai.com');
		}
	else if (window.sidebar){
		if(window.netscape){
			try{
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
			}catch (e){ 
			   alert("该操作被浏览器拒绝，如果想启用该功能，请在地址栏内输入 about:config,然后将项 signed.applets.codebase_principal_support 值该为true"); 
			 }
		   } 
		    var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
			if(confirm("是否要将“http://www.ruyicai.com”设置为首页")){
		    prefs.setCharPref('browser.startup.homepage','http://www.ruyicai.com');
			}
		 }
	}

//更改验证码头部验证码加载
function change(mag){
	var d=new Date();
	var imageUrl = "/chlw/function/common/image.jsp?id="+d.getDate()+ Math.random();
	$("#"+mag).attr('src',imageUrl);
}

//验证手机号码
function checkTelephone(){
	var tele = $("#mobileId").val();
	var mno = $("#mno");
	if(tele==null || tele==""){
		mno.html("请您输入手机号码!");
		return false;
	}
	var telePattern=/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
	if(!telePattern.test(tele)){
		mno.html("手机号码格式错误!");
		return false;
	}
	mno.innerHTML=""; 
	return true;
}

//验证用户名
function checkUserName(){
	var tele = $("#userName").val();
	var mno = $("#mno");
	if(tele==null || tele==""){
		mno.html("请您输入用户名!");
		return false;
	}
	var telePattern=/^[a-z]{1}[a-z0-9_]{3,15}$/;
	if(!telePattern.test(tele)){
		mno.html("请正确输入用户名!");
		return false;
	}
	mno.innerHTML=""; 
	return true;
}
// 验证密码
function checkPass(){
	var pass = $("#password").val();
	var upass = $("#upass");
	if(pass==null || pass==""){
		upass.html("请正确输入密码!");
		return false;
	}
	upass.innerHTML=""; 
	return true;
}
// 表单提交验证手机号码和密码
function checkformsub(){
	var teleOk = checkTelephone();
	var passOk = checkPass();
	if(teleOk && passOk){
		return true;
	}else{
		return false;
	}
}
//点击首页头部登录让登录层显示
function loginShow(){
	// change('mag');
	  $('#login_pop').toggle();
}

/**
 * ajax登录
 * @return
 */
function ajaxlogin(){
 var userName=/^[a-z]{1}[a-z0-9_]{3,15}$/;
 var password = /^[0-9a-zA-Z]{6,11}$/;
 var mobile_nullError="用户名不能为空！";
 var mobileId_error = "请输入正确的用户名！";
 var password_nullError="密码不能为空！";
 var password_error = "请输入您的密码，不少于6个字符！";
 var phone=$("#userName").val();
 var pwd=$("#password").val();
 if(phone=="" || phone==null){
	alert(mobile_nullError);
	return false;
 }else if(!userName.test($("#userName").val())){
	 alert(mobileId_error);
	 return false;
 }
 if(pwd=="" || pwd==null){
	alert(password_nullError);
	return false;
}else if(!password.test($("#password").val())){
	 alert(password_error);
	 return false;
 }
 var params=$('#logform').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值   
	$.ajax({   
		url:'/chlw/function/tuserinfoAction!ajaxLogin',   
		type:'post', //数据发送方式   
		data:params, //接受数据格式   
		dataType:'json' ,
		success: function(msg){
			if(msg!=null&&msg!="null"){
				$('#login_pop').hide();
				$('#userDivDis').css('display','block');
				$('#userDivNone').css('display','none');
				//首页右边显示与隐藏
				$('#login_success').css('display','block');
				$('#noLogin').css('display','none');
				
				//投注页面显示名称及内容
				//判断该控件是否存在
				if ($("#this_username").length > 0) {
					$('#this_username').html(msg.userName);
				}
				if($("#touzhu_money").length > 0){
					$('#touzhu_money').html(msg.deposit_amount);
				}
				
				if($("#FM_Id1").length > 0){
					$("#FM_Id1").contents().find("#touzhu_money").html(msg.deposit_amount);//首页iframe里赋值
					$("#FM_Id2").contents().find("#touzhu_money").html(msg.deposit_amount);
					$("#FM_Id3").contents().find("#touzhu_money").html(msg.deposit_amount);
				}
				//重新加载内容
				topLogin();
				indexRight();
			}else{
				change('magTop');
			}
		}
	});
	return true;
}

function topLogin(){
	$.ajax({
	    type: "get",
	    url: "/chlw/function/user/user_top.jsp?"+Math.random(),
	    dataType: "html",
	    success: function(msg){
	     $('#top_user').html(msg);}
	});
}

//首页加载
function indexRight(){
	$.ajax({
	    type: "get",
	    url: "/chlw/function/user/index_right_div.jsp?"+Math.random(),
	    dataType: "html",
	    success: function(msg){
	     $('#top_right').html(msg);}
	});
}

//查询余额
function balanceDivDis(){
	 $.ajax({   
			url:'/chlw/function/selectAll!findBalance',  
			type:'post', //数据发送方式   
			dataType:'json',
			success: function(msg){
				$('#deposit_amount').html(msg.deposit_amount/100);
				$('#valid_amount').html(msg.valid_amount/100);
				$('#freeze_amout').html(msg.freeze_amout/100);
			}
		}); 	 
}

//查询余额
function findBalance(){
	 $.ajax({   
			url:'/chlw/function/selectAll!findBalance',  
			type:'post', //数据发送方式   
			dataType:'json',
			success: function(msg){
				$('#deposit_amount_user').html(msg.deposit_amount/100);
				$('#valid_amount_user').html(msg.valid_amount/100);
				$('#freeze_amout_user').html(msg.freeze_amout/100);
			}
		}); 	 
}

/**
 * 用户退出
 * @return
 */
function ajaxLoginOut(){
	$.ajax({
	    type: "POST",
	    url: "/chlw/function/tuserinfoAction!loginOut",
	    success: function(msg){
		  window.location.href="/rules/login.html";	
		  topLogin();
		  indexRight();
	     }
	   });
}

