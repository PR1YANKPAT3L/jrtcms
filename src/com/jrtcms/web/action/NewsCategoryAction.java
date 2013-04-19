package com.jrtcms.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;

import com.jrtcms.listener.propertys.InitWebsitePropertys;
import com.jrtcms.web.model.NewsCategoryMD;
import com.jrtcms.web.pojo.NewsCategory;
import com.jrtcms.web.pojo.NewsTemplate;
import com.jrtcms.web.service.NewsCategoryService;
import com.jrtcms.web.service.NewsTemplateService;
import com.jrtcms.web.util.BaseAction;
import com.jrtcms.web.util.CnToSpell;
import com.jrtcms.web.util.FinalVar;

/**
 * @classname: NewsCategoryAction
 * @description 新闻分类Action
 * @author 蓝生
 * @date： 2011-1-20 下午04:51:13
 */

public class NewsCategoryAction extends BaseAction {
	private Logger log = Logger.getLogger(NewsCategoryAction.class);
	private static final long serialVersionUID = 6700728852376247928L;
	private NewsCategoryService newsCategoryService;
	private NewsTemplateService newsTemplateService;

	public void setNewsTemplateService(NewsTemplateService newsTemplateService) {
		this.newsTemplateService = newsTemplateService;
	}

	private NewsCategoryMD newsCategoryMD = new NewsCategoryMD();
	private NewsCategory newsCategory = new NewsCategory();

	public NewsCategory getNewsCategory() {
		return newsCategory;
	}

	public void setNewsCategory(NewsCategory newsCategory) {
		this.newsCategory = newsCategory;
	}

	public NewsCategoryMD getNewsCategoryMD() {
		return newsCategoryMD;
	}

	public void setNewsCategoryMD(NewsCategoryMD newsCategoryMD) {
		this.newsCategoryMD = newsCategoryMD;
	}

	public void setNewsCategoryService(NewsCategoryService newscategoryService) {
		this.newsCategoryService = newscategoryService;
	}

	public NewsCategoryService getNewsCategoryService() {
		return newsCategoryService;
	}

	/**
	 * @description 查询分类封装树状数据 ajax调用返回xml数据
	 * @throws IOException
	 */
	public String getCategory() throws IOException {
		Long website_id = Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE"));
		List<NewsCategoryMD> list = newsCategoryService.queryAll(website_id);
		NewsTemplate record = new NewsTemplate();
		record.setType(2);
		record.setShowflag(0);
		record.setWebsiteurl_id(website_id);
		List models = newsTemplateService.queryNewsTemplateByType(record);
		request.setAttribute("models", models);
		request.setAttribute("CategoryList", list);
		Map list_map = zToCategoryMap(list);
		request.setAttribute("CategoryList_z", list_map);
		return "index";
	}

	/**
	 * 将所有分类的子分类存入一个map中，以分类记录的父分类编号为KEY，用于前台树形输出
	 * 
	 * @param list
	 * @return
	 */
	private Map zToCategoryMap(List<NewsCategoryMD> list) {
		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			NewsCategory nc = list.get(i);
			Map map_z = new HashMap();
			for (int j = 0; j < list.size(); j++) {
				NewsCategory nc_z = list.get(j);
				if (nc_z.getPcode().equals(nc.getCode())) {
					map_z.put(nc_z.getCode(), nc_z);
				}
			}
			map.put(nc.getCode(), map_z);
		}
		return map;
	}

	/**
	 * @description 添加新闻分类
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String create() throws UnsupportedEncodingException {
		newsCategoryMD.setShowflag(0);// 默认设置可显示
		newsCategoryMD.setState(0);// 0为正常新闻的状态 1为删除
		newsCategoryMD.setWebsite_id(Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE")));
		// 如果拼音为空则将中文转化成拼音
		if (newsCategoryMD.getName_zh().equals("")
				|| newsCategoryMD.getName_zh() == null) {
			String name_zh = CnToSpell
					.getFullSpell(newsCategoryMD.getName_cn());
			newsCategoryMD.setName_zh(name_zh);
		} else {
			newsCategoryMD.setName_zh(newsCategoryMD.getName_zh().trim());
			newsCategoryMD.setName_cn(newsCategoryMD.getName_cn().trim());
		}
		// 调用接口方法实现添加
		String insertcode = newsCategoryService.add(newsCategoryMD);
		if (insertcode.indexOf(FinalVar.INSERT_SUCCESS+",") > -1 ) {
			Map map = InitWebsitePropertys.getCategooryListMap();
			String code = insertcode.replaceAll(FinalVar.INSERT_SUCCESS+",", "");
			Long codeToLong = 0l;
			if(!code.equals("")){
				codeToLong = new Long(code);
			}
			map.put(codeToLong, newsCategoryMD);
			request.setAttribute("msg", "创建成功！");
			request.setAttribute("state", "1");
		} else if (FinalVar.INSERT_THERE.equals(insertcode)) {
			request.setAttribute("msg", "创建失败！分类的英文名称或者中文名称已存在！");
		} else {
			request.setAttribute("msg", "创建失败！");
		}
		return "msg";

	}

	/**
	 * @description 删除分类 假删除，只是将可显示设为0
	 * @return
	 */
	public String del() {
		newsCategoryService.remove(newsCategory.getCode());
		Map delMap=new HashMap();
		delMap = InitWebsitePropertys.getNewschannelListMap();
		delMap.remove(newsCategory.getCode());
		delMap.put(newsCategory.getCode(),newsCategory);
		request.setAttribute("msg", "删除成功！");
		request.setAttribute("state", "1");
		return "msg";
	}

	/**
	 * 移动分类到别的分类下
	 * 
	 * @return
	 */
	/*
	 * public String move(){ //要移动的编号 String code =
	 * request.getParameter("code")==null?"0":request.getParameter("code");
	 * //移动到的分类编号 String codeTo =
	 * request.getParameter("codeTo")==null?"0":request.getParameter("codeTo");
	 * Map map = new HashMap(); map.put("code", code); map.put("pcode", codeTo);
	 * String deleteCount = newsCategoryService.editNewsCotegory(map); if(
	 * FinalVar.JSON_SUCCESS.equals(deleteCount)){ log.info("新闻分类移动成功"); return
	 * "success"; }else{ log.error("新闻分类移动失败"); return "index"; } }
	 */
	/**
	 * 分类更新
	 * 
	 * @return
	 * @throws IOException
	 */
	public void modify() throws IOException {
		URLDecoder.decode(newsCategoryMD.getName_cn().trim(), "utf-8");
		newsCategoryMD.setName_cn(URLDecoder.decode(newsCategoryMD.getName_cn().trim(), "utf-8"));
		newsCategoryMD.setDescription(URLDecoder.decode(newsCategoryMD.getDescription(), "utf-8"));
		newsCategoryMD.setWebsite_id(Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE")));
		String updatecode = newsCategoryService.edit(newsCategoryMD);
		PrintWriter out = response.getWriter();
		if (FinalVar.UPDATE_SUCCESS.equals(updatecode)) {
			Map map = InitWebsitePropertys.getCategooryListMap();
			map.remove(newsCategory.getPcode());
			map.put(newsCategory.getCode(), newsCategory);
			out.print("保存成功！");
		} else if (FinalVar.UPDATE_THERE.equals(updatecode)) {
			out.print("保存失败！没有找到对应频道！");
		} else {
			out.print("保存失败！");
		}
	}

	/**
	 * 获取父分类下子类集合
	 * 
	 * @return
	 */
	public String getCategoryByPcode() {
//		Map map = InitWebsitePropertys.getCategooryListMap();
		String pcode = request.getParameter("pcode") == null ? "-1" : request
				.getParameter("pcode");
		Long website_id = Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE"));
		//map.put(newsCategory.getPcode(), newsCategory);
		newsCategory.setPcode(pcode);
		newsCategory.setWebsite_id(website_id);
		newsCategory.setState(0);// 获取状态为0的分类，当状态为0时标识此分类是正常的，1为已删除
		List<NewsCategoryMD> list = newsCategoryService
				.queryCategoryByPcode(newsCategory);
		// test
		String json = JSONArray.fromObject(list).toString();
		out.print(json);
		return null;
	}

}
