
package com.jrtcms.web.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.jrtcms.listener.propertys.InitWebsitePropertys;
import com.jrtcms.web.dao.Website_PropertiesDAO;
import com.jrtcms.web.pojo.Website_Properties;

/** 
 * Website_PropertiesDAOImpl
 * @description
 * 网站属性配置实现类
 * @author 
 * 鞠牧 
 * @date：
 * 2011-1-18 下午05:12:48 
 */

public class Website_PropertiesDAOImpl implements Website_PropertiesDAO {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	
	public Long insert(Website_Properties web_pro) {
		return (Long) this.sqlMapClientTemplate.insert("Website_Properties.insert",web_pro);
	}

	public Integer update(Website_Properties web_pro) {
		return this.sqlMapClientTemplate.update("Website_Properties.update",web_pro);
		
	}

	public Website_Properties selectInId(Long id) {
		Website_Properties web_pro = (Website_Properties)this.sqlMapClientTemplate.queryForObject("Website_Properties.selectInId",id);
		return web_pro;
	}

	public List<Website_Properties> select() {
		@SuppressWarnings("unchecked")
		List<Website_Properties> web_proList = this.sqlMapClientTemplate.queryForList("Website_Properties.select");
		return web_proList;
	}

	public Website_Properties selectWebsiteByName_cn(String webname) {

		return  (Website_Properties) this.sqlMapClientTemplate.queryForObject(
				"Website_Properties.selectWebsiteByName_cn", webname);
	}
	
	public Integer selectWebsiteById(String webname,Long websiteID) {
		Map map = InitWebsitePropertys.getWpsListMap();
		map.put("name_cn", webname);
		map.put("id", websiteID);
		return  (Integer) this.sqlMapClientTemplate.queryForObject("Website_Properties.selectWebsiteById",map);
	}
	
	public Website_Properties selectWebsiteByName_zh(String webname) {

		return  (Website_Properties) this.sqlMapClientTemplate.queryForObject(
				"Website_Properties.selectWebsiteByName_zh", webname);
	}
	
	public Integer selectWebsiteByZhId(String webname,Long websiteID) {
		Map map = InitWebsitePropertys.getWpsListMap();
		map.put("name_zh", webname);
		map.put("id", websiteID);
		return  (Integer) this.sqlMapClientTemplate.queryForObject("Website_Properties.selectWebsiteByZhId",map);
	}
}
