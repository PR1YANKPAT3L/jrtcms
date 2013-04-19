package com.jrtcms.web.service.impl;

import java.util.Map;

import org.apache.log4j.Logger;

import com.jrtcms.web.dao.AdminDAO;
import com.jrtcms.web.pojo.Admin;
import com.jrtcms.web.service.AdminService;
import com.jrtcms.web.util.FinalVar;

/**
 * @classname: AdminServiceImpl
 * @description 系统管理员 业务操作实现方法
 * @author 蓝生
 * @date： 2011-1-18 下午05:40:39
 */

public class AdminServiceImpl implements AdminService {
	private Logger log = Logger.getLogger(AdminServiceImpl.class);
	AdminDAO adminDAO = null;

	public AdminDAO getAdminDAO() {
		return adminDAO;
	}

	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	public Admin selectAdmin(Map record) {

		return this.adminDAO.selectAdmin(record);
	}

	@Override
	public Admin queryAdminByName(String name) {

		return this.adminDAO.selectAdminByName(name);
	}

	@Override
	public String editPwd(String changepwd, Long id) {

		try {
			Integer num = this.adminDAO.updatePwd(changepwd, id);
			if (num > 0) {
				log.info("修改密码成功");
				return FinalVar.UPDATE_SUCCESS;
			} else {
				log.info("数据库找不到此记录");
				return FinalVar.UPDATE_THERE;
			}
		} catch (Exception e) {
			log.error("修改密码失败");
			return FinalVar.UPDATE_FAIL;
		}

	}

	@Override
	public String addadmin(Admin user) {
		try {
			this.adminDAO.insertAdmin(user);
			log.info("添加管理员成功");
			return FinalVar.INSERT_SUCCESS;
		} catch (Exception e) {
			log.info("添加失败");
			return FinalVar.INSERT_FAIL;
		}
	}

}
