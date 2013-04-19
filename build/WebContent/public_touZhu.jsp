<%@ page contentType="text/html; charset=utf-8"%>
<div class="basket">
	<div class="add_cont">
	<select name="list_LotteryNumber" id="list_LotteryNumber" size="10" ></select>
	</div>
	<div class="add_btn">
		<ul>
			<li><a href="javascript:btn_2_RandManyClick(1)" id="btn_2_Rand" name="btn_2_Rand" title="机选1注">机选1注</a></li>
			<li><a href="javascript:btn_2_RandManyClick(5)" id="btn_2_Rand5" name="btn_2_Rand5" title="机选5注">机选5注</a></li>
			<li><a href="javascript:btn_2_RandManyClick(10)"  id="btn_2_Rand10" name="btn_2_Rand10" title="机选10注">机选10注</a></li>
		</ul>
	</div>	
	<div class="add_money">
	  <div class="tzbs">
		倍数：<input type="text" id="tb_Multiple" name="tb_Multiple"  value="1" onkeyup="value=value.replace('０','0').replace('１','1').replace('２','2').replace('３', '3').replace('４','4').replace('５','5').replace('６','6').replace('７', '7').replace('８','8').replace('９','9');multipleValidate();updateMultipleTotalMoney();">
	  </div>
		<div class="tzje">注数：<span class="red_text" id="lab_Num">0</span>注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金额：
		<span class="red_text" id="investField">0</span>元
	    </div>
		<div class="add_del" id="btn_ClearSelect"  onClick="return btn_ClearSelectClick()">删除选中</div>
		<div class="zhixuan_del"><img onClick="return btn_ClearClick()" src="/images/qkhml.gif" width="73" height="25" /></div>
	</div>
</div>

<!-- 登录的弹出框 -->
<div id="login_pop" style="display:none;">
	<form action="" method="post" id="userTouzhuLoginForm" name="userTouzhuLoginForm" >
	<div class="pop_header">
		<div class="pop_header_zi">用户登录</div>
		<div class="pop_header_btn"><a href="javascript:divClose();" title="关闭"><img src="/images/guanbi_btn.gif" alt="关闭"  border="0"/></a></div>
	</div>
	<div class="pop_content">
		<div class="pop_con">
			<ul>
				<li>手机号码：<input class="pop_input" name="tuserinfo.MOBILEID" type="text" id="mobilePOP" /><a href="http://users.ruyicai.com/register/register_new.jsp" title="免费注册"><span class="blue">免费注册</span></a></li>
				<li>密　码：<input class="pop_input1" name="tuserinfo.PASSWORD" type="password" id="passwordPOP" /><a href="/rules/findPwd_new.html" title="忘记密码"><span class="blue">忘记密码</span></a></li>
			  	<li>验证码：<input class="pop_input2" id="validatePOP" name="password1" type="text" />
			  	  <img src="/chlw/function/common/image.jsp" id="magPOP"/>
			  	  <a href="javascript:change('magPOP');" title="看不清，换一张"><span class="huise">看不清，换一张</span></a>
			  	</li>
			</ul>
	  </div>
		<div class="pop_btn">
		<input class="denglu" name="Input" type="button"  value="" onclick="tgTouZhuLogin()"/>
		</div>
	</div>
	</form>
</div>

