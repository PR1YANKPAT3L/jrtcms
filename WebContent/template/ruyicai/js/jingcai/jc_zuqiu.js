//定义变量allMatch（选择的赛事）
var allMatch = Number($("#matchNum").html());
//checkZhuma为基本的注码校验和计算方法，每次有操作的时候，都会调用该方法

//当勾选和取消勾选的时候，全部改变按钮的颜色（样式）
function changeColorCheckbox(day, stat) {
	if ($("#checkbox_" + day + "_" + stat).attr("checked")) {
		$("#ball3_" + day + "_" + stat).removeClass("result_3");
		$("#ball0_" + day + "_" + stat).removeClass("result_3");
		$("#ball1_" + day + "_" + stat).removeClass("result_3");
		$("#ball3_" + day + "_" + stat).addClass("result_1");
		$("#ball0_" + day + "_" + stat).addClass("result_1");
		$("#ball1_" + day + "_" + stat).addClass("result_1");
	} else {
		$("#ball3_" + day + "_" + stat).removeClass("result_1");
		$("#ball0_" + day + "_" + stat).removeClass("result_1");
		$("#ball1_" + day + "_" + stat).removeClass("result_1");
		$("#ball3_" + day + "_" + stat).addClass("result_3");
		$("#ball0_" + day + "_" + stat).addClass("result_3");
		$("#ball1_" + day + "_" + stat).addClass("result_3");
	}
	checkZhuma();
	addMatchForRight($("#ball3_" + day + "_" + stat), day, stat, 3);
	addMatchForRight($("#ball1_" + day + "_" + stat), day, stat, 1);
	addMatchForRight($("#ball0_" + day + "_" + stat), day, stat, 0);
}

//当点击按钮的时候，改变按钮的颜色（样式），同时检查按钮是否全部选定，相应的改变checkbox的勾选状态
function checkColorButton(object, day, type, stat) {
	if ($("#ball" + type + "_" + day + "_" + stat).attr("class") == "result_1") {
		$("#ball" + type + "_" + day + "_" + stat).removeClass("result_1").addClass("result_3");
	} else if ($("#ball" + type + "_" + day + "_" + stat).attr("class") == "result_3") {
		$("#ball" + type + "_" + day + "_" + stat).removeClass("result_3").addClass("result_1");
	}
	if ($("#ball0" + "_" + day + "_" + stat).attr("class") == "result_1" && $("#ball1" + "_" + day + "_" + stat).attr("class") == "result_1" && $("#ball3" + "_" + day + "_" + stat).attr("class") == "result_1") {
		$("#checkbox_" + day + "_" + stat).attr("checked", true);
	} else {
		$("#checkbox_" + day + "_" + stat).attr("checked", false);
	}
	checkZhuma();
	addMatchForRight(object, day, stat, type);

}

//注码校验和计算注数
//计算注数的方法
function checkZhuma() {
	$("option", $("#list_LotteryNumber")).remove();
	$("#codes li").remove();
	var zhuma = "",
	matchDate = "",
	matchWeek = "",
	match = "";

	//循环遍历取得时间的数组
	var daArr = [];
	$("input[name='day']").each(function(i) {
		daArr[i] = $(this).val();
	});

	//循环遍历取得总的赛事的值
	var count = 0;
	$("input[name='count']").each(function(i) {
		count += Number($(this).val());
	});

	for (var i = 1; i <= count; i++) {
		for (var j = 0; j < daArr.length; j++) {
			var day = daArr[j];
			if ($("#ball0_" + day + "_" + i).attr("class") == "result_1" || $("#ball1_" + day + "_" + i).attr("class") == "result_1" || $("#ball3_" + day + "_" + i).attr("class") == "result_1") {
				matchDate = $("#day_" + day + "_" + i).val();
				matchWeek = $("#weekid_" + day + "_" + i).val();
				match = $("#no_" + day + "_" + i).html();
				zhuma = zhuma + matchDate + "|" + matchWeek + "|" + match + "|";
			}
			if ($("#ball0_" + day + "_" + i).attr("class") == "result_1") {
				zhuma = zhuma + "0";
			}
			if ($("#ball1_" + day + "_" + i).attr("class") == "result_1") {
				zhuma = zhuma + "1";
			}
			if ($("#ball3_" + day + "_" + i).attr("class") == "result_1") {
				zhuma = zhuma + "3";
			}
			if ($("#ball0_" + day + "_" + i).attr("class") == "result_1" || $("#ball1_" + day + "_" + i).attr("class") == "result_1" || $("#ball3_" + day + "_" + i).attr("class") == "result_1") {
				zhuma = zhuma + '^';
			} else {
				zhuma = zhuma;
			}
		}
	}

	var lotteryListSelect = $("#list_LotteryNumber");
	var opt;
	var wanfa = saleMa();
	if (wanfa.indexOf("|") != -1) {
		for (var k = 0; k < wanfa.split("|").length; k++) {
			opt = new Option(zhuma, zhuma);
			opt.setAttribute('wangFang', wanfa.split("|")[k]);
			add_codes(zhuma, zhuma);
			lotteryListSelect[k].options.add(opt);
		}
	} else {
		opt = new Option(zhuma, zhuma);
		opt.setAttribute('wangFang', wanfa);
		add_codes(zhuma, zhuma);
		lotteryListSelect[0].options.add(opt);
	}

	//添加到弹出框的注码
	$("#alert_zhuma").text(zhuma);
}

//加载页面时的清空操作
function cleanReadySPF() {
	$("option", $("#list_LotteryNumber")).remove();
	$(".result_1").removeClass("result_1").addClass("result_3");
	$("input[name='checkbox']").attr("checked", false);
	$("#lab_Num_standrad").text(0);
	$("#investField_standrad").text(0);
	$("#current_money").html(0);
}

//基本计算

//阶乘
function multiplyByStep(m, n) {
	if (m < 0 || n < 0) {
		return - 1;
	}
	var result = 1;

	if (m >= n) {
		for (var i = n; i <= m; i++) {
			result = result * i;
		}
	} else {
		for (var i = m; i <= n; i++) {
			result = result * i;
		}
	}
	return result;
}

//幂运算
function exp(d, z) {
	var result = 1;
	for (var i = 0; i < z; i++) {
		result = result * d;
	}
	return result;
}

//倍数验证

function multipleValidateJC() {
	// 如用户倍数框留空，光标离开倍数输入框，则倍数输入框默认为1.
	if ($('#tb_Multiple_standrad').val() == '' || $('#tb_Multiple_standrad').val() == undefined || $('#tb_Multiple_standrad').val() == null || Number($('#tb_Multiple_standrad').val()) <= 0) {
		$('#tb_Multiple_standrad').val(1);
		$("#tb_Multiple").val(1);
		$('#tb_Multiple_standrad').focus();
		$('#tb_Multiple_standrad').select();
	}

	//判断倍数是否在1-9999倍之间
	if (Number($('#tb_Multiple_standrad').val()) > 9999) {
		$('#tb_Multiple_standrad').val(9999);
		$("#tb_Multiple").val(9999);
		$('#tb_Multiple_standrad').focus();
		$('#tb_Multiple_standrad').select();
	}

	//自动转换为半角，不支持标点、小数点以及英文字母等其他输入。
	var pattern = /^-?\d+$/;
	if (isNaN($('#tb_Multiple_standrad').val()) || $('#tb_Multiple_standrad').val().search(pattern) != 0) {
		$('#tb_Multiple_standrad').val(1);
		$("#tb_Multiple").val(1);
		$('#tb_Multiple_standrad').focus();
		$('#tb_Multiple_standrad').select();
		return false;
	}
	return true;
}

//修改总金额
function updateMultipleTotalMoney() {
	var zhuShu = Number($("#lab_Num_standrad").html());
	var beishu = $("#tb_Multiple_standrad").attr("value");
	$("#tb_Multiple").val(beishu);
	totalMoney = parseInt(2 * beishu * zhuShu);
	$("#investField_standrad").html(totalMoney);
	$("#current_money").html(totalMoney);
	if (parseInt(($("#touzhu_money").html()) - ($("#current_money").html())) < 0) {
		$("#final_money").html("0");
	} else {
		$("#final_money").html(parseInt(($("#touzhu_money").html()) - ($("#current_money").html())));
	}
}

//点击赛事添加右侧的js (a代表id标号，b代表胜-3，平-1，负-0)
function addMatchForRight(object, day, a, b) {
	if (object.attr("class") != "result_1") {
		if (($("#CheckWin-" + day + "-" + a).hasClass("selected") != true && $("#CheckTie-" + day + "-" + a).hasClass("selected") != true && $("#CheckLoss-" + day + "-" + a).hasClass("selected") == true) || ($("#CheckWin-" + day + "-" + a).hasClass("selected") == true && $("#CheckTie-" + day + "-" + a).hasClass("selected") != true && $("#CheckLoss-" + day + "-" + a).hasClass("selected") != true) || ($("#CheckWin-" + day + "-" + a).hasClass("selected") != true && $("#CheckTie-" + day + "-" + a).hasClass("selected") == true && $("#CheckLoss-" + day + "-" + a).hasClass("selected") != true)) {
			$("#choose_" + day + "_" + a).remove();
			allMatch -= 1;
		} else {
			if (b == 3) {
				$("#CheckWin-" + day + "-" + a).removeClass("selected");
			} else if (b == 1) {
				$("#CheckTie-" + day + "-" + a).removeClass("selected");
			} else if (b == 0) {
				$("#CheckLoss-" + day + "-" + a).removeClass("selected");
			}
		}
		if (allMatch < 8) {
			for (var i = allMatch; i < 9; i++) {
				$("#r" + (allMatch + 1) + "c1").css("display", "none");
				$("#r" + (allMatch + 1) + "c1").removeClass("CheckBox light Switch").addClass("CheckBox light");
				if ($("#allWanfa").val().indexOf((allMatch + 1) + "串1") != -1) {
					$("#allWanfa").val($("#allWanfa").val().substring(0, $("#allWanfa").val().indexOf((allMatch + 1) + "串1") - 1) + $("#allWanfa").val().substring($("#allWanfa").val().indexOf((allMatch + 1) + "串1") + ((allMatch + 1) + "串1").length));
					$("#list_LotteryNumber option:eq(0)").attr("wangFang", $("#list_LotteryNumber option:eq(0)").attr("wangFang").substring(0, $("#list_LotteryNumber option:eq(0)").attr("wangFang").indexOf("50" + (allMatch + 1)) - 1) + $("#list_LotteryNumber option:eq(0)").attr("wangFang").substring($("#list_LotteryNumber option:eq(0)").attr("wangFang").indexOf("50" + (allMatch + 1)) + 3));
				}
			}
			//定义数组存放多串投注方式时的id编号
			var more = ["r3c3,r3c4", "r4c4,r4c5,r4c6,r4c11", "r5c5,r5c6,r5c10,r5c16,r5c20,r5c26", "r6c6,r6c7,r6c15,r6c20,r6c22,r6c35,r6c42,r6c50,r6c57", "r7c7,r7c8,r7c21,r7c35,r7c120", "r8c8,r8c9,r8c28,r8c56,r8c70,r8c247"];
			if (allMatch > 1) {
				for (var j = allMatch; j < 8; j++) {
					for (var m = 0; m < more[allMatch - 2].split(",").length; m++) {
						var id = more[allMatch - 2].split(",")[m];
						$("#" + id).css("display", "none");
						$("#" + id).children().removeClass();
						if ($("#allWanfa").val().indexOf(id.substring(id.indexOf("r") + 1, id.indexOf("c")) + "串" + id.substring(id.indexOf("c") + 1)) != -1) {
							$("#allWanfa").val($("#allWanfa").val().substring(0, $("#allWanfa").val().indexOf(id.substring(id.indexOf("r") + 1, id.indexOf("c")) + "串" + id.substring(id.indexOf("c") + 1)) - 1) + $("#allWanfa").val().substring($("#allWanfa").val().indexOf(id.substring(id.indexOf("r") + 1, id.indexOf("c")) + "串" + id.substring(id.indexOf("c") + 1)) + (id.substring(id.indexOf("r") + 1, id.indexOf("c")) + "串" + id.substring(id.indexOf("c") + 1)).length));
						}
					}
				}
			}
		}

	} else {
		if ($("#choose_" + day + "_" + a).length < 1) {
			$("#choose_list").append("<tr id='choose_" + day + "_" + a + "'><td><dl class='CheckBox light Switch' onclick='CheckBox($(this));removeThisResult($(this)," + day + "," + a + ",3,1);'><dt></dt><dd id='no-" + day + "-" + a + "'></dd></dl></td><td id='homeTeam-" + day + "-" + a + "'></td><td><span id='CheckWin-" + day + "-" + a + "' class='CheckWin' onclick='removeThisResult($(this)," + day + "," + a + ",3,0);'>胜</span><span id='CheckTie-" + day + "-" + a + "' class='CheckTie' onclick='removeThisResult($(this)," + day + "," + a + ",1,0)'>平</span><span id='CheckLoss-" + day + "-" + a + "' class='CheckLoss' onclick='removeThisResult($(this)," + day + "," + a + ",0,0)'>负</span></td></tr>");
			if (b == 3) {
				$("#CheckWin-" + day + "-" + a).addClass("selected");
			} else if (b == 1) {
				$("#CheckTie-" + day + "-" + a).addClass("selected");
			} else if (b == 0) {
				$("#CheckLoss-" + day + "-" + a).addClass("selected");
			}
			allMatch += 1;
		} else {
			if (b == 3) {
				$("#CheckWin-" + day + "-" + a).addClass("selected");
			} else if (b == 1) {
				$("#CheckTie-" + day + "-" + a).addClass("selected");
			} else if (b == 0) {
				$("#CheckLoss-" + day + "-" + a).addClass("selected");
			}
		}
		if (allMatch > 10) {
			openAlert(decodeURI(EncodeUtf8("您好，单个方案最多只能选择10场比赛进行投注！")));
			$("#choose_" + day + "_" + a).remove();
			$("#checkbox_" + day + "_" + a).attr("checked", false);
			allMatch -= 1;
			$("#ball" + b + "_" + day + "_" + a).removeClass("result_1").addClass("result_3");
			if (b == 3) {
				$("#CheckWin-" + day + "-" + a).removeClass("selected");
			} else if (b == 1) {
				$("#CheckTie-" + day + "-" + a).removeClass("selected");
			} else if (b == 0) {
				$("#CheckLoss-" + day + "-" + a).removeClass("selected");
			}
			checkZhuma();
		} else {
			var no = $("#no_" + day + "_" + a).html();
			var homeTeam = $("#hteam_" + day + "_" + a).html();

			if (allMatch < 9) {
				for (var i = 2; i <= allMatch; i++) {
					$("#r" + allMatch + "c1").css("display", "");
					//$("#r"+allMatch+"c1").removeClass("CheckBox light Switch").addClass("CheckBox light");
				}

				//定义数组存放多串投注方式时的id编号
				if (allMatch == 3) {
					var more = ["3", "4"];
				} else if (allMatch == 4) {
					var more = ["4", "5", "6", "11"];
				} else if (allMatch == 5) {
					var more = ["5", "6", "10", "16", "20", "26"];
				} else if (allMatch == 6) {
					var more = ["6", "7", "15", "20", "22", "35", "42", "50", "57"];
				} else if (allMatch == 7) {
					var more = ["7", "8", "21", "35", "120"];
				} else if (allMatch == 8) {
					var more = ["8", "9", "28", "56", "70", "247"];
				}

				for (var j = 3; j <= allMatch; j++) {
					for (var m = 0; m < more.length; m++) {
						var id = "r" + allMatch + "c" + more[m];
						$("#" + id).css("display", "");
						//$("#"+id).children().removeClass();
					}
				}
			}
			$("#no-" + day + "-" + a).html(no);
			$("#homeTeam-" + day + "-" + a).html(homeTeam);
		}
	}

	$("#matchNum").html(allMatch);
	var wanfa = $("#allWanfa").val();
	guoGuanWays(wanfa, 0);
}

//点击右侧赛事去掉选中的该结果object（当前对象）、 a（球的位置）、 b（胜平负代码310）、key（选择的是否是删除整场所有结果的选择按钮）
function removeThisResult(object, day, a, b, key) {
	if (key == 1) {
		$("#ball3_" + day + "_" + a).removeClass("result_1").addClass("result_3");
		$("#ball1_" + day + "_" + a).removeClass("result_1").addClass("result_3");
		$("#ball0_" + day + "_" + a).removeClass("result_1").addClass("result_3");
		$("#choose_" + day + "_" + a).remove();
		allMatch -= 1;
	} else if (key == 0) {
		$("#ball" + b + "_" + day + "_" + a).removeClass("result_1").addClass("result_3");
		if (($("#CheckWin-" + day + "-" + a).hasClass("selected") != true && $("#CheckTie-" + day + "-" + a).hasClass("selected") != true && $("#CheckLoss-" + day + "-" + a).hasClass("selected") == true) || ($("#CheckWin-" + day + "-" + a).hasClass("selected") == true && $("#CheckTie-" + day + "-" + a).hasClass("selected") != true && $("#CheckLoss-" + day + "-" + a).hasClass("selected") != true) || ($("#CheckWin-" + day + "-" + a).hasClass("selected") != true && $("#CheckTie-" + day + "-" + a).hasClass("selected") == true && $("#CheckLoss-" + day + "-" + a).hasClass("selected") != true)) {
			$("#choose_" + day + "_" + a).remove();
			allMatch -= 1;
		} else {
			object.removeClass("selected");
		}
	}

	$("#checkbox_" + day + "_" + a).attr("checked", false);
	checkZhuma();

	$("#matchNum").html(allMatch);
	if (allMatch < 8) {
		for (var i = allMatch; i < 9; i++) {
			$("#r" + (allMatch + 1) + "c1").css("display", "none");
			$("#r" + (allMatch + 1) + "c1").removeClass("CheckBox light Switch").addClass("CheckBox light");
			if ($("#allWanfa").val().indexOf((allMatch + 1) + "串1") != -1) {
				$("#allWanfa").val($("#allWanfa").val().substring(0, $("#allWanfa").val().indexOf((allMatch + 1) + "串1") - 1) + $("#allWanfa").val().substring($("#allWanfa").val().indexOf((allMatch + 1) + "串1") + ((allMatch + 1) + "串1").length));
				$("#list_LotteryNumber option:eq(0)").attr("wangFang", $("#list_LotteryNumber option:eq(0)").attr("wangFang").substring(0, $("#list_LotteryNumber option:eq(0)").attr("wangFang").indexOf("50" + (allMatch + 1)) - 1) + $("#list_LotteryNumber option:eq(0)").attr("wangFang").substring($("#list_LotteryNumber option:eq(0)").attr("wangFang").indexOf("50" + (allMatch + 1)) + 3));
			}
		}

		//定义数组存放多串投注方式时的id编号
		var more = ["r3c3,r3c4", "r4c4,r4c5,r4c6,r4c11", "r5c5,r5c6,r5c10,r5c16,r5c20,r5c26", "r6c6,r6c7,r6c15,r6c20,r6c22,r6c35,r6c42,r6c50,r6c57", "r7c7,r7c8,r7c21,r7c35,r7c120", "r8c8,r8c9,r8c28,r8c56,r8c70,r8c247"];
		if (allMatch > 1) {
			for (var j = allMatch; j < 8; j++) {
				for (var m = 0; m < more[allMatch - 2].split(",").length; m++) {
					var id = more[allMatch - 2].split(",")[m];
					$("#" + id).css("display", "none");
					$("#" + id).children().removeClass();
					if ($("#allWanfa").val().indexOf(id.substring(id.indexOf("r") + 1, id.indexOf("c")) + "串" + id.substring(id.indexOf("c") + 1)) != -1) {
						$("#allWanfa").val($("#allWanfa").val().substring(0, $("#allWanfa").val().indexOf(id.substring(id.indexOf("r") + 1, id.indexOf("c")) + "串" + id.substring(id.indexOf("c") + 1)) - 1) + $("#allWanfa").val().substring($("#allWanfa").val().indexOf(id.substring(id.indexOf("r") + 1, id.indexOf("c")) + "串" + id.substring(id.indexOf("c") + 1)) + (id.substring(id.indexOf("r") + 1, id.indexOf("c")) + "串" + id.substring(id.indexOf("c") + 1)).length));
					}
				}
			}
		}
	}

	var wanfa = $("#allWanfa").val();
	guoGuanWays(wanfa, 0);
}

//组合公式
function nchoosek(n, k) {
	if (n <= 0 || k < 0 || n < k) {
		return - 1;
	}
	if (k == 0 || n == k) {
		return 1;
	}
	if (k > n / 2) {
		k = n - k;
	}
	var result = multiplyByStep(n, n - k + 1) / multiplyByStep(k, 1);
	return result;
}

/* var a = [1, 2, 3];
 	document.write('<h1>'+a.join()+'里选3个进行排列组合的实例如下：</h1>');
 	document.write('<h1>排列</h1><ol><li>' + combAndArrange(a, 3, 'p').join('</li><li>') + '</li></ol>');
 	document.write('<h1>组合</h1><ol><li>' + combAndArrange(a, 3, 'c').join('</li><li>') + '</li></ol>');
 */
function combAndArrange(a, r, t) {

	function arrangeFirst(arr) {
		var len = arr.length;
		if (len == 2) {
			var a = arr[0],
			b = arr[1];
			return [a + b, b + a];
		} else if (len == 1) {
			return arr;
		} else {
			var strRtn = "";
			for (var i = 0; i < len; i++) {
				strRtn += merge(arr[i], arguments.callee(arr.slice(0, i).concat(arr.slice(i + 1, len)))).join(" , ") + " , ";
			}
			return strRtn.replace(/ \,$ /, "").split(" , ");
		}

		function merge(head, arr) {
			for (var i = 0; i < arr.length; i++) {
				arr[i] = head + arr[i];
			}
			return arr;
		}
	}

	function arrange(o, r) {
		var result = [];
		while (o.length) {
			var tmp = o.pop();
			if (tmp.length == r) result.push(tmp);
		}
		return result;
	}

	function combination(a, r, s) {
		var ret = [];
		s = s || [];

		if (r == 0) {
			return [s];
		}

		for (var i = 0; i <= a.length - r; i++) {
			ret = ret.concat(arguments.callee(a.slice(i + 1), r - 1, s.slice(0).concat(a[i])));
		}
		return ret;
	}
	var la = combination(a, r);

	if (t == "c") {
		return la;
	} else if (t == "p") {
		var pret = [];
		for (var j = 0,
		l = la.length; j < l; j++) {
			Array.prototype.push.apply(pret, arrange(arrangeFirst(la[j].join("-").split("-")), r));
		}
		return pret;
	}
}

function chuan2_1(a) {
	var chuan2_1 = combAndArrange(a, 2, 'c');
	var k = [];
	var ji = 0;
	for (var m = 0; m < chuan2_1.length; m++) {
		k = chuan2_1[m].toString().replace(',', '*').split("*");
		var keke = 0;
		for (var n = 0; n < k.length - 1; n += 2) {
			keke = Number(k[n]) * Number(k[n + 1]);
		}
		ji += keke;
	}
	return ji;
}
function chuan3_1(a) {
	var chuan3_1 = combAndArrange(a, 3, 'c');
	var k = [];
	var ji = 0;
	for (var m = 0; m < chuan3_1.length; m++) {
		k = chuan3_1[m].toString().replace(/\,/g, '*').split("*");
		var keke = 0;
		for (var n = 0; n < k.length - 1; n += 3) {
			keke = Number(k[n]) * Number(k[n + 1]) * Number(k[n + 2]);
		}
		ji += keke;
	}
	return ji;
}
function chuan4_1(a) {
	var chuan4_1 = combAndArrange(a, 4, 'c');
	var k = [];
	var ji = 0;
	for (var m = 0; m < chuan4_1.length; m++) {
		k = chuan4_1[m].toString().replace(/\,/g, '*').split("*");
		var keke = 0;
		for (var n = 0; n < k.length - 1; n += 4) {
			keke = Number(k[n]) * Number(k[n + 1]) * Number(k[n + 2]) * Number(k[n + 3]);
		}
		ji += keke;
	}
	return ji;
}
function chuan5_1(a) {
	var chuan5_1 = combAndArrange(a, 5, 'c');
	var k = [];
	var ji = 0;
	for (var m = 0; m < chuan5_1.length; m++) {
		k = chuan5_1[m].toString().replace(/\,/g, '*').split("*");
		var keke = 0;
		for (var n = 0; n < k.length - 1; n += 5) {
			keke = Number(k[n]) * Number(k[n + 1]) * Number(k[n + 2]) * Number(k[n + 3]) * Number(k[n + 4]);
		}
		ji += keke;
	}
	return ji;
}
function chuan6_1(a) {
	var chuan6_1 = combAndArrange(a, 6, 'c');
	var k = [];
	var ji = 0;
	for (var m = 0; m < chuan6_1.length; m++) {
		k = chuan6_1[m].toString().replace(/\,/g, '*').split("*");
		var keke = 0;
		for (var n = 0; n < k.length - 1; n += 6) {
			keke = Number(k[n]) * Number(k[n + 1]) * Number(k[n + 2]) * Number(k[n + 3]) * Number(k[n + 4]) * Number(k[n + 5]);
		}
		ji += keke;
	}
	return ji;
}
function chuan7_1(a) {
	var chuan7_1 = combAndArrange(a, 7, 'c');
	var k = [];
	var ji = 0;
	for (var m = 0; m < chuan7_1.length; m++) {
		k = chuan7_1[m].toString().replace(/\,/g, '*').split("*");
		var keke = 0;
		for (var n = 0; n < k.length - 1; n += 7) {
			keke = Number(k[n]) * Number(k[n + 1]) * Number(k[n + 2]) * Number(k[n + 3]) * Number(k[n + 4]) * Number(k[n + 5]) * Number(k[n + 6]);
		}
		ji += keke;
	}
	return ji;
}
function chuan8_1(a) {
	var chuan8_1 = combAndArrange(a, 8, 'c');
	var k = [];
	var ji = 0;
	for (var m = 0; m < chuan8_1.length; m++) {
		k = chuan8_1[m].toString().replace(/\,/g, '*').split("*");
		var keke = 0;
		for (var n = 0; n < k.length - 1; n += 8) {
			keke = Number(k[n]) * Number(k[n + 1]) * Number(k[n + 2]) * Number(k[n + 3]) * Number(k[n + 4]) * Number(k[n + 5]) * Number(k[n + 6]) * Number(k[n + 7]);
		}
		ji += keke;
	}
	return ji;
}

//n 为过关方式 比如：2串1,getNum为选的结果数的数组
function guoGuanWays(wanfa, key) {
	//注数
	var zhushu;
	//设置三级玩法,key为0时不设置，为1时设置
	if (key == 0) {
		zhushu = 0;
	} else if (key == 1) {
		if (wanfa == "|2串1" || wanfa == "|3串1" || wanfa == "|4串1" || wanfa == "|5串1" || wanfa == "|6串1" || wanfa == "|7串1" || wanfa == "|8串1") {
			var setWanfa = $("#allWanfa").val();
			if ($("#r" + wanfa.substring(1, 2) + "c" + wanfa.substring(wanfa.indexOf('串') + 1)).hasClass("Switch")) {
				if ($("#allWanfa").val().indexOf(wanfa.substring(1)) != -1) {
					$("#allWanfa").val(setWanfa);
				} else {
					setWanfa = setWanfa + "|" + wanfa.substring(1);
					$("#allWanfa").val(setWanfa);
				}
			} else {
				setWanfa = setWanfa.substring(0, setWanfa.indexOf(wanfa.substring(1)) - 1) + setWanfa.substring(setWanfa.indexOf(wanfa.substring(1)) + wanfa.substring(1).length);
				$("#allWanfa").val(setWanfa);
			}

			zhushu = Number($("#lab_Num_standrad").html());
		} else if (wanfa == "") {
			$("#allWanfa").val();
			zhushu = 0;
		} else {
			var setWanfa = wanfa;
			$("#allWanfa").val(setWanfa);
			zhushu = 0;
		}
	}

	//得到注码
	var view = $("#list_LotteryNumber > option").text();
	var singleMatch = view.split("^");
	var getNum = [];
	for (var i = 0; i < singleMatch.length - 1; i++) {
		var num = singleMatch[i].split("|")[3].length;
		getNum[i] = num;
	}

	var beishu = $("#tb_Multiple_standrad").attr("value");
	$("#tb_Multiple").val(beishu);

	//自由过关的变量
	var zhushu2_1 = 0,
	zhushu3_1 = 0,
	zhushu4_1 = 0,
	zhushu5_1 = 0,
	zhushu6_1 = 0,
	zhushu7_1 = 0,
	zhushu8_1 = 0;
	//多串过关的变量
	var zhushu3_3 = 0,
	zhushu3_4 = 0,
	zhushu4_4 = 0,
	zhushu4_5 = 0,
	zhushu4_6 = 0,
	zhushu4_11 = 0,
	zhushu5_5 = 0,
	zhushu5_6 = 0,
	zhushu5_10 = 0,
	zhushu5_16 = 0,
	zhushu5_20 = 0,
	zhushu5_26 = 0,
	zhushu6_6 = 0,
	zhushu6_7 = 0,
	zhushu6_15 = 0,
	zhushu6_20 = 0,
	zhushu6_22 = 0,
	zhushu6_35 = 0,
	zhushu6_42 = 0,
	zhushu6_50 = 0,
	zhushu6_57 = 0,
	zhushu7_7 = 0,
	zhushu7_8 = 0,
	zhushu7_21 = 0,
	zhushu7_35 = 0,
	zhushu7_120 = 0,
	zhushu8_8 = 0,
	zhushu8_9 = 0,
	zhushu8_28 = 0,
	zhushu8_56 = 0,
	zhushu8_70 = 0,
	zhushu8_247 = 0;
	for (var i = 1; i < wanfa.split("|").length; i++) {
		n = wanfa.split("|")[i];
		if (n == "2串1") {
			if ($("#r2c1").hasClass("Switch")) {
				zhushu2_1 = chuan2_1(getNum);
			} else {
				zhushu2_1 = -chuan2_1(getNum);
			}
		} else if (n == "3串1") {
			if ($("#r3c1").hasClass("Switch")) {
				zhushu3_1 = chuan3_1(getNum);
			} else {
				zhushu3_1 = -chuan3_1(getNum);
			}
		} else if (n == "4串1") {
			if ($("#r4c1").hasClass("Switch")) {
				zhushu4_1 = chuan4_1(getNum);
			} else {
				zhushu4_1 = -chuan4_1(getNum);
			}
		} else if (n == "5串1") {
			if ($("#r5c1").hasClass("Switch")) {
				zhushu5_1 = chuan5_1(getNum);
			} else {
				zhushu5_1 = -chuan5_1(getNum);
			}
		} else if (n == "6串1") {
			if ($("#r6c1").hasClass("Switch")) {
				zhushu6_1 = chuan6_1(getNum);
			} else {
				zhushu6_1 = -chuan6_1(getNum);
			}
		} else if (n == "7串1") {
			if ($("#r7c1").hasClass("Switch")) {
				zhushu7_1 = chuan7_1(getNum);
			} else {
				zhushu7_1 = -chuan7_1(getNum);
			}
		} else if (n == "8串1") {
			if ($("#r8c1").hasClass("Switch")) {
				zhushu8_1 = chuan8_1(getNum);
			} else {
				zhushu8_1 = -chuan8_1(getNum);
			}
		} else if (n == "3串3") {
			var zhumaArr = combAndArrange(getNum, 3, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu3_3 += chuan2_1(zhumaArr[k]);
			}
		} else if (n == "3串4") {
			var zhumaArr = combAndArrange(getNum, 3, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu3_4 += chuan2_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu3_4 += chuan3_1(zhumaArr[k]);
			}
		} else if (n == "4串4") {
			var zhumaArr = combAndArrange(getNum, 4, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu4_4 += chuan3_1(zhumaArr[k]);
			}
		} else if (n == "4串5") {
			var zhumaArr = combAndArrange(getNum, 4, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu4_5 += chuan3_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu4_5 += chuan4_1(zhumaArr[k]);
			}
		} else if (n == "4串6") {
			var zhumaArr = combAndArrange(getNum, 4, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu4_6 += chuan2_1(zhumaArr[k]);
			}
		} else if (n == "4串11") {
			var zhumaArr = combAndArrange(getNum, 4, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu4_11 += chuan2_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu4_11 += chuan3_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu4_11 += chuan4_1(zhumaArr[k]);
			}
		} else if (n == "5串5") {
			var zhumaArr = combAndArrange(getNum, 5, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu5_5 += chuan4_1(zhumaArr[k]);
			}
		} else if (n == "5串6") {
			var zhumaArr = combAndArrange(getNum, 5, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu5_6 += chuan4_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu5_6 += chuan5_1(zhumaArr[k]);
			}
		} else if (n == "5串10") {
			var zhumaArr = combAndArrange(getNum, 5, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu5_10 += chuan2_1(zhumaArr[k]);
			}
		} else if (n == "5串16") {
			var zhumaArr = combAndArrange(getNum, 5, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu5_16 += chuan3_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu5_16 += chuan4_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu5_16 += chuan5_1(zhumaArr[k]);
			}
		} else if (n == "5串20") {
			var zhumaArr = combAndArrange(getNum, 5, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu5_20 += chuan2_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu5_20 += chuan3_1(zhumaArr[k]);
			}
		} else if (n == "5串26") {
			var zhumaArr = combAndArrange(getNum, 5, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu5_26 += chuan2_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu5_26 += chuan3_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu5_26 += chuan4_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu5_26 += chuan5_1(zhumaArr[k]);
			}
		} else if (n == "6串6") {
			var zhumaArr = combAndArrange(getNum, 6, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_6 += chuan5_1(zhumaArr[k]);
			}
		} else if (n == "6串7") {
			var zhumaArr = combAndArrange(getNum, 6, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_7 += chuan5_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_7 += chuan6_1(zhumaArr[k]);
			}
		} else if (n == "6串15") {
			var zhumaArr = combAndArrange(getNum, 6, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_15 += chuan2_1(zhumaArr[k]);
			}
		} else if (n == "6串20") {
			var zhumaArr = combAndArrange(getNum, 6, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_20 += chuan3_1(zhumaArr[k]);
			}
		} else if (n == "6串22") {
			var zhumaArr = combAndArrange(getNum, 6, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_22 += chuan4_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_22 += chuan5_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_22 += chuan6_1(zhumaArr[k]);
			}
		} else if (n == "6串35") {
			var zhumaArr = combAndArrange(getNum, 6, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_35 += chuan2_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_35 += chuan3_1(zhumaArr[k]);
			}
		} else if (n == "6串42") {
			var zhumaArr = combAndArrange(getNum, 6, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_42 += chuan3_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_42 += chuan4_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_42 += chuan5_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_42 += chuan6_1(zhumaArr[k]);
			}
		} else if (n == "6串50") {
			var zhumaArr = combAndArrange(getNum, 6, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_50 += chuan2_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_50 += chuan3_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_50 += chuan4_1(zhumaArr[k]);
			}
		} else if (n == "6串57") {
			var zhumaArr = combAndArrange(getNum, 6, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_57 += chuan2_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_57 += chuan3_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_57 += chuan4_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_57 += chuan5_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu6_57 += chuan6_1(zhumaArr[k]);
			}
		} else if (n == "7串7") {
			var zhumaArr = combAndArrange(getNum, 7, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu7_7 += chuan6_1(zhumaArr[k]);
			}
		} else if (n == "7串8") {
			var zhumaArr = combAndArrange(getNum, 7, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu7_8 += chuan6_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu7_8 += chuan7_1(zhumaArr[k]);
			}
		} else if (n == "7串21") {
			var zhumaArr = combAndArrange(getNum, 7, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu7_21 += chuan5_1(zhumaArr[k]);
			}
		} else if (n == "7串35") {
			var zhumaArr = combAndArrange(getNum, 7, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu7_35 += chuan4_1(zhumaArr[k]);
			}
		} else if (n == "7串120") {
			var zhumaArr = combAndArrange(getNum, 7, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu7_120 += chuan2_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu7_120 += chuan3_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu7_120 += chuan4_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu7_120 += chuan5_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu7_120 += chuan6_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu7_120 += chuan7_1(zhumaArr[k]);
			}
		} else if (n == "8串8") {
			var zhumaArr = combAndArrange(getNum, 8, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu8_8 += chuan7_1(zhumaArr[k]);
			}
		} else if (n == "8串9") {
			var zhumaArr = combAndArrange(getNum, 8, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu8_9 += chuan7_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu8_9 += chuan8_1(zhumaArr[k]);
			}
		} else if (n == "8串28") {
			var zhumaArr = combAndArrange(getNum, 8, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu8_28 += chuan6_1(zhumaArr[k]);
			}
		} else if (n == "8串56") {
			var zhumaArr = combAndArrange(getNum, 8, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu8_56 += chuan5_1(zhumaArr[k]);
			}
		} else if (n == "8串70") {
			var zhumaArr = combAndArrange(getNum, 8, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu8_70 += chuan4_1(zhumaArr[k]);
			}
		} else if (n == "8串247") {
			var zhumaArr = combAndArrange(getNum, 8, 'c');
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu8_247 += chuan2_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu8_247 += chuan3_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu8_247 += chuan4_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu8_247 += chuan5_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu8_247 += chuan6_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu8_247 += chuan7_1(zhumaArr[k]);
			}
			for (var k = 0; k < zhumaArr.length; k++) {
				zhushu8_247 += chuan8_1(zhumaArr[k]);
			}
		}
	}

	zhushu = zhushu + zhushu2_1 + zhushu3_1 + zhushu4_1 + zhushu5_1 + zhushu6_1 + zhushu7_1 + zhushu8_1 + zhushu3_3 + zhushu3_4 + zhushu4_4 + zhushu4_5 + zhushu4_6 + zhushu4_11 + zhushu5_5 + zhushu5_6 + zhushu5_10 + zhushu5_16 + zhushu5_20 + zhushu5_26 + zhushu6_6 + zhushu6_7 + zhushu6_15 + zhushu6_20 + zhushu6_22 + zhushu6_35 + zhushu6_42 + zhushu6_50 + zhushu6_57 + zhushu7_7 + zhushu7_8 + zhushu7_21 + zhushu7_35 + zhushu7_120 + zhushu8_8 + zhushu8_9 + zhushu8_28 + zhushu8_56 + zhushu8_70 + zhushu8_247;
	$("#lab_Num_standrad").html(zhushu);
	$("#investField_standrad").html(zhushu * beishu * 2);
	$("#current_money").html(zhushu * beishu * 2);
}
function saleMa() {
	var allWanfa = "";
	if ($("#allWanfa").val().indexOf("|") != -1) {
		var wanfaArr = $("#allWanfa").val().split("|");
		for (var m = 1; m < wanfaArr.length; m++) {
			if (wanfaArr[m] == "2串1") {
				wanfaArr[m] = "502";
			} else if (wanfaArr[m] == "3串1") {
				wanfaArr[m] = "503";
			} else if (wanfaArr[m] == "4串1") {
				wanfaArr[m] = "504";
			} else if (wanfaArr[m] == "5串1") {
				wanfaArr[m] = "505";
			} else if (wanfaArr[m] == "6串1") {
				wanfaArr[m] = "506";
			} else if (wanfaArr[m] == "7串1") {
				wanfaArr[m] = "507";
			} else if (wanfaArr[m] == "8串1") {
				wanfaArr[m] = "508";
			} else if (wanfaArr[m] == "3串3") {
				wanfaArr[m] = "526";
			} else if (wanfaArr[m] == "3串4") {
				wanfaArr[m] = "527";
			} else if (wanfaArr[m] == "4串6") {
				wanfaArr[m] = "528";
			} else if (wanfaArr[m] == "4串11") {
				wanfaArr[m] = "529";
			} else if (wanfaArr[m] == "5串10") {
				wanfaArr[m] = "530";
			} else if (wanfaArr[m] == "5串20") {
				wanfaArr[m] = "531";
			} else if (wanfaArr[m] == "5串26") {
				wanfaArr[m] = "532";
			} else if (wanfaArr[m] == "6串15") {
				wanfaArr[m] = "533";
			} else if (wanfaArr[m] == "6串35") {
				wanfaArr[m] = "534";
			} else if (wanfaArr[m] == "6串50") {
				wanfaArr[m] = "535";
			} else if (wanfaArr[m] == "6串57") {
				wanfaArr[m] = "536";
			} else if (wanfaArr[m] == "7串120") {
				wanfaArr[m] = "537";
			} else if (wanfaArr[m] == "8串247") {
				wanfaArr[m] = "538";
			} else if (wanfaArr[m] == "4串4") {
				wanfaArr[m] = "539";
			} else if (wanfaArr[m] == "4串5") {
				wanfaArr[m] = "540";
			} else if (wanfaArr[m] == "5串16") {
				wanfaArr[m] = "541";
			} else if (wanfaArr[m] == "6串20") {
				wanfaArr[m] = "542";
			} else if (wanfaArr[m] == "6串42") {
				wanfaArr[m] = "543";
			} else if (wanfaArr[m] == "5串5") {
				wanfaArr[m] = "544";
			} else if (wanfaArr[m] == "5串6") {
				wanfaArr[m] = "545";
			} else if (wanfaArr[m] == "6串22") {
				wanfaArr[m] = "546";
			} else if (wanfaArr[m] == "7串35") {
				wanfaArr[m] = "547";
			} else if (wanfaArr[m] == "8串70") {
				wanfaArr[m] = "548";
			} else if (wanfaArr[m] == "6串6") {
				wanfaArr[m] = "549";
			} else if (wanfaArr[m] == "6串7") {
				wanfaArr[m] = "550";
			} else if (wanfaArr[m] == "7串21") {
				wanfaArr[m] = "551";
			} else if (wanfaArr[m] == "8串56") {
				wanfaArr[m] = "552";
			} else if (wanfaArr[m] == "7串7") {
				wanfaArr[m] = "553";
			} else if (wanfaArr[m] == "7串8") {
				wanfaArr[m] = "554";
			} else if (wanfaArr[m] == "8串28") {
				wanfaArr[m] = "555";
			} else if (wanfaArr[m] == "8串8") {
				wanfaArr[m] = "556";
			} else if (wanfaArr[m] == "8串9") {
				wanfaArr[m] = "557";
			}
			allWanfa += wanfaArr[m] + "-";
		}
		allWanfa = allWanfa.substring(0, allWanfa.length - 1);
	} else {
		allWanfa = $("#allWanfa").val();
	}

	return allWanfa;
}

function removeSelectWays(key) {
	if (key == "PassFreedom") {
		$("#PassFreedom dl").removeClass("CheckBox light Switch").addClass("CheckBox light");
	} else if (key == "PassSeries") {
		$("#PassSeries dl").children().removeClass("selected");
	}
	$("#lab_Num_standrad").html(0);
	$("#investField_standrad").html(0);
	$("#current_money").html(0);
	$("#allWanfa").val("");
}