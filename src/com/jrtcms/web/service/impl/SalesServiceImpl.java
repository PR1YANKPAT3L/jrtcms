package com.jrtcms.web.service.impl;

import com.jrtcms.web.dao.SalesDAO;
import com.jrtcms.web.pojo.Sales;
import com.jrtcms.web.service.SalesService;

public class SalesServiceImpl implements SalesService {

	private SalesDAO salesDAO;
	
	
	public SalesDAO getSalesDAO() {
		return salesDAO;
	}

	public void setSalesDAO(SalesDAO salesDAO) {
		this.salesDAO = salesDAO;
	}

	public void add(Sales s) {
		salesDAO.insert(s);
	}



}
