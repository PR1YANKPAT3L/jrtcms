package com.jrtcms.web.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.jrtcms.web.dao.AdminDAO;
import com.jrtcms.web.pojo.Admin;

/**
 * @classname: AdminDAOImpl
 * @description 系统管理员 操作实现类
 * @author 蓝生
 * @date： 2011-1-18 下午05:10:35
 */

public class AdminDAOImpl implements AdminDAO {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	/**
	 * @description 查询系统用户
	 * @param record
	 * @return 用户列表
	 */
	public Admin selectAdmin(Map record) {
		Admin admin = (Admin) this.sqlMapClientTemplate.queryForObject(	"Admin.selectAdmin", record);
		return admin;
	}

	@Override
	public Admin selectAdminByName(String name) {

		return (Admin) this.sqlMapClientTemplate.queryForObject(
				"Admin.selectAdminByName", name);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Integer updatePwd(String changepwd, Long id) {
		Map map = new HashMap();
		map.put("login_password", changepwd);
		map.put("login_id", id);
		return this.sqlMapClientTemplate.update("Admin.updatePwd", map);
	}

	public void insertAdmin(Admin user) {

		this.sqlMapClientTemplate.insert("Admin.insertAdmin", user);
	}

	

}
