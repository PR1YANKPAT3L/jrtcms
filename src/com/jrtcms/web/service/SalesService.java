package com.jrtcms.web.service;

import com.jrtcms.web.pojo.Sales;


/**
 * 销量统计
 * @author 鞠牧
 *
 */
public interface SalesService {

	/**
	 * 创建一条购买记录
	 * @param s
	 * @return
	 */
	void add(Sales s);

}
