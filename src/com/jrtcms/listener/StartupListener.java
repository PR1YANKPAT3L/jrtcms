package com.jrtcms.listener;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ResourceBundle;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.ContextLoaderListener;


public class StartupListener extends ContextLoaderListener implements
		ServletContextListener {

	private static final Log log = LogFactory.getLog(StartupListener.class);
	private static ResourceBundle rbint = ResourceBundle.getBundle("jrtcms");
	//复制源D:\\template
	private static String copyFromUrl = rbint.getString("copyFromUrl");
	//复制目标地址 D:\\tomcat6\\wtpwebapps\\jrtcms\\template
	private static String tomcatUrl = rbint.getString("tomcatUrl");
	//copy命令 xcopy /e /y /i 
	private static String copyCode = rbint.getString("copyCode");
	
	public void contextInitialized(ServletContextEvent event) {
		if (log.isDebugEnabled()) {
			log.debug("initializing context...");
		}
		System.setProperty("java.awt.headless", "true");
		if (log.isDebugEnabled()) {
			log.debug("projectname has initialized to context...java.awt.headless:true");
		}

		try {
			Runtime rt = Runtime.getRuntime();  
						log.info(copyCode+copyFromUrl+" "+tomcatUrl);
	        Process p = rt.exec(copyCode+copyFromUrl+" "+tomcatUrl);

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		log.info("模版拷贝完成！！");
	}

}
