package com.jrtcms.web.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;


public class PaginationTag extends TagSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public int doStartTag() throws JspException {
		try {
			HttpServletRequest request = (HttpServletRequest) pageContext
					.getRequest();
			pageContext.getResponse().setContentType("text/html;charset=UTF-8");
			JspWriter out = pageContext.getOut();
			StringBuffer urlStr = new StringBuffer();
			Pager pager = (Pager) request.getAttribute("pager");
			if (!StrUtil.isNull(pager)) {
				if (StrUtil.isEqual(String.valueOf(pager.getHasPreviousPage()),
						"true")) {
					urlStr.append("<a href='");
					urlStr.append(pager.getAction());
					urlStr.append("&pageroperation=previous&currentPage="
							+ pager.getCurrentPage() + "&totalPages="
							+ pager.getTotalPages() + "'>上一页</a>");

				}
				urlStr.append(pager.getStrUrl());
				if (StrUtil.isEqual(String.valueOf(pager.getHasNextPage()),
						"true")) {
					urlStr.append("<a href='");
					urlStr.append(pager.getAction());
					urlStr.append("&pageroperation=next&currentPage="
							+ pager.getCurrentPage() + "&totalPages="
							+ pager.getTotalPages() + "'>下一页</a>");

				}
			}
			out.print(urlStr);
		} catch (java.io.IOException e) {
			throw new JspTagException(e.getMessage());
		}

		return SKIP_BODY;
	}
}
