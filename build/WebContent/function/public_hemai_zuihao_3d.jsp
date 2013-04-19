<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
		
			<div class="buy">
              <div class="buy_title">
                <div class="buy_fsh">购买方式</div>
                <div class="buy_fl">
                  <ul>
                    <li>
                      <input name="daiGou" type="radio" value="daigou" checked="checked" id="daiGou" onclick="setGoumaifangshi('代购');daiGou_heMai()" /> 代购</li>
                    <li>
                      <input name="daiGou" type="radio" value="zhuihao" id="zuiHao" onclick="setGoumaifangshi('追号');daiGou_heMai()" />追号</li>
                  </ul>
                </div>
                <div class="buy_self"><span id="gmzh_text">由购买人自行全额购买彩票</span></div>
              </div>
              <div id="zuiHaoDIV" style="display: none;">
                <div class="buy_num">
                  <div class="buy_num_ok1">
                    <div class="buy_num_zi1">期数选择</div>
                  </div>
                  <div class="buy_num_con1">
                    <div class="buy_num_rule">
                     <select name="batchNum" id="betchNum" >
                       <option value="1">1</option>
                     </select>
						<span>最高99期,默认追5期,包括当前期</span>
                      </div>
                  </div>
                </div>
              </div>
              <div class="buy_content1">
                <div class="buy_ok">
                  <div class="buy_zi1">确认购买</div>
                </div>
				<div class="buy_cont">
					  <div id="loginStaticInTouZhu" class="buy_con_list">
						<span class="buy_blue" id="this_username"></span>您尚未登录，请先<span class="buy_blue"><a href="javascript:loginShow();" title="登录">登录</a></span>
				  </div>
				  <div id="loginStaticInMoney" class="buy_con_list">
						<%/*本次投注金额为<span class="buy_red" id="current_money">0</span>元 */%>
						<script>touzhuInitStatic()</script>
					</div>
					<div class="buy_con_list">
						<input name="xieyi" id="xieyi" type="checkbox" value="" checked="checked">
						我已阅读并同意<span class="buy_blue"><a href="/rules/betProtocol.html" title="用户代购协议" target="_blank">《用户代购协议》</a></span></div>
					<div class="buy_con_list" style="margin:0px 0px 0px 10px; line-height:22px;"><input name="xieyi" id="fengxiang" type="checkbox" value="" checked="checked">彩票发行中心对福彩3D进行<span class="buy_blue"><a href="/rules/3DRisk.html" title="投注风险须知议" target="_blank">限号管理</a></span>，我已阅读并同意网站<br />
					<span class="buy_blue"><a href="/rules/3DRisk.html" title="投注风险须知议" target="_blank">《福彩3D投注风险须知》</a></span></div>
				</div>
                <div class="buy_tzh"><img src="/images/ljgcbtn.gif" title="立即购买" alt="立即购买" onclick="openTouzhu()"/></div>
              </div>
            </div>
         
		
  <script type="text/javascript">
  var view = GetQueryString("views");
  var listView = GetQueryString("listView");
	   var url = GetQueryString("url");

  	if(!view ==""&&!url==""){
       luckSumit(view,listView,url);

  }
</script>
