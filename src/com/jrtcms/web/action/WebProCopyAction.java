package com.jrtcms.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.jrtcms.web.model.NewsMD;
import com.jrtcms.web.pojo.News;
import com.jrtcms.web.pojo.NewsCategory;
import com.jrtcms.web.pojo.NewsChannel;
import com.jrtcms.web.service.NewsCategoryService;
import com.jrtcms.web.service.NewsChannelService;
import com.jrtcms.web.service.NewsService;
import com.jrtcms.web.service.Website_PropertiesService;
import com.jrtcms.web.util.BaseAction;
import com.jrtcms.web.util.FinalVar;

/**
 * WebProCopyAction
 * 
 * @description 站点拷贝管理的Action
 * @author 蓝生
 * @date： 2011-3-29
 */

public class WebProCopyAction extends BaseAction {
	private static final long serialVersionUID = 670073285376247928L;
	private Website_PropertiesService web_proService;
	private NewsService newsService;
	private NewsChannelService newsChannelService;
	private NewsCategoryService newsCategoryService;

	public Website_PropertiesService getWeb_proService() {
		return web_proService;
	}

	public void setWeb_proService(Website_PropertiesService web_proService) {
		this.web_proService = web_proService;
	}

	public NewsService getNewsService() {
		return newsService;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	public NewsChannelService getNewsChannelService() {
		return newsChannelService;
	}

	public void setNewsChannelService(NewsChannelService newsChannelService) {
		this.newsChannelService = newsChannelService;
	}

	public NewsCategoryService getNewsCategoryService() {
		return newsCategoryService;
	}

	public void setNewsCategoryService(NewsCategoryService newsCategoryService) {
		this.newsCategoryService = newsCategoryService;
	}

	/**
	 * 整站拷贝
	 * 
	 * @return
	 * @throws IOException 
	 */
	public void copyAllWebsite() throws IOException {
		String msg = "";
		// 获取当前所在的站点ID
		Long webSiteID = Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE"));
		// 获取需要拷贝的站点ID
		Long copyWebstite_Id = request.getParameter("copyWebstite_Id") == null?0l: new Long(request.getParameter("copyWebstite_Id"));
		if(webSiteID.equals(copyWebstite_Id)){
			msg="哥，没必要自己拷贝自己站点的东西，谢了！";
		}
		else{
			//获取需要拷贝的站点的所有分类 保存在 oldCategoryMap里
			Map<Long,NewsCategory> oldCategoryMap = new HashMap<Long, NewsCategory>();
			    List categoryList = newsCategoryService.queryAll(copyWebstite_Id);
			    if(categoryList != null && categoryList.size() >0 ){
			    	for (int i = 0; i < categoryList.size(); i++) {
			    		NewsCategory value = (NewsCategory)categoryList.get(i);
				        System.out.println(value.getWebsite_id());
				       if(value.getWebsite_id().equals(copyWebstite_Id)){
				    	   oldCategoryMap.put(value.getCode(), value);
				       }
					}
			    }
			   System.out.println("oldCategoryMap.size():"+oldCategoryMap.size());     
			  //保存新生成的分类code和它对应原来分类的父分类pcode的关系 保存到新 关系oRmap 
			    Map<Long,Long> oRmap = new HashMap<Long, Long>();
			    Iterator itNewCategory = oldCategoryMap.entrySet().iterator();   
			    int categoryCount = 0;
			    while (itNewCategory.hasNext()) {   
			    	Map.Entry entry = (Map.Entry) itNewCategory.next();   
			    	Long key = (Long)entry.getKey();   
			    	NewsCategory value = (NewsCategory)entry.getValue();
			    	Long oldCode = value.getCode();
			    	value.setCode(null);//code自增增长所以 先设置为null再添加到库里
			    	value.setWebsite_id(webSiteID);//设置站点为当前站点
			    	//存库 
			    	Long insertCode = newsCategoryService.addByCopy(value);
			    	if(insertCode > 0){
			    		categoryCount++;
			    	}
			    	//把关系保存到map里
			    	oRmap.put(oldCode, insertCode);
			    }
			    System.out.println("oRmap.size():"+oRmap.size());  
			    //存库好了，现在把刚存进去的分类读取出来，把父分类编号进行修改，如果父编号为-1 就不修改，否则去oRmap 里找对应的编号做父编号
			    List newsCategoryList = newsCategoryService.queryAll(webSiteID);
			    if(newsCategoryList != null && newsCategoryList.size()>0){
			    	for (int i = 0; i < newsCategoryList.size(); i++) {
						NewsCategory newsCategory = (NewsCategory)newsCategoryList.get(i);
						int pcode = Integer.parseInt(newsCategory.getPcode().toString());
						if(pcode != -1){
							Long pcodeInMap = (Long)oRmap.get(newsCategory.getPcode());
							if(pcodeInMap != null){
								newsCategory.setPcode(pcodeInMap);
								int k = newsCategoryService.editByCopy(newsCategory);
								System.out.println(k);
							}
						}
					}
			    }
			 //保存    
			 //获取需要拷贝的站点的所有频道 保存在 oldchannelMap里    
		    Map<Long,NewsChannel> oldchannelMap = new HashMap<Long, NewsChannel>();
		    List channelList = newsChannelService.query(copyWebstite_Id);
		    if(channelList != null && channelList.size()>0){
		    	for (int i = 0; i < channelList.size(); i++) {
		    		NewsChannel value = (NewsChannel)channelList.get(i);  
			    	if(value.getWebsite_id().equals(copyWebstite_Id)){
			    		oldchannelMap.put(value.getId(), value);
			    	}
		    	}
		    }
		    System.out.println("oldchannelMap.size():"+oldchannelMap.size());
			//频道存库 保存关系
		    
		    Map<Long,Long> oRmapChanel = new HashMap<Long, Long>();
		    Iterator itNewsChannel = oldchannelMap.entrySet().iterator(); 
		    int channelCount = 0;
		    while (itNewsChannel.hasNext()) {   
		    	Map.Entry entry = (Map.Entry) itNewsChannel.next();   
		    	Long key = (Long)entry.getKey();   
		    	NewsChannel value = (NewsChannel)entry.getValue();
		    	Long oldChanelId = value.getId();
		    	value.setId(null);//code自增增长所以 先设置为null再添加到库里
		    	value.setWebsite_id(webSiteID);
		    	//存库 
		    	Long insertCode = newsChannelService.addByCopy(value);
		    	if(insertCode > 0){
		    		channelCount++;
		    	}
		    	oRmapChanel.put(oldChanelId, insertCode);
		    }
		    System.out.println("oRmapChanel.size():"+oRmapChanel.size()); 
		    //拷贝新闻
		    NewsMD nmd = new NewsMD();
		    nmd.setWebsiteId(copyWebstite_Id);
		    nmd.setNowPage(0);
			nmd.setLimitCount(10000);
		    //获取所有新闻
			int num = 0;
		    List newslist = newsService.query(nmd);
		    if(newslist != null && newslist.size() > 0){
		    	
		    	for (int i = 0; i < newslist.size(); i++) {
		    		NewsMD newsMD  = (NewsMD)newslist.get(i);
		    		News news  = new News();
		    		news.setAuditType(newsMD.getAuditType());
		    		news.setAdminId(newsMD.getAdminId());
		    		news.setWebsiteId(webSiteID);
		    		news.setAuthor(newsMD.getAuthor());
		    		news.setCallUrl(newsMD.getCallUrl());
		    		news.setCompile(newsMD.getCompile());
		    		news.setContent(newsMD.getContent());
		    		news.setNumero(newsMD.getNumero());
		    		news.setTitle(newsMD.getTitle());
		    		news.setType(newsMD.getType());
		    		news.setPicName(newsMD.getPicName());
		    		news.setSequence(newsMD.getSequence());
		    		news.setTopNews(newsMD.getTopNews());
		    		news.setUrl(newsMD.getUrl());
		    		
		    		if( newsMD.getCategoryCode() != null){
		    			news.setCategoryCode((Long)oRmap.get(newsMD.getCategoryCode()));
		    		}
		    		if( newsMD.getChannelId() != null){
		    			news.setChannelId((Long)oRmapChanel.get(newsMD.getChannelId()));
		    		}
		    		String insertCode = newsService.add(news);
		    		if(FinalVar.INSERT_SUCCESS.equals(insertCode)){
		    			num++;
		    		}
				}
		    	
		    }
		    msg = "拷贝成功:\n分类："+categoryCount+"条，频道："+channelCount+"条，新闻："+num+"条";
		}
		PrintWriter out = response.getWriter();
		out.print(msg);
	}
	/**
	 * 只拷贝频道和分类
	 * 
	 * @return
	 * @throws IOException 
	 */
	public void copyWebsite() throws IOException {
		String msg = "";
		// 获取当前所在的站点ID
		Long webSiteID = Long.valueOf((String) session
				.getAttribute("ADMIN_WEBSITE"));
		// 获取需要拷贝的站点ID
		Long copyWebstite_Id = request.getParameter("copyWebstite_Id") == null?0l: new Long(request.getParameter("copyWebstite_Id"));
		if(webSiteID.equals(copyWebstite_Id)){
			msg="哥，没必要自己拷贝自己站点的东西，谢了！";
		}
		else{
			//获取需要拷贝的站点的所有分类 保存在 oldCategoryMap里
			Map<Long,NewsCategory> oldCategoryMap = new HashMap<Long, NewsCategory>();
			    List categoryList = newsCategoryService.queryAll(copyWebstite_Id);
			    if(categoryList != null && categoryList.size() >0 ){
			    	for (int i = 0; i < categoryList.size(); i++) {
			    		NewsCategory value = (NewsCategory)categoryList.get(i);
				        System.out.println(value.getWebsite_id());
				       if(value.getWebsite_id().equals(copyWebstite_Id)){
				    	   oldCategoryMap.put(value.getCode(), value);
				       }
					}
			    }
			   System.out.println("oldCategoryMap.size():"+oldCategoryMap.size());     
			  //保存新生成的分类code和它对应原来分类的父分类pcode的关系 保存到新 关系oRmap 
			    Map<Long,Long> oRmap = new HashMap<Long, Long>();
			    Iterator itNewCategory = oldCategoryMap.entrySet().iterator();   
			    int categoryCount = 0;
			    while (itNewCategory.hasNext()) {   
			    	Map.Entry entry = (Map.Entry) itNewCategory.next();   
			    	Long key = (Long)entry.getKey();   
			    	NewsCategory value = (NewsCategory)entry.getValue();
			    	Long oldCode = value.getCode();
			    	value.setCode(null);//code自增增长所以 先设置为null再添加到库里
			    	value.setWebsite_id(webSiteID);//设置站点为当前站点
			    	//存库 
			    	Long insertCode = newsCategoryService.addByCopy(value);
			    	if(insertCode > 0){
			    		categoryCount++;
			    	}
			    	//把关系保存到map里
			    	oRmap.put(oldCode, insertCode);
			    }
			    System.out.println("oRmap.size():"+oRmap.size());  
			    //存库好了，现在把刚存进去的分类读取出来，把父分类编号进行修改，如果父编号为-1 就不修改，否则去oRmap 里找对应的编号做父编号
			    List newsCategoryList = newsCategoryService.queryAll(webSiteID);
			    if(newsCategoryList != null && newsCategoryList.size()>0){
			    	for (int i = 0; i < newsCategoryList.size(); i++) {
						NewsCategory newsCategory = (NewsCategory)newsCategoryList.get(i);
						int pcode = Integer.parseInt(newsCategory.getPcode().toString());
						if(pcode != -1){
							Long pcodeInMap = (Long)oRmap.get(newsCategory.getPcode());
							if(pcodeInMap != null){
								newsCategory.setPcode(pcodeInMap);
								int k = newsCategoryService.editByCopy(newsCategory);
								System.out.println(k);
							}
						}
					}
			    }
			 //保存    
			 //获取需要拷贝的站点的所有频道 保存在 oldchannelMap里    
		    Map<Long,NewsChannel> oldchannelMap = new HashMap<Long, NewsChannel>();
		    List channelList = newsChannelService.query(copyWebstite_Id);
		    if(channelList != null && channelList.size()>0){
		    	for (int i = 0; i < channelList.size(); i++) {
		    		NewsChannel value = (NewsChannel)channelList.get(i);  
			    	if(value.getWebsite_id().equals(copyWebstite_Id)){
			    		oldchannelMap.put(value.getId(), value);
			    	}
		    	}
		    }
		    System.out.println("oldchannelMap.size():"+oldchannelMap.size());
			//频道存库 保存关系
		    
		    Map<Long,Long> oRmapChanel = new HashMap<Long, Long>();
		    Iterator itNewsChannel = oldchannelMap.entrySet().iterator(); 
		    int channelCount = 0;
		    while (itNewsChannel.hasNext()) {   
		    	Map.Entry entry = (Map.Entry) itNewsChannel.next();   
		    	Long key = (Long)entry.getKey();   
		    	NewsChannel value = (NewsChannel)entry.getValue();
		    	Long oldChanelId = value.getId();
		    	value.setId(null);//code自增增长所以 先设置为null再添加到库里
		    	value.setWebsite_id(webSiteID);
		    	//存库 
		    	Long insertCode = newsChannelService.addByCopy(value);
		    	if(insertCode > 0){
		    		channelCount++;
		    	}
		    	oRmapChanel.put(oldChanelId, insertCode);
		    }
		    System.out.println("oRmapChanel.size():"+oRmapChanel.size()); 
		   
		    msg = "拷贝成功:\n分类："+categoryCount+"条，频道："+channelCount+"条";
		}
		PrintWriter out = response.getWriter();
		out.print(msg);
	}

	
	
	
}
