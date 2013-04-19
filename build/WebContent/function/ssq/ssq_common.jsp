<%@ page contentType="text/html; charset=utf-8"%>
<div class="redselect">
	<div class="redselect_left">
		<div class="redselect_left_zi">红球至少选择6个</div>
	</div>
	<div class="redselect_mid">
		<div class="redselect_mid_ball">
				<ul>
					<li class="ball_num" id="td_r_01" onclick="SelectBall('r','01');">01</li>
                    <li class="ball_num" id="td_r_02" onclick="SelectBall('r','02');">02</li>
                    <li class="ball_num" id="td_r_03" onclick="SelectBall('r','03');">03</li>
                    <li class="ball_num" id="td_r_04" onclick="SelectBall('r','04');">04</li>
                    <li class="ball_num" id="td_r_05" onclick="SelectBall('r','05');">05</li>
                    <li class="ball_num" id="td_r_06" onclick="SelectBall('r','06');">06</li>
                    <li class="ball_num" id="td_r_07" onclick="SelectBall('r','07');">07</li>
                    <li class="ball_num" id="td_r_08" onclick="SelectBall('r','08');">08</li>
                    <li class="ball_num" id="td_r_09" onclick="SelectBall('r','09');">09</li>
                    <li class="ball_num" id="td_r_10" onclick="SelectBall('r','10');">10</li>
					<li class="ball_num" id="td_r_11" onclick="SelectBall('r','11');">11</li>
                </ul>
		</div>
		<div class="redselect_mid_ball">
				<ul>
					<li class="ball_num" id="td_r_12" onclick="SelectBall('r','12');">12</li>
                    <li class="ball_num" id="td_r_13" onclick="SelectBall('r','13');">13</li>
                    <li class="ball_num" id="td_r_14" onclick="SelectBall('r','14');">14</li>
                    <li class="ball_num" id="td_r_15" onclick="SelectBall('r','15');">15</li>
                    <li class="ball_num" id="td_r_16" onclick="SelectBall('r','16');">16</li>
                    <li class="ball_num" id="td_r_17" onclick="SelectBall('r','17');">17</li>
                    <li class="ball_num" id="td_r_18" onclick="SelectBall('r','18');">18</li>
                    <li class="ball_num" id="td_r_19" onclick="SelectBall('r','19');">19</li>
                    <li class="ball_num" id="td_r_20" onclick="SelectBall('r','20');">20</li>
                    <li class="ball_num" id="td_r_21" onclick="SelectBall('r','21');">21</li>
                    <li class="ball_num" id="td_r_22" onclick="SelectBall('r','22');">22</li>
                </ul>
		</div>
		<div class="redselect_mid_ball">
				<ul>
					<li class="ball_num" id="td_r_23" onclick="SelectBall('r','23');">23</li>
                    <li class="ball_num" id="td_r_24" onclick="SelectBall('r','24');">24</li>
                    <li class="ball_num" id="td_r_25" onclick="SelectBall('r','25');">25</li>
                    <li class="ball_num" id="td_r_26" onclick="SelectBall('r','26');">26</li>
                    <li class="ball_num" id="td_r_27" onclick="SelectBall('r','27');">27</li>
                    <li class="ball_num" id="td_r_28" onclick="SelectBall('r','28');">28</li>
                    <li class="ball_num" id="td_r_29" onclick="SelectBall('r','29');">29</li>
                    <li class="ball_num" id="td_r_30" onclick="SelectBall('r','30');">30</li>
                    <li class="ball_num" id="td_r_31" onclick="SelectBall('r','31');">31</li>
                    <li class="ball_num" id="td_r_32" onclick="SelectBall('r','32');">32</li>
                    <li class="ball_num" id="td_r_33" onclick="SelectBall('r','33');">33</li>
                </ul>
		</div>
	</div>
	<div class="redselect_right">
		<div class="red_sel">
			<select id="redBallCount"  onChange="controllRedBallCount()" >
		          <option value="6">6</option>
		          <option value="7">7</option>
		          <option value="8">8</option>
		          <option value="9">9</option>
		          <option value="10">10</option>
		          <option value="11">11</option>
		          <option value="12">12</option>
		          <option value="13">13</option>
		          <option value="14">14</option>
		          <option value="15">15</option>
		          <option value="16">16</option>
		     </select>
		 </div>
		<div class="red_select"><a href="javascript:redRand()" title="机选红球">机选红球</a></div>
		<div class="red_reset"><a href="javascript:clearRedSelect()" title="重选">重选</a></div>
		</div>
	</div>
<div class="blueselect">
	<div class="blueselect_left">
		<div  class="blueselect_left_zi">蓝球至少选择1个</div>
	</div>
	<div class="blueselect_mid">
		<div class="blueselect_mid_ball">
				<ul>
					<li class="ball_num" id="td_b_01" onclick="SelectBall('b','01');">01</li>
                    <li class="ball_num" id="td_b_02" onclick="SelectBall('b','02');">02</li>
                    <li class="ball_num" id="td_b_03" onclick="SelectBall('b','03');">03</li>
                    <li class="ball_num" id="td_b_04" onclick="SelectBall('b','04');">04</li>
                    <li class="ball_num" id="td_b_05" onclick="SelectBall('b','05');">05</li>
                    <li class="ball_num" id="td_b_06" onclick="SelectBall('b','06');">06</li>
                    <li class="ball_num" id="td_b_07" onclick="SelectBall('b','07');">07</li>
                    <li class="ball_num" id="td_b_08" onclick="SelectBall('b','08');">08</li>
                </ul>
		</div>
		<div class="blueselect_mid_ball">
				<ul>
					<li class="ball_num" id="td_b_09" onclick="SelectBall('b','09');">09</li>
                    <li class="ball_num" id="td_b_10" onclick="SelectBall('b','10');">10</li>
					<li class="ball_num" id="td_b_11" onclick="SelectBall('b','11');">11</li>
					<li class="ball_num" id="td_b_12" onclick="SelectBall('b','12');">12</li>
                    <li class="ball_num" id="td_b_13" onclick="SelectBall('b','13');">13</li>
                    <li class="ball_num" id="td_b_14" onclick="SelectBall('b','14');">14</li>
                    <li class="ball_num" id="td_b_15" onclick="SelectBall('b','15');">15</li>
                    <li class="ball_num" id="td_b_16" onclick="SelectBall('b','16');">16</li>
                </ul>
	  </div>
	 
	</div>
	<div class="blueselect_right">
		<div class="red_sel"><select id="blueBallCount"  onChange="controllBlueBallCount()">
		          <option value="1">1</option>
			      <option value="2">2</option>
			      <option value="3">3</option>
			      <option value="4">4</option>
			      <option value="5">5</option>
		          <option value="6">6</option>
		          <option value="7">7</option>
		          <option value="8">8</option>
		          <option value="9">9</option>
		          <option value="10">10</option>
		          <option value="11">11</option>
		          <option value="12">12</option>
		          <option value="13">13</option>
		          <option value="14">14</option>
		          <option value="15">15</option>
		          <option value="16">16</option>
		        </select></div>
		<div class="red_select"><a href="javascript:blueRand()" title="机选蓝球">机选蓝球</a></div>
		<div class="red_reset"><a href="javascript:clearBlueSelect()" title="重选">重选</a></div>
	</div>
</div>
<div class="ball_money">【您选择了 <span class="red_text" id="lab_2_Selected">0注，0元</span>】</div>
	<div class="add_basket1">
		<span class="add_btton1"><img src="/images/add_btn.gif" id="btn_2_Add" name="btn_2_Add"  onclick="return btn_2_AddClick();" alt="增加到号码篮"/></span>
	    <span class="add_re"><a href="javascript:btn_ClearClick()" id="btn_Clear">重选</a></span>
	    <span class="add_list">
		<select id="jixuan_Rand" >
				  <option value="1" id="btn_2_Rand1"  title="机选1注">1注</option>
		          <option value="5" id="btn_2_Rand5" title="机选5注" selected="selected">5注</option>
		          <option value="10" id="btn_2_Rand10" title="机选10注">10注</option>
		          <option value="20" id="btn_2_Rand20" title="机选20注">20注</option>
		          <option value="30" id="btn_2_Rand30" title="机选30注">30注</option>
		          <option value="50" id="btn_2_Rand50" title="机选50注">50注</option>
		</select>
	</span>
	<span class="add_jixuan1"><img src="/images/jixuan.gif" width="53" onclick='btn_2_RandManyClick($("#jixuan_Rand").val())'></span>
	    	
	</div>
