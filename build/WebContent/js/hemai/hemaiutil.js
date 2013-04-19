//============================合买使用的js===================================

function checkDesc() {

	var desc = $("#description").val(); // 合买宣传语
	if (desc.length > 500) {
		openAlert(decodeURI(EncodeUtf8("方案宣传不能超过500个字符")));
		$("#description").val($("#description").val().substring(0, 500));
		return false;
	}
}
function faqiHemai() {

	if (!touzhuPublic()) { //合买投注追号通用判断
		return false;
	}
	//获取用户余额
	var touzhu_money = parseInt($("#touzhu_money").html());

	var buyAmt = $("#buyAmt").val(); // 购买金额
	var safeAmt = $("#safeAmt").val(); // 保底金额
	var commisionRatio = $("#commisionRatio").val(); // 佣金
	var visibility = $("input[name='visibility']:checked").val(); // 保密类型
	var minAmt = $("#minAmt").val(); // 最小购买金额
	var desc = $("#description").val(); // 合买宣传语
	// 如果用戶沒有选择是否设置最低跟单金额则设置为0
	if (!$("#isMinAmt").is(':checked')) {
		minAmt = 1;
	}

	//校验合买数据
	var testNum = /^[0-9]|[1-9]d*$/;
	if ((buyAmt == "" || buyAmt == "0") && (safeAmt == "" || safeAmt == "0")) {
		openAlert(decodeURI(EncodeUtf8("你好，认购金额与保底金额至少填写其中一个！")));
		$("#buyAmt").focus();
		return false;
	} else if (!testNum.test(buyAmt)) {
		openAlert(decodeURI(EncodeUtf8("你好，认购金额只能填写数字！")));
		$("#buyAmt").focus();
		return false;
	} else if (!$("#isAllSafeAmt").is(':checked') && !testNum.test(safeAmt)) {
		openAlert(decodeURI(EncodeUtf8("你好，保底金额只能填写数字！")));
		$("#safeAmt").focus();
		return false;
	} else if ($("#isMinAmt").is(':checked') && !testNum.test(minAmt)) {
		openAlert(decodeURI(EncodeUtf8("你好，最低跟单金额必须为数字！")));
		$("#minAmt").val(2);
		$("#minAmt").focus();
		return false;
	} else if ($("#isMinAmt").is(':checked') && minAmt > (parseInt($("#investField").html()) / 2)) {
		openAlert(decodeURI(EncodeUtf8("你好，最低认购金额不能超过方案金额的一半！")));
		$("#minAmt").val(parseInt($("#investField").html()) / 2);
		$("#minAmt").focus();
		return false;
	} else if ($("#isMinAmt").is(':checked') && minAmt < 2) {
		openAlert(decodeURI(EncodeUtf8("你好，最低认购金额设置最低为2元！")));
		$("#minAmt").val(2);
		$("#minAmt").focus();
		return false;
	} else if (touzhu_money < (parseInt(buyAmt) + parseInt(safeAmt))) {
		openAjaxPopup("openTishi", 1000, "/rules/tishi.html?key=2&num=3");
		$("#buyAmt").focus();
		return false;
	}
	var jsonObj = '{"buyAmt":"' + buyAmt + '","safeAmt":"' + safeAmt + '","commisionRatio":"' + commisionRatio + '","desc":"' + desc + '","visibility":"' + visibility + '","minAmt":"' + minAmt + '","isIe":"' + decodeURI(EncodeUtf8("中")) + '"}';
	$("#jsonStringCLR").val(jsonObj);

	htmlMsg(); //给 弹出层设置相关数据
	connPath();
	openStaticPopup("openTouzhu", 1000, "touzhuOpen1");

}
//比例计算a*100/b
function bili(idstr) {
	var a = Number($("#" + idstr).val());
	var b = Number($("#investField").html());
	var safeAmt = Number($("#safeAmt").val());
	//如果认购金额大于投注总金额 设为投注金额
	if (a > b) {
		a = b;
		$("#" + idstr).val(a);
	}
	//如果认购金额加保底金额大于总金额，则将保底金额设为总金额减去认购金额
	if (a + safeAmt > b && (idstr == "buyAmt" || idstr == "amt")) {
		safeAmt = b - a;
		$("#safeAmt").val(safeAmt);
	} else if (idstr == "safeAmt") {
		if ($("#buyAmt") && (a + Number($("#buyAmt").val()) > b)) {
			$("#buyAmt").val(b - a);
		} else if ($("#amt") && (a + Number($("#amt").val()) > b)) {
			$("#amt").val(b - a);
		}
	}
	if (b == 0) {
		openAlert(decodeURI(EncodeUtf8("你好，请您先选号！")));
		$("#" + idstr).val("");
		return;
	}
	$("#" + idstr + "_bili").html(round(a * 100 / b, 2));
	if ($("#isAllSafeAmt").is(':checked')) {
		$("#safeAmt").val(b - a);
		$("#safeAmt_bili").html(round((100 - (a * 100 / b)), 2));
	} else if ($("#safeAmt").val() == 0) {
		$("#safeAmt_bili").html(0);
	}

}
//按期号查询
function changeBathcode(value) {
	var value1 = value;
	if (value != null && value != '' && value.indexOf("$") > -1) {
		value1 = value.split("$")[0];
	}
	$('#selectBatchCode').val(value1);
	$('#CaseSelectForm').submit();
}
//判断一个复选框是否已勾选，如果勾选则使某组件失效
function ifAllSafeAmt(a, b) {
	if ($("#" + a).is(':checked')) {
		$("#" + b).attr("disabled", "disabled");
		$("#" + b).val(Number($("#investField").html()) - Number($("#buyAmt").val()));
	} else {
		$("#" + b).removeAttr("disabled");
	}
}
//ajax处理筛选请求
function ajaxFromToHemai(formId, divId) {
	var parameters = $("#" + formId).serialize() + "&isAjax=ajax";
	for (b in $.browser) if (b == 'msie') {
		parameters = encodeURI(parameters) + "&msie=1";
	}
	$.ajax({
		url: basepath + "/function/selectAll!getCaselotsByWhere",
		//后台处理程序
		type: "POST",
		//数据发送方式
		data: parameters,
		//参数
		dataType: 'html',
		//接受数据格式
		beforeSend: function() {
			loginShow("ajax_hemai_pop", false);
		},
		success: function(html) {
			loginShow("ajax_hemai_pop", true);
			$("#" + divId).html(html);
		}
	});
	return false;
}

//ajax处理筛选请求
function ajaxFromToHemaiCenter(formId, divId) {
	var parameters = $("#" + formId).serialize() + "&sortStateFlag=0&isAjax=ajax";
	for (b in $.browser) if (b == 'msie') {
		parameters = encodeURI(parameters) + "&msie=1";
	}
	$.ajax({
		url: basepath + "/function/hemaiCenter!getCaselotsByWhere",
		//后台处理程序
		type: "POST",
		//数据发送方式
		data: parameters,
		//参数
		dataType: 'html',
		//接受数据格式
		beforeSend: function() {
			loginShow("ajax_hemai_pop", false);
		},
		success: function(html) {
			loginShow("ajax_hemai_pop", false);
			$("#" + divId).html(html);
		}
	});
	return false;
}
//参与合买验证确认
function canyuHemai(caseId) {
	var amt = $("#canyu_amt_" + caseId).val();
	var testNum = /^[0-9]|[1-9]d*$/;
	if (!testNum.test(amt)) {
		openAlert(decodeURI(EncodeUtf8("你好，请输入整数！")));
		return false;
	}
	//判断用户是否登录   
	if (!isLogin()) {
		//弹出层
		loginShow();
		return false;
	}
	$("#amt_caseId").val(amt + "$" + caseId);
	$("#blancemoney").text($("#topLogin_money").html());
	$("#buymoney").text(amt);
	if (Number(amt) > Number($("#topLogin_money").html())) {
		$("#queding").hide();
		$("#closequeding").hide();
		$("#yueBuzu").show();
		$("#quxiao").show();
	} else {
		$("#queding").show();
		$("#yueBuzu").hide();
		$("#quxiao").hide();
		$("#closequeding").hide();
	}
	canyuHemaiShow();
}
function toHemaiSubmit() {
	var amt_caseId = $("#amt_caseId").val();
	var amt = 0;
	var caseId = "";
	if (amt_caseId.indexOf("$")) {
		amt = amt_caseId.split("$")[0];
		caseId = amt_caseId.split("$")[1];
	}

	toHemai(amt, caseId);
}
//点击确认购买 显示为认购中
function tohemairengou() {
	$("#queding").hide();
	$("#rengouzhong").show();
	$("#yueBuzu").hide();
	$("#quxiao").hide();
	$("#closequeding").hide();
	toHemaiSubmit();
}
//提交参与和买的内容
function toHemai(amt, caseId, safeAmt) {
	var parameters = "amt=" + amt + "&caseId=" + caseId;
	if (safeAmt) {
		parameters += "&safeAmt=" + safeAmt;
	}
	$.ajax({
		url: basepath + "/user/bet!toHemai",
		//后台处理程序
		type: "POST",
		//数据发送方式
		data: parameters,
		//参数
		dataType: 'json',
		//接受数据格式
		beforeSend: function() {
			$("#button_" + caseId).attr("disabled", "true"); //使提交按钮失效
		},
		success: function(json) {
			$("#button_" + caseId).removeAttr("disabled");
			$("#rengouzhong").hide();
			$("#closequeding").show();
			$("#queding").hide();
			$("#yueBuzu").hide();
			$("#quxiao").hide();
			if (json.errorCode == "502") {
				$("#message").html(json.message);
			} else if (json.errorCode == "501") {
				$("#buymoney").text(json.amt);
				$("#blancemoney").text(json.deposit_amount);
				$("#message").html(json.message);
			} else if (json.errorCode == "500") {
				$("#message").html(json.message);
				return false;
			} else if (json.errorCode == "0") {
				$("#message").html(json.message);
			} else {
				$("#message").html("网络错误！请稍后再试！");
				return false;
			}
		}
	});
}
//参与合买验证确认
function infoCanyuHemai(lotno, caseId) {
	var amt = $("#amt").val();
	var safeAmt = $("#safeAmt").val();
	var testNum = /[1-9]d*/;;
	if (!testNum.test(amt) && !testNum.test(safeAmt)) {
		$("#amt").focus();
		openAlert(decodeURI(EncodeUtf8("你好，请至少选择认购或保底其中一项，填写金额后认购！")));
		return false;
	} else if ($("#xieyi") != null || $("#xieyi") != undefined) {
		if ($("#xieyi").attr('checked') == false) {
			openAlert(decodeURI(EncodeUtf8("请您同意用户代购合买协议！")));
			return false;
		}
	}
	if ($("#fengxiang")) {
		if ($("#fengxiang").attr('checked') == false) {
			if (lotno == "T01002") {
				openAlert(decodeURI(EncodeUtf8("彩票发行中心对排列3进行限号管理，您是否同意网站《排列3投注风险须知》？")));
			} else if (lotno == "F47103") {
				openAlert(decodeURI(EncodeUtf8("彩票发行中心对福彩3D进行限号管理，您是否同意网站《福彩3D投注风险须知》？")));
			}

			return false;
		}
	}
	//判断用户是否登录   
	if (!isLogin()) {
		//弹出层
		loginShow();
		return false;
	}
	$("#rengou_buymoney").text(amt);
	loginShow("rengouTiShishow", false); //弹出认购提示

	return false;
}
//撤单
function chedan(caseId) {
	$.ajax({
		url: basepath + "/user/bet!cancelCaselot",
		//后台处理程序
		type: "POST",
		//数据发送方式
		data: "caseId=" + caseId,
		//参数
		dataType: 'json',
		//接受数据格式
		beforeSend: function() {
			$("#button_chedan").attr("disabled", "true"); //使提交按钮失效
		},
		success: function(json) {
			$("#button_chedan").removeAttr("disabled");
			if (json.errorCode == "500") {
				openAlert(json.message);
				return false;
			} else if (json.errorCode == "0") {
				openAlert(json.message);
				$("#cd_t").attr("class", "none");
				$("#cd_b").attr("class", "none");
				$("#chedanstate").html(decodeURI(EncodeUtf8("撤单")));
				window.location.reload();
				return false;
			} else {
				openAlert(decodeURI(EncodeUtf8("网络错误！请稍后再试！")));
				return false;
			}
		}
	});
}
//撤资
function chezi(caseId) {
	$.ajax({
		url: basepath + "/user/bet!cancelCaselotbuy",
		//后台处理程序
		type: "POST",
		//数据发送方式
		data: "caseId=" + caseId,
		//参数
		dataType: 'json',
		//接受数据格式
		beforeSend: function() {
			$("#button_chezi").attr("disabled", "true"); //使提交按钮失效
		},
		success: function(json) {
			$("#button_chezi").removeAttr("disabled");
			if (json.errorCode == "500") {
				openAlert(json.message);
				return false;
			} else if (json.errorCode == "0") {
				openAlert(json.message);
				$("#canyuAmt").text(0);
				window.location.reload();
				return false;
			} else {
				openAlert(decodeURI(EncodeUtf8("网络错误！请稍后再试！")));
				return false;
			}
		}
	});
}
//查看玩家发起方案记录
function fanganListToUser(userno, nickname) {
	$("#Fangan_userno").val(userno);
	$("#Fangan_title").html(decodeURI(EncodeUtf8("投注记录查看" + nickname)));
	$("#Fangan_displayState").val("0");
	$("#Fangan_isWinner").val("0");
	$("#BtnL").attr("class", "BaseBtn");
	$("#BtnR").attr("class", "BaseBtn");
	ajaxFromFanganListToUser("CaseFanganSelectForm", "fangan_Html");
	loginShow("fanganList_Alert", false);
}
//ajax处理合买历史筛选请求
function ajaxFromFanganListToUser(formId, divId) {
	var parameters = $("#" + formId).serialize();
	for (b in $.browser) if (b == 'msie') {
		parameters = encodeURI(parameters) + "&msie=1";
	}
	$.ajax({
		url: basepath + "/function/selectAll!getFangAnListToUser",
		//后台处理程序
		type: "POST",
		//数据发送方式
		data: parameters,
		//参数
		async: false,
		beforeSend: function() {
			$("#" + divId).html(decodeURI(EncodeUtf8("查询中..."))); //使提交按钮失效
		},
		dataType: 'html',
		//接受数据格式
		success: function(html) {
			$("#" + divId).html(html);
		}
	});
	return false;
}

//查看用户盈利战绩记录
function yingliListToUser(userno, lotno, nickname, displayIcon_index, lotno_cn) {
	$("#Yingli_userno").val(userno);
	$("#Yingli_lotno").val(lotno);
	$("#Yingli_nickname").html(nickname);
	$("#Yingli_displayIcon").html($("#" + displayIcon_index).html());
	$("#Yingli_lotno_cn").html(lotno_cn + decodeURI(EncodeUtf8("战绩：")));
	$("#Yingli_lotno_cn_df").val(decodeURI(EncodeUtf8(lotno_cn)));
	$("#Yingli_state").val("-1");
	$("#BtnYl").attr("class", "BaseBtn");
	ajaxFromYingliListToUser("CaseYingliSelectForm", "yingli_Html");
	loginShow("yingliList_Alert", false);
}
//ajax处理盈利战绩筛选请求
function ajaxFromYingliListToUser(formId, divId) {
	var parameters = $("#" + formId).serialize();
	for (b in $.browser) if (b == 'msie') {
		parameters = encodeURI(parameters) + "&msie=1";
	}
	$.ajax({
		url: basepath + "/function/selectAll!getYingLiListToUser",
		//后台处理程序
		type: "POST",
		//数据发送方式
		data: parameters,
		//参数
		async: false,
		beforeSend: function() {
			$("#" + divId).html(decodeURI(EncodeUtf8("查询中..."))); //使提交按钮失效
		},
		dataType: 'html',
		//接受数据格式
		success: function(html) {
			$("#" + divId).html(html);
		}
	});
	return false;
}
//发起和买的页面跳转方法、
function faqiHemaiTiaozhuan(lonto) {
	var url;
	if (lonto == "F47104") {
		url = "/shuangseqiu.html";
	} else if (lonto == "F47103") {
		url = "/fucai3D.html";
	} else if (lonto == "F47102") {
		url = "/qilecai.html";
	} else if (lonto == "T01001") {
		url = "/daletou.html";
	} else if (lonto == "T01002") {
		url = "/pailie3.html";
	} else if (lonto == "T01011") {
		url = "/pailie5.html";
	} else if (lonto == "T01009") {
		url = "/qixingcai.html";
	} else if (lonto == "T01003") {
		url = "/zucaishengfu.html";
	} else if (lonto == "T01005") {
		url = "/4changjinqiu.html";
	} else if (lonto == "T01004") {
		url = "/renxuan9chang.html";
	} else if (lonto == "T01006") {
		url = "/6changbanquan.html";
	}
	window.location.href = url + "?canshu=hemai#BettingForm";
}
//点击发起合买进入投注页面的初始化方法
function hemaiInit() {
	var canshu = GetQueryString("canshu");
	if (!canshu == "" || !canshu == "null") {
		setGoumaifangshi('合买');
		tabHemaiAndDaigou('hemai');
		$("#controlHemai").addClass("selected");
		$("#controlHemai").siblings().removeClass("selected");
		$("#followHemai").addClass("selected");
		$("#followHemai").siblings().removeClass("selected");
	}
}
//合买方案详情页面，查看发起人记录 根据彩种显示不同的页面查询信息
function hemaiInfoSelect() {
	var lotno = $("#Fangan_lotno").val();
	if (lotno == "T01003" || lotno == "T01004" || lotno == "T01005" || lotno == "T01006") {
		$("#Football").addClass("selected");
		$("#Football").siblings().removeClass("selected");
		$("#followFootball").addClass("selected");
		$("#followFootball").siblings().removeClass("selected");
	} else if (lotno == "F47104" || lotno == "F47103" || lotno == "F47102") {
		$("#FUCAI").addClass("selected");
		$("#FUCAI").siblings().removeClass("selected");
		$("#followFuCai").addClass("selected");
		$("#followFuCai").siblings().removeClass("selected");
	} else if (lotno == "T01001" || lotno == "T01009" || lotno == "T01002" || lotno == "T01011") {
		$("#TICAI").addClass("selected");
		$("#TICAI").siblings().removeClass("selected");
		$("#followTiCai").addClass("selected");
		$("#followTiCai").siblings().removeClass("selected");
	}
	$("#" + lotno).addClass("selected");
	$("#" + lotno).siblings().removeClass("selected");
}

//获取合买中心的公告
function getCaseNews(divId) {
	$.ajax({
		url: '/include/hemaiCenter_gonggao.html',
		type: "GET",
		//数据发送方式
		dataType: 'html',
		success: function(data) {
			$("#" + divId).html(data);
		}
	});

}
//============================合买使用的js=========END=======================