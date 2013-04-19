package com.jrtcms.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Permissions implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		
		String Operation = request.getParameter("Operation") == null ? ""
				: (String) request.getParameter("Operation");
		
		if (Operation.isEmpty()&& ((request.getServletPath().indexOf("login") == -1 && request.getServletPath().indexOf("phoneInfo") == -1 && request.getServletPath().indexOf("htmlCodeAction") == -1 )|| request.getServletPath().equals("/"))) {
			if (request.getSession().getAttribute("WEBSITE_SESSION") == null) {
				response.sendRedirect("/tologin.jsp");
				return;
			}
		}
		// System.out.println("filter使用成功！！！！"+request.getServletPath());
		filterChain.doFilter(request, response);

	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

}
