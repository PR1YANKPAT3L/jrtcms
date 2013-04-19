package com.jrtcms.web.model;

import com.jrtcms.web.pojo.PhraseLibrary;
import com.jrtcms.web.util.FinalVar;

/**
 * @classname: NewsInfoMD
 * @description 新闻分页模板
 * @author 蓝生
 * @date： 2011-2-16 下午04:53:05
 */

public class PhraseLibraryMD extends PhraseLibrary {
	
	/**
	 * 当前页数
	 */
	private Integer page = 1;
	/**
	 * 当前起始记录行
	 */
	protected Integer nowPage;
	/**
	 * 每页新闻条数
	 */
	protected Integer limitCount = FinalVar.PAGESIZE;
	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getNowPage() {
		return nowPage;
	}

	public void setNowPage(Integer nowPage) {
		this.nowPage = nowPage;
	}

	public Integer getLimitCount() {
		return limitCount;
	}

	public void setLimitCount(Integer limitCount) {
		this.limitCount = limitCount;
	}


}
