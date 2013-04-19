<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="zhixuan_tishi">
	<div class="zhx_tihi">玩法提示：从0~9任意选择2个或以上的号码，奖金50元。（开除对子不算中奖）<img src="/images/buy_wen.gif"></div>
</div>
<div class="Zu6F_content">
	<div class="Zu6F_left">
	  <div class="Zu6F_btn">选择号码</div>
	</div>
	<div class="Zu6F_mid">
	  <div class="Zu6F_list">
		 <ul>
		  	<li class="ball_num" id="tdrxzxf_2_0_0" onClick="SelectBall_rxzxf(this);">0</li>
            <li class="ball_num" id="tdrxzxf_2_0_1" onClick="SelectBall_rxzxf(this);">1</li>
            <li class="ball_num" id="tdrxzxf_2_0_2" onClick="SelectBall_rxzxf(this);">2</li>
            <li class="ball_num" id="tdrxzxf_2_0_3" onClick="SelectBall_rxzxf(this);">3</li>
            <li class="ball_num" id="tdrxzxf_2_0_4" onClick="SelectBall_rxzxf(this);">4</li>
            <li class="ball_num" id="tdrxzxf_2_0_5" onClick="SelectBall_rxzxf(this);">5</li>
            <li class="ball_num" id="tdrxzxf_2_0_6" onClick="SelectBall_rxzxf(this);">6</li>
            <li class="ball_num" id="tdrxzxf_2_0_7" onClick="SelectBall_rxzxf(this);">7</li>
            <li class="ball_num" id="tdrxzxf_2_0_8" onClick="SelectBall_rxzxf(this);">8</li>
            <li class="ball_num" id="tdrxzxf_2_0_9" onClick="SelectBall_rxzxf(this);">9</li>
          </ul>
        </div>
	</div>
  </div>
 <div class="ball_money">
	 <div class="ball_money_select">【您选择了 <span class="red_text" id="rxzxf_lab_Selected">0注， 0元。</span>】</div>
	 <div class="ball_money_btn"><img src="./images/qkxhq.gif" width="78" height="24" alt="清空选号区" title="清空选号区" onClick="ClearAll('rxzxf',0);"></div>
 </div>
  <div class="add_basket1">
  	<span class="add_btton1"><img onClick="return btn_2_AddClick_rxzxf()" src="./images/add_btn.gif" id="btn_rxzh_Add"></span>
  		<span class="add_list">
		<select id="jixuan_Randrxzxf">
				  <option value="1" id="btnrxzxf_2_Rand1" title="机选1注">1注</option>
				  <option value="2" id="btnrxzxf_2_Rand2" title="机选2注">2注</option>
		          <option value="5" id="btnrxzxf_2_Rand5" title="机选5注" selected="selected">5注</option>
		          <option value="10" id="btnrxzxf_2_Rand10" title="机选10注">10注</option>
		          <option value="20" id="btnrxzxf_2_Rand20" title="机选20注">20注</option>
		          <option value="50" id="btnrxzxf_2_Rand50" title="机选50注">50注</option>
		</select>
	</span>
	<span class="add_jixuan1"><img src="./images/jixuan.gif" width="53" onClick="btn_2_RandManyClick($(&quot;#jixuan_Randrxzxf&quot;).val())"></span>
  	</div>
