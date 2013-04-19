 <%@page contentType="text/html" pageEncoding="UTF-8"%>  
 <%@ taglib prefix="tangs" uri="/WEB-INF/tangs.tld"%>  
<%@taglib prefix="s" uri="/struts-tags"%>  
   
 <html>  
     <head>  
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
         <title>List</title>  
     </head>  
     <body>  
         共 <s:property value="total"/> 页 第 <s:property value="cpage"/> 页<br>  
         <tangs:pages cpage="${cpage}" total="${total}" url="${url}"/>  
     </body>  
 </html>