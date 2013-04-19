package com.jrtcms.web.service;

import com.jrtcms.web.pojo.Activity;

public interface ActivityService {

	/**
	 * 创建一条用户参与活动的记录
	 * @param ac
	 * @return
	 */
	void add(Activity ac);
	/**
	 * 根据相应的条件，判断用户是否已经参加过此活动
	 * @param ac
	 * @return
	 */
	Integer queryCount(Activity ac);

}
