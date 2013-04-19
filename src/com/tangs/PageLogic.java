  package com.tangs;  
    
  import java.io.IOException;
import java.io.Writer;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.struts2.components.Component;

import com.opensymphony.xwork2.util.ValueStack;
    
  /** 
   * 分页逻辑Bean 
   * @author tangs 
   */  
  public class PageLogic extends Component {  
	  protected Integer cpageInt;
	  private String cpage;  
	  protected Integer totalInt;
	  private String total;  
      private String url;  
      protected Integer web_idInt;
      private String web_id;  //传入的站点id 
      protected Integer numInt;
      private String num;  //显示条数  
      private String categoryCn;  //查询分类的中文名  
      private String channelCn;  //询分类新闻的频道中文名
      
      public String getCpage() {  
          return cpage;  
      }  
    
      public void setCpage(String cpage) {  
          this.cpage = cpage;  
      }  
    
      public String getTotal() {  
          return total;  
      }  
    
      public void setTotal(String total) {  
          this.total = total;  
      }  
    
      public String getUrl() {  
          return url;  
      }  
    
      public void setUrl(String url) {  
          this.url = url;  
      }  
      public void setWeb_id(String web_id) {
  		this.web_id = web_id;
  	}

  	public void setNum(String num) {
  		this.num = num;
  	}

  	public void setCategoryCn(String categoryCn) {
  		this.categoryCn = categoryCn;
  	}

  	public void setChannelCn(String channelCn) {
  		this.channelCn = channelCn;
  	}  
        
      public void setCpageInt(Integer cpageInt) {
		this.cpageInt = cpageInt;
	}

	public void setTotalInt(Integer totalInt) {
		this.totalInt = totalInt;
	}

	public void setWeb_idInt(Integer web_idInt) {
		this.web_idInt = web_idInt;
	}

	public void setNumInt(Integer numInt) {
		this.numInt = numInt;
	}

	public PageLogic(ValueStack arg0) {  
          super(arg0);  
      }  
    
      @Override  
      public boolean start(Writer writer) { 
    	  if(cpage != null)
              cpageInt = (Integer)findValue(cpage, java.lang.Integer.class);
          if(total != null)
        	  totalInt = (Integer)findValue(total, java.lang.Integer.class);
          if(url != null)
        	  url = (String )findValue(url,java.lang.String.class);
          boolean result = super.start(writer);  
          try {  
              StringBuilder str = new StringBuilder();  
              boolean isValid = true;  
                
              
//              NewsService newsService = (NewsService)ApplicationContextUtil.ctx.getBean("newsService");
              
//              int count =  newsService.queryNewsCount(null, null, new Long(web_id));
//              totalInt = totalInt/20 +(totalInt%20 == 0?0:1);
              if (isValid) {  
                  //Integer cpageInt = Integer.valueOf(cpage);  
                  //当前页与总页数相等  
                 /* if (cpage.equals(total)) {  
                      //如果total = 1，则无需分页，显示“[第1页] [共1页]”  
                      if ("1".equals(total)) {  
                          str.append("[第 " + cpage + " 页]");  
                          str.append(" [共 " + total + " 页]");  
                      } else {  
                          //到达最后一页,显示“[首页] [上一页] [末页]”  
                          str.append("<a href='");  
                          str.append(url);  
                          str.append("?cpage=1&total="+total+"&url="+url);  
                          str.append("'>[首页]</a> <a href='");  
                          str.append(url);  
                          str.append("?cpage=" + (cpageInt - 1) + "&total=" + total+"&url="+url);  
                          str.append("'>《《《</a> <a href='");  
                          str.append(url);  
                          str.append("?cpage=" + total + "&total=" + total+"&url="+url);  
                          str.append("'>[末页]</a>");  
                      }  
                  } else {*/
                      //当前页与总页数不相同  
                	  //
                      /*if ("1".equals(cpage)) {  
                          //第一页，显示“[首页] [下一页] [末页]”  
                          str.append("<a href='");  
                          str.append(url);  
                          str.append("?cpage=1&total="+total+"&url="+url);  
                          str.append("'>[首页]</a> <a href='");  
                          str.append(url);  
                          str.append("?cpage=" + (cpageInt + 1) + "&total=" + total+"&url="+url);  
                          str.append("'>》》》</a> <a href='");  
                          str.append(url);  
                          str.append("?cpage=" + total + "&total=" + total+"&url="+url);  
                          str.append("'>[末页]</a>");  
                      } else { */ 
                          //不是第一页，显示“[首页] [上一页] [下一页] [末页]”  
                          /*str.append("<a href='");  
                          str.append(url);  
                          str.append("?cpage=1&total="+total+"&url="+url);  
                          str.append("'>[首页]</a> ");*/
                          //<a href="#"><span>上一页</span></a> 
                    	  //<a href="#"><span><b>1</b></span></a> 
                    	  //<a href="#"><span>2</span></a> 
                    	  //<a href="#"><span>下一页</span></a>
                	  /*
                	   <a href="#"><span class="fenye1">首页</span></a> 
                	   <a href="#"><span class="fenye4">&nbsp;</span></a>
                	   <a href="#"><span class="fenye2">1</span></a> 
                	   <a href="#"><span class="fenye2">2</span></a> 
                	   <a href="#"><span class="fenye2">3</span></a> 
                	   <a href="#"><span class="fenye2_hover">4</span></a> 
                	   <a href="#"><span class="fenye2">5</span></a> 
                	   <a href="#"><span class="fenye2">6</span></a> 
                	   <a href="#"><span class="fenye2">7</span></a> 
                	   <a href="#"><span class="fenye2">8</span></a>
                	   <a href="#"><span class="fenye2">9</span></a>
                	   <a href="#"> <span class="blue">&middot;&middot;&middot;</span></a>
                	   <a href="#"><span class="fenye2">22</span></a>
                	   <a href="#"><span class="fenye4">&nbsp;</span></a>
                	   <a href="#"><span class="fenye1">尾页</span></a>
                	   <span><input class="fenye_input" name="Input" type="text" /></span>
                	   <span class="fenye3">&nbsp;</span>*/
                	  
                	  str.append("<a href='");  
                      str.append(url+"1.html");  
                      str.append("'><span class='fenye1'>首页</span></a> ");
                          str.append("<a href='");  
                          str.append(url+(cpageInt-1==0?1:cpageInt-1)+".html");  
                          str.append("'><span class='fenye5'>&nbsp;</span></a> ");
                          for(int i=1;i <= totalInt;i++){
                        	  str.append("<a href='");
                        	  str.append(url+i+".html");  
                              str.append("'>");
                              if(cpageInt == i){
                            	  str.append("<span class='fenye2_hover'>");
                            	  str.append(i+""); 
                                  str.append("</span></a>");
                              }else if((i+5)==cpageInt||(i-5)==cpageInt){
                            	  	  str.append("<span class='fenye2'>");
                            		  str.append("......."+""); 
                                      str.append("</span></a>");
                              }else if(cpageInt!=null&&(cpageInt-5)<i&&(cpageInt+5)>i){
	                  				str.append("<span class='fenye2'>");
	                  				str.append(i+""); 
	                                str.append("</span></a>");
                  			}
                              
                          }
                          str.append("<a href='");  
                          str.append(url+(cpageInt+1>totalInt?totalInt:cpageInt+1)+".html");  
                          str.append("'>");
                          str.append("<span class='fenye4'>&nbsp;</span></a> ");
                          
                          str.append("<a href='");  
                          str.append(url+totalInt+".html");  
                          str.append("'><span class='fenye1'>尾页</span></a>");  
//                      }  
//                  }  
              }  
               
              writer.write(str.toString());  
                
          } catch (IOException ex) {  
              Logger.getLogger(PageLogic.class.getName()).log(Level.SEVERE, null, ex);  
          }  
          return result;  
      }  
  }  