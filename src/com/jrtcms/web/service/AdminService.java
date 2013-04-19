
package com.jrtcms.web.service;

import java.util.Map;

import com.jrtcms.web.pojo.Admin;

/** 
 * @classname:
 * AdminService
 * @description
 * 系统管理员 业务操作接口
 * @author 
 * 蓝生 
 * @date：
 * 2011-1-18 下午05:39:19 
 */

public interface AdminService {
	
	public Admin selectAdmin(Map record);
	
	/**
	 * @description 返回查询的管理员对象
	 * @param name 
	 * @return 管理员对象
	 */
	public Admin queryAdminByName(String name);
	
	/**
	 * @description 根据id修改对应的管理员密码
	 * @param changepwd
	 * @param id
	 * @return 返回码
	 */
	public String editPwd(String changepwd,Long id);

	/**
	 * @description 创建管理员
	 * @param user
	 * @return 返回码
	 */
	public String addadmin(Admin user);

	
}
