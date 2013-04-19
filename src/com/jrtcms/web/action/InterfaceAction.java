package com.jrtcms.web.action;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.tempuri.WebService;

import com.jrtcms.web.pojo.Custom;
import com.jrtcms.web.pojo.Sales;
import com.jrtcms.web.service.CustomService;
import com.jrtcms.web.service.SalesService;
import com.jrtcms.web.util.BaseAction;
import com.jrtcms.web.util.FinalVar;
import com.jrtcms.web.util.MD5.PaySign;


public class InterfaceAction extends BaseAction {
	private static final long serialVersionUID = 4194606505788198758L;

	private Logger log = Logger.getLogger(InterfaceAction.class);
	
	private WebService webService; 
	public WebService getWebService() {
		return webService;
	}
	public void setWebService(WebService webService) {
		this.webService = webService;
	}
	private SalesService salesService;
	
	
	public SalesService getSalesService() {
		return salesService;
	}
	public void setSalesService(SalesService salesService) {
		this.salesService = salesService;
	}
	
	private CustomService customService;
	
	public CustomService getCustomService() {
		return customService;
	}
	public void setCustomService(CustomService customService) {
		this.customService = customService;
	}
	
	/**
	 * mobileIds手机号可以以英文半角逗号分割，多少个手机号 num就是多少
	 */
	public void sendSms(){
		try {
			String mobileIds = request.getParameter("mobileIds");
			if(mobileIds==null||mobileIds.length()<11){
				response.getWriter().print(FinalVar.INTERFACE_STATE_NO_PROPERTY);//手机号码不正确
				log.info("发送短信接口(InterfaceAction.sendSms):### MobileIds is error ! mobileIds:"+mobileIds+" ###");
				return;
			}
			String strMsg = request.getParameter("strMsg")==null?"":request.getParameter("strMsg");//目前测试能支持到100字"一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十";
			if("".equals(strMsg)){
				response.getWriter().print(FinalVar.INTERFACE_STATE_NO_PROPERTY);//发送的信息不能为空
				log.info("发送短信接口(InterfaceAction.sendSms):### StrMsg is NULL ! StrMsg:"+strMsg+" ###");
				return;
			}
			Integer num = mobileIds.split(",").length;
			//发送短信，并返回相应的返回码
			response.getWriter().print(webService.sendSms(mobileIds, strMsg, num));
			
			return;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 创建销量记录
	 * @throws IOException 
	 */
	public void createSales() throws IOException{
		String salesJsonObj = request.getParameter("sales");
		JSONObject reObj = new JSONObject();
		try {
			if(salesJsonObj==null||"null".equals(salesJsonObj)){
				reObj.put("errorCode",FinalVar.INTERFACE_ERROR);
			}else{
				Sales s = (Sales) JSONObject.toBean(JSONObject.fromObject(salesJsonObj),Sales.class);
				salesService.add(s);
				reObj.put("errorCode", FinalVar.INTERFACE_OK);
			}
			response.getWriter().print(reObj);
			return;
		} catch (IOException e) {
			log.error("salesJsonObj:"+salesJsonObj);
			response.getWriter().print(FinalVar.INTERFACE_ERROR);
			e.printStackTrace();
		}
	}
	
	/**
	 * 客户留言
	 * @throws IOException 
	 * @throws NoSuchAlgorithmException 
	 */
	public void createCustomMessage() throws IOException, NoSuchAlgorithmException{
		
		String customJsonObj = request.getParameter("custom");
		String macFrom = request.getParameter("Mac");
		String userno = request.getParameter("userno");
		
		JSONObject reObj = new JSONObject();
		try {
			if (macFrom != null && !"".equals(macFrom) && userno != null
					&& !"".equals(userno)) {
				String userNo = userno + "ruyicaiwebgood";
				String macChack = PaySign.EncoderByMd5(userNo);
				if(macChack.indexOf("+")>-1){
					macChack = macChack.replaceAll("\\+", "_");
				}
				if (macChack.equals(macFrom)) {
					log.info("客户留言mac一致");
					if(customJsonObj==null||"null".equals(customJsonObj)){
						reObj.put("errorCode",FinalVar.INTERFACE_ERROR);
					}else{
						Custom c = (Custom) JSONObject.toBean(JSONObject.fromObject(customJsonObj),Custom.class);
						customService.addCustom(c);
						reObj.put("errorCode", FinalVar.INTERFACE_OK);
					}
				}else {
					log.info("客户留言mac不一致,请求失败");
					reObj.put("errorCode", FinalVar.INTERFACE_STATE_NO_MD5);
				}
			}else {
				log.info("客户留言mac地址非法");
				reObj.put("errorCode", FinalVar.INTERFACE_STATE_NO_PROPERTY);
			}
			response.getWriter().print(reObj);
		} catch (IOException e) {
			log.error("customJsonObj:"+customJsonObj);
			response.getWriter().print(FinalVar.INTERFACE_ERROR);
			e.printStackTrace();
		}
	}
}
