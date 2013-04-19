<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<div class="zhixuan_tishi">
	<div class="zhx_tihi">玩法提示：从0~9任意选择1个号码为一个投注号码，奖金10元。<img src="/images/buy_wen.gif"></div>
</div>
<div class="Zu6F_content">
	<div class="Zu6F_left">
	  <div class="Zu6F_btn">个位</div>
	</div>
	<div class="Zu6F_mid">
	  <div class="Zu6F_list">
		 <ul>
		  	<li class="ball_num" id="tdyx_2_0_0" onClick="SelectBallZhiFYX(this);">0</li>
            <li class="ball_num" id="tdyx_2_0_1" onClick="SelectBallZhiFYX(this);">1</li>
            <li class="ball_num" id="tdyx_2_0_2" onClick="SelectBallZhiFYX(this);">2</li>
            <li class="ball_num" id="tdyx_2_0_3" onClick="SelectBallZhiFYX(this);">3</li>
            <li class="ball_num" id="tdyx_2_0_4" onClick="SelectBallZhiFYX(this);">4</li>
            <li class="ball_num" id="tdyx_2_0_5" onClick="SelectBallZhiFYX(this);">5</li>
            <li class="ball_num" id="tdyx_2_0_6" onClick="SelectBallZhiFYX(this);">6</li>
            <li class="ball_num" id="tdyx_2_0_7" onClick="SelectBallZhiFYX(this);">7</li>
            <li class="ball_num" id="tdyx_2_0_8" onClick="SelectBallZhiFYX(this);">8</li>
            <li class="ball_num" id="tdyx_2_0_9" onClick="SelectBallZhiFYX(this);">9</li>
          </ul>
        </div>
	</div>
  </div>
 <div class="ball_money">
	 <div class="ball_money_select">【您选择了 <span class="red_text" id="yx_lab_2_Selected">0注， 0元。</span>】</div>
	 <div class="ball_money_btn"><img src="./images/qkxhq.gif" width="78" height="24" alt="清空选号区" title="清空选号区" onClick="ClearAllYX(0);"></div>
 </div>
  <div class="add_basket1">
  	<span class="add_btton1"><img onClick="return btn_yx_AddClickZhiFYX()" src="./images/add_btn.gif" id="btnyx_2_AddYX"></span>
  		<span class="add_list">
		<select id="jixuan_Randyx">
				  <option value="1" id="btnyx_2_Rand1" title="机选1注"  selected="selected">1注</option>
		          <option value="2" id="btnyx_2_Rand2" title="机选2注">2注</option>
		          <option value="5" id="btnyx_2_Rand5" title="机选5注">5注</option>
		</select>
	</span>
	<span class="add_jixuan1"><img src="./images/jixuan.gif" width="53" onClick="btn_2_RandManyClick($(&quot;#jixuan_Randyx&quot;).val())"></span>
  	</div>
