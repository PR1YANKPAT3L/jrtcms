package com.jrtcms.junit;

import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;


public class UnitTestTemplate extends  AbstractTransactionalDataSourceSpringContextTests {
	
	@Override
	protected String[] getConfigLocations() {
		String[] config = new String[] {
				"classpath*:com\\jrtcms\\configs\\basecontext\\applicationContext-base.xml",
				"classpath*:com\\jrtcms\\configs\\cmscontext\\applicationContext-newsModule-daos.xml",
				"classpath*:com\\jrtcms\\configs\\cmscontext\\applicationContext-newsModule-services.xml",
				"classpath*:com\\jrtcms\\configs\\cmscontext\\applicationContext-newsModule-actions.xml",
				"classpath*:com\\jrtcms\\configs\\cmscontext\\applicationContext-job.xml"
		};
		return config;
	}
}



