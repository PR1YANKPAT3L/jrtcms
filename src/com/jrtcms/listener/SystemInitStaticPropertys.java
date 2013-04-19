package com.jrtcms.listener;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jrtcms.listener.propertys.InitWebsitePropertys;
import com.jrtcms.web.pojo.NewsCategory;
import com.jrtcms.web.pojo.NewsChannel;
import com.jrtcms.web.pojo.Website_Properties;
import com.jrtcms.web.service.NewsCategoryService;
import com.jrtcms.web.service.NewsChannelService;
import com.jrtcms.web.service.Website_PropertiesService;
/**
 * 项目启动时，初始化项目的所有静态属性
 * @author Administrator
 * 
 */
public class SystemInitStaticPropertys {
	private static Logger log = Logger.getLogger(SystemInitStaticPropertys.class);
	private static Website_PropertiesService wpss;
	private static NewsCategoryService newsCategoryService;
	private static NewsChannelService newsChannelService;
	
	public NewsChannelService getNewsChannelService() {
		return newsChannelService;
	}
	public void setNewsChannelService(NewsChannelService newsChannelService) {
		this.newsChannelService = newsChannelService;
	}
	public Website_PropertiesService getWpss() {
		return wpss;
	}
	public void setWpss(Website_PropertiesService wpss) {
		this.wpss = wpss;
	}

	public  NewsCategoryService getNewsCategoryService() {
		return newsCategoryService;
	}
	public  void setNewsCategoryService(
			NewsCategoryService newsCategoryService) {
		this.newsCategoryService = newsCategoryService;
	}
	
	public static void sysInit() {
		
		List <Website_Properties> wpsList = wpss.quiry();
		log.info("初始化系统静态属性...");
		log.info("--------------站点属性-------------");
		log.info("start...");
		Map<Long, Website_Properties> wpsListMap = new HashMap<Long, Website_Properties>();
		for(Website_Properties wps:wpsList){
			log.info(wps.toString());
			wpsListMap.put(wps.getId(),wps);
		}
		log.info("...END");
		InitWebsitePropertys.setWpsListMap(wpsListMap);
	}
	public static void categoryInit() {
		
		log.info("初始化系统静态属性...");
		List <NewsCategory> newsCategoryList = newsCategoryService.queryList();
		log.info("--------------分类属性-------------");
		log.info("start...");
		Map<Long, NewsCategory> newsCategoryMap = new HashMap<Long, NewsCategory>();
		for(NewsCategory nsc:newsCategoryList){
			log.info(nsc.toString());
			newsCategoryMap.put(nsc.getCode(),nsc);
		}
		log.info("...END");
		InitWebsitePropertys.setCategooryListMap(newsCategoryMap);
	}
	
public static void channelInit() {
		
		log.info("初始化系统静态属性...");
		List <NewsChannel> newsChannelList = newsChannelService.queryList();
		log.info("--------------频道属性-------------");
		log.info("start...");
		Map<Long, NewsChannel> newsChannelMap = new HashMap<Long, NewsChannel>();
		for(NewsChannel ncl:newsChannelList){
			log.info(ncl.toString());
			newsChannelMap.put(ncl.getId(),ncl);
		}
		log.info("...END");
		InitWebsitePropertys.setNewschannelListMap(newsChannelMap);
	}

}
