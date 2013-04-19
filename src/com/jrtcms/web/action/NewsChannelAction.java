package com.jrtcms.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jrtcms.listener.propertys.InitWebsitePropertys;
import com.jrtcms.web.model.NewsChannelMD;
import com.jrtcms.web.pojo.NewsChannel;
import com.jrtcms.web.pojo.NewsTemplate;
import com.jrtcms.web.service.NewsChannelService;
import com.jrtcms.web.service.NewsTemplateService;
import com.jrtcms.web.util.BaseAction;
import com.jrtcms.web.util.CnToSpell;
import com.jrtcms.web.util.FinalVar;

/**
 * @classname: NewsChannelAction
 * @description 新闻频道Action
 * @author 蓝生
 * @date： 2011-2-14 上午10:27:17
 */

public class NewsChannelAction extends BaseAction {
	private static final long serialVersionUID = 670072885376247928L;
	private NewsChannelService newsChannelService;
	private NewsTemplateService newsTemplateService;

	public void setNewsTemplateService(NewsTemplateService newsTemplateService) {
		this.newsTemplateService = newsTemplateService;
	}

	public NewsTemplateService getNewsTemplateService() {
		return newsTemplateService;
	}

	private NewsChannelMD newsChannelMD = new NewsChannelMD();
	private NewsChannel newsChannel=new NewsChannel();

	public NewsChannel getNewsChannel() {
		return newsChannel;
	}

	public void setNewsChannel(NewsChannel newsChannel) {
		this.newsChannel = newsChannel;
	}

	public NewsChannelMD getNewsChannelMD() {
		return newsChannelMD;
	}

	public void setNewsChannelMD(NewsChannelMD newsChannelMD) {
		this.newsChannelMD = newsChannelMD;
	}

	public NewsChannelService getNewsChannelService() {
		return newsChannelService;
	}

	public void setNewsChannelService(NewsChannelService newsChannelService) {
		this.newsChannelService = newsChannelService;
	}

	/**
	 * 添加新闻频道
	 * 
	 * @return
	 */
	public String createNewsChannel() {
		// 调用接口方法实现添加
		newsChannelMD.setWebsite_id(Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE")));
		if(newsChannelMD.getName_zh()==null||newsChannelMD.getName_zh().equals("")){
		// 将中文转化成拼音
		String name_zh="";
		try {
			name_zh = CnToSpell.getFullSpell(newsChannelMD.getName_cn());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		newsChannelMD.setName_zh(name_zh);
		}
		newsChannelMD.setName_cn(new String (newsChannelMD.getName_cn().trim()));
		newsChannelMD.setName_zh(new String(newsChannelMD.getName_zh().trim()));
		String insertcode = newsChannelService.add(newsChannelMD);
		if (FinalVar.INSERT_SUCCESS.equals(insertcode)) {
			Map map=new HashMap();
			map= InitWebsitePropertys.getNewschannelListMap();
			map.put(newsChannelMD.getId(), newsChannelMD);
			request.setAttribute("msg", "创建成功！");
			request.setAttribute("state", "1");
		} else if (FinalVar.INSERT_THERE.equals(insertcode)) {
			request.setAttribute("msg", "创建失败！请确认您的输入是否有重复！");
		} else {
			request.setAttribute("msg", "创建失败！");
		}
		return "msg";
	}

	/**
	 * 获取频道列表
	 * 
	 * @return
	 */
	public String getNewsChannelList() {
		// 调用接口方法实现添加
		Long webSiteID = Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE"));
		List<NewsChannelMD> nList = newsChannelService.query(webSiteID);
		NewsTemplate record = new NewsTemplate();
		record.setType(1);
		record.setShowflag(0);
		record.setWebsiteurl_id(webSiteID);
		List<NewsTemplate> lists = newsTemplateService
				.queryNewsTemplateByType(record);
		request.setAttribute("lists", lists);
		request.setAttribute("nList", nList);	
		return "newsChannelList";
	}

	/**
	 * 删除指定频道，频道为假删除
	 * 
	 * @return
	 */
	public String del() {
		// 获取要删除的频道的ID，如果频道ID为null 或者 0 则认为是错误的ID。
		Long id = (request.getParameter("id") == null ? 0 : Long
				.valueOf((String) request.getParameter("id")));
		if (id > 0) {
			String delcode = newsChannelService.remove(id);
			if (FinalVar.UPDATE_SUCCESS.equals(delcode)) {
				Map delMap=new HashMap();
				delMap = InitWebsitePropertys.getNewschannelListMap();
				delMap.remove(id);
				delMap.put(id,newsChannelMD);
				request.setAttribute("msg", "删除频道成功！");
				request.setAttribute("state", "1");
			} else {
				request.setAttribute("msg", "删除频道失败！");
			}
		} else {
			request.setAttribute("msg", "没有找到要删除的频道！");
		}
		return "msg";
	}

	/**
	 * 修改指定的频道
	 * 
	 * @return
	 * @throws IOException
	 */
	public void modify() throws IOException {
		// 获取要编辑的频道的ID，如果频道ID为null 或者 0 则认为是错误的ID。
		newsChannelMD.setName_cn(new String(newsChannelMD.getName_cn()
				.getBytes("ISO-8859-1"), "utf-8"));
		newsChannelMD.setWebsite_id(Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE")));
//		newsChannelMD.setName_cn(new String (newsChannelMD.getName_cn().trim()));
		newsChannelMD.setName_zh(new String(newsChannelMD.getName_zh().trim()));
		String updatecode = newsChannelService.eidt(newsChannelMD);
		PrintWriter out = response.getWriter();
		if (FinalVar.UPDATE_SUCCESS.equals(updatecode)) {
			Map modifyMap=new HashMap();
			modifyMap=InitWebsitePropertys.getNewschannelListMap();
			modifyMap.remove(newsChannelMD.getId());
			modifyMap.put(newsChannelMD.getId(), newsChannelMD);
			out.print("保存成功！");
		} else if (FinalVar.UPDATE_THERE.equals(updatecode)) {
			out.print("保存失败！找不到对应的频道！");
		} else {
			out.print("保存失败！");
		}
	}

}
