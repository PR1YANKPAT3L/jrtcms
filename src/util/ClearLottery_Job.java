package util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

import com.jrtcms.web.pojo.CP_Drawalottery;
import com.jrtcms.web.service.CP_DrawalotteryService;
import com.jrtcms.web.util.BaseAction;

/**
 * @classname: ClearLottery_Job
 * @description 自动生成HTML定时器调用的类
 * @author 蓝生
 * @date： 2011-7-18 下午02:10:17
 */

public class ClearLottery_Job extends BaseAction {
	//html访问地址 http\://test.ruyicai.com/
	private static ResourceBundle rbint = ResourceBundle.getBundle("jrtcms");
	private static String templateUrl = rbint.getString("templateUrl");
	//获取html生成路径  D\:/WEB
	private static String htmlUrl = rbint.getString("htmlLocal");
	private static final long serialVersionUID = 6700728852312217928L;
	private CP_DrawalotteryService cp_drawalotteryService = null;

	public CP_DrawalotteryService getCp_drawalotteryService() {
		return cp_drawalotteryService;
	}

	public void setCp_drawalotteryService(
			CP_DrawalotteryService cpDrawalotteryService) {
		cp_drawalotteryService = cpDrawalotteryService;
	}

	public void clearLotteryMember() {
		//获取当前时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String nowDate =sdf.format(new Date());
		//查询当前时间的所有彩种和期号拼接 
		List lotno_bathcode = cp_drawalotteryService.selectAllByDate(nowDate);
		String lotno_bathcodeStr = "";
		if(lotno_bathcode != null && lotno_bathcode.size()>0){
			for (int i = 0; i < lotno_bathcode.size(); i++) {
				lotno_bathcodeStr += ((CP_Drawalottery)lotno_bathcode.get(i)).getLotno()+"|";
			}
		}
		//执行清空 chlw 的map
		Tools.makeHtml(templateUrl+"chlw/function/selectAll!removeLotteryMap?lotno_bathcode="+lotno_bathcodeStr, 
				htmlUrl+"/ruyicai/include/", "removeMap.html");
//		再清空 库表里的数据
		int k = cp_drawalotteryService.removeLottery(nowDate);
		System.out.println("delete success number:"+k+"  delete time:"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		
	}
	
}
