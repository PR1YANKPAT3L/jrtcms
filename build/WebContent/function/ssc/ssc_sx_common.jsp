<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  
	<div class="zhixuan_tishi">
		<div class="zhx_tihi">玩法提示：每行至少选1个号码，奖金1,000元。<img src="/images/buy_wen.gif"></div>
	</div>
	<div class="zhixuan_content">
		<div class="zhixuan_left">
		  <div class="zhixuan_btn">百位</div>
		  <div class="zhixuan_btn">十位</div>
			<div class="zhixuan_btn">个位</div>
		</div>
		<div class="zhixuan_mid">
		  <div class="zhixuan_list">
			 <ul>
			  	<li class="ball_num" id="tdsx_2_0_0" onClick="SelectBallZhiFSX(this);" >0</li>
	            <li class="ball_num" id="tdsx_2_0_1" onClick="SelectBallZhiFSX(this);">1</li>
	            <li class="ball_num" id="tdsx_2_0_2" onClick="SelectBallZhiFSX(this);">2</li>
	            <li class="ball_num" id="tdsx_2_0_3" onClick="SelectBallZhiFSX(this);">3</li>
	            <li class="ball_num" id="tdsx_2_0_4" onClick="SelectBallZhiFSX(this);">4</li>
	            <li class="ball_num" id="tdsx_2_0_5" onClick="SelectBallZhiFSX(this);">5</li>
	            <li class="ball_num" id="tdsx_2_0_6" onClick="SelectBallZhiFSX(this);">6</li>
	            <li class="ball_num" id="tdsx_2_0_7" onClick="SelectBallZhiFSX(this);">7</li>
	            <li class="ball_num" id="tdsx_2_0_8" onClick="SelectBallZhiFSX(this);">8</li>
	            <li class="ball_num" id="tdsx_2_0_9" onClick="SelectBallZhiFSX(this);">9</li>
	            <li id="tdsx_2_0_Q" class="filtBall" onClick="QuickSelectZhiFSX(this);">全</li>
	            <li id="tdsx_2_0_D" class="filtBall" onClick="QuickSelectZhiFSX(this);">大</li>
	            <li id="tdsx_2_0_X" class="filtBall" onClick="QuickSelectZhiFSX(this);">小</li>
	            <li id="tdsx_2_0_J" class="filtBall" onClick="QuickSelectZhiFSX(this);">奇</li>
	            <li id="tdsx_2_0_O" class="filtBall" onClick="QuickSelectZhiFSX(this);">偶</li>
	            <li id="tdsx_2_0_C" class="filtBall" onClick="QuickSelectZhiFSX(this);">清</li>
	          </ul>
	        </div>
	        <div class="zhixuan_list">
	          <ul>
			  	<li class="ball_num" id="tdsx_2_1_0" onClick="SelectBallZhiFSX(this);">0</li>
	            <li class="ball_num" id="tdsx_2_1_1" onClick="SelectBallZhiFSX(this);">1</li>
	            <li class="ball_num" id="tdsx_2_1_2" onClick="SelectBallZhiFSX(this);">2</li>
	            <li class="ball_num" id="tdsx_2_1_3" onClick="SelectBallZhiFSX(this);">3</li>
	            <li class="ball_num" id="tdsx_2_1_4" onClick="SelectBallZhiFSX(this);">4</li>
	            <li class="ball_num" id="tdsx_2_1_5" onClick="SelectBallZhiFSX(this);">5</li>
	            <li class="ball_num" id="tdsx_2_1_6" onClick="SelectBallZhiFSX(this);">6</li>
	            <li class="ball_num" id="tdsx_2_1_7" onClick="SelectBallZhiFSX(this);">7</li>
	            <li class="ball_num" id="tdsx_2_1_8" onClick="SelectBallZhiFSX(this);">8</li>
	            <li class="ball_num" id="tdsx_2_1_9" onClick="SelectBallZhiFSX(this);">9</li>
	            <li id="tdsx_2_1_Q" class="filtBall" onClick="QuickSelectZhiFSX(this);">全</li>
	            <li id="tdsx_2_1_D" class="filtBall" onClick="QuickSelectZhiFSX(this);">大</li>
	            <li id="tdsx_2_1_X" class="filtBall" onClick="QuickSelectZhiFSX(this);">小</li>
	            <li id="tdsx_2_1_J" class="filtBall" onClick="QuickSelectZhiFSX(this);">奇</li>
	            <li id="tdsx_2_1_O" class="filtBall" onClick="QuickSelectZhiFSX(this);">偶</li>
	            <li id="tdsx_2_1_C" class="filtBall" onClick="QuickSelectZhiFSX(this);">清 </li>
	          </ul>
	      </div>
		  <div class="zhixuan_list">
	          <ul>
			  	<li class="ball_num" id="tdsx_2_2_0" onClick="SelectBallZhiFSX(this);">0</li>
	            <li class="ball_num" id="tdsx_2_2_1" onClick="SelectBallZhiFSX(this);">1</li>
	            <li class="ball_num" id="tdsx_2_2_2" onClick="SelectBallZhiFSX(this);">2</li>
	            <li class="ball_num" id="tdsx_2_2_3" onClick="SelectBallZhiFSX(this);">3</li>
	            <li class="ball_num" id="tdsx_2_2_4" onClick="SelectBallZhiFSX(this);">4</li>
	            <li class="ball_num" id="tdsx_2_2_5" onClick="SelectBallZhiFSX(this);">5</li>
	            <li class="ball_num" id="tdsx_2_2_6" onClick="SelectBallZhiFSX(this);">6</li>
	            <li class="ball_num" id="tdsx_2_2_7" onClick="SelectBallZhiFSX(this);">7</li>
	            <li class="ball_num" id="tdsx_2_2_8" onClick="SelectBallZhiFSX(this);">8</li>
	            <li class="ball_num" id="tdsx_2_2_9" onClick="SelectBallZhiFSX(this);">9</li>
	            <li id="tdsx_2_2_Q" class="filtBall" onClick="QuickSelectZhiFSX(this);">全</li>
	            <li id="tdsx_2_2_D" class="filtBall" onClick="QuickSelectZhiFSX(this);">大</li>
	            <li id="tdsx_2_2_X" class="filtBall" onClick="QuickSelectZhiFSX(this);">小</li>
	            <li id="tdsx_2_2_J" class="filtBall" onClick="QuickSelectZhiFSX(this);">奇</li>
	            <li id="tdsx_2_2_O" class="filtBall" onClick="QuickSelectZhiFSX(this);">偶</li>
	            <li id="tdsx_2_2_C" class="filtBall" onClick="QuickSelectZhiFSX(this);">清 </li>
	          </ul>
	      </div>
		</div>
	  </div>
	 <div class="ball_money">
		 <div class="ball_money_select">【您选择了 <span class="red_text" id="sx_lab_2_Selected">0注， 0元。</span>】</div>
		 <div class="ball_money_btn"><img src="./images/qkxhq.gif" width="78" height="24" alt="清空选号区" title="清空选号区" onClick="ClearAllSX(2);ClearAllSX(0);ClearAllSX(1);"></div>
	 </div>
	 <div class="add_basket1">
	  	<span class="add_btton1"><img onClick="return btn_sx_AddClickZhiF()" src="./images/add_btn.gif" id="btn_sx_Add"></span>
	  		<span class="add_list">
			<select id="jixuan_Randsx">
					  <option value="1" id="btnsx_2_Rand1" title="机选1注">1注</option>
					  <option value="2" id="btnsx_2_Rand2" title="机选2注">2注</option>
			          <option value="5" id="btnsx_2_Rand5" title="机选5注" selected="selected">5注</option>
			          <option value="10" id="btnsx_2_Rand10" title="机选10注">10注</option>
			          <option value="20" id="btnsx_2_Rand20" title="机选20注">20注</option>
			          <option value="50" id="btnsx_2_Rand50" title="机选50注">50注</option>
			          <option value="100" id="btnsx_2_Rand100" title="机选100注">100注</option>
			</select>
		</span>
		<span class="add_jixuan1"><img src="./images/jixuan.gif" width="53" onClick="btn_2_RandManyClick($(&quot;#jixuan_Randsx&quot;).val())"></span>
  	</div>

