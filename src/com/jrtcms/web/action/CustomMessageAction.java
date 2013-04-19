package com.jrtcms.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import com.jrtcms.web.model.CustomMD;
import com.jrtcms.web.pojo.Custom;
import com.jrtcms.web.service.CustomService;
import com.jrtcms.web.util.BaseAction;
import com.jrtcms.web.util.FinalVar;

public class CustomMessageAction extends BaseAction {
	private static final long serialVersionUID = 3666018189768927656L;
	private static ResourceBundle rbint = ResourceBundle.getBundle("jrtcms");
	private Custom custom=new Custom();
	private CustomMD cmd = new CustomMD();
	private CustomService customService;
	public Custom getCustom() {
		return custom;
	}
	public void setCustom(Custom custom) {
		this.custom = custom;
	}
	public CustomMD getCmd() {
		return cmd;
	}
	public void setCmd(CustomMD cmd) {
		this.cmd = cmd;
	}
	public CustomService getCustomService() {
		return customService;
	}
	public void setCustomService(CustomService customService) {
		this.customService = customService;
	}
	
	/**
	 * 修改客户留言状态，识别当前留言是未审批 已审批 或者需要修改
	 * 
	 * @return
	 */
	public String modifyAuditing() {
		String id = request.getParameter("id");
		String auditType = request.getParameter("auditType");
		if (id == null || auditType == null) {
			request.setAttribute("msg", "请选择要操作的留言记录！");
		} else {
			Map auditMap = new HashMap();
			auditMap.put("id", id);
			auditMap.put("auditType", auditType);
			String code = customService.editAuditing(auditMap);
			if (FinalVar.UPDATE_SUCCESS.equals(code)) {
				request.setAttribute("msg", "操作成功！");
				request.setAttribute("state", "1");
			} else {
				request.setAttribute("msg", "操作失败！");
			}
		}
		return "msg";
	}
	
	/**
	 * 删除ID数组中包含的ID指定的留言记录
	 * 
	 * @return
	 */
	public String del() {
		String idsToString = this.arrayToString();
		if (idsToString.equals("")) {
			request.setAttribute("msg", "请选择要删除的客户留言记录！");
		} else {
			String code = customService.remove(idsToString);
			if (FinalVar.DELETE_SUCCESS.equals(code)) {
				request.setAttribute("msg", "删除客户留言成功！");
				request.setAttribute("state", "1");
			} else {
				request.setAttribute("msg", "删除客户留言失败！");
			}
		}
		return "msg";
	}
	
	
	/**
	 * 获取单个留言内容
	 * 
	 * @return
	 */
	public String getById(){
		Long id = Long.valueOf((String) request.getParameter("id"));
		CustomMD cmd = customService.queryCustomByIdForObject(id);
		
		request.setAttribute("customMdInfo", cmd);
		return "customMdInfo";

	}

	
	/**
	 * 获取所有的客户留言列表，以及相关分页数据
	 * 
	 * @return
	 */
	public String getCustomSearchList() {

		//cmd.setCustomId();

		// 计算当前分页条件
		Integer page = 0;
		Object object = request.getParameter("page");
		if (object == null || object.equals("")) {
			page = 1;
		} else {
			page = Integer.valueOf(request.getParameter("page"));
		}
		session.setAttribute("page", page);
		Integer limitCount = Integer.parseInt(rbint.getString("limitCount"));
		cmd.setNowPage((page - 1) * limitCount);
		cmd.setLimitCount(limitCount);
		
		// 获取符合条件的客户留言记录
		List<CustomMD> nmdList = customService.query(cmd);

		// 如果客户留言记录不为空并且记录数量大于一页的记录数量，则进行分页获取
		if (nmdList != null && nmdList.size() > 0) {
			Integer maxLine = customService.queryForIntThisPage(cmd);
			if (maxLine != null && maxLine > limitCount) {
				request.setAttribute("pageHtml",
						getPageToHtml(page, maxLine, limitCount, 3));
			}
			request.setAttribute("nList", nmdList);
		}
		request.setAttribute("SearchWhere", cmd);
		return "list";
	}
	
	
	/**
	 * 返回对应的页数
	 * 
	 * @param page
	 *            当前选择页数
	 * @param maxLine
	 *            当前条件下的
	 * @param limitCount
	 *            每页显示记录数
	 * @param omission
	 *            设置前后间隔几页进行省略
	 * @return
	 */
	private String getPageToHtml(Integer page, Integer maxLine,
			Integer limitCount, Integer omission) {
		String html = "";
		Integer maxPage = (maxLine + limitCount - 1) / limitCount;

		if (page != null && page > 1) {
			html += "<a href='/web/customSearch!getCustomSearchList?page=1'>第一页</a>";
			html += "<a href='/web/customSearch!getCustomSearchList?page=" + (page - 1)
					+ "'>上一页</a>";
		}
		for (int i = 0; i < maxPage; i++) {
			if ((i + 1) == page) {
				html += "[-" + (i + 1) + "-]";
			} else if ((i + omission + 1) == page || (i - omission + 1) == page) {
				html += "<a href='/web/customSearch!getCustomSearchList?page="
						+ (i + 1) + "'>[...]</a>";
			} else if (page != null && (page - omission - 1) < i
					&& (page + omission - 1) > i) {
				html += "<a href='/web/customSearch!getCustomSearchList?page="
						+ (i + 1) + "'>[-" + (i + 1) + "-]</a>";
			}
		}
		if (page == null || page < maxPage) {
			html += "<a href='/web/customSearch!getCustomSearchList?page=" + (page + 1)
					+ "'>下一页</a>";
			html += "<a href='/web/customSearch!getCustomSearchList?page=" + maxPage
					+ "'>尾页</a>";
		}

		html += "共" + maxPage + "页　" + maxLine + "行";
		return html;
	}
	/**
	 * 做了
	 */
	private String arrayToString() {
		String[] ids = request.getParameterValues("ids");
		String idsToString = "";
		if (ids.length > 0) {
			for (int i = 0; i < ids.length; i++) {
				idsToString += ids[i] + ",";
			}
			idsToString = idsToString.substring(0, idsToString.length() - 1);
			return idsToString;
		} else {
			return "";
		}
	}
}
