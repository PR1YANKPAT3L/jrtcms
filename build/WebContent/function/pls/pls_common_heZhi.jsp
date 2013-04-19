<%@ page contentType="text/html; charset=utf-8"%>
<div class="zhixuan_tishi">
	<div class="zhx_tihi">玩法提示：所选的和值与开奖号码和值相同即中1,000元。<img src="/images/buy_wen.gif" /></div>
</div>
<div class="hezhi_content">
	<div class="hezhi_left">
		<div class="hezhi_btn">选择和值</div>
	</div>
	<div class="hezhi_mid">
		 <div class="hezhi_list">
          		<ul>
				<li class="ball_num" id="td_2_00" onClick="SelectBallZiHe(this);">0</li>
	  			<li class="ball_num" id="td_2_01" onClick="SelectBallZiHe(this);">1</li>
                  <li class="ball_num" id="td_2_02" onClick="SelectBallZiHe(this);">2</li>
                  <li class="ball_num" id="td_2_03" onClick="SelectBallZiHe(this);">3</li>
                  <li class="ball_num" id="td_2_04" onClick="SelectBallZiHe(this);">4</li>
                  <li class="ball_num" id="td_2_05" onClick="SelectBallZiHe(this);">5</li>
                  <li class="ball_num" id="td_2_06" onClick="SelectBallZiHe(this);">6</li>
                  <li class="ball_num" id="td_2_07" onClick="SelectBallZiHe(this);">7</li>
                  <li class="ball_num" id="td_2_08" onClick="SelectBallZiHe(this);">8</li>
                  <li class="ball_num" id="td_2_09" onClick="SelectBallZiHe(this);">9</li>
                  <li class="ball_num" id="td_2_10" onClick="SelectBallZiHe(this);">10</li>
                  <li class="ball_num" id="td_2_11" onClick="SelectBallZiHe(this);">11</li>
                  <li class="ball_num" id="td_2_12" onClick="SelectBallZiHe(this);">12</li>
                  <li class="ball_num" id="td_2_13" onClick="SelectBallZiHe(this);">13</li>
              </ul>
        </div>
         <div class="hezhi_list">
		 		<ul>	
		 		<li class="ball_num" id="td_2_14" onClick="SelectBallZiHe(this);">14</li>
                  <li class="ball_num" id="td_2_15" onClick="SelectBallZiHe(this);">15</li>
                  <li class="ball_num" id="td_2_16" onClick="SelectBallZiHe(this);">16</li>
                  <li class="ball_num" id="td_2_17" onClick="SelectBallZiHe(this);">17</li>
                  <li class="ball_num" id="td_2_18" onClick="SelectBallZiHe(this);">18</li>
                  <li class="ball_num" id="td_2_19" onClick="SelectBallZiHe(this);">19</li>
                  <li class="ball_num" id="td_2_20" onClick="SelectBallZiHe(this);">20</li>
                  <li class="ball_num" id="td_2_21" onClick="SelectBallZiHe(this);">21</li>
                  <li class="ball_num" id="td_2_22" onClick="SelectBallZiHe(this);">22</li>
                  <li class="ball_num" id="td_2_23" onClick="SelectBallZiHe(this);">23</li>
                  <li class="ball_num" id="td_2_24" onClick="SelectBallZiHe(this);">24</li>
                  <li class="ball_num" id="td_2_25" onClick="SelectBallZiHe(this);">25</li>
                  <li class="ball_num" id="td_2_26" onClick="SelectBallZiHe(this);">26</li>
				   <li class="ball_num" id="td_2_27" onClick="SelectBallZiHe(this);">27</li>
              </ul>
        </div>
	</div>
  </div>
  <div class="ball_money">
	 <div class="ball_money_select">【您选择了 <span class="red_text" id="ziHeSelected">0注,共0元</span>】</div>
	 <div class="ball_money_btn"><img src="/images/qkxhq.gif" width="78" height="24" alt="清空选号区" title="清空选号区"  onclick="ClearZiHeSelect();"></div>
 </div>
   <div class="add_basket1">
  	<span class="add_btton1">
  		<img onclick="return plsZhiHe_AddClick()" id="btn_addEvent"   src="/images/add_btn.gif" />
  	</span>
 </div>