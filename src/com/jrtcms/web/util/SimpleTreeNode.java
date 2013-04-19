
package com.jrtcms.web.util;
/** 
 * @classname:
 *
 * @description
 *
 * @author 
 * 蓝生 
 * @date：
 * 2011-2-12 上午09:54:04 
 */

import java.util.HashMap;
  
public class SimpleTreeNode {   
private Object id;   
private String text;   
private Object parentId;   
       
/**  
 * 仅用于需要异步读取数据的文件夹节点。当节点有子节点时，该属性不起作用。节点永远为文件夹节点   
 */  
private boolean isFolder=false;    
private HashMap<String, Object> attrs=new HashMap<String,Object>();   
    
public SimpleTreeNode(Object id, String text,Object parentId){   
        this.id=id;   
        this.text=text;   
        this.parentId=parentId;   
    }   
       
   public SimpleTreeNode(Object id, String text, Object parentId,boolean isFolder){   
       this.id=id;   
        this.text=text;   
        this.parentId=parentId;   
        this.isFolder=isFolder;   
    }   
       
    public SimpleTreeNode(Object id, String text, Object parentId,boolean isFolder,HashMap<String,Object> attrs){   
        this.id=id;   
        this.text=text;   
        this.parentId=parentId;   
        this.isFolder=isFolder;   
       this.attrs=attrs;   
    }   
       
    public void addAttribute(String key,Object value){   
        this.attrs.put(key, value);   
    }   
       
   public Object getId() {   
        return id;   
    }   
    public void setId(Object id) {   
        this.id = id;   
    }   
    public String getText() {   
        return text;   
   }   
    public void setText(String text) {   
        this.text = text;   
    }   
    public Object getParentId() {   
        return parentId;   
   }   
    public void setParentId(Object parentId) {   
        this.parentId = parentId;   
    }   
  
    public boolean isFolder() {   
        return isFolder;   
    }   
  
    public void setFolder(boolean isFolder) {   
        this.isFolder = isFolder;   
    }   
  
   public HashMap<String, Object> getAttrs() {   
        return attrs;   
    }   
  
    public void setAttrs(HashMap<String, Object> attrs) {   
        this.attrs = attrs;   
    }   
       
       
       
}  

