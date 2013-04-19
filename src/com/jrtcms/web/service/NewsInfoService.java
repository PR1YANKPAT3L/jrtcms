package com.jrtcms.web.service;

import java.util.List;

import com.jrtcms.web.model.NewsInfoMD;
import com.jrtcms.web.pojo.NewsInfo;
import com.jrtcms.web.util.Page;
import com.jrtcms.web.util.Pager;

/**
 * @classname: NewsInfoService
 * @description 新闻操作Service
 * @author 蓝生
 * @date： 2011-1-14 上午10:42:20
 */

public interface NewsInfoService {
	/**
	 * @description 添加新闻接口
	 * @param record
	 *            新闻对象
	 */
	public String add(NewsInfo record);

	/**
	 * 更新新闻
	 * 
	 * @param params
	 *            传参
	 * @return 数据库受影响行数大于0 则成功
	 */
	public String editNewsInfo(NewsInfo newsInfo);

	/**
	 * 更新新闻前
	 * 
	 * @param params
	 *            传参
	 * @return 返回新闻详情
	 */
	public NewsInfo queryNewsInfoById(long id);

	/**
	 * @description 查询新闻
	 * @param newsInfoMD
	 *            新闻分页模板
	 * @return 返回所有分类
	 */
	List<NewsInfoMD> queryNewsInfo(NewsInfoMD newsInfoMD);

	/**
	 * 查询出所有新闻进行分页
	 * 
	 * @param pager
	 * @return
	 */
	public List queryAllNewsInfo(NewsInfo newsInfo, Pager pager);

	/**
	 * 查询出所有新闻条数
	 * 
	 * @param newsInfoMD
	 * @return
	 */
	public int queryAllNewsInfoCount(NewsInfoMD newsInfoMD);

	/**
	 * @description 分页查询新闻信息
	 * @param rowCount
	 *            新闻信息的总条数
	 * @param size
	 *            每页显示的条数
	 * @param str_num
	 *            页号
	 * @return 根据条件返回当分页的信息
	 */
	public Page queryNewsInfoOnpage(int rowCount, NewsInfoMD newsInfoMD);

	/**
	 * @description 查询单个新闻信息
	 * @param id
	 * @return 单个新闻对象
	 */
	public NewsInfo queryObjcet(Long id);

	/**
	 *  @description 查询所有新闻信息
	 *  @param wed_site
	 * @return  新闻信息集合
	*/
	public List<NewsInfo> queryList();
}
