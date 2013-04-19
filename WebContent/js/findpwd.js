function  findpwdValidator(){
	$(document).ready(function(){
		$.formValidator.initConfig({formid:"findPwdForm",onError:function(){alert(decodeURI(EncodeUtf8("校验没有通过，具体错误请看错误提示")));}});
		//手机号码验证
		$("#inputMobile").formValidator({
			onshow : decodeURI(EncodeUtf8("请输入11位手机号码！")),
			onfocus : decodeURI(EncodeUtf8("请输入您的手机号码，不可为空")),
			oncorrect : decodeURI(EncodeUtf8("该手机号格式正确"))
		}).inputValidator({
			min : 11,
			max : 11,
			onerror : decodeURI(EncodeUtf8("对不起，请正确填写手机号！"))
		}).regexValidator({
			regexp : "mobile",
			datatype : "enum",
			onerror : decodeURI(EncodeUtf8("对不起， 该手机号码不存在或者号码格式错误。"))
		});
	});
}

function toFindpwd(){
	var params=$('#findPwdForm').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值   
	// 发送请求
	$.ajax({
		url	: '/chlw/3gfunction/3g_findtuser2!chooseFindPwdWays',
		type:"POST",//数据发送方式
		data:params,//参数
		dataType:'html',//接受数据格式
		success:function(data){
		if(data.indexOf("{success}")==-1){
			change('magLogin');
			alert(data);
		}else{
			data = data.replace("{success}","");
			$("#right_text_certifiction").html(data);
		}
				
		}		
	});
}



//------用户找回密码时选择的找回密码的方式-----
function tGFindPwd() {          
        var url="";
if($('input[@name=findPwdInfo]').get(0).checked == true){
		url="/chlw/3gfunction/3g_findtuser2!callBacksendMessage";

	}else if($('input[@name=findPwdInfo]').get(1).checked == true ){
		var str = $("#emailHid").val() ;
		if(str!= null && str!=" "){
			url="/chlw/3gfunction/3g_findtuser2!callBacksendEmail";
		}
		else{
			alert(decodeURI(EncodeUtf8("邮箱未绑定，请绑定邮箱！")));
			return ;
		}
		
	}

		var params=$('#chooseFindPwdForm').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值   
		// 发送请求
		$.ajax({
			url	: url,
			type:"POST",//数据发送方式
			data:params,//参数
			dataType:'html',//接受数据格式
			success:function(data){
				//此处判断跳转的的jsp中显示的数据是否有{success}字样，如果有的话，则认为是成功的
				if(data.indexOf("{success}")==-1){
					change('magLogin');
					alert(data);
				}else{
					data = data.replace("{success}","");
					$("#right_text_certifiction").html(data);
				}
			}		
		});	
}



// 3g彩票网找回密码时向用户发送手机短信

function getSendMessage(){
	$.ajax({
		url : '/chlw/3gfunction/3g_findtuser2!callBacksendMessage',
		type:"POST",//数据发送方式
		dataType:'html',//接受数据格式
		success:function(data){
			$("#sendMobileAgain").html(data);
	}
			
	});
}
// 3g彩票网找回密码时向用户重发发送手机短信
 
function getSendMessageAgain(){
	$.ajax({
		url : '/chlw/3gfunction/3g_findtuser2!callBacksendMessageAgain',
		type:"POST",//数据发送方式
		async:false,
		dataType:'html',//接受数据格式
		success:function(data){
			data = data.replace("{success}","");
					$("#sendMobileAgain").html(data);
	}
			
	});
}
// 3g彩票网找回密码时向用户Email发送信息

function getSendEmail(){
	$.ajax({
		url : '/chlw/3gfunction/3g_findtuser2!callBacksendEmail',
		type:"POST",//数据发送方式
		dataType:'html',//接受数据格式
		success:function(data){
			$("#sendEmailAgain").html(data);
	}
			
	});
}
// 3g彩票网找回密码时向用户Email发送信息

function getSendEmailAgain(){
	$.ajax({
		url : '/chlw/3gfunction/3g_findtuser2!callBacksendEmailAgain',
		type:"POST",//数据发送方式
		dataType:'html',//接受数据格式
		success:function(data){
			data = data.replace("{success}","");
					$("#sendEmailAgain").html(data);
	}
			
	});
}
function tGPhoneCheckPwd() {
		// 验证输入的邮箱是否正确
		var regValid = jQuery.formValidator.pageIsValid('1');
		if (!regValid) {
			return;
		}
var params=$('#updatePasswordForm').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值   
		// 发送请求
		$.ajax({
			url	: '/chlw/3gfunction/3g_findtuser2!callbackPassword',
			type:"POST",//数据发送方式
			async:false, 
			data:params,//参数
			dataType:'html',//接受数据格式
			success:function(data){
				//此处判断跳转的的jsp中显示的数据是否有{success}字样，如果有的话，则认为是成功的
				if(data.indexOf("{success}")==-1){
					alert(data);
				}else{
					data = data.replace("{success}","");
					$("#right_text_certifiction").html(data);
				}
			}		
		});
	
}
function tGPhoneCheckPwdByEmail() {
	// 验证输入的邮箱是否正确
	var regValid = jQuery.formValidator.pageIsValid('1');
	if (!regValid) {
		return;
	}
var params=$('#updatePasswordForm').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值   
	// 发送请求
	$.ajax({
		url	: '/chlw/3gfunction/3g_findtuser2!callbackPasswordByEmail',
		type:"POST",//数据发送方式
		async:false, 
		data:params,//参数
		dataType:'html',//接受数据格式
		success:function(data){
			//此处判断跳转的的jsp中显示的数据是否有{success}字样，如果有的话，则认为是成功的
			if(data.indexOf("{success}")==-1){
				alert(data);
			}else{
				data = data.replace("{success}","");
				$("#right_text_certifiction").html(data);
			}
		}		
	});

}
function tGPhoneCheck() {
	$.formValidator.initConfig({
		formid:"callbackForm",
		onError:function(){
			alert(decodeURI(EncodeUtf8("校验没有通过，具体错误请看错误提示")));
		}
	});
	$("#passRegister").formValidator({
		min : 4,
		max : 4,
		onshow : decodeURI(EncodeUtf8("请输入手机验证码。")),
		onfocus : decodeURI(EncodeUtf8("必须和您手机收到的保持一致！")),
		oncorrect : decodeURI(EncodeUtf8("验证码一致"))
	}).inputValidator({
		min : 4,
		max : 4,
		empty : {
			leftempty : false,
			rightempty : false,
			emptyerror : decodeURI(EncodeUtf8("验证码两边不能有空符号"))
		},
		onerror : decodeURI(EncodeUtf8("验证码不能为空，请确认"))
	});
	//--------------输入验证码提交------------

		var params=$('#callbackForm').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值   
		// 发送请求
		$.ajax({
			url	: '/chlw/3gfunction/3g_findtuser2!callBackPhoneCheck',
			type:"POST",//数据发送方式
			data:params,//参数
			dataType:'html',//接受数据格式
			success:function(data){
				//此处判断跳转的的jsp中显示的数据是否有{success}字样，如果有的话，则认为是成功的
				if(data.indexOf("{success}")==-1){
					alert(data);
				}else{
					data = data.replace("{success}","");
					$("#right_text_certifiction").html(data);
				}
			}		
	});
}
	//打开邮箱内的链接
function openEmail(url){
    window.location.href="http://"+url;
}

/*
 * 
 * 邮箱密码修改
 */
function editPwdValidator(){
	$.formValidator.initConfig({
		formid:"updatePasswordForm",
		onError:function(){
			alert(decodeURI(EncodeUtf8("校验没有通过，具体错误请看错误提示")));
		}
	});
//	$.formValidator.initConfig({formid:"updatePasswordForm",onError:function(){alert(decodeURI(EncodeUtf8("校验没有通过，具体错误请看错误提示")));}});
	$("#passUpdate").formValidator( {
		onshow : decodeURI(EncodeUtf8("请输入密码")),
		onfocus : decodeURI(EncodeUtf8("不能为空，长度 6 - 16 个字符，建议用字母，数字，下划线混合提高密码强度！")),
		oncorrect : decodeURI(EncodeUtf8("密码合法"))
	}).inputValidator( {
		min : 6,
		max : 16,
		empty : {
			leftempty : false,
			rightempty : false,
			emptyerror : decodeURI(EncodeUtf8("密码两边不能有空符号"))
		},
		onerror : decodeURI(EncodeUtf8("密码长度不合法，请确认"))
	}).regexValidator({
		regexp : "username",
		datatype : "enum",
		onerror : decodeURI(EncodeUtf8("密码不合法，请确认"))
	});
	
	$("#real_pass").formValidator( {
		min : 6,
		max : 16,
		onshow : decodeURI(EncodeUtf8("请输入重复密码")),
		onfocus : decodeURI(EncodeUtf8("两次密码必须一致哦")),
		oncorrect : decodeURI(EncodeUtf8("密码一致"))
	}).inputValidator( {
		min : 6,
		max : 15,
		empty : {
			leftempty : false,
			rightempty : false,
			emptyerror : decodeURI(EncodeUtf8("重复密码两边不能有空符号"))
		},
		onerror : decodeURI(EncodeUtf8("重复密码不正确，请确认"))
	}).compareValidator( {
		desid : "passUpdate",
		operateor : "=",
		onerror : decodeURI(EncodeUtf8("2次密码不一致，请确认"))
	});	
}


//修改密码页面的显示强弱的函数
 function passStrong(){
	 var num = new RegExp('[0-9]');
	 var pinyin = new RegExp('[A-Za-z]');
	 var teshu = new RegExp('[_]');
	 var tiao = '';
	 var countT = 0;
	 
	 var pwd =$("#passUpdate").val();
	 if(pwd!=null){
	 	if(num.test(pwd)||pinyin.test(pwd)){
		 $("#showStrong").text(decodeURI(EncodeUtf8("弱")));
		 countT = countT + 3;
		 	if(num.test(pwd)&&pinyin.test(pwd)){
		 		$("#showStrong").text(decodeURI(EncodeUtf8("中")));
				countT = countT + 3;
		 			if(teshu.test(pwd)){
		 				$("#showStrong").text(decodeURI(EncodeUtf8("强")));
						countT = countT + 4;
			 			}
			 	}
		 }
		 
	for ( var i = 0; i < 10; i++) {
		if (i < countT) {
			tiao = tiao + '<li class="re_pass_hong">&nbsp;</li>';
		} else {
			tiao = tiao + '<li class="re_pass_hui">&nbsp;</li>';
		}
		$("#tiao").html(tiao);
	}
		 
	}else{
			 $("#showStrong").text("");
			 $("#tiao").html('<li class="re_pass_hui">&nbsp;</li>');
			 }


 }
