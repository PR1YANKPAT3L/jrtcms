package com.jrtcms.web.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.jrtcms.listener.propertys.InitWebsitePropertys;
import com.jrtcms.web.pojo.Admin;
import com.jrtcms.web.pojo.Website_Properties;
import com.jrtcms.web.service.AdminService;
import com.jrtcms.web.util.BaseAction;
import com.jrtcms.web.util.FinalVar;

/**
 * @classname: AdminAction
 * @description 系统用户管理
 * @author 蓝生
 * @date： 2011-2-12 上午10:50:32
 */

public class AdminAction extends BaseAction {
	private String pwd;
	private String changpwd;
	private String confpwd;
	private Admin user = new Admin();

	public void setUser(Admin user) {
		this.user = user;
	}

	public Admin getUser() {
		return user;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setChangpwd(String changpwd) {
		this.changpwd = changpwd;
	}

	public void setConfpwd(String confpwd) {
		this.confpwd = confpwd;
	}

	private static final long serialVersionUID = 11242567L;
	private AdminService adminService = null;

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	/**
	 * 管理员登陆功能
	 * 
	 * @return
	 */
	public String login() {
		String login_name = request.getParameter("name");

		String login_password = request.getParameter("password");

		Website_Properties web_por = new Website_Properties();

		Long web_key = Long
				.valueOf(request.getParameter("web_pro_id") == null ? "0"
						: request.getParameter("web_pro_id"));
		int webkey = Integer.parseInt(request.getParameter("web_pro_id") == null ? "0"
						: request.getParameter("web_pro_id"));
		web_por = (Website_Properties) InitWebsitePropertys.getWpsListMap()
				.get(web_key);

		Map map = new HashMap();

		map.put("login_name", login_name);
		map.put("login_password", login_password);

		Admin admin = adminService.selectAdmin(map);

		if (admin != null){
			
			if(admin.getRole_id() == webkey || admin.getRole_id() == -1){
				request.getSession().setAttribute("ADMIN", login_name);
				request.getSession().setAttribute("ADMIN_SESSION", admin);
				request.getSession().setAttribute("ADMIN_WEBSITE",
						web_por.getId() + "");
				request.getSession().setAttribute("WEBSITE_SESSION", web_por);
				return "index";
			}
			else{
				return "login";
			}
		} else {
			return "login";
		}
	}

	/**
	 * 管理员退出功能
	 * 
	 * @return
	 */
	public String logout() {
		request.getSession().invalidate();
		return "login";

	}

	/**
	 * 修改管理员密码
	 * 
	 * @return
	 */
	public String modifyPwd() {

		String name = (String) request.getSession().getAttribute("ADMIN");

		Admin admin = adminService.queryAdminByName(name);
		if (pwd.equals(admin.getLogin_password())) {
			String updatecode = adminService.editPwd(changpwd,
					Long.parseLong(admin.getLogin_id().toString()));
			if (FinalVar.UPDATE_SUCCESS.equals(updatecode)) {
				request.setAttribute("msg", "修改密码成功");
			} else {
				request.setAttribute("msg", "修改密码失败");
			}

		} else {
			request.setAttribute("msg", "原始密码错误,请重新输入");
		}

		return "msg";

	}

	/**
	 * 添加管理员
	 * 
	 * @return
	 */
	public String createAdmin() {
		Admin admin = adminService.queryAdminByName(user.getLogin_name());
		if (admin == null) {
			String insertcode = adminService.addadmin(user);
			if (FinalVar.INSERT_SUCCESS.equals(insertcode)) {
				request.setAttribute("msg", "添加管理员成功");
			} else {
				request.setAttribute("msg", "添加管理员失败");
			}
		} else {
			request.setAttribute("msg", "此管理员已存在");
		}
		return "msg";

	}

	public void validateUserName() throws Exception {
		String username = request.getParameter("username");
		Object object = adminService.queryAdminByName(username);
		PrintWriter out = response.getWriter();
		if (object!=null) {
			out.print("1");
		} else {
			out.print("0");
		}

	}

}

