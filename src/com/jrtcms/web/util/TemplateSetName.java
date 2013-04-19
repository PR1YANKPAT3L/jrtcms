package com.jrtcms.web.util;

import java.util.ArrayList;
import java.util.List;

import com.jrtcms.web.pojo.NewsTemplate;
/**
 * 
 * @classname: TemplateSetName
 * @description: 转换模版名称封装新的list
 * @author: 蓝生
 * @date: 2011-3-13 上午11:07:52
 */
public class TemplateSetName {
	    /**
	     * 转换模版名称
	     * @param website_Properties_name_zh 站点名称
	     * @param list 需要转换的模版list
	     * @return 转换后的list
	     */
        public static List setTemplateName(String website_Properties_name_zh,List<NewsTemplate> list){
    		List<NewsTemplate> list2 = new ArrayList<NewsTemplate>();
    		if(list != null && list.size()>0){
    			for (int i = 0; i < list.size(); i++) {
    				NewsTemplate newsTemplate = (NewsTemplate)list.get(i);
    				String name = newsTemplate.getName();
    				if(name.indexOf(website_Properties_name_zh+"_")>-1){
    					newsTemplate.setName(name.replace(website_Properties_name_zh+"_", ""));
    				}
    				list2.add(newsTemplate);
    				
    			}
    		}
        	return list2;
        }
}
