/*修改密码页面验证*/
$(function() {
	$.formValidator.initConfig( {
		formid : "form1",
		onError : function() {
			alert("校验没有通过，具体错误请看错误提示");
		}
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
});