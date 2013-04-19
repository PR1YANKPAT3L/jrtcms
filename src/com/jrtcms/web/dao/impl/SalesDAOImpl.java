package com.jrtcms.web.dao.impl;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.jrtcms.web.dao.SalesDAO;
import com.jrtcms.web.pojo.Sales;

public class SalesDAOImpl implements SalesDAO{
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	public void insert(Sales s) {
		this.sqlMapClientTemplate.insert("Sales.insertSales", s);
	}



}
