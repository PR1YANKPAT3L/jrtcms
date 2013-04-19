package com.jrtcms.web.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.web.context.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;


public class BaseAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, ServletContextAware {

	private static final long serialVersionUID = 6945581678147395699L;

	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;
	protected ServletContext application;
	protected PrintWriter out;

	/**
	 * 初始化设置Request,并在其中初始化session
	 * 
	 * @param request
	 */
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		this.session = request.getSession();
	}

	/**
	 * 初始化设置response
	 * 
	 * @param response
	 */
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
		this.response.setContentType("text/html; charset=utf-8");
		try {
			out = this.response.getWriter();
		} catch (IOException e) {

		}
	}

	/**
	 * 初始化设置application
	 * 
	 * @param application
	 */
	@Override
	public void setServletContext(ServletContext application) {
		this.application = application;
	}

	/**
	 * 获取本地IP
	 * 
	 * @return 本地IP
	 */
	public String getLocalIp() {
		InetAddress addr = null;
		try {
			addr = InetAddress.getLocalHost();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (addr == null)
			return "";
		return addr.getHostAddress().toString();
	}
	/**
	 * 向客户端输出JSON
	 * @param jsonObj JSON
	 */
	protected void outPrint(JSONObject jsonObj){
		outPrint(jsonObj.toString());
	}
	
	/**
	 * 向客户端输出内容
	 * @param str 内容
	 */
	protected void outPrint(String str){
		out.print(str);
		out.flush();
		out.close();
	}
	
	/**
	 * 获得转码后的JSON对象
	 * @return 以error_code为key的返回码，以result为key的转码后的JSON对象
	 */
	protected Map<String,Object> getJsonString(){
		String reqJsonStr = request.getParameter("jsonString");
		Map<String,String> respJson = new HashMap<String,String>();
		respJson.put("error_code", FinalVar.JSON_SUCCESS);
		if(reqJsonStr == null || "".equals(reqJsonStr)){
			respJson.put("error_code", FinalVar.JSON_ERR_PARAMETER);
		}
		return Encoder.isoToUtf8(reqJsonStr);
	}
}
