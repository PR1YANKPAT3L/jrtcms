package com.jrtcms.listener.propertys;

import java.util.Map;

import com.jrtcms.listener.SystemInitStaticPropertys;


public class InitWebsitePropertys {
	public static Map wpsListMap = null;
	public static Map categooryListMap = null;
	public static Map newschannelListMap=null;

	public static Map getNewschannelListMap() {
		if(newschannelListMap==null){
			SystemInitStaticPropertys.channelInit();
		}
		return newschannelListMap;
	}

	public static void setNewschannelListMap(Map newschannelListMap) {
		InitWebsitePropertys.newschannelListMap = newschannelListMap;
	}

	public static Map getWpsListMap() {
		if(wpsListMap==null){
			SystemInitStaticPropertys.sysInit();
		}
		return wpsListMap;
	}

	public static void setWpsListMap(Map wpsListMap) {
		InitWebsitePropertys.wpsListMap = wpsListMap;
	}

	public static Map getCategooryListMap() {
		
		if(categooryListMap == null){
			SystemInitStaticPropertys.categoryInit();
		}
		return categooryListMap;
	}

	public static void setCategooryListMap(Map categooryListMap) {
		InitWebsitePropertys.categooryListMap = categooryListMap;
	}
	
	
}
