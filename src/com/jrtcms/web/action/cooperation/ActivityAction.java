package com.jrtcms.web.action.cooperation;


import java.io.IOException;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.jrtcms.web.pojo.Activity;
import com.jrtcms.web.service.ActivityService;
import com.jrtcms.web.util.BaseAction;
import com.jrtcms.web.util.FinalVar;

/**
 * @classname: ActivityAction
 * @description 活动 对外接口Action
 * @author 鞠牧
 * @date： 2011-2-12 上午10:50:32
 */

public class ActivityAction extends BaseAction {
	private static final long serialVersionUID = -5022918587700859095L;
	private ActivityService activityService = null;
	private Logger log = Logger.getLogger(ActivityAction.class);

	public ActivityService getActivityService() {
		return activityService;
	}
	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}
	/**
	 * 创建用户参与活动记录
	 * @throws IOException 
	 */
	public void create() throws IOException{
		String activityJsonObj = request.getParameter("activity");
		JSONObject reObj = new JSONObject();
		try {
			if(activityJsonObj==null||"null".equals(activityJsonObj)){
				reObj.put("errorCode",FinalVar.INTERFACE_ERROR);
			}else{
				Activity ac = (Activity) JSONObject.toBean(JSONObject.fromObject(activityJsonObj),Activity.class);
				activityService.add(ac);
				reObj.put("errorCode", FinalVar.INTERFACE_OK);
			}
			response.getWriter().print(reObj);
			return;
		} catch (IOException e) {
			log.error("activityJsonObj:"+activityJsonObj);
			response.getWriter().print(FinalVar.INTERFACE_ERROR);
			e.printStackTrace();
		}
	}
	/**
	 * 根据用户的userNO查看参与活动记录统计数
	 * @throws IOException 
	 */
	public void getActivityByUserNo() throws IOException{
		String activityJsonObj = request.getParameter("activity");
		JSONObject reObj = new JSONObject();
		try {
			if(activityJsonObj==null||"null".equals(activityJsonObj)){
				reObj.put("errorCode",FinalVar.INTERFACE_ERROR);
			}else{
				Activity ac = (Activity) JSONObject.toBean(JSONObject.fromObject(activityJsonObj),Activity.class);
				reObj.put("value",activityService.queryCount(ac));
				reObj.put("errorCode", FinalVar.INTERFACE_OK);
			}
			response.getWriter().print(reObj);
			return;
		} catch (IOException e) {
			log.error("activityJsonObj:"+activityJsonObj);
			response.getWriter().print(FinalVar.INTERFACE_ERROR);
			e.printStackTrace();
		}
	}

}

