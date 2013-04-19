package com.jrtcms.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import com.jrtcms.listener.propertys.InitWebsitePropertys;
import com.jrtcms.web.pojo.Website_Properties;
import com.jrtcms.web.service.Website_PropertiesService;
import com.jrtcms.web.util.BaseAction;
import com.jrtcms.web.util.FinalVar;

/**
 * WebProAction
 * 
 * @description 站点管理的Action
 * @author 鞠牧
 * @date： 2011-2-17
 */

public class WebProAction extends BaseAction {
	private static final long serialVersionUID = 670072885376247928L;
	private Website_Properties web_pro = new Website_Properties();
	private Website_PropertiesService web_proService;

	public Website_Properties getWeb_pro() {
		return web_pro;
	}

	public void setWeb_pro(Website_Properties web_pro) {
		this.web_pro = web_pro;
	}

	public Website_PropertiesService getWeb_proService() {
		return web_proService;
	}

	public void setWeb_proService(Website_PropertiesService web_proService) {
		this.web_proService = web_proService;
	}

	/**
	 * 创建一个新的站点
	 * 
	 * @return
	 */
	public String create() {
		Long insertcode = web_proService.add(web_pro);		
		if (insertcode!=null) {
			Map map=InitWebsitePropertys.getWpsListMap();		
			map.put(insertcode, web_pro);
			request.setAttribute("msg", "创建成功！");
			request.setAttribute("state", "1");
		} else {
			request.setAttribute("msg", "创建失败！");
		}
		return "msg";
	}

	/**
	 * 获取站点的详细内容
	 * 
	 * @return
	 */
	public String getWebProperties() {
		// 获取当前所在的站点ID
		Long webSiteID = Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE"));
		Website_Properties webPro = web_proService.quiryInId(webSiteID);

		request.setAttribute("webPro", webPro);
		return "webPro";
	}

	/**
	 * 获取所有站点
	 * 
	 * @return
	 */
	public String getList() {
		List<Website_Properties> webProList = web_proService.quiry();

		request.setAttribute("webProList", webProList);
		return "webPro";
	}

	/**
	 * 修改所在的站点的内容
	 * 
	 * @return
	 * @throws IOException
	 */
	public String modify() throws IOException {
		// 获取当前所在的站点ID
		Long webSiteID = Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE"));
		web_pro.setId(webSiteID);
		String updatecode = web_proService.edit(web_pro);
		if (FinalVar.UPDATE_SUCCESS.equals(updatecode)) {
			request.setAttribute("msg", "保存成功！");
			Map map=InitWebsitePropertys.getWpsListMap();
			map.remove(web_pro.getId());
			map.put(web_pro.getId(), web_pro);
			InitWebsitePropertys.setWpsListMap(map);
			request.getSession().setAttribute("WEBSITE_SESSION", web_pro);
			request.setAttribute("state", "1");
		} else if (FinalVar.UPDATE_THERE.equals(updatecode)) {
			request.setAttribute("msg", "保存失败！站点的英文名称已存在！");
		} else {
			request.setAttribute("msg", "创建失败！");
		}
		return "msg";
	}

	/**
	 * ajax 选择站点时，将后台操作的站点数据更换
	 * 
	 * @throws IOException
	 */
	public void transferWebSite() throws IOException {
		Website_Properties web_por = new Website_Properties();
		Long web_key = Long.valueOf(request.getParameter("web_pro_id"));
		web_por = (Website_Properties) InitWebsitePropertys.getWpsListMap()
				.get(web_key);
		request.getSession()
				.setAttribute("ADMIN_WEBSITE", web_por.getId() + "");
		request.getSession().setAttribute("WEBSITE_SESSION", web_por);
		PrintWriter out = response.getWriter();
		out.print("");
	}
	/**
	 * 添加站点中文名验证
	 * @throws Exception
	 */	
	public void validateWebSiteName() throws Exception {
		String webname = request.getParameter("webname_cn");
		webname= new String(webname.getBytes("ISO-8859-1"), "utf-8");
		Object object = web_proService.queryWebsiteByName_cn(webname);
		PrintWriter out = response.getWriter();
		if (object!=null) {
			out.print("1");
		} else {
			out.print("0");
		}
	}
	/**
	 * 修改站点中文名	
	 * @throws Exception
	 */	
	public void validateWebSiteById() throws Exception {	
		String webname = request.getParameter("webname");
		webname= new String(webname.getBytes("ISO-8859-1"), "utf-8");
		Long websiteID = Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE"));	
		Integer object = web_proService.queryWebsiteById(webname, websiteID);
		PrintWriter out = response.getWriter();
		if (object!=0) {
			out.print("1");
		} else {
			out.print("0");
		}
	}
	/**
	 * 添加站点英文名验证
	 * @throws Exception
	 */
	public void validateWebSiteName_zh() throws Exception {
		String webname = request.getParameter("webname_zh");
		Object object = web_proService.queryWebsiteByName_zh(webname);
		PrintWriter out = response.getWriter();
		if (object!=null) {
			out.print("1");
		} else {
			out.print("0");
		}
	}
	/**
	 * 修改站点英文名
	 * @throws Exception
	 */
	public void validateWebSiteByZhId() throws Exception {	
		String webname = request.getParameter("name_zh");
		Long websiteID = Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE"));	
		Integer object = web_proService.queryWebsiteByZhId(webname, websiteID);
		PrintWriter out = response.getWriter();
		if (object!=0) {
			out.print("1");
		} else {
			out.print("0");
		}
	}
	
	
}
