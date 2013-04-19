package com.jrtcms.web.dao;

import com.jrtcms.web.pojo.Activity;

public interface ActivityDAO {

	/**
	 * 插入一条记录到数据库
	 * @param ac
	 */
	void insert(Activity ac);

	/**
	 * 获取对应条件的记录数
	 * @param ac
	 * @return
	 */
	Integer selectCount(Activity ac);

}
