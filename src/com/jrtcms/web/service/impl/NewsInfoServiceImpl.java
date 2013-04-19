package com.jrtcms.web.service.impl;

import java.util.List;

import org.apache.log4j.Logger;

import com.jrtcms.web.dao.NewsInfoDAO;
import com.jrtcms.web.model.NewsInfoMD;
import com.jrtcms.web.pojo.NewsInfo;
import com.jrtcms.web.service.NewsInfoService;
import com.jrtcms.web.util.FinalVar;
import com.jrtcms.web.util.Page;
import com.jrtcms.web.util.Pager;

/**
 * @classname: NewsInfoServiceImpl
 * @description 新闻操作实现
 * @author 蓝生
 * @date： 2011-1-17 上午11:22:42
 */

public class NewsInfoServiceImpl implements NewsInfoService {
	private Logger log = Logger.getLogger(NewsInfoServiceImpl.class);
	NewsInfoDAO newsInfoDAO = null;

	public NewsInfoDAO getNewsInfoDAO() {
		return newsInfoDAO;
	}

	public void setNewsInfoDAO(NewsInfoDAO newsInfoDAO) {
		this.newsInfoDAO = newsInfoDAO;
	}

	/**
	 * @description 添加新闻
	 * @param record
	 *            新闻对象
	 */
	public String add(NewsInfo record) {
		try {
			this.newsInfoDAO.insert(record);
			log.info("添加新闻成功");
			return FinalVar.INSERT_SUCCESS;
		} catch (Exception e) {
			log.error("添加新闻失败");
			return FinalVar.INSERT_FAIL;
		}
	}

	public NewsInfo queryNewsInfoById(long id ) {
		return this.newsInfoDAO.selectNewsInfoById(id);
	}

	public String editNewsInfo(NewsInfo newsInfo) {
		int num = this.newsInfoDAO.updateNewsInfo(newsInfo);
		if (num > 0) {
			return FinalVar.UPDATE_SUCCESS;
		}
		return FinalVar.UPDATE_FAIL;
	}

	public List<NewsInfoMD> queryNewsInfo(NewsInfoMD newsInfoMD) {

		return this.newsInfoDAO.selectNewsInfo(newsInfoMD);
	}

	public List queryAllNewsInfo(NewsInfo newsInfo, Pager pager) {
		return this.newsInfoDAO.selectAllNewsInfo(newsInfo, pager);
	}

	public int queryAllNewsInfoCount(NewsInfoMD newsInfoMD) {
		return this.newsInfoDAO.selectAllNewsInfoCount(newsInfoMD);
	}

	@Override
	public Page queryNewsInfoOnpage(int  rowCont,NewsInfoMD newsInfoMD) {
		Page page = new Page(rowCont, newsInfoMD.getLimitCount(), String.valueOf(newsInfoMD.getNowPage()/newsInfoMD.getLimitCount()+1));
		List<NewsInfoMD> list = this.newsInfoDAO.selectAllNewsOnpage(newsInfoMD);
		page.setResult(list);
		return page;
	}

	@Override
	public NewsInfo queryObjcet(Long id) {
		
		return this.newsInfoDAO.selectObject(id); 
	}

	@Override
	public List<NewsInfo> queryList() {
		
		return this.newsInfoDAO.seclectList();
	}
	
}
