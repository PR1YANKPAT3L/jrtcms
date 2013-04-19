package com.jrtcms.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

import org.apache.log4j.Logger;

import util.JspToHtml_Job;

import com.jrtcms.web.pojo.PhoneInfo;
import com.jrtcms.web.service.NewsService;
import com.jrtcms.web.service.PhoneInfoService;
import com.jrtcms.web.util.BaseAction;
import com.jrtcms.web.util.FinalVar;
import com.jrtcms.web.util.MD5.PaySign;

public class PhoneInfoAction extends BaseAction {

	private static final long serialVersionUID = -8351064091313090344L;
	private Logger log = Logger.getLogger(PhoneInfoAction.class);
	private PhoneInfoService phoneInfoService;
	private NewsService newsService;

	public void create() throws NoSuchAlgorithmException, IOException {
		String macFrom = request.getParameter("Mac");
		String phoneCode = request.getParameter("phoneCode");
		Integer rules = Integer
				.valueOf(request.getParameter("rules") == "" ? "0" : request
						.getParameter("rules"));
		int flag = 3;
		if (macFrom != null && !"".equals(macFrom) && phoneCode != null
				&& !"".equals(phoneCode)) {
			String phonecode = phoneCode + "3gcaipiao";
			String macChack = PaySign.EncoderByMd5(phonecode);
			if(macChack.indexOf("+")>-1){
				macChack = macChack.replaceAll("\\+", "_");
			}
			if (macChack.equals(macFrom)) {
				log.info("mac一致开始传送");
				PhoneInfo phoneInfo = new PhoneInfo();
				phoneInfo.setPhoneCode(Long.valueOf(phoneCode));
				phoneInfo.setRules(rules);
				flag = phoneInfoService.queryPhoneInfoCount(phoneInfo);
				if (flag < 3) {
					String code = phoneInfoService.add(phoneInfo);
					if (FinalVar.INSERT_SUCCESS.equals(code)) {
						request.setAttribute("msg", "手机信息添加成功");
						log.info("手机计数添加成功");
					} else {
						log.info("手机计数添加失败");
					}
				} else {
					log.info("手机信息每天超过3次则发送失败");
				}
			} else {
				log.info("mac不一致传送失败");
			}
		} else {
			log.info("mac地址非法");
		}
		PrintWriter out = response.getWriter();
		out.print(flag);
	}
	public void addCont() throws IOException {
		String count="";
		try {
			String phoneCode = request.getParameter("emailCode");
			Integer rules = Integer
					.valueOf(request.getParameter("rules") == "" ? "0" : request
							.getParameter("rules"));
			PhoneInfo phoneInfo = new PhoneInfo();
			phoneInfo.setEmail(phoneCode);
			phoneInfo.setRules(rules);
			 count =phoneInfoService.add(phoneInfo);
			 if (FinalVar.INSERT_SUCCESS.equals(count)) {
				 PrintWriter out = response.getWriter();
					out.print("succ");
				} else {
					PrintWriter out = response.getWriter();
					out.print("fail");
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void getCont() throws IOException {
		int count=0;
		try {
			String phoneCode = request.getParameter("emailCode");
			Integer rules = Integer
					.valueOf(request.getParameter("rules") == "" ? "0" : request
							.getParameter("rules"));
			PhoneInfo phoneInfo = new PhoneInfo();
			phoneInfo.setEmail(phoneCode);
			phoneInfo.setRules(rules);
			count =phoneInfoService.queryInfoCountByEmail(phoneInfo);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		PrintWriter out = response.getWriter();
		out.print(count);
	}
	public void getContNew() throws IOException {
		int count=0;
		try {
			String phoneCode = request.getParameter("emailCode");
			Integer rules = Integer
					.valueOf(request.getParameter("rules") == "" ? "0" : request
							.getParameter("rules"));
			PhoneInfo phoneInfo = new PhoneInfo();
			phoneInfo.setEmail(phoneCode);
			phoneInfo.setRules(rules);
			count =phoneInfoService.queryPhoneInfoCountByEmail(phoneInfo);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		PrintWriter out = response.getWriter();
		out.print(count);
	}
	public void createEmail() throws NoSuchAlgorithmException, IOException {
		String macFrom = request.getParameter("Mac");
		String emailCode = request.getParameter("emailCode");
		Integer rules = Integer
				.valueOf(request.getParameter("rules") == "" ? "0" : request
						.getParameter("rules"));
		int flag = 3;
		if (macFrom != null && !"".equals(macFrom) && emailCode != null
				&& !"".equals(emailCode)) {
			String codes = emailCode + "3gcaipiao";
			String macChack = PaySign.EncoderByMd5(codes);
			if (macChack.equals(macFrom)) {
				log.info("mac一致开始传送");
				PhoneInfo phoneInfo = new PhoneInfo();
				phoneInfo.setEmail(emailCode);
				phoneInfo.setRules(rules);
				flag = phoneInfoService.queryPhoneInfoCountByEmail(phoneInfo);
				if (flag < 3) {
					String code = phoneInfoService.add(phoneInfo);
					if (FinalVar.INSERT_SUCCESS.equals(code)) {
						request.setAttribute("msg", "邮箱信息添加成功");
						log.info("邮箱计数添加成功");
					} else {
						log.info("邮箱计数添加失败");
					}
				} else {
					log.info("邮箱信息每天超过3次则发送失败");
				}
			} else {
				log.info("mac不一致传送失败");
			}
		} else {
			log.info("mac地址非法");
		}
		PrintWriter out = response.getWriter();
		out.print(flag);
	}

	public void getCheck() throws IOException {
		String result = null;
		try {

			String check = request.getParameter("check");
			Integer usered = phoneInfoService.queryCheck(check);
			if (usered == 0) {
				result = "0";
			} else {
				result = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.print(result);

	}

	public void createChecked() {
		try {
			String checked = request.getParameter("check");
			if (checked != null) {
				PhoneInfo info = new PhoneInfo();
				info.setChecked(checked);
				info.setRules(1);
				phoneInfoService.add(info);
				log.info("添加checked成功!");
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.info("添加checked失败!");
		}

	}

	public void createRemark() {
		try {
			String checked = request.getParameter("check");
			if (checked != null) {

				phoneInfoService.editeRemark(checked);

				log.info("添加remark!");
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.info("添加remark失败!");
		}

	}

	public void getRemark() {
		try {
			PrintWriter out = response.getWriter();
			String checked = request.getParameter("check");
			Integer count = phoneInfoService.queryRemark(checked);
			out.print(count);

		} catch (Exception e) {
			e.printStackTrace();
			log.info("查询链接失败！");
		}
	}
	/**
	 * 更新点击数
	 * @throws IOException
	 */
	public void updateClickCount() throws IOException{
		response.setCharacterEncoding("utf-8");
		String value="";
		Long  id= Long.valueOf(request.getParameter("id")==""?"0":request.getParameter("id"));
		Integer num = newsService.editClickCount(id);
		if(num>0){
			 value="1";
		}else{
			value= "0";
		}
		PrintWriter out = response.getWriter();
		out.print(value);
		
		
	}
	/**
	 * 获取新闻的点击数
	 * @throws IOException
	 */
 public void getClickCount() throws IOException{
		
		response.setCharacterEncoding("utf-8");
		Long  id= Long.valueOf(request.getParameter("id")==""?"0":request.getParameter("id"));
		Long  num = newsService.queryClickCount(id);
		
		
		PrintWriter out = response.getWriter();
		out.print(num);
	}
 
	 /**
	  * chlw在合买认购成功以后调用生成静态页面的方法重新生成静态页面
	  */
 
	public void refreshHemaiPage(){
		response.setCharacterEncoding("utf-8");
		try {
			String lotno = request.getParameter("lotno")==null?"":request.getParameter("lotno");
			new JspToHtml_Job().jspToHtmlHeMai(lotno);
			
			log.info("参与合买成功后生成合买页静态页面成功！");
		} catch (Exception e) {
			log.error("参与合买成功后生成合买页静态页面失败！");
		}
	}
	
	public PhoneInfoService getPhoneInfoService() {
		return phoneInfoService;
	}

	public void setPhoneInfoService(PhoneInfoService phoneInfoService) {
		this.phoneInfoService = phoneInfoService;
	}

	public NewsService getNewsService() {
		return newsService;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

}
