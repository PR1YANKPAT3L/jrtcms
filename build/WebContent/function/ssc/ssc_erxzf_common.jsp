<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<div class="zhixuan_tishi">
	<div class="zhx_tihi">玩法提示：所选十位、个位与开奖号码全部一致即中奖，奖金100元。（每一位至少选择1个号码）<img src="/images/buy_wen.gif"></div>
</div>
<div class="blueselect">
	<div class="blueselect_left">
	  <div class="zhixuan_btn">十　位</div>
		<div class="zhixuan_btn">个　位</div>
	</div>
	<div class="shishicai_mid">
	  <div class="zhixuan_list">
		 <ul>
		  	<li class="ball_num" id="tdrxzf_2_0_0" onClick="SelectBall_rxzf(this);">0</li>
            <li class="ball_num" id="tdrxzf_2_0_1" onClick="SelectBall_rxzf(this);">1</li>
            <li class="ball_num" id="tdrxzf_2_0_2" onClick="SelectBall_rxzf(this);">2</li>
            <li class="ball_num" id="tdrxzf_2_0_3" onClick="SelectBall_rxzf(this);">3</li>
            <li class="ball_num" id="tdrxzf_2_0_4" onClick="SelectBall_rxzf(this);">4</li>
            <li class="ball_num" id="tdrxzf_2_0_5" onClick="SelectBall_rxzf(this);">5</li>
            <li class="ball_num" id="tdrxzf_2_0_6" onClick="SelectBall_rxzf(this);">6</li>
            <li class="ball_num" id="tdrxzf_2_0_7" onClick="SelectBall_rxzf(this);">7</li>
            <li class="ball_num" id="tdrxzf_2_0_8" onClick="SelectBall_rxzf(this);">8</li>
            <li class="ball_num" id="tdrxzf_2_0_9" onClick="SelectBall_rxzf(this);">9</li>
            <li id="tdrxzf_2_0_Q" class="filtBall" onClick="QuickSelect_rxzf(this);">全</li>
            <li id="tdrxzf_2_0_D" class="filtBall" onClick="QuickSelect_rxzf(this);">大</li>
            <li id="tdrxzf_2_0_X" class="filtBall" onClick="QuickSelect_rxzf(this);">小</li>
            <li id="tdrxzf_2_0_J" class="filtBall" onClick="QuickSelect_rxzf(this);">奇</li>
            <li id="tdrxzf_2_0_O" class="filtBall" onClick="QuickSelect_rxzf(this);">偶</li>
            <li id="tdrxzf_2_0_C" class="filtBall" onClick="QuickSelect_rxzf(this);">清</li>
          </ul>
        </div>
        <div class="zhixuan_list">
          <ul>
		  	<li class="ball_num" id="tdrxzf_2_1_0" onClick="SelectBall_rxzf(this);">0</li>
            <li class="ball_num" id="tdrxzf_2_1_1" onClick="SelectBall_rxzf(this);">1</li>
            <li class="ball_num" id="tdrxzf_2_1_2" onClick="SelectBall_rxzf(this);">2</li>
            <li class="ball_num" id="tdrxzf_2_1_3" onClick="SelectBall_rxzf(this);">3</li>
            <li class="ball_num" id="tdrxzf_2_1_4" onClick="SelectBall_rxzf(this);">4</li>
            <li class="ball_num" id="tdrxzf_2_1_5" onClick="SelectBall_rxzf(this);">5</li>
            <li class="ball_num" id="tdrxzf_2_1_6" onClick="SelectBall_rxzf(this);">6</li>
            <li class="ball_num" id="tdrxzf_2_1_7" onClick="SelectBall_rxzf(this);">7</li>
            <li class="ball_num" id="tdrxzf_2_1_8" onClick="SelectBall_rxzf(this);">8</li>
            <li class="ball_num" id="tdrxzf_2_1_9" onClick="SelectBall_rxzf(this);">9</li>
            <li id="tdrxzf_2_1_Q" class="filtBall" onClick="QuickSelect_rxzf(this);">全</li>
            <li id="tdrxzf_2_1_D" class="filtBall" onClick="QuickSelect_rxzf(this);">大</li>
            <li id="tdrxzf_2_1_X" class="filtBall" onClick="QuickSelect_rxzf(this);">小</li>
            <li id="tdrxzf_2_1_J" class="filtBall" onClick="QuickSelect_rxzf(this);">奇</li>
            <li id="tdrxzf_2_1_O" class="filtBall" onClick="QuickSelect_rxzf(this);">偶</li>
            <li id="tdrxzf_2_1_C" class="filtBall" onClick="QuickSelect_rxzf(this);">清 </li>
          </ul>
      </div>
	</div>
  </div>
 <div class="ball_money">
	 <div class="ball_money_select">【您选择了 <span class="red_text" id="rxzf_lab_Selected">0注， 0元。</span>】</div>
	<div class="ball_money_btn"><img src="./images/qkxhq.gif" width="78" height="24" alt="清空选号区" title="清空选号区" onClick="ClearAll('rxzf',0);ClearAll('rxzf',1);"></div>
 </div>
  <div class="add_basket1">
  	<span class="add_btton1"><img onClick="return btn_2_AddClick_rxzf()" src="./images/add_btn.gif" id="btn_2_Add"></span>
  		<span class="add_list">
		<select id="jixuan_Randrxzf">
				  <option value="1" id="btnrxzf_2_Rand1" title="机选1注">1注</option>
				  <option value="2" id="btnrxzf_2_Rand2" title="机选2注">2注</option>
		          <option value="5" id="btnrxzf_2_Rand5" title="机选5注" selected="selected">5注</option>
		          <option value="10" id="btnrxzf_2_Rand10" title="机选10注">10注</option>
		          <option value="20" id="btnrxzf_2_Rand20" title="机选20注">20注</option>
		</select>
	</span>
	<span class="add_jixuan1"><img src="./images/jixuan.gif" width="53" onClick="btn_2_RandManyClick($(&quot;#jixuan_Randrxzf&quot;).val())"></span>
  	</div>

