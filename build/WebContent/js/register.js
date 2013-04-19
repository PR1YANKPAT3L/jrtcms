

/*
*个人信息修改
 */
function editUserValidator(){
$.formValidator.initConfig({formid:"form2",onError:function(){alert("校验没有通过，具体错误请看错误提示");}});
$("#mobile_code").formValidator({
	onshow : "请确认正确填写，注册后不可更改！",
	onfocus : "请输入你的手机号码，不可为空",
	oncorrect : "该手机号格式正确"
}).inputValidator({
	min : 11,
	max : 11,
	onerror : "手机号码必须是11位的,请确认"
}).regexValidator({
	regexp : "mobile",
	datatype : "enum",
	onerror : "你输入的手机号码格式不正确"
});

$("#realPass").formValidator({
	min : 6,
	max : 15,
	onshow : "请输入重复密码",
	onfocus : "两次密码必须一致哦",
	oncorrect : "密码一致"
}).inputValidator({
	min : 6,
	max : 15,
	empty : {
		leftempty : false,
		rightempty : false,
		emptyerror : "重复密码两边不能有空符号"
	},
	onerror : "重复密码不能为空,请确认"
}).compareValidator({
	desid : "passLogin",
	operateor : "=",
	onerror : "2次密码不一致,请确认"
});
	
	$("#userID").formValidator({
				onshow : "领奖取现的重要凭证，请认真填写！或在以后完善信息",
				onfocus : "输入15或18位的身份证",
				oncorrect : "输入正确"
			}).functionValidator({
				fun : isCardID
			});
	$("#email").formValidator({
		empty : true,
		onshow : "请输入你的邮箱，可以为空",
		onfocus : "邮箱至少6个字符,最多100个字符",
		oncorrect : "邮箱格式输入正确"
			//defaultvalue : "@"
		}).inputValidator({
				min : 6,
				max : 100,
				onerror : "你输入的邮箱长度非法,请确认"
			}).regexValidator({
		regexp : "^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",
		onerror : "你输入的邮箱格式不正确"
	});
	
	$("#nickName").formValidator({
		empty : true,
		onshow : "请输入你的昵称，可以为空",
		onfocus : "请输入你想要的昵称",
		oncorrect : "昵称输入完成"
			//defaultvalue : "@"
		}).inputValidator({
				min : 0,
				max : 20,
				onerror : "昵称不能超过10个字符!"
		});
	
	$("#user_address").formValidator({
		empty : true,
		onshow : "请输入你的地址，可以为空",
		onfocus : "请输入你的地址",
		oncorrect : "地址输入完成"
			//defaultvalue : "@"
		}).inputValidator({
				min : 0,
				max : 60,
				onerror : "地址不能超过40个英文字符(20个汉字)!"
		});
	
	$("#qq").formValidator({
		empty : true,
		onshow : "请输入你的QQ，可以为空",
		onfocus : "请输入您的QQ",
		oncorrect : "输入正确"
			//defaultvalue : "@"
		}).inputValidator({
				min : 4,
				max : 10,
				onerror : "你输入的QQ长度非法,请确认"
			}).regexValidator({
		regexp : "^[1-9]*[1-9][0-9]*$",
		onerror : "你输入的QQ格式不正确"
	});
	
	$("#msn").formValidator({
		empty : true,
		onshow : "请输入你的MSN，可以为空",
		onfocus : "请输入您的MSN",
		oncorrect : "输入正确"
			//defaultvalue : "@"
		}).inputValidator({
				min : 6,
				max : 100,
				onerror : "你输入的MSN长度非法,请确认"
			}).regexValidator({
		regexp : "/^[0-9a-zA-Z]+([\.\-\_][0-9a-zA-Z]+)*@[0-9a-zA-Z]+([\.\-][0-9a-zA-Z]+)*.[a-zA-Z]$/",
		onerror : "你输入的MSN格式不正确"
	});
	$("#old_pass").formValidator( {
		onshow : "请输入密码",
		onfocus : "密码不能为空,密码长度6-15位",
		oncorrect : "密码合法"
	}).inputValidator( {
		min : 6,
		max : 15,
		empty : {
			leftempty : false,
			rightempty : false,
			emptyerror : "密码两边不能有空符号"
		},
		onerror : "密码不合法,请确认"
	});

	$("#new_pass").formValidator( {
		onshow : "请输入密码",
		onfocus : "密码不能为空,密码长度6-15位",
		oncorrect : "密码合法"
	}).inputValidator( {
		min : 6,
		max : 15,
		empty : {
			leftempty : false,
			rightempty : false,
			emptyerror : "密码两边不能有空符号"
		},
		onerror : "密码不合法,请确认"
	});
	$("#real_pass").formValidator( {
		min : 6,
		max : 15,
		onshow : "请输入重复密码",
		onfocus : "两次密码必须一致哦",
		oncorrect : "密码一致"
	}).inputValidator( {
		min : 6,
		max : 15,
		empty : {
			leftempty : false,
			rightempty : false,
			emptyerror : "重复密码两边不能有空符号"
		},
		onerror : "重复密码不能为空,请确认"
	}).compareValidator( {
		desid : "new_pass",
		operateor : "=",
		onerror : "2次密码不一致,请确认"
	});
	
}
function test(obj) {
	if (obj.value == "不校验身份证") {
		$("#sfzh").attr("disabled", true).unFormValidator(true);
		obj.value = "校验身份证";
	} else {
		$("#sfzh").attr("disabled", false).unFormValidator(false);
		obj.value = "不校验身份证";
	}
}


/**
 * 注册验证
 * form名称 userRegisterForm
 * @return
 */
function regFormValidator(){
	$.formValidator.initConfig({
		formid:"userRegisterForm",
		onError:function(){
			alert("校验没有通过，具体错误请看错误提示");
			return false;
		}
	});
	
	//用户名验证
	$("#username").formValidator({
		onshow : "4-12位汉字、字母、数字组合，不区分大小写！",
		onfocus : "请输入你的用户名，不可为空",
		oncorrect : "该用户名格式正确"
	}).regexValidator({
		regexp : "^[a-z]{1}[a-z0-9_]{3,15}$",
		onerror : "你输入的用户名格式不正确"
		
	});
	
	//手机号码验证
	$("#mobile_code").formValidator({
		onshow : "请确认正确填写，注册后不可更改！",
		onfocus : "请输入你的手机号码，不可为空",
		oncorrect : "该手机号格式正确"
	}).inputValidator({
		min : 11,
		max : 11,
		onerror : "手机号码必须是11位的,请确认"
	}).regexValidator({
		regexp : "mobile",
		datatype : "enum",
		onerror : "你输入的手机号码格式不正确"
	});
	
	//密码验证
	$("#passLogin").formValidator({
		onshow : "请输入密码",
		onfocus : "密码不能为空,密码长度6-15位",
		oncorrect : "密码合法"
	}).inputValidator({
		min : 6,
		max : 15,
		empty : {
			leftempty : false,
			rightempty : false,
			emptyerror : "密码两边不能有空符号"
		},
		onerror : "密码不合法,请确认"
	});
	
	//重复密码验证
	$("#realPass").formValidator({
			min : 6,
			max : 15,
			onshow : "请输入重复密码",
			onfocus : "两次密码必须一致哦",
			oncorrect : "密码一致"
		}).inputValidator({
			min : 6,
			max : 15,
			empty : {
				leftempty : false,
				rightempty : false,
				emptyerror : "重复密码两边不能有空符号"
			},
			onerror : "重复密码不能为空,请确认"
		}).compareValidator({
			desid : "passLogin",
			operateor : "=",
			onerror : "2次密码不一致,请确认"
		});
	//email验证
	$("#email").formValidator({
		empty : true,
		onshow : "请输入你的邮箱，可以为空",
		onfocus : "邮箱至少6个字符,最多100个字符",
		oncorrect : "邮箱格式输入正确"
			//defaultvalue : "@"
		}).inputValidator({
				min : 6,
				max : 100,
				onerror : "你输入的邮箱长度非法,请确认"
			}).regexValidator({
		regexp : "^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",
		onerror : "你输入的邮箱格式不正确"
	});
}


//登录验证
function loginFormValidator(){
	$.formValidator.initConfig({
		formid:"userLoginForm",
		onError:function(){
			alert("校验没有通过，具体错误请看错误提示");
			return false;
		}
	});
	
	//用户名验证
	$("#username").formValidator({
		onshow : "4-12位汉字、字母、数字组合，不区分大小写！",
		onfocus : "请输入你的用户名，不可为空",
		oncorrect : "该用户名格式正确"
	}).regexValidator({
		regexp : "^[a-z]{1}[a-z0-9_]{3,15}$",
		onerror : "你输入的用户名格式不正确"
		
	});

	//密码验证
	$("#pwd").formValidator({
		onshow : "请输入密码",
		onfocus : "密码不能为空,密码长度6-15位",
		oncorrect : "密码合法"
	}).inputValidator({
		min : 6,
		max : 15,
		empty : {
			leftempty : false,
			rightempty : false,
			emptyerror : "密码两边不能有空符号"
		},
		onerror : "密码不合法,请确认"
	});
	
}

//实名制认证验证
function realFormValidator(){
	$.formValidator.initConfig({
		formid:"realForm",
		onError:function(){
			alert("校验没有通过，具体错误请看错误提示");
			return false;
		}
	});
	
	//真实姓名验证
	$("#name").formValidator({
		onshow : "4-12位汉字、字母、数字组合，不区分大小写！",
		onfocus : "请输入你的真实姓名，可为空",
		oncorrect : "该用户名格式正确"
	}).regexValidator({
		regexp : "^[a-z]{1}[a-z0-9_]{3,20}$",
		onerror : "你输入的真实姓名格式不正确"
		
	});
	
	//身份证验证
	$("#userID").formValidator({
		onshow : "领奖取现的重要凭证，请认真填写！或在以后完善信息",
		onfocus : "输入15或18位的身份证",
		oncorrect : "输入正确"
	}).functionValidator({
		fun : isCardID
	});
	
	//邮箱验证
	$("#email").formValidator({
		empty : true,
		onshow : "请输入你的邮箱，可以为空",
		onfocus : "邮箱至少6个字符,最多100个字符",
		oncorrect : "邮箱格式输入正确"
		}).inputValidator({
				min : 6,
				max : 100,
				onerror : "你输入的邮箱长度非法,请确认"
			}).regexValidator({
		regexp : "^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",
		onerror : "你输入的邮箱格式不正确"
	});
}


//------用户登录注册，以及判断用户是否登录的跳转，全站通用-----
$(function() {
	// 注册表单验证插件
	regFormValidator();

	//登录表单验证插件
	loginFormValidator();
	
	//实名制认证插件
	realFormValidator();

	/********用户注册*********/
	$('#register_submit').click(function(){
		// 验证输入的用户名、密码、手机号码、邮箱是否正确
		var regValid = jQuery.formValidator.pageIsValid('1');
		if (!regValid) {
			return;
		}
		
		//用户注册协议
		if ($("#registerXieyi").attr("checked") != true && $("#registerXieyi").attr("checked") != "checked") {
			 alert("您没有同意《如意彩服务协议》！");
			 return;
        }
		
		var params=$('#userRegisterForm').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值   
		// 发送请求
		$.ajax({
			url	: '/chlw/function/tuserinfoAction!register',
			type:"POST",//数据发送方式
			data:params,//参数
			dataType:'html',//接受数据格式
			success:function(data){
				//此处判断跳转的的jsp中显示的数据是否有{success}字样，如果有的话，则认为是成功的
				if(data.indexOf("{success}")==-1){
					alert(data);
					change('magRegister');
				}else{
					data = data.replace("{success}","");
					$("#right_text").html(data);
				}
			}		
		});

	});

	/********用户登录*********/
	$('#login_submit').click(function(){
		// 验证输入的用户名、密码是否正确
		//var logValid = jQuery.formValidator.pageIsValid('1');
//		if (!logValid) {
//			return;
//		}	
		
		var params=$('#userLoginForm').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值   
		// 发送请求
		$.ajax({
			url	: '/chlw/function/tuserinfoAction!login',
			type:"POST",//数据发送方式
			data:params,//参数
			dataType:'html',//接受数据格式
			success:function(data){
					//此处判断跳转的的jsp中显示的数据是否有{success}字样，如果有的话，则认为是成功的
					if(data.indexOf("{success}")==-1){
						alert(data);
					}else{
						location.href="/rules/user.html?key=23&#Menu=ChildMenu1";
					}
				}		
		});
 
	});   
	
	$('#findPwd_submit').click(function(){
	var inputUserName=$("#inputUserName").val();
	var inputRandCode=$("#inputRandCode").val();
	if(inputUserName==null||inputUserName==""){
		alert("用户名和密码都不能为空}");
		return false;
	}
	else{
		var params=$('#findPwdByMobileAndEmail').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值   
		// 发送请求
		$.ajax({
			url	: '/chlw/function/tuserinfoAction!findPwdByMobileAndEmail',
			type:"POST",
			data:params,
			dataType:'html',
			success:function(data){
				// localtion.href="/chlw/page/user/chooseFindPwdWay.jsp";
			}		
		});
	}
});
	
	/*****实名制认证*
	$('#register_submit').click(function(){
		// 验证输入的用户名、密码是否正确
		var regValid = jQuery.formValidator.pageIsValid('1');
		if (!regValid) {
			return;
		}	
		var params=$('#realForm').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值   
		// 发送请求
		$.ajax({
			url	: '/chlw/function/tuserinfoAction!register',
			type:"POST",//数据发送方式
			data:params,//参数
			dataType:'html',//接受数据格式
			success:function(data){
				//此处判断跳转的的jsp中显示的数据是否有{success}字样，如果有的话，则认为是成功的
				if(data.indexOf("{success}")==-1){
					alert(data);
					change('magRegister');
				}else{
					data = data.replace("{success}","");
					$("#right_text").html(data);
				}
			}		
		});

	});****/

});




