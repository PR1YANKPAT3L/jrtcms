
package com.jrtcms.web.service;

import java.util.List;

import com.jrtcms.web.pojo.Website_Properties;


/** 
 * @classname:
 * Website_PropertiesService
 * @description
 * 网站属性配置 业务接口
 * @author 
 * 蓝生 
 * @date：
 * 2011-1-18 下午05:47:59 
 */

public interface Website_PropertiesService {
	
	public Long add(Website_Properties web_pro);
	public String edit(Website_Properties web_pro);
	public Website_Properties quiryInId(Long id);
	public List<Website_Properties> quiry();
	/**
	 * @description 返回查询的站点对象
	 * @param name_cn 
	 * @return 站点对象
	 */
	public Website_Properties queryWebsiteByName_cn(String webname);
	/**
	 * @description 返回查询的站点对象
	 * @param id
	 * @return 站点对象
	 */
	public Integer queryWebsiteById(String webname,Long websiteID);
	/**
	 * @description 返回查询的站点对象
	 * @param name_cn 
	 * @return 站点对象
	 */
	public Website_Properties queryWebsiteByName_zh(String webname);
	/**
	 * @description 返回查询的站点对象
	 * @param id
	 * @return 站点对象
	 */
	public Integer queryWebsiteByZhId(String webname,Long websiteID);
}
