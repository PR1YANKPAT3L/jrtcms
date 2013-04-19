/**
 * 导航栏切换
 */
function fetch_object(idname) {
	var my_obj = document.getElementById(idname);
	return my_obj;
}
function toggle_nav(obj,hout,hover,length) {
	for (i = 1; i <= length; i++) {
		var sub_nav = fetch_object("sub_nav_" + i);
		var sub_nav_index = fetch_object("sub_nav_0");
		sub_nav_index.style.display = "none";
		var id = $("#nav_"+i);
		if (obj == i) {	
			id.removeClass(hout);
        	id.addClass(hover);
			sub_nav.style.display = "block";
		} else {
			id.removeClass(hover);
        	id.addClass(hout);
			sub_nav.style.display = "none";
		}
	}
}

/**
 * 查询DNA账户充值的action
 *
 */
function chargeOnload() {
	 $.ajax({
	         url:'/chlw/ajax/ajaxCharge!toCharge',  //后台处理程序
	         type:'post',    //数据发送方式
	         dataType:'json',   //接受数据格式
	         success:(function(json){ //回传函数实体，参数为XMLhttpRequest.responseText
	        	 if(json.objDNABind.error_code=="000000"){
    				$("#tel").val(json.objDNABind.Mobile);
    				if(json.objDNABind.BankCardNo!="" && json.objDNABind.BankCardNo!=null){
    					$("#cardNumber").val(json.objDNABind.BankCardNo);
    					$("#cardNumber").attr('readonly','false');
    					$("#cardNumber").css('border-style','none');
    				}
    				if(json.objDNABind.Name!="" && json.objDNABind.Name!=null){
    				   $("#userName").val(json.objDNABind.Name);
    				   $("#userName").attr('readonly','false');
    				   $("#userName").css('border-style','none');
    				}
    			}
    		 })//回传函数(这里是函数名)
	});
};


//得到radio按钮验证的值
function disDiv(radioID){
	var radio=document.getElementsByName(radioID);//得到卡的类型
	var c;
	 if(radio.length){  
		for(var i=0;i <radio.length;i++){ 
		   if(radio[i].checked){  
			    c =radio[i].value; 
			    break; 
		  }       
		} 
	}
   return c;
}
/**
 * 网上银行充值开始
 */
//网上银行按钮
function bankRadioCharge(radioID){
	var c = disDiv(radioID);
	 if(c=='minShengBanks'){
		 $("#dis").html("民生银行支付");
		 $("#minshengNo").html("本次充值由 <font id='dis'>民生银行支付</font> 提供接口支持");
	 }else if(c=='zfbzx' || c=='zfbyy'){
		 $("#dis").html("支付宝支付");
		 $("#minshengNo").html("本次充值由 <font id='dis'>支付宝支付</font> 提供接口支持");
	 }else if(c=='yeepay'){
		 $("#dis").html("易宝支付");
		 $("#minshengNo").html("本次充值由 <font id='dis'>易宝支付</font> 提供接口支持");
	 }
}
//验证
function checkMinsheng(){
	var bankMoneyPattern = /^([1-9]{1}[0-9]*)$/;
	var bankMoney = document.getElementById("minshengMoney").value;
	//alert(bankMoney);
	var tmoney = document.getElementById("minshengNo");
	if (bankMoney == null || bankMoney == "") {
		tmoney.innerHTML = "请您输入充值金额!";
		return false;
	}
	if (isNaN(bankMoney)) {
		tmoney.innerHTML = "充值金额必须是数字!";
		return false;
	}
	if(!bankMoneyPattern.test(bankMoney)){
		tmoney.innerHTML = "充值金额必须是整数!";
		return false;
	}
	if (bankMoney < 1 || bankMoney > 9223372036854775807) {
		tmoney.innerHTML = "必须是大于等于1的数字!";
		return false;
	}
	tmoney.innerHTML = "";
	return true;
}
function ajaxMinshengFill(){
	if(!checkMinsheng()){
	   return;
	}
    var params=$('#MinshengForm').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值
    $.ajax({
         url:'/chlw/ajax/ajaxCharge!minshengCharge',  //后台处理程序
         type:'post',    //数据发送方式
         dataType:'json',   //接受数据格式
         data:params,   //要传递的数据;就是上面序列化的值
         success:minshengCharge_Result //回传函数(这里是函数名) 
     });
}
function minshengCharge_Result(json){ //回传函数实体，参数为XMLhttpRequest.responseText
	if(json.flag){ 
		if(json.bankOrSound == 'minShengBanks'){
			$("#minshengNo").html("<form name='myForm' method='post'  action='"+json.objMinsheng.requrl+"'>" +
			"<input type='hidden' name='orderinfo' id='orderinfo' value='"+json.objMinsheng.msBank_Mac+"'/>" +
			"</form>" +
			"<script type='text/javascript'>" +
			"document.myForm.target='_blank';document.myForm.submit();</script>");

		}else if(json.bankOrSound == 'yeepay'){
		    window.open(json.jsonYeepay.requrl);
		}else if(json.bankOrSound == 'zfbzx'){
			 window.open(json.jsonAlipay.requrl);
		}else{
			$("#minshengNo").html(json.message);
		}
	 }else{
		 $("#minshengNo").html(json.message);
	 }
}
/**
 * 网上银行充值结束
 */

/**
 * 话费、游戏卡充值开始
 */
//点卡按钮
function pointRadio(radioID){
	var c = disDiv(radioID);
	if(c =='SZX' || c=='UNICOM' || c=='DXJFK'){
		document.getElementById('huafei').style.display='block';
		document.getElementById('game').style.display='none';
	}else{
		document.getElementById('game').style.display='block';
		document.getElementById('huafei').style.display='none';
	}
}

// 充值时点卡卡号验证	
function chargeCardNoCheck(){
	var cardNo = document.getElementById("cardNoPoint").value;
	var cno = document.getElementById("pointMessage");
	if (cardNo == null || cardNo == "") {
		cno.innerHTML = "请您输入点卡卡号!";
		return false;
	}
	if (cardNo.length > 30) {
		cno.innerHTML = "卡号必须是小于30位!";
		return false;
	}
	cno.innerHTML = "";
	return true;
}
// 充值时点卡密码验证
function chargePassCheck(){
	var cardPass = document.getElementById("cardPassword").value;
	var cpass = document.getElementById("pointMessage");
	if (cardPass == null || cardPass == "") {
		cpass.innerHTML = "请您输入您的点卡密码";
		return false;
	}
	cpass.innerHTML = "";
	return true;
}
// 验证充值卡面值
function chargeallmoneyCheck(){
	var  bankMoneyPattern = /^([1-9]{1}[0-9]*)$/;
	var bankMoney = document.getElementById("mzmoney1").value;
	var tmoney = document.getElementById("pointMessage");
	if (bankMoney == null || bankMoney == "") {
		tmoney.innerHTML = "请您输入充值卡面值!";
		return false;
	}
	if (isNaN(bankMoney)) {
		tmoney.innerHTML = "点卡面值必须是数字!";
		return false;
	}
	if (bankMoney < 1 || bankMoney > 5000) {
		tmoney.innerHTML = "点卡面值必须为整数!";
		return false;
	}
	tmoney.innerHTML = "";
	return true;
}

function ajaxPointFill(){
	if(!chargeCardNoCheck()){return;}
	if(!chargePassCheck()){return;}
	var c = disDiv('radioName');
	if(c =='JUNNET' || c=='SNDACARD' || c=='ZHENGTU'){if(!chargeallmoneyCheck()){return;}}
	var params=$('#pointForm').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值
	    $.ajax({
	         url:'/chlw/ajax/ajaxCharge!pointCharge',  //后台处理程序
	         type:'post',    //数据发送方式
	         dataType:'json',   //接受数据格式
	         data:params,   //要传递的数据;就是上面序列化的值
	         success:point_Result //回传函数(这里是函数名) 
	     });
}
function point_Result(data){
	if(data.flag){
		var error_code = data.jsonValue.error_code;
		if(error_code=="000000"){
			$("#pointMessage").html("充值中，请稍后查询余额!");
		}else{
			$("#pointMessage").html("充值失败，请重新充值");
		}
	}else{
		$("#pointMessage").html(data.message);
	}
	
}
/**
 * 话费、游戏卡充值结束
 */


/**
 * dna充值开始
 */
//验证充值的金额
function amountCheck()// 充值时数据验证	
{
	var bankMoneyPattern = /^([1-9]{1}[0-9]*)$/;
	var bankMoney = document.getElementById("amount").value;
	var tmoney = document.getElementById("dnaMessage");
	if (bankMoney == null || bankMoney == "") {
		tmoney.innerHTML = "请您输入充值金额!";
		return false;
	}
	if (isNaN(bankMoney)) {
		tmoney.innerHTML = "充值金额必须是数字!";
		return false;
	}
	if(!bankMoneyPattern.test(bankMoney)){
		tmoney.innerHTML = "充值金额必须是整数!";
		return false;
	}
	if (bankMoney < 20 || bankMoney > 9223372036854775807) {
		tmoney.innerHTML = "银行卡电话充值最少20元";
		return false;
	}
	tmoney.innerHTML = "";
	return true;
}

//验证银行卡号
function cardNumberCheck(){
	var cardNumber=document.getElementById("cardNumber").value;
	var reg = /^([0-9]{16,21})/;  
	var cardNo =document.getElementById("dnaMessage");
	if (cardNumber == null || cardNumber == "") {
		cardNo.innerHTML = "请您输入银行卡卡号!";
		cardNo.style.color = "";
		return false;
	}
	if(!reg.test(cardNumber) ){
		cardNo.innerHTML = "请你输入正确的银行账号";
		cardNo.style.color = "";
		return false;
	}
	cardNo.innerHTML="";
	return true;

}

//验证电话号码
function telCheck(){
	var phone = document.getElementById("tel").value;
	var tphone = document.getElementById("dnaMessage");

	var phonePattern1=/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
	var phonePattern2=/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
	if(phone==null||phone==""){
		tphone.innerHTML="请输入电话号码"; 
		return false;
	}
	if(isNaN(phone)){
		tphone.innerHTML="请正确输入电话号码"; 
		return false;
	}
	if(phone.length>11){
		tphone.innerHTML="请正确输入电话号码"; 
		return false;
	}
	tphone.innerHTML=""; 
	return true;
}

//验证用户名
function checkUserName(){
	var userName = document.getElementById("userName").value;
	var uname = document.getElementById("dnaMessage");
	if(userName==null || userName==""){
		uname.innerHTML = "请输入持卡人姓名!";
		return false;
	}
	if(userName.length>20){
		uname.innerHTML = "用户名不能超过20个字符!";
		return false;
	}
	uname.innerHTML=""; 
	return true;
}
//开卡证件所在地
function checkDocumentAddress(){
	var documentNumber=document.getElementById("documentAddress").value;
	var documentNo=document.getElementById("dnaMessage");
	if(documentNumber==null||documentNumber==""){
		documentNo.innerHTML="请输入身份证户籍所在地";
		return false;
	}
	documentNo.innerHTML="";
	return true;
	
}
function ajaxDnaFill(){
	 if(!amountCheck()){return;}
	 if(!cardNumberCheck()){return;}
	 if(!telCheck()){return;} 
	 if($("#hiddenName").val=="grayList"){
		 if(!checkUserName()){return;}
		 if(!checkDocumentAddress()){return;}
	 }
	 var params=$('#dnaForm').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值
	    $.ajax({
	         url:'/chlw/ajax/ajaxCharge!dnaCharge',  //后台处理程序
	         type:'post',    //数据发送方式
	         dataType:'json',   //接受数据格式
	         data:params,   //要传递的数据;就是上面序列化的值
	         success:dna_Result //回传函数(这里是函数名) 
	     });
}
function dna_Result(json){
	if(json.flag){
		var error_code = json.jsonValue.error_code;
		if(error_code=="T437" || error_code=="T438"){
			$("#displayAll").css('display','block');//显示用户详细信息
			$("#dnaMessage").html("您首次使用银联手机支付，请补全信息");
	    	$("#hiddenName").val("grayList");
		}else{
			$("#dnaMessage").html(json.jsonValue.error_remark);
		}
	}else{
		$("#dnaMessage").html(json.message);
	}
	
}
/**
 * dna充值结束
 */

/**
 * 如意彩点卡充值开始
 */
//如意彩点卡充值 
function chargeCardNoCheck2(){
	var cardNo = document.getElementById("cardNoRyc").value;
	var cardNoPattern = /^[0-9]{16}$/;
	var cno = document.getElementById("rycMessage");
	if (cardNo == null || cardNo == "") {
		cno.innerHTML = "请您输入如意彩充值卡卡号";
		return false;
	}
	if (!cardNoPattern.test(cardNo)) {
		cno.innerHTML = "卡号必须是16位的数字字符串";
		return false;
	}
	cno.innerHTML = "";
	return true;
}
//充值时点卡密码验证
function chargePassCheck2(){
	var cardPass = document.getElementById("cardPasswordRyc").value;
	var cardPassPattern = /^[0-9]{6}$/;
	var cpass = document.getElementById("rycMessage");
	if (cardPass == null || cardPass == "") {
		cpass.innerHTML = "充值密码必须填写";
		return false;
	}
	if (!cardPassPattern.test(cardPass)) {
		cpass.innerHTML = "密码必须是6位的数字字符串";
		return false;
	}
	cpass.innerHTML = "";
	return true;
}
function ajaxRycPointFill(){
	if(!chargeCardNoCheck2()){return;}
	if(!chargePassCheck2()){return;}
    var params=$('#ruyicaiForm').serialize(); //这里直接就序列化了表单里面的值；直接获取到表单元素的值
    $.ajax({
         url:'/chlw/ajax/ajaxCharge!rycPointCharge',  //后台处理程序
         type:'post',    //数据发送方式
         dataType:'json',   //接受数据格式
         data:params,   //要传递的数据;就是上面序列化的值
         success:rycPoint_Result //回传函数(这里是函数名) 
     });
}
function rycPoint_Result(json){ //回传函数实体，参数为XMLhttpRequest.responseText
 if(json.flag){
	 if(json.jsonValue.error_code=="000000"){
		 $("#rycMessage").html("充值成功，请稍后查询余额！");
	 }else if(json.jsonValue.error_code=="000012"){
		 $("#rycMessage").html("对不起，您的充值卡无效！");
	 }
 }else{
	 $("#rycMessage").html(json.message);
 }
}
/**
 * 如意彩点卡充值结束
 */


function fun(){
	   var city=new Array();
	   city['选择开户账号的省份--']=['选择开户账号的城市--'];
	   city['北京市']=['东城区','丰台区','大兴区','宣武区','崇文区','平谷区','怀柔区','房山区','昌平区','朝阳区','海淀区','石景山区','西城区','通州区','门头沟区','顺义区'];
	   city['上海市']=['南汇区','卢湾区','嘉定区','奉贤区','宝山区','徐汇区','普陀区','杨浦区','松江区','浦东新区','虹口区','金山区','长宁区','闵行区','闸北区','青浦区','静安区','黄浦区'];
	   city['重庆市']=['万州区','万盛区','九龙坡区','北碚区','南岸区','南川区','双桥区','合川区','大渡口区','巴南区','永川区','江北区','江津区','沙坪坝区','涪陵区','渝中区','渝北区','长寿区','黔江区'];
	   city['天津市']=['东丽区','北城区','南开区','和平区','塘沽区','大港区','宝坻区','武清区','汉沽区','河东区','河北区','河西区','津南区','虹桥区','西青区'];
	   city['黑龙江省']=['七台河市','伊春市','佳木斯市','双鸭山市','哈尔滨市','大兴安岭地区','大庆市','牡丹江市','绥化市','鸡西市','鹤岗市','黑河市','齐齐哈尔市'];
	   city['云南省']=['临沧市','丽江市','保山市','大理白族自治州','德宏傣族景颇族自治州','怒江傈僳族自治州','文山壮族苗族自治州','昆明市','昭通市','普洱市','曲靖市','楚雄傣族自治州','','玉溪市','红河哈尼族傣族自治州','西双版纳傣族自治州','迪庆藏族自治州'];
	   city['吉林省']=['吉林市','四平市','延边朝鲜族自治州','松原市','白城市','白山市','辽源市','通化市','长春市'];
	   city['安徽省']=['毫州市','六安市','合肥市','安庆市','宣城市','宿州市','巢湖市','池州市','淮北市','淮南市','滁州市','芜湖市','蚌埠市','铜陵市','阜阳市','马鞍山市','黄山市'];
	   city['山东省']=['东营市','临沂市','威海市','德州市','日照市','枣庄市','泰安市','济南市','济宁市','淄博市','滨州市','潍坊市','烟台市','聊城市','莱芜市','菏泽市','青岛市'];
	   city['山西省']=['临汾市','吕梁市','大同市','太原市','忻州市','晋中市','晋城市','朔州市','运城市','长治市','阳泉市'];
	   city['广东省']=['东莞市','云浮市','中山市','佛山市','广州市','惠州市','揭阳市','梅州市','汕头市','汕尾市','江门市','河源市','深圳市','清远市','湛江市','潮州市','珠海市','肇庆市','茂名市','阳江市','韶关市'];
	   city['广西壮族自治区']=['北海市','南宁市','崇左市','来宾市','柳州市','桂林市','梧州市','河池市','玉林市','百色市','贵港市','贺州市','钦州市','防城港市'];
	   city['江苏省']=['南京市','南通市','宿迁市','常州市','扬州市','徐州市','无锡市','泰州市','淮安市','盐城市','苏州市','连云港市','镇江市'];
	   city['江西省']=['上饶市','九江市','南昌市','吉安市','宜春市','抚州市','新余市','景德镇市','萍乡市','赣州市','鹰潭市'];
	   city['河北省']=['保定市','廊坊市','唐山市','张家口市','承德市','沧州市','石家庄市','秦皇岛市','衡水市','邢台市','邯郸市'];
	   city['河南省']=['三门峡市','信阳市','南阳市','周口市','商丘市','安阳市','平顶山市','开封市','新乡市','洛阳市','漯河市','濮阳市','焦作市','许昌市','郑州市','驻马店市','鹤壁市'];
	   city['浙江省']=['丽水市','台州市','嘉兴市','宁波市','杭州市','温州市','湖州市','绍兴市','舟山市','衢州市','金华市'];
	   city['海南省']=['三亚市','海口市','省直辖及县级行政单位'];
	   city['湖北省']=['武汉市','黄石市','十堰市','宜昌市','襄樊市','鄂州市','荆门市','黄冈市','咸宁市','随州市','恩施土家族苗族自治州','省直辖行政单位','孝感市','荆州市'];
	   city['湖南省']=['长沙市','株洲市','湘潭市','衡阳市','邵阳市','岳阳市','常德市','张家界市','益阳市','郴州市','永州市','怀化市','娄底市','湘西土家族苗族自治州'];
	   city['甘肃省']=['兰州市','嘉峪关市','金昌市','白银市','天水市','武威市','张掖市','平凉市','酒泉市','庆阳市','定西市','陇南市','临夏回族自治州','甘南藏族自治州','','','',''];
	   city['福建省']=['福州市','厦门市','莆田市','三明市','泉州市','漳州市','南平市','龙岩市','宁德市'];
	   city['四川省']=['成都市','自贡市','攀枝花市','泸州市','德阳市','绵阳市','广元市','遂宁市','内江市','乐山市','南充市','眉山市','宜宾市','广安市','达州市','雅安市','巴中市','资阳市','阿坝藏族羌族自治州','连山傣族自治州','甘孜藏族自治州'];
	   city['贵州省']=['贵阳市','六盘水市','遵义市','安顺市','铜仁地区','黔西南布依族苗族自治州','毕节地区','黔东南苗族侗族自治州','黔南布依族苗族自治州'];
	   city['辽宁省']=['沈阳市','大连市','鞍山市','抚顺市','本溪市','丹东市','锦州市','营口市','阜新市','辽阳市','盘锦市','铁岭市','朝阳市','葫芦岛市'];
	   city['陕西省']=['西安市','铜川市','宝鸡市','咸阳市','渭南市','延安市','汉中市','榆林市','安康市','商洛市'];
	   city['青海省']=['西宁市','海东地区','海北藏族自治州','黄南藏族自治州','海南藏族自治州','果洛藏族自治州','玉树藏族自治州','海西蒙古族藏族自治州'];
	   city['宁夏回族自治区']=['银川市','石嘴山市','吴忠市','固原市','中卫市'];
	   city['西藏自治区']=['拉萨市','昌都地区','山南地区','日喀则地区','那曲地区','阿里地区','林芝地区'];
	   city['新疆维吾尔自治区']=['乌鲁木齐市','克拉玛依市','吐鲁番地区','哈密地区','昌吉回族自治州','博尔塔拉蒙古自治州','巴音郭楞蒙古自治州','阿克苏地区','克孜勒苏柯尔克孜自治州','喀什地区','和田地区','伊犁哈萨克自治州','塔城地区','阿勒泰地区','省直辖行政单位'];
	   city['内蒙古自治区']=['呼和浩特市','包头市','乌海市','赤峰市','通辽市','鄂尔多斯市','呼伦贝尔市','巴彦淖尔市','乌兰察布市','兴安盟','锡林郭勒盟','阿拉善盟'];
	   city['香港特别行政区']=['香港特别行政区'];
	   city['澳门特别行政区']=['澳门特别行政区'];
	   city['台湾省']=['台湾省'];   
	   var sheng=document.getElementById("shengFeng").value;
	   var shengBank=document.getElementById("shengFengBank").value;
	   var op1;
	   var op2;
	   document.getElementById("city").options.length=0;
	   document.getElementById("cityBank").options.length=0;
	   for(var i in city[sheng]){
	      op1=new Option(city[sheng][i],city[sheng][i]);
		  document.getElementById("city").options.add(op1);
	    }
	   for(var i in city[shengBank]){
		   op2=new Option(city[shengBank][i],city[shengBank][i]);
		  document.getElementById("cityBank").options.add(op2);
	    }
	   
} 