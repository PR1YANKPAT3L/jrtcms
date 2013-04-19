<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="bluedanma">
	<div class="bluedanma_left">
		<div class="shx_left">至少选择2个号码</div>
	</div>
	<div class="shx_mid">
	  <div class="shx_mid_ball">
		<ul>
            <li class="shx_num_01" id="shx_r_01" onclick="Animal_SelectBall('r','01');">&nbsp;</li>
            <li class="shx_num_02" id="shx_r_02" onclick="Animal_SelectBall('r','02');">&nbsp;</li>
            <li class="shx_num_03" id="shx_r_03" onclick="Animal_SelectBall('r','03');">&nbsp;</li>
            <li class="shx_num_04" id="shx_r_04" onclick="Animal_SelectBall('r','04');">&nbsp;</li>
			<li class="shx_num_05" id="shx_r_05" onclick="Animal_SelectBall('r','05');">&nbsp;</li>
            <li class="shx_num_06" id="shx_r_06" onclick="Animal_SelectBall('r','06');">&nbsp;</li>
        </ul>
	  </div>
	  <div class="shx_mid_ball">
	   <ul>
	   		<li class="shx_num_07" id="shx_r_07" onclick="Animal_SelectBall('r','07');">&nbsp;</li> 
         	<li class="shx_num_08" id="shx_r_08" onclick="Animal_SelectBall('r','08');">&nbsp;</li>
        	<li class="shx_num_09" id="shx_r_09" onclick="Animal_SelectBall('r','09');">&nbsp;</li>
            <li class="shx_num_10" id="shx_r_10" onclick="Animal_SelectBall('r','10');">&nbsp;</li> 
            <li class="shx_num_11" id="shx_r_11" onclick="Animal_SelectBall('r','11');">&nbsp;</li> 
            <li class="shx_num_12" id="shx_r_12" onclick="Animal_SelectBall('r','12');">&nbsp;</li> 
        </ul>
	  </div>
	</div>
</div>
  <div class="ball_money">【您选择了 <span class="red_text" id="animal_lab_2_Selected">0注,0元 </span>】</div>
  <div class="add_basket1">
  <span class="add_btton1"><img id="animal_btn_2_Add" onclick="return Animal_btn_2_AddClick();"   src="/images/add_btn.gif"/></span>
  	<span class="add_re"><a href="javascript:btn_ClearClick()" id="btn_Clear">重选</a></span>
  	<span class="add_list">
		<select id="jixuan_Rands" >
				  <option value="1" id="btn_2_Rand1"  title="机选1注">1注</option>
		          <option value="5" id="btn_2_Rand5" title="机选5注" selected="selected">5注</option>
		          <option value="10" id="btn_2_Rand10" title="机选10注">10注</option>
		          <option value="20" id="btn_2_Rand20" title="机选20注">20注</option>
		          <option value="30" id="btn_2_Rand30" title="机选30注">30注</option>
		          <option value="50" id="btn_2_Rand50" title="机选50注">50注</option>
		</select>
	</span>
	<span class="add_jixuan1"><img src="/images/jixuan.gif" width="53" onclick='animalRand($("#jixuan_Rands").val())'></span>
  </div>
