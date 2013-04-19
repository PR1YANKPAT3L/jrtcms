package com.jrtcms.web.dao;

import java.util.Map;

import com.jrtcms.web.pojo.Admin;

/**
 * @classname: AdminDAO
 * @description 系统管理员 操作接口
 * @author 蓝生
 * @date： 2011-1-18 下午05:08:31
 */

public interface AdminDAO {
	/**
	 * @description 查询系统用户
	 * @param record
	 * @return 用户列表
	 */
	Admin selectAdmin(Map record);

	/**
	 * @description 根据用户名查询数据库的管理员信息
	 * @param name  用户名
	 * @return 管理员对象
	 */
	Admin selectAdminByName(String name);

	/**
	 * @description 根据id修改管理员密码
	 * @param changepwd 修改密码
	 * @return 返回成功更新的条数
	 */
	Integer updatePwd(String changepwd,Long id);
	
	/**
	 * @description 创建管理员
	 * @param admin 创建的管理员对象
	 * @return
	 */
	void insertAdmin(Admin user);

}
