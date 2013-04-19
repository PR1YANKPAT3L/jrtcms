<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<div class="zhixuan_tishi">
	<div class="zhx_tihi">玩法提示：选择1个和值投注，所有和值与开奖号码后两和值一致即中奖100元。（每一位至少选择1个和值）<img src="/images/buy_wen.gif"></div>
</div>
<div class="blueselect">
	<div class="blueselect_left">
	  <div class="dantuo_btn">选择和值</div>
	</div>
	<div class="shishicai_mid">
	  <div class="zhixuan_list">
		 <ul>
		  	<li class="ball_num" id="tdrxzh_2_00" onClick="SelectBall_rxzh(this);">0</li>
            <li class="ball_num" id="tdrxzh_2_01" onClick="SelectBall_rxzh(this);">1</li>
            <li class="ball_num" id="tdrxzh_2_02" onClick="SelectBall_rxzh(this);">2</li>
            <li class="ball_num" id="tdrxzh_2_03" onClick="SelectBall_rxzh(this);">3</li>
            <li class="ball_num" id="tdrxzh_2_04" onClick="SelectBall_rxzh(this);">4</li>
            <li class="ball_num" id="tdrxzh_2_05" onClick="SelectBall_rxzh(this);">5</li>
            <li class="ball_num" id="tdrxzh_2_06" onClick="SelectBall_rxzh(this);">6</li>
            <li class="ball_num" id="tdrxzh_2_07" onClick="SelectBall_rxzh(this);">7</li>
            <li class="ball_num" id="tdrxzh_2_08" onClick="SelectBall_rxzh(this);">8</li>
            <li class="ball_num" id="tdrxzh_2_09" onClick="SelectBall_rxzh(this);">9</li>
            <li class="ball_num" id="tdrxzh_2_10" onClick="SelectBall_rxzh(this);">10</li>
            <li class="ball_num" id="tdrxzh_2_11" onClick="SelectBall_rxzh(this);">11</li>
            <li class="ball_num" id="tdrxzh_2_12" onClick="SelectBall_rxzh(this);">12</li>
            <li class="ball_num" id="tdrxzh_2_13" onClick="SelectBall_rxzh(this);">13</li>
            <li class="ball_num" id="tdrxzh_2_14" onClick="SelectBall_rxzh(this);">14</li>
            
          </ul>
        </div>
        <div class="zhixuan_list">
          <ul>
		  	<li class="ball_num" id="tdrxzh_2_15" onClick="SelectBall_rxzh(this);">15</li>
		  	<li class="ball_num" id="tdrxzh_2_16" onClick="SelectBall_rxzh(this);">16</li>
            <li class="ball_num" id="tdrxzh_2_17" onClick="SelectBall_rxzh(this);">17</li>
            <li class="ball_num" id="tdrxzh_2_18" onClick="SelectBall_rxzh(this);">18</li>
          </ul>
      </div>
	</div>
  </div>
 <div class="ball_money">
	 <div class="ball_money_select">【您选择了 <span class="red_text" id="rxzh_lab_Selected">0注， 0元。</span>】</div>
	 <div class="ball_money_btn"><img src="./images/qkxhq.gif" width="78" height="24" alt="清空选号区" title="清空选号区" onClick="ClearSelect_rxzh();"></div>
 </div>
  <div class="add_basket1">
  	<span class="add_btton1"><img onClick="return btn_2_AddClick_rxzh()" src="./images/add_btn.gif" id="btn_2_Add_rxzh"></span>
  		<span class="add_list">
		<select id="jixuan_Rand">
				  <option value="1" id="btn_2_Rand1" title="机选1注">1注</option>
				  <option value="2" id="btn_2_Rand2" title="机选2注">2注</option>
		          <option value="5" id="btn_2_Rand5" title="机选5注" selected="selected">5注</option>
		          <option value="10" id="btn_2_Rand10" title="机选10注">10注</option>
		          <option value="20" id="btn_2_Rand20" title="机选20注">20注</option>
		</select>
	</span>
	<span class="add_jixuan1"><img src="./images/jixuan.gif" width="53" onClick="btn_2_RandManyClick($(&quot;#jixuan_Rand&quot;).val())"></span>
  	</div>

