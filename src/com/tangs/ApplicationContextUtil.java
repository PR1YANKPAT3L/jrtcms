
package com.tangs;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/** 
 * @classname:
 *
 * @description
 *
 * @author 
 * 蓝生 
 * @date：
 * 2011-6-1 下午05:27:31 
 */

public class ApplicationContextUtil {
	
	public static final String[] strs = {"com/jrtcms/configs/cmscontext/applicationContext-newsModule-services.xml","com/jrtcms/configs/cmscontext/applicationContext-newsModule-daos.xml","com/jrtcms/configs/basecontext/applicationContext-base.xml"};
	public static final ApplicationContext ctx =  new ClassPathXmlApplicationContext(strs);

}
