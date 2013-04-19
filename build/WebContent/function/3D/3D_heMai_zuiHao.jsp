<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div class="buy">
<div class="buy_title">
		<div class="buy_fsh">购买方式</div>
		<div class="buy_fl">
			<ul>
			  	<li><input name="daiGou" type="radio" value="" checked="checked"  id="daiGou" onClick="daiGou_heMai(),getBalance()"/>代购</li>
				<!--  <li><input name="daiGou" type="radio" value=""  id="heMai" onclick="daiGou_heMai(),getBalance()"/>合买</li>-->
				<li><input name="daiGou" type="radio" value=""  id="zuiHao" onClick="daiGou_heMai(),getBalance()"/>追号</li>
			</ul>
		</div>
		<div class="buy_self"><span id="gmzh_text">由购买人自行全额购买彩票</span><span><img src="/images/buy_wen.gif"/></span></div>
</div>

<!-- 追号 -->
<div id="zuiHaoDIV" style="display: none;">
  <div class="buy_num">
		<div class="buy_num_ok1">
			<div class="buy_num_zi1">期数选择</div>
		</div>
		<div class="buy_num_con1">
			<div class="buy_num_rule">
			<select name="batchNum" id="betchNum" >
			  <option value="1">1</option>
			</select>
			<span>最高99期,默认追5期,包括当前期</span>
			</div>
		</div>
	</div>
</div>
<!-- 代购 -->
<div class="buy_content1" id="daiGouDIV">
	<div class="buy_ok">
		<div class="buy_zi">确认购买</div>
	</div>
	<div class="buy_con">
		<div id="touzhu_user" class="buy_con_list">
			<span class="buy_blue" id="this_username"></span>
			您尚未登录，请先<a href="javascript:divContent('login_pop');" title="登录" ><span class="buy_blue">登录</span></a>
		</div>
		<div class="buy_con_list">
			本次投注金额为<span class="buy_red" id="current_money">0</span>元，
			购买后您的账户余额为<span class="buy_red" id="final_money">0</span>元
			<script>getBalance()</script>
		</div>
		<div class="buy_con_list">
			<input name="xieyi" id="xieyi" type="checkbox" value="" checked="checked"/>
			我已阅读并同意<a href="/rules/betProtocol.html" title="用户代购协议" target="_blank"><span class="buy_blue">《用户代购协议》</span></a></div>
		<div class="buy_con_list">
			<input name="fengxiang" id="fengxiang" type="checkbox" value="" checked="checked"/>
			彩票发行中心对福彩3D进行限号管理
			，我已阅读并同意网站<a href="/rules/3D_RiskFile.html"><span class="buy_blue">《福彩3D投注风险须知》</span></a>
		</div>	
	</div>
	<div class="buy_tzh"><img src="/images/buy_btn.gif" title="立即投注" alt="立即投注" width="123" height="37"  onclick="touzhu()"/></div>
</div>
	
<!-- 合买 -->
<!-- 
	<div id="heMaiDIV" style="display:none">
	<div class="hemai_set">
		<div class="hm_set">
			<div  class="hm_set_zi">合买设置</div>
		</div>
		<div class="hm_content">
		  <div class="hm_con"><span class="buy_red"> * </span>我要分为：<span class="buy_in"><input name="" type="text" maxlength="10" /></span>份，每份<span class="buy_red">¥1.00</span>元 每份至少1元</div>
			<div class="hm_con">　我要提成
			  <select name="select3"></select>%<img src="/images/buy_wen.gif" /></div>
			<div class="hm_con">　是否公开：<input name="" type="radio" value=""/>完全公开　<input name="" type="radio" value="" />截止后公开　<input name="" type="radio" value="" />仅跟单人可见</div>
		</div>
	</div>
	<div class="sub_content">
		<div class="sub_ok">
			<div class="sub_zi">认购设置</div>
		</div>
		<div class="sub_con">
			<div class="sub_con_list"><span class="buy_blue"><s:property value="#session.users.usersNAME"/></span>，您的账户余额为<span class="buy_red" id="touzhu_money"></span>元【<img src="/images/zhanghuchongzhi.gif" height="8"/>
			<span class="buy_blue">账户充值</span>】</div>
			<div class="sub_con_list"><span class="buy_red"> * </span>我要认购：<span class="buy_in">
			  <input name="" type="text" maxlength="10" /></span>份，<span class="buy_red">¥1.00</span>元（50.00%）</div>
		  <div class="sub_con_list"><input name="" type="checkbox" value="" />我要保底：<span class="buy_in">
		  <input name="" type="text" maxlength="10" /></span>份，<span class="buy_red">¥1.00</span>元（0%）</div>
			<div class="sub_con_list"><input name="" type="checkbox" value=""/>我已阅读并同意《<span class="buy_blue">用户合买代购协议</span>》</div>
		</div>
		<div class="sub_tzh"><img src="/images/buy_btn.gif" width="123" height="37" onclick="touzhu()"/></div>
	</div>
	<div class="selectable">
		<div class="selectable_news">
			<div class="selectable_news_zi">可选信息</div>
		</div>
		<div class="selectable_con">
			<div class="selectable_p"><input name="" type="checkbox" value="" />方案宣传与合买对象</div>
			<div class="selectable_s">帮助您方案宣传与选择合买对象</div>
		</div>
	</div>
  </div>
	 -->
</div>

	
  
  
