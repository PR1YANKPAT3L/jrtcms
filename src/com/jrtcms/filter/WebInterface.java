package com.jrtcms.filter;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jrtcms.web.util.FinalVar;
import com.jrtcms.web.util.MD5.PaySign;

public class WebInterface implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String macPr = request.getParameter("Mac");
		if(macPr==null){ 
			response.getWriter().print("密钥验证失败！！您的IP地址为："+request.getRemoteAddr()+" IP地址已经被记录，请不要恶意操作！");
			return;
		}
		
		String interfaceType = request.getParameter("interfaceType");
		if(interfaceType==null){
			response.getWriter().print(FinalVar.INTERFACE_STATE_NO_PROPERTY);//没有选择接口类型
			return;
		}
		String mac = ""; //本地要拼接的MD5加密，加密后 与获取的MD5进行比对校验
		
		if(interfaceType.equals(FinalVar.INTERFACE_TYPE_SMS)){
			mac = request.getParameter("mobileIds")+FinalVar.INTERFACE_KEY;
			
		}
		if(interfaceType.equals(FinalVar.INTERFACE_TYPE_ACTIVITY_FIRST_REGISTR_GIFT_3)){
			mac = request.getParameter("userno")+FinalVar.INTERFACE_KEY;
			
		}
		
		
		try {
			String macmd5=PaySign.EncoderByMd5(mac);
			if(macmd5.indexOf("+")>-1){
				macmd5 = macmd5.replaceAll("\\+", "_");
			}
			if(macPr.equals(macmd5)){
				filterChain.doFilter(request, response);
			}else{
				response.getWriter().print(FinalVar.INTERFACE_STATE_NO_MD5);//MD5验证失败
				return;
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			response.getWriter().print(FinalVar.INTERFACE_ERROR);
			return;
		}
		// System.out.println("filter使用成功！！！！"+request.getServletPath());
		

	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

}
