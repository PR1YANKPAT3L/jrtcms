package com.jrtcms.web.action;

import util.Tools;

import com.jrtcms.web.service.NewsCategoryService;
import com.jrtcms.web.util.BaseAction;
import com.jrtcms.web.util.CreateNewsCategoryCodeUtil;


public class IndexAction extends BaseAction {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6700728852376617928L;
	private NewsCategoryService newsCategoryService;
	
	public void setNewsCategoryService(NewsCategoryService newscategoryService) {
		this.newsCategoryService = newscategoryService;
	}



	public NewsCategoryService getNewsCategoryService() {
		return newsCategoryService;
	}



	public String goindex(){
		
		//测试生成编号
		String pcode = request.getParameter("pcode")==null?"0":request.getParameter("pcode");
		
		String code = CreateNewsCategoryCodeUtil.createCode(newsCategoryService, pcode);
		 
		
		System.out.println(code);
		
		return "index";
	}
	public String testjsp(){
		
		//测试生成编号
		System.out.println("--------");
		
		request.setAttribute("test", "真强大");
		return "index";
	}
	public String jspTohtml(){
		
		
		String basePath = request.getSession().getServletContext()
			.getRealPath("/")+ "../" ;

		System.out.println(basePath);

		String path = "http://localhost:8080/jrtcms/";
		
		String pageUrl=path+"/test.jsp";
		
		String filePath=basePath+"aa";
		
		String fileName="bb.html";
		
		System.out.println(path);
		
		System.out.println(fileName);
		
		//测试生成html
		Tools.makeHtml(pageUrl, filePath, fileName);
		return "index";
	}
}
