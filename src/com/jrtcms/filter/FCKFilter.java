
package com.jrtcms.filter;
/** 
 * @classname:
 * FCKFilter
 * @description
 * 为fck上传图片做配置
 * @author 
 * 蓝生 
 * @date：
 * 2011-4-11 上午09:25:20 
 */

  import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;
   
  public class FCKFilter extends StrutsPrepareAndExecuteFilter { 
      public void doFilter(ServletRequest req,ServletResponse res, FilterChain chain) throws IOException, ServletException {   
          HttpServletRequest request = (HttpServletRequest) req;  
          String URI = request.getRequestURI(); 
          String[] uriArray = URI.split("/fckeditor/editor/filemanager/connectors/"); 
          int arrayLen = uriArray.length; 
          if (arrayLen >= 2) { 
              chain.doFilter(req, res);  
          }else { 
              super.doFilter(req, res, chain);   
          } 
      }  
  } 
