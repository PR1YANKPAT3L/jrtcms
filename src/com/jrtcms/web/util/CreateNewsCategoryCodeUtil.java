
package com.jrtcms.web.util;

import com.jrtcms.web.service.NewsCategoryService;

/** 
 * @classname:
 * CreateNewsCategoryCodeUtil
 * @description
 * 自动生成新闻分类编号的公共类，该类向外提供一个自动生成新闻分类编号的方法
 * @author 
 * 蓝生 
 * @date：
 * 2011-1-12 下午01:04:45 
 */

public  class CreateNewsCategoryCodeUtil {
    /**
     * @Title: createCode
	 * @Description: 向外部提供提供一个自动生成新闻分类编号的方法 
	 * @param newsCategoryService 传进一个经过注入的接口
     * @param newsCategory_pcode 传入的父编号比如：要在编号为01的分类下添加子类，则这个参数就是01
     * @return 返回生成的分类编号
     */
	public static String createCode(NewsCategoryService newsCategoryService,String newsCategory_pcode){
		//定义返回编号
		String code = "";
		
		//如果传入的父编号长度小与2位，说明要添加的是一级分类
		if(newsCategory_pcode.length()<2){
			code = "01";//初始化为01
		}else{//如果传入的父编号长度不小于2位，说明要添加的是子级分类
			code = newsCategory_pcode+"01";//初始化编号为当前父编号+01做为该编号
		}
		//按照父编号查询该父编号下的子类
//		List list = newsCategoryService.selectCategoryByPcode(newsCategory_pcode);
//		//如果没有查到有子类，则取初始化的编号，如果有子类，查出的子类按编号倒序取第一个编号
//		if(list != null && list.size()>0){
//				NewsCategory ca = (NewsCategory)list.get(0)	;
//				code = ca.getCode(); //取到倒序的第一个，则改编号就是这一级中最大编号
//				int codeToInt = Integer.parseInt(code) + 1;//把编号转化成int，然后递增1
//				code = "0"+codeToInt;//递增后转化为字符串，在前面加0
//		}
		return code;
	}
}
