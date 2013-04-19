function ajaxCash(){
	
}

function checkMoney()// 验证金额
	{
		var money = document.getElementById("withdrawel_money").value;
		var Valid_amount = document.getElementById("Valid_amount").value;
		var moneyPattern = /^([1-9]{1}[0-9]*)$/;
		var mno = document.getElementById("mno");
	
		if(money==null || money == "")
		{
			mno.innerHTML="请输入提现金额";
			mno.style.color="#FF0000";
			return false;
		}
		if(! moneyPattern.test(money))
		{
			mno.innerHTML="金额必须是大于1的数字!";
			mno.style.color="#FF0000";
			return false;
		}
		
		if(parseInt(money)>parseInt(Valid_amount)){
			mno.innerHTML=decodeURI(EncodeUtf8("提现金额大于可提现金额！"));
			document.getElementById("withdrawel_money").value="";
			mno.style.color="#FF0000";
			return false;
		}
		mno.innerHTML = "OK";
		mno.style.color="#00CC66";
		return true;
	}
	function checkBankName()//验证开户行名称
	{
		var bankName=document.getElementById("bankName").value;
		var bankNo=document.getElementById("bankNo");
		if(bankName==null||bankName=="")
		{
			bankNo.innerHTML="开户行名称必须输入";
			bankNo.style.color="#FF0000";
			return false;
	    }
		bankNo.innerHTML="OK";
		bankNo.style.color="#00CC66";
		return true;
	}
	function checkBankNO()// 验证银行账号
	{
		var bankNo = document.getElementById("bank_number").value;
		var bankNoPattern=/^([0-9]{16,21})/;
		var bno = document.getElementById("bno");
		if(bankNo==null || bankNo=="")
		{
			bno.innerHTML="请您输入银行卡账号";
			bno.style.color="#FF0000";
			return false;
		}
		if(! bankNoPattern.test(bankNo))
		{
			bno.innerHTML="请你输入正确的银行账号";
			bno.style.color="#FF0000";
			return false;
		}
		bno.innerHTML = "OK";
		bno.style.color="#00CC66";
		return true;
	}
	function checkUserNo()// 验证身份证号码
	{	
		var userNo = document.getElementById("ID_number").value;
		var uno = document.getElementById("uno");
		if(userNo==null || userNo=="" )
		{
			uno.innerHTML = "身份证号码必须输入!";
			uno.style.color="#FF0000";
			return false;
		}
		var userNoPattern1 = /^[0-9]{15}$/;
		var userNoPattern2 = /^[0-9]{17}[0-9]{1}|x{1}|X{1}$/;
		var isOk1 = userNoPattern1.test(userNo);
		var isOk2 = userNoPattern2.test(userNo);
		if(!isOk1 && !isOk2)
		{
			uno.innerHTML = "身份证号格式错误!!";
			uno.style.color="#FF0000";
			return false;
		}
		uno.innerHTML = "OK";
		uno.style.color="#00CC66";
		return true;
	}
	function checkName_real()
	{
	    var nameReal = document.getElementById("real_name").value;
		var uname = document.getElementById("realName");
		
		if(nameReal==null || nameReal=="" )
		{
			uname.innerHTML = "真实姓名必须输入";
			uname.style.color="#FF0000";
			//alert(uname);
			return false;
		}
		if(nameReal!=null && nameReal!="")
		{
			if(nameReal.length>10)
			{
				nameReal.innerHTML = "用户名不能超过10个字符";
				uname.style.color="#FF0000";
				return false;
			}
		}
		uname.innerHTML="OK"; 
		uname.style.color="#00CC66";
		return true;
	}
	//提交验证
	function checkAll()
	{
		return  checkMoney() && checkBankNO()&& checkName_real() && checkBankName();
	}
	
	
	function fun()
	 {
	    var city=new Array();
	    city['选择开户账号的省份--']=['选择开户账号的城市--'];
	    city['北京']=['东城区','丰台区','大兴区','宣武区','崇文区','平谷区','怀柔区','房山区','昌平区','朝阳区','海淀区','石景山区','西城区','通州区','门头沟区','顺义区'];
	    city['上海']=['南汇区','卢湾区','嘉定区','奉贤区','宝山区','徐汇区','普陀区','杨浦区','松江区','浦东新区','虹口区','金山区','长宁区','闵行区','闸北区','青浦区','静安区','黄浦区'];
	    city['重庆']=['万州区','万盛区','九龙坡区','北碚区','南岸区','南川区','双桥区','合川区','大渡口区','巴南区','永川区','江北区','江津区','沙坪坝区','涪陵区','渝中区','渝北区','长寿区','黔江区'];
	    city['天津']=['东丽区','北城区','南开区','和平区','塘沽区','大港区','宝坻区','武清区','汉沽区','河东区','河北区','河西区','津南区','虹桥区','西青区'];
	    city['黑龙江']=['七台河市','伊春市','佳木斯市','双鸭山市','哈尔滨市','大兴安岭地区','大庆市','牡丹江市','绥化市','鸡西市','鹤岗市','黑河市','齐齐哈尔市'];
	    city['云南']=['临沧市','丽江市','保山市','大理白族自治州','德宏傣族景颇族自治州','怒江傈僳族自治州','文山壮族苗族自治州','昆明市','昭通市','普洱市','曲靖市','楚雄傣族自治州','','玉溪市','红河哈尼族傣族自治州','西双版纳傣族自治州','迪庆藏族自治州'];
	    city['吉林']=['吉林市','四平市','延边朝鲜族自治州','松原市','白城市','白山市','辽源市','通化市','长春市'];
	    city['安徽']=['毫州市','六安市','合肥市','安庆市','宣城市','宿州市','巢湖市','池州市','淮北市','淮南市','滁州市','芜湖市','蚌埠市','铜陵市','阜阳市','马鞍山市','黄山市'];
	    city['山东']=['东营市','临沂市','威海市','德州市','日照市','枣庄市','泰安市','济南市','济宁市','淄博市','滨州市','潍坊市','烟台市','聊城市','莱芜市','菏泽市','青岛市'];
	    city['山西']=['临汾市','吕梁市','大同市','太原市','忻州市','晋中市','晋城市','朔州市','运城市','长治市','阳泉市'];
	    city['广东']=['东莞市','云浮市','中山市','佛山市','广州市','惠州市','揭阳市','梅州市','汕头市','汕尾市','江门市','河源市','深圳市','清远市','湛江市','潮州市','珠海市','肇庆市','茂名市','阳江市','韶关市'];
	    city['广西壮族自治区']=['北海市','南宁市','崇左市','来宾市','柳州市','桂林市','梧州市','河池市','玉林市','百色市','贵港市','贺州市','钦州市','防城港市'];
	    city['江苏']=['南京市','南通市','宿迁市','常州市','扬州市','徐州市','无锡市','泰州市','淮安市','盐城市','苏州市','连云港市','镇江市'];
	    city['江西']=['上饶市','九江市','南昌市','吉安市','宜春市','抚州市','新余市','景德镇市','萍乡市','赣州市','鹰潭市'];
	    city['河北']=['保定市','廊坊市','唐山市','张家口市','承德市','沧州市','石家庄市','秦皇岛市','衡水市','邢台市','邯郸市'];
	    city['河南']=['三门峡市','信阳市','南阳市','周口市','商丘市','安阳市','平顶山市','开封市','新乡市','洛阳市','漯河市','濮阳市','焦作市','许昌市','郑州市','驻马店市','鹤壁市'];
	    city['浙江']=['丽水市','台州市','嘉兴市','宁波市','杭州市','温州市','湖州市','绍兴市','舟山市','衢州市','金华市'];
	    city['海南']=['三亚市','海口市','省直辖及县级行政单位'];
	    city['湖北']=['武汉市','黄石市','十堰市','宜昌市','襄樊市','鄂州市','荆门市','黄冈市','咸宁市','随州市','恩施土家族苗族自治州','省直辖行政单位','孝感市','荆州市'];
	    city['湖南']=['长沙市','株洲市','湘潭市','衡阳市','邵阳市','岳阳市','常德市','张家界市','益阳市','郴州市','永州市','怀化市','娄底市','湘西土家族苗族自治州'];
	    city['甘肃']=['兰州市','嘉峪关市','金昌市','白银市','天水市','武威市','张掖市','平凉市','酒泉市','庆阳市','定西市','陇南市','临夏回族自治州','甘南藏族自治州','','','',''];
	    city['福建']=['福州市','厦门市','莆田市','三明市','泉州市','漳州市','南平市','龙岩市','宁德市'];
	    city['四川']=['成都市','自贡市','攀枝花市','泸州市','德阳市','绵阳市','广元市','遂宁市','内江市','乐山市','南充市','眉山市','宜宾市','广安市','达州市','雅安市','巴中市','资阳市','阿坝藏族羌族自治州','连山傣族自治州','甘孜藏族自治州'];
	    city['贵州']=['贵阳市','六盘水市','遵义市','安顺市','铜仁地区','黔西南布依族苗族自治州','毕节地区','黔东南苗族侗族自治州','黔南布依族苗族自治州'];
	    city['辽宁']=['沈阳市','大连市','鞍山市','抚顺市','本溪市','丹东市','锦州市','营口市','阜新市','辽阳市','盘锦市','铁岭市','朝阳市','葫芦岛市'];
	    city['陕西']=['西安市','铜川市','宝鸡市','咸阳市','渭南市','延安市','汉中市','榆林市','安康市','商洛市'];
	    city['青海']=['西宁市','海东地区','海北藏族自治州','黄南藏族自治州','海南藏族自治州','果洛藏族自治州','玉树藏族自治州','海西蒙古族藏族自治州'];
	    city['宁夏回族自治区']=['银川市','石嘴山市','吴忠市','固原市','中卫市'];
	    city['西藏自治区']=['拉萨市','昌都地区','山南地区','日喀则地区','那曲地区','阿里地区','林芝地区'];
	    city['新疆维吾尔自治区']=['乌鲁木齐市','克拉玛依市','吐鲁番地区','哈密地区','昌吉回族自治州','博尔塔拉蒙古自治州','巴音郭楞蒙古自治州','阿克苏地区','克孜勒苏柯尔克孜自治州','喀什地区','和田地区','伊犁哈萨克自治州','塔城地区','阿勒泰地区','省直辖行政单位'];
	    city['内蒙古自治区']=['呼和浩特市','包头市','乌海市','赤峰市','通辽市','鄂尔多斯市','呼伦贝尔市','巴彦淖尔市','乌兰察布市','兴安盟','锡林郭勒盟','阿拉善盟'];
	    city['香港特别行政区']=['香港特别行政区'];
	    city['澳门特别行政区']=['澳门特别行政区'];
	    city['台湾']=['台湾'];   
	   var sheng=document.getElementById("shengFeng").value;
	   var op1;
	   document.getElementById("city").options.length=0;
	   for(var i in city[sheng])
	   {
	      op1=new Option(city[sheng][i],city[sheng][i]);
		  document.getElementById("city").options.add(op1);
	    }
	 
	   
	 } 