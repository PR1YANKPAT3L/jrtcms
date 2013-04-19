package com.jrtcms.web.service.impl;

import java.util.List;

import org.apache.log4j.Logger;

import com.jrtcms.web.dao.Website_PropertiesDAO;
import com.jrtcms.web.pojo.Website_Properties;
import com.jrtcms.web.service.Website_PropertiesService;
import com.jrtcms.web.util.FinalVar;

/**
 * Website_PropertiesServiceImpl
 * 
 * @description 网站属性配置 业务实现
 * @author 鞠牧
 * @date： 2011-1-18 下午05:48:45
 */

public class Website_PropertiesServiceImpl implements Website_PropertiesService {
	private Logger log = Logger.getLogger(Website_PropertiesServiceImpl.class);
	private Website_PropertiesDAO web_proDAO;

	public Website_PropertiesDAO getWeb_proDAO() {
		return web_proDAO;
	}

	public void setWeb_proDAO(Website_PropertiesDAO web_proDAO) {
		this.web_proDAO = web_proDAO;
	}

	public Long add(Website_Properties web_pro) {
		 return web_proDAO.insert(web_pro);
			
	}

	public String edit(Website_Properties web_pro) {
		try {
			int num = web_proDAO.update(web_pro);
			System.out.println(num);
			if (num > 0) {
				return FinalVar.UPDATE_SUCCESS;
			} else {
				return FinalVar.UPDATE_FAIL;
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.error("修改站点时出现异常！  " + web_pro.toString());
			return FinalVar.UPDATE_FAIL;
		}
	}

	public Website_Properties quiryInId(Long id) {
		return web_proDAO.selectInId(id);
	}

	public List<Website_Properties> quiry() {
		return web_proDAO.select();
	}

	public Website_Properties queryWebsiteByName_cn(String webname) {

		return this.web_proDAO.selectWebsiteByName_cn(webname);
	}
	
	public Integer queryWebsiteById(String webname,Long websiteID) {

		return this.web_proDAO.selectWebsiteById(webname, websiteID);
	}
	
	public Website_Properties queryWebsiteByName_zh(String webname) {

		return this.web_proDAO.selectWebsiteByName_zh(webname);
	}
	
	public Integer queryWebsiteByZhId(String webname,Long websiteID) {

		return this.web_proDAO.selectWebsiteByZhId(webname, websiteID);
	}
}
