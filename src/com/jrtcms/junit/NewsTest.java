package com.jrtcms.junit;


import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.jrtcms.web.dao.NewsDAO;
import com.jrtcms.web.pojo.News;
import com.jrtcms.web.service.NewsService;


/**
 * 测试账户变动信息操作 
 * @author 阮陈滨
 * (C)版权由北京金软瑞彩科技有限公司
 */
public class NewsTest extends UnitTestTemplate {
	private Logger log = Logger.getLogger(NewsTest.class);
	/**
	 * @return AccountDetail的业务操作对象
	 */
	public NewsService getNewsService() {
		return (NewsService) applicationContext.getBean("newsService");
	}
	/**
	 * @return AccountDetail的数据操作对象
	 */
	public NewsDAO getNewsDAO(){
		return (NewsDAO)applicationContext.getBean("newsDAO");
	}
	public SqlMapClientTemplate getSqlMapClientTemplate(){
		return (SqlMapClientTemplate)applicationContext.getBean("sqlMapClientTemplate");
	}
	public void testQueryAccountDetailForUser(){
		News n = this.getNewsService().queryNewsByIdForObject((long)115);
		System.out.println(n.getId());
		List nList = this.getNewsService().queryNewsInIdForList((long)24, (long)29, null, 10, (long)3);
		nList = this.getNewsService().queryNewsInNameZhForList(null, "ciwawa", 0, 20, (long)3);
		Map nMap = this.getNewsService().queryNewsInCategoryNameZhsByChannelIdForMap((long)24,"'ciwawa','ciwawa1'" , (long)3, 5);
		System.out.println(nMap.toString());
	}
	
}

