<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
<div class="zhixuan_tishi">
	<div class="zhx_tihi">玩法提示：分别从个、十位中任选一种性质组成一注投注号码，与开奖号码的个位、十位一致即中奖、奖金4元。<img src="/images/buy_wen.gif"></div>
</div>
<div class="blueselect">
	<div class="blueselect_left">
	  <div class="dantuo_btn">选择号码</div>
	</div>
	<div class="shishicai_middx">
		<div class="sscshiwei">
			<div class="shiweitop"><font class="dahao">十位</font>（至少选择一个号码）</div>
			<div class="shiweicontent">
				<ul>
				<li class="ball_numssc" id="tddxds_2_0_0" onClick="BallZhiFDXDS(this,0);">大</li>
				<li class="ball_numssc" id="tddxds_2_0_1" onClick="BallZhiFDXDS(this,0);">小</li>
				<li class="ball_numssc" id="tddxds_2_0_2" onClick="BallZhiFDXDS(this,0);">单</li>
				<li class="ball_numssc" id="tddxds_2_0_3" onClick="BallZhiFDXDS(this,0);">双</li>
			  </ul>
		  </div>
		</div>
		<div class="sscgewei">
			<div class="shiweitop"><font class="dahao">个位</font>（至少选择一个号码）</div>
			<div class="shiweicontent">
				<ul>
				<li class="ball_numssc" id="tddxds_2_1_0" onClick="BallZhiFDXDS(this,1);">大</li>
				<li class="ball_numssc" id="tddxds_2_1_1" onClick="BallZhiFDXDS(this,1);">小</li>
				<li class="ball_numssc" id="tddxds_2_1_2" onClick="BallZhiFDXDS(this,1);">单</li>
				<li class="ball_numssc" id="tddxds_2_1_3" onClick="BallZhiFDXDS(this,1);">双</li>
			  </ul>
		  </div></div>
	</div>
  </div>
 <div class="ball_money">
	 <div class="ball_money_select">【您选择了 <span class="red_text" id="dxds_lab_2_Selected">0注， 0元。</span>】</div>
	 <div class="ball_money_btn"><img src="./images/qkxhq.gif" width="78" height="24" alt="清空选号区" title="清空选号区" onClick="ClearAllDXDS(0);ClearAllDXDS(1);"></div>
 </div>
  <div class="add_basket1">
  	<span class="add_btton1"><img onClick="return btn_dxds_AddClickZhiF()" src="./images/add_btn.gif" id="btn_dxds_Add"></span>
  		<span class="add_list">
		<select id="jixuan_Randdxds">
				  <option value="1" id="btndxds_2_Rand1" title="机选1注" selected="selected">1注</option>
		          <option value="2" id="btndxds_2_Rand2" title="机选2注">2注</option>
		</select>
	</span>
	<span class="add_jixuan1"><img src="./images/jixuan.gif" width="53" onClick="btn_2_RandManyClick($(&quot;#jixuan_Randdxds&quot;).val())"></span>
  	</div>