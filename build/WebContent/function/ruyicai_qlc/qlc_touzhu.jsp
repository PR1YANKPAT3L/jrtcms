<%@ page contentType="text/html; charset=utf-8"%>
			<div class="add_cont" style="display: none;"> 
				<select name="list_LotteryNumber" id="list_LotteryNumber" size="10" ></select> 
			</div> 
			<div class="numberbox">
              <ul>
                <li class="numberlan"><span class="numberhao">ewwrewrwe</span><a href="javascript:;" title="删除"><span class="numberdel">删除</span></a></li>
                <li>
                <div class="numberhao">ewwrewrweaaaaaaaaaaaassssssaaaaaaaaaaaaaassssssssaaaaaaaaaaacccccccccaaaaaaaaaaa</div><a href="javascript:;" class="numberdel" title="删除"><span>删除</span></a>                </li>
				  <li>
                  <span class="numberhao">ewwrewrweaaaaaaaaaaaassssssaaaaaaaaaaaaaassssssssaaaaaaaaaaacccccccccaaaaaaaaaaa</span>
                  <a href="javascript:;" title="删除">
                  <span class="numberdel">删除</span>                  </a></li>
                <li><span class="numberhao">ewwrewrwe</span><a href="javascript:;" title="删除"><span class="numberdel">删除</span></a></li>
                <li><span class="numberhao">ewwrewrwe</span><a href="javascript:;" title="删除"><span class="numberdel">删除</span></a></li>
              </ul>
            </div>
            <div class="add_money">
              <div class="tzje">您选择了<span class="red" id="lab_Num">0</span>注，
                <input type="text" id="tb_Multiple" name="tb_Multiple"  value="1" onkeyup="value=value.replace('０','0').replace('１','1').replace('２','2').replace('３', '3').replace('４','4').replace('５','5').replace('６','6').replace('７', '7').replace('８','8').replace('９','9');multipleValidate();updateMultipleTotalMoney();" />
                &nbsp;倍，共 <span class="red" >￥</span><span class="red" id="investField">0.00</span>元 </div>
              <div class="zhixuan_del"><img onclick="return btn_ClearClick()" src="/images/qkhml.gif"  /></div>
            </div>