
package com.jrtcms.web.dao;

import java.util.List;

import com.jrtcms.web.pojo.Website_Properties;

/** 
 * Website_PropertiesDAO
 * @description
 * 网站属性配置DAO
 * @author 
 * 鞠牧
 * @date：
 * 2011-1-18 下午05:11:36 
 */

public interface Website_PropertiesDAO {

	public Long insert(Website_Properties web_pro);
	public Integer update(Website_Properties web_pro);
	public Website_Properties selectInId(Long id);
	public List<Website_Properties> select();
	/**
	 * @description 根据站点名查询数据库的站点信息
	 * @param name_cn  站点名
	 * @return 站点对象
	 */
	Website_Properties selectWebsiteByName_cn(String webname);
	/**
	 * @description 根据站点id查询的站点信息
	 * @param id  站点id
	 * @return 站点对象
	 */
	public Integer selectWebsiteById(String webname,Long websiteID);
	/**
	 * @description 根据站点英文名查询数据库的站点信息
	 * @param name_zh  站点名
	 * @return 站点对象
	 */
	Website_Properties selectWebsiteByName_zh(String webname);
	/**
	 * @description 根据站点id查询的站点信息
	 * @param id  站点id
	 * @return 站点对象
	 */
	public Integer selectWebsiteByZhId(String webname,Long websiteID);
	
}
