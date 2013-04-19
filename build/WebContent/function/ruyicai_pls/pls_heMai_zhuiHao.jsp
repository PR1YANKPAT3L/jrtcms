<%@ page contentType="text/html; charset=utf-8"%>
<div class="buy">
          <div class="buy_title">
            <div class="buy_fsh">购买方式</div>
            <div class="buy_fl">
              <ul>
                <li>
                  <input name="daiGou" type="radio" value="" checked="checked" id="daiGou" onclick="daiGou_heMai(),getBalance()" />
                  代购</li>
                <li>
                  <input name="daiGou" type="radio" value="" id="zuiHao" onclick="daiGou_heMai(),getBalance(),loadSelect()" />
                  追号</li>
              </ul>
            </div>
            <div class="buy_self"><span>由购买人自行全额购买彩票</span></div>
          </div>
          <div id="zuiHaoDIV" style="display: none;">
            <div class="buy_num">
              <div class="buy_num_ok1">
                <div class="buy_num_zi1">期数选择</div>
              </div>
              <div class="buy_num_con1">
                <div class="buy_num_rule">
                  <select name="batchNum" id="betchNum">
                  </select>
                  <span>最高99期,默认追1期,即买当前期</span> </div>
              </div>
            </div>
          </div>
          <div class="buy_content1">
            <div class="buy_ok">
              <div class="buy_zi">确认购买</div>
            </div>
			<div class="buy_cont">
				  <div  class="buy_con_list">
					<span class="buy_blue" id="this_username"></span>您尚未登录，请先<a href="javascript:divContent('login_pop');" title="登录"><span class="buy_blue">登录</span></a>
			  </div>
				<div class="buy_con_list">
					本次投注金额为<span class="buy_red" id="current_money">0</span>元，
					购买后您的账户余额为<span class="buy_red" id="final_money">0</span>元
					<script>getBalance()</script>
				</div>
				<div class="buy_con_list">
					<input name="xieyi" id="xieyi" type="checkbox" value="" checked="checked">
					我已阅读并同意《<a href="#" title="用户代购协议" target="_bank"><span class="buy_blue">用户代购协议</span></a>》</div>
			</div>
            <div class="buy_tzh"><img src="../images/ljgcbtn.gif" title="立即购买" alt="立即购买" /></div>
          </div>
  </div>
  