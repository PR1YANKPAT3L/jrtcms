
package com.jrtcms.web.service;

import java.util.List;
import java.util.Map;

import com.jrtcms.web.model.NewsChannelMD;
import com.jrtcms.web.pojo.NewsChannel;

/** 
 * @classname:
 * NewsChannelService
 * @description
 * 新闻频道的Service
 * @author 
 * 蓝生 
 * @date：
 * 2011-1-13 下午03:42:17 
 */

public interface NewsChannelService {
	
	/**
	 * 返回该站点所有频道的map 以频道英文名为key  频道list为值
	 * @param websiteId
	 * @return 
	 */
	Map<String,NewsChannelMD> queryChannelListForMap(Long websiteId);
	/**
	 * 根据频道中文名获取频道对象
	 * @param id
	 * @return
	 */
	public NewsChannelMD queryObjectForChannelCn(String name,Long web_id);
	/**
	 * 根据频道中文名获取频道对象
	 * @param id
	 * @return
	 */
	public NewsChannelMD queryObjectForChannelId(Long channelId,Long web_id);
	
	/////////////////////后台dao////////////
	/**
	 * @description 添加新闻频道接口
	 * @param record 新闻频道对象
	 */
    public String add(NewsChannelMD record);
    /**
     * @description 添加拷贝新闻频道接口
     * @param record 新闻频道对象
     */
    public Long addByCopy(NewsChannel record);
    /**
	 * @description 获取频道列表
	 * @return 返回所有频道
	 */
	public List<NewsChannelMD> query(Long webSiteID);
	/**
	 * 删除指定频道的
	 * @param id
	 * @return 返回码
	 */
	public String remove(Long id);
	/**
	 * 修改指定的频道
	 * @param newsChannelMD
	 * @return 返回码
	 */
	public String eidt(NewsChannelMD ncmd);
	/**
	 * 根据频道id获取新闻频道对象
	 * @param id
	 * @return
	 */
	public NewsChannelMD queryObject(Long id);
	
	/**
	 * 获取所有频道存放到list
	 * @return
	 */
	public List<NewsChannel> queryList();
	
	
	
}
