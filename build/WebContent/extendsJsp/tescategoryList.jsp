<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<%@taglib prefix="s" uri="/struts-tags"%>  
<%@ taglib prefix="tangs" uri="/WEB-INF/tangs.tld"%>  
 <html>  
     <head>  
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
         <title>List</title>  
     </head>  
     <body>  
<tangs:ryc_newslist value="4" categoryCn="#attr['nameCn']"  web_id="2">
<div class="zsh2">  ${name_cn}</div>
			<div class="zsh3">
             <ul>


             <tangs:ryc_newslist id="bbbb" value="3" categoryCn="#attr['name_cn']" web_id="2">
              <li> ${title }</li> 
             
             </tangs:ryc_newslist>
             
           
			</ul>
			</div>


</tangs:ryc_newslist>  
     </body>  
 </html>