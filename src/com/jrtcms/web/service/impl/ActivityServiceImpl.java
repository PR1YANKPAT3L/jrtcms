package com.jrtcms.web.service.impl;

import com.jrtcms.web.dao.ActivityDAO;
import com.jrtcms.web.pojo.Activity;
import com.jrtcms.web.service.ActivityService;

public class ActivityServiceImpl implements ActivityService {

	private ActivityDAO activityDAO;
	
	
	public ActivityDAO getActivityDAO() {
		return activityDAO;
	}

	public void setActivityDAO(ActivityDAO activityDAO) {
		this.activityDAO = activityDAO;
	}

	public void add(Activity ac) {
		activityDAO.insert(ac);
	}

	public Integer queryCount(Activity ac) {
		return activityDAO.selectCount(ac);
	}


}
