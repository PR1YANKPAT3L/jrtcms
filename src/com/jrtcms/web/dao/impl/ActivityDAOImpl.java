package com.jrtcms.web.dao.impl;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.jrtcms.web.dao.ActivityDAO;
import com.jrtcms.web.pojo.Activity;

public class ActivityDAOImpl implements ActivityDAO{
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	public void insert(Activity ac) {
		this.sqlMapClientTemplate.insert("Activity.insertActivity", ac);
	}

	public Integer selectCount(Activity ac) {
		return (Integer)this.sqlMapClientTemplate.queryForObject("Activity.selectCount", ac);
	}


}
