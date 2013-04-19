<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java"  pageEncoding="utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.util.UUID" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
body,td,th {
	font-size: 12px;
}
-->
</style>
<script src="/jquery_jar/formValidator/jquery_last.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="/jquery_jar/formValidator/style/validator.css"></link>
<script src="/jquery_jar/formValidator/formValidator.js" type="text/javascript" charset="UTF-8"></script>
<script src="/jquery_jar/formValidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script src="/jquery_jar/formValidator/jquery_last.js" type="text/javascript"></script>
<script type="text/javascript" src="/jquery_jar/jquery.js"></script>
<link type="text/css" rel="stylesheet" href="/jquery_jar/formValidator/style/validator.css"></link>
<script src="/jquery_jar/formValidator/formValidator.js" type="text/javascript" charset="UTF-8"></script>
<script src="/jquery_jar/formValidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script language="javascript" type="text/javascript" src="/jquery_jar/jQuery.FillOptions.js"></script>
<script language="javascript" type="text/javascript" src="/jquery_jar/jQuery.CascadingSelect.js"></script>

<script language="javascript" type="text/javascript">
$(function(){
		$("#Category0").FillOptions("/web/newsCategory!getCategoryByPcode?pcode=-1",{datatype:"json",textfield:"name_cn",valuefiled:"code"});
		$("#Category0").AddOption("请选择","-1",true,0);
		//当触发一级分类的select的时候，如果选择的是值为-1的“请选择”则频道不是子分类 0为首分类 1为子分类
		$("#Category0").change(function(){if($(this).val()==-1){$("#leaf").val("0");}else{$("#leaf").val("1");}});
});



function categoryTree(treeId)
{
	$("#"+treeId).toggle();
	if($("#"+treeId).css('display')=='none'){
		$("#Tree_"+treeId).html("[ + ]");
	}else{
		$("#Tree_"+treeId).html("[ - ]");
	}
} 
function updateCategory(id){
	var name_cn_input = "Tree_name_cn_"+id;
	var name_zh_input = "Tree_name_zh_"+id;
	var template_id_input = "Tree_template_id_"+id;
	var sequence_input = "Tree_sequence_"+id;
	var description_input = "Tree_description_"+id;
	var name_cn = $("input[name="+name_cn_input+"]").attr("value"); 
	var name_zh = $("input[name="+name_zh_input+"]").attr("value");
	var template_id = $("select[name="+template_id_input+"]").val();  
	var sequence = $("select[name="+sequence_input+"]").val();
	var description = $("input[name="+description_input+"]").attr("value");

	var modelName = "newsCategoryMD";
	//alert('/web/newsChannel!modify?'+modelName+'.code='+id+'&'+modelName+'.name_cn='+name_cn+'&'+modelName+'.name_zh='+name_zh+'&'+modelName+'.template_id='+template_id+'&'+modelName+'.sequence='+sequence);
	name_cn = encodeURI(encodeURI(name_cn));
	description = encodeURI(encodeURI(description));
	//for(b in $.browser) if(b=='msie'){name_cn = encodeURI(name_cn)};
	//for(b in $.browser) if(b=='msie'){description = encodeURI(description)};
	$.ajax({   
        url:'/web/newsCategory!modify?'+modelName+'.code='+id+'&'+modelName+'.name_cn='+
        	name_cn+'&'+modelName+'.name_zh='+name_zh+'&'+modelName+'.template_id='+template_id+'&'+modelName+'.sequence='+sequence+'&'+modelName+'.description='+description,   
        type:'post', //数据发送方式   
        dataType:'html', //接受数据格式   
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        error:function(html){alert( "保存失败!操作发生错误"+html);},  
        async: false ,  
        success: function(html){alert(html);}  
  });  
	
}
</script>
<script type="text/javascript">
$(function(){
	
	$.formValidator.initConfig({formid:"createCategory",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
	$("#createCate").click(function(){
		document.getElementById("new_category").style.display="block";
	});
	$("#namecn").formValidator({onshow:"请输入分类名称 ",onfocus:"分类名称不能为空 ",oncorrect:"正确"}).inputValidator({empty:{leftempty:false,rightempty:false,emptyerror:"字符两边不能有空符号"},min:1,onerror:"分类名称不能为空,请确认"});
	$("#cateSpell").formValidator({onshow:"请输入分类的拼音名称   ",oncorrect:"恭喜你输入正确",empty:true}).inputValidator({}).regexValidator({regexp:"^[a-zA-Z]{1}[a-zA-Z0-9_]{3,15}$",onerror:"分类拼音名称必须以字母开头,只能包括字母和数字 ，或输入的字符长度不够  "});
		
});


</script>

</head>
<body>
  <p>
    <input type="button" name="new" value="创建分类" onclick="document.getElementById('new_category').style.display='block'" id="createCate"/>
    <input type="button" name="cat_block" value="移动分类" onclick="document.getElementById('cat').style.display='block'"/>
</p>
<div id="new_category" style="display:none" >
<form action="/web/newsCategory!create"  method="post" id="createCategory">
  <p id="category_select">
  <input type="hidden" id="leaf" name="newsCategoryMD.leaf" value="0" />
  <input type="hidden" id="pcode" name="newsCategoryMD.pcode" value="-1" />
    <select id="Category0" name="Category0" onchange="selectLin(0,'Category')">
    </select>
  </p>
  
  <p>分类名字：
    <input type="text" name="newsCategoryMD.name_cn"  id="namecn"/>拼音(可以为空):<input name="newsCategoryMD.name_zh" type="text" id="cateSpell"  />描述 (可以为空)：<input name="newsCategoryMD.description" type="text" id="description"  />
  排序：<select name="newsCategoryMD.sequence">
	<option value="0">最低</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5" selected="selected">默认</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">最高</option>
    </select> 					
	<select name="newsCategoryMD.template_id">
	
      <option value="0" <s:if test="#newsCategoryMD.template_id==0" >selected</s:if>>默认</option>
      <s:iterator value="#request.models" id="model">
	<option value="${model.id }"
	<s:if test="#newsCategoryMD.template_id==#model.id "> selected </s:if>> ${model.name }</option>
	</s:iterator> 
    </select>
  <input type="submit" name="new_save" value="保存" id="button" />
  <input type="button" name="new_cancel" value="取消" onclick="document.getElementById('new_category').style.display='none'"/>
  </p>
</form>
</div>
  <div id="cat" style="display:none" >
    <p>目标分类：
      <select name="select6">
        <option value="0">请选择分类</option>
        <s:iterator  value="#request.CategoryList"  id="NewsCategory">
  		<option value="<s:property value="id"/>"><s:property value="name_cn"/></option>
  		 </s:iterator>
      </select>
      <select name="select6">
        <option value="0">{动态菜单-子分类}</option>
      </select>
    </p>
    <p>移动到：
      <select name="select7">
        <option value="0">请选择分类</option>
        <option value="1">分类1</option>
        <option value="2">分类2</option>
      </select>
      <select name="select7">
        <option value="0">{动态菜单-子分类}</option>
      </select>
      下
      <input type="button" name="cat_ok" value="确定" />
      <input type="button" name="cat_cancel" value="取消" onclick="document.getElementById('cat').style.display='none'"/>
    </p>
    </div>
  <hr />
<table width="1300px" border="0" cellspacing="0" >
	  <tr>
        <td width="35%">分类名称｛拼音｝</td>
         <td >分类描述</td>
        <td width="7%" align="center">模版</td>
        <td width="7%" align="center">优先级<br />
        [低0-10高]</td>
        <td width="46%" align="center">操作</td>
      </tr>
      
      
<s:iterator id="cl" value="#request.CategoryList" >
	<s:if test="#cl.leaf==0">
	      <tr>
	        <td><a href="#" id="Tree_${cl.code}" onclick="categoryTree('${cl.code}')">[ + ]</a>
	        <input type="text" name="Tree_name_cn_${cl.code}" value="${cl.name_cn}" id="name_cn"/>
	      {${cl.name_zh}} <input name="Tree_name_zh_${cl.code}" type="hidden" value="${cl.name_zh}"/></td>
	      <td width="17%" align="center">
	      <input type="text" name="Tree_description_${cl.code}" value="${cl.description}" id="description" style="width:300px"/></td>
	        <td align="center"><select name="Tree_template_id_${cl.code}">
	          	<option value="0" <s:if test="#cl.template_id==0" >selected</s:if>>默认</option>
      			<s:iterator value="#request.models" id="model">
				<option value="${model.id }"
				<s:if test="#cl.template_id==#model.id"> selected </s:if>> ${model.name }</option>
				</s:iterator> 
	        </select></td>
	        <td align="center"><select name="Tree_sequence_${cl.code}">
					<option value="0" <s:if test="#cl.sequence==0" >selected</s:if>>最低</option>
					<option value="1" <s:if test="#cl.sequence==1" >selected</s:if>>1</option>
					<option value="2" <s:if test="#cl.sequence==2" >selected</s:if>>2</option>
					<option value="3" <s:if test="#cl.sequence==3" >selected</s:if>>3</option>
					<option value="4" <s:if test="#cl.sequence==4" >selected</s:if>>4</option>
					<option value="5" <s:if test="#cl.sequence==5" >selected</s:if>>默认</option>
					<option value="6" <s:if test="#cl.sequence==6" >selected</s:if>>6</option>
					<option value="7" <s:if test="#cl.sequence==7" >selected</s:if>>7</option>
					<option value="8" <s:if test="#cl.sequence==8" >selected</s:if>>8</option>
					<option value="9" <s:if test="#cl.sequence==9" >selected</s:if>>9</option>
					<option value="10" <s:if test="#cl.sequence==10" >selected</s:if>>最高</option>
			    </select> 
			</td>
	        <td><a href="/web/newsCategory!del?newsCategory.code=${cl.code}" onclick="return confirm('确实要删除该分类吗？')" >[ 删除  ]</a>
				<a href="javascript:updateCategory(${cl.code})" >[ 保存  ]</a>
				 [ <a href="/web/newsTemplate!jspToHtmlByCategoryOnline?code=${cl.code}">生成</a> ] [ 上线 ] [ <a target="_blank" href="/web/newsTemplate!jspToHtmlByCategory?code=${cl.code}">预览 </a>] </td>
	      </tr>
		  <tr >
	        <td colspan="5">
		    <table width="98%" border="0" cellspacing="0"  align="right" id="${cl.code}" style="display:none">
		    <s:iterator id="cl_1" value="#request.CategoryList_z[#cl.code]" >
		      <tr>
		        <td><a href="#" id="Tree_${cl_1.value.code}" onclick="categoryTree('${cl_1.value.code}')">[ + ]</a>
		        <input type="text" name="Tree_name_cn_${cl_1.value.code}" value="${cl_1.value.name_cn}" />{${cl_1.value.name_zh}}
		        <input type="hidden"" name="Tree_name_zh_${cl_1.value.code}" value="${cl_1.value.name_zh}" />
		        </td>
		        <td><input type="text" name="Tree_description_${cl_1.value.code}" value="${cl_1.value.description}" style="width:300px"/></td>
		        <td align="center" width="7%"><select name="Tree_template_id_${cl_1.value.code}">
		          	<option value="0" <s:if test="#cl_1.value.template_id==0" >selected</s:if>>默认</option>
	      			<s:iterator value="#request.models" id="model">
					<option value="${model.id }"
					<s:if test="#cl_1.value.template_id==#model.id "> selected </s:if>> ${model.name }</option>
					</s:iterator> 
	        	</select></td>
		        <td align="center" width="7%">
		        	<select name="Tree_sequence_${cl_1.value.code}">
					<option value="0" <s:if test="#cl_1.value.sequence==0" >selected</s:if>>最低</option>
					<option value="1" <s:if test="#cl_1.value.sequence==1" >selected</s:if>>1</option>
					<option value="2" <s:if test="#cl_1.value.sequence==2" >selected</s:if>>2</option>
					<option value="3" <s:if test="#cl_1.value.sequence==3" >selected</s:if>>3</option>
					<option value="4" <s:if test="#cl_1.value.sequence==4" >selected</s:if>>4</option>
					<option value="5" <s:if test="#cl_1.value.sequence==5" >selected</s:if>>默认</option>
					<option value="6" <s:if test="#cl_1.value.sequence==6" >selected</s:if>>6</option>
					<option value="7" <s:if test="#cl_1.value.sequence==7" >selected</s:if>>7</option>
					<option value="8" <s:if test="#cl_1.value.sequence==8" >selected</s:if>>8</option>
					<option value="9" <s:if test="#cl_1.value.sequence==9" >selected</s:if>>9</option>
					<option value="10" <s:if test="#cl_1.value.sequence==10" >selected</s:if>>最高</option>
		    		</select>
		    	</td>
		        <td width="37%" >
		        	<a href="/web/newsCategory!del?newsCategory.code=${cl_1.value.code}" onclick="return confirm('确实要删除该分类吗？')">[ 删除  ]</a>
					<a href="javascript:updateCategory(${cl_1.value.code})" >[ 保存  ]</a>
					 [ <a href="/web/newsTemplate!jspToHtmlByCategoryOnline?code=${cl_1.value.code}">生成</a> ] [ 上线 ] [<a target="_blank" href="/web/newsTemplate!jspToHtmlByCategory?code=${cl_1.value.code}">预览 </a>] </td>
		      </tr>
			  <tr>
		        <td colspan="5">
		           
		           
		            <table width="98%" border="0" cellspacing="0"  align="right" id="${cl_1.value.code}" style="display:none">
					    <s:iterator id="cl_2" value="#request.CategoryList_z[#cl_1.value.code]" >
					      <tr>
					        <td><a href="#" id="Tree_${cl_2.value.code}" onclick="categoryTree('${cl_2.value.code}')">[ + ]</a>
					        <input type="text" name="Tree_name_cn_${cl_2.value.code}" value="${cl_2.value.name_cn}" />{${cl_2.value.name_zh}}
					       <input type="hidden" name="Tree_name_zh_${cl_2.value.code}" value="${cl_2.value.name_zh}" /></td>
					       <td><input type="text" name="Tree_description_${cl_2.value.code}" value="${cl_2.value.description}" style="width:300px"/></td>
					        <td align="center" width="7%"><select name="Tree_template_id_${cl_2.value.code}">
					          	<option value="0" <s:if test="#cl_2.value.template_id==0" >selected</s:if>>默认</option>
				      			<s:iterator value="#request.models" id="model">
							<option value="${model.id }"
							<s:if test="#cl_2.value.template_id==#model.id "> selected </s:if>> ${model.name }</option>
							</s:iterator> 
				        	</select></td>
					        <td align="center" width="7%">
					        	<select name="Tree_sequence_${cl_2.value.code}">
								<option value="0" <s:if test="#cl_2.value.sequence==0" >selected</s:if>>最低</option>
								<option value="1" <s:if test="#cl_2.value.sequence==1" >selected</s:if>>1</option>
								<option value="2" <s:if test="#cl_2.value.sequence==2" >selected</s:if>>2</option>
								<option value="3" <s:if test="#cl_2.value.sequence==3" >selected</s:if>>3</option>
								<option value="4" <s:if test="#cl_2.value.sequence==4" >selected</s:if>>4</option>
								<option value="5" <s:if test="#cl_2.value.sequence==5" >selected</s:if>>默认</option>
								<option value="6" <s:if test="#cl_2.value.sequence==6" >selected</s:if>>6</option>
								<option value="7" <s:if test="#cl_2.value.sequence==7" >selected</s:if>>7</option>
								<option value="8" <s:if test="#cl_2.value.sequence==8" >selected</s:if>>8</option>
								<option value="9" <s:if test="#cl_2.value.sequence==9" >selected</s:if>>9</option>
								<option value="10" <s:if test="#cl_2.value.sequence==10" >selected</s:if>>最高</option>
					    		</select>
					    	</td>
					        <td width="37%" >
					        	<a href="/web/newsCategory!del?newsCategory.code=${cl_2.value.code}" onclick="return confirm('确实要删除该分类吗？')">[ 删除  ]</a>
								<a href="javascript:updateCategory(${cl_2.value.code})" >[ 保存  ]</a>
								 [ <a href="/web/newsTemplate!jspToHtmlByCategoryOnline?code=${cl_2.value.code}">生成</a> ] [ 上线 ] [ <a target="_blank" href="/web/newsTemplate!jspToHtmlByCategory?code=${cl_2.value.code}">预览 </a> ] </td>
					      </tr>
						  <tr>
					        <td colspan="4">
					        	
					        	<table width="98%" border="0" cellspacing="0"  align="right" id="${cl_2.value.code}" style="display:none">
								    <s:iterator id="cl_3" value="#request.CategoryList_z[#cl_2.value.code]" >
								      <tr>
								        <td><a href="#" id="Tree_${cl_3.value.code}" onclick="categoryTree('${cl_3.value.code}')">[ + ]</a>
								        <input type="text" name="Tree_name_cn_${cl_3.value.code}" value="${cl_3.value.name_cn}" />{${cl_3.value.name_zh}}
								        <input type="hidden"" name="Tree_name_zh_${cl_3.value.code}" value="${cl_3.value.name_zh}" /></td>
								        <td><input type="text" name="Tree_description_${cl_3.value.code}" value="${cl_3.value.description}" style="width:300px"/></td>
								        <td align="center" width="7%"><select name="Tree_template_id_${cl_3.value.code}">
								          	<option value="0" <s:if test="#cl_3.value.template_id==0" >selected</s:if>>默认</option>
							      			<s:iterator value="#request.models" id="model">
											<option value="${model.id }"
											<s:if test="#cl_3.value.template_id==#model.id "> selected </s:if>> ${model.name }</option>
											</s:iterator> 
							        	</select></td>
								        <td align="center" width="7%">
								        	<select name="Tree_sequence_${cl_3.value.code}">
											<option value="0" <s:if test="#cl_3.value.sequence==0" >selected</s:if>>最低</option>
											<option value="1" <s:if test="#cl_3.value.sequence==1" >selected</s:if>>1</option>
											<option value="2" <s:if test="#cl_3.value.sequence==2" >selected</s:if>>2</option>
											<option value="3" <s:if test="#cl_3.value.sequence==3" >selected</s:if>>3</option>
											<option value="4" <s:if test="#cl_3.value.sequence==4" >selected</s:if>>4</option>
											<option value="5" <s:if test="#cl_3.value.sequence==5" >selected</s:if>>默认</option>
											<option value="6" <s:if test="#cl_3.value.sequence==6" >selected</s:if>>6</option>
											<option value="7" <s:if test="#cl_3.value.sequence==7" >selected</s:if>>7</option>
											<option value="8" <s:if test="#cl_3.value.sequence==8" >selected</s:if>>8</option>
											<option value="9" <s:if test="#cl_3.value.sequence==9" >selected</s:if>>9</option>
											<option value="10" <s:if test="#cl_3.value.sequence==10" >selected</s:if>>最高</option>
								    		</select>
								    	</td>
								        <td width="37%" >
								        	<a href="/web/newsCategory!del?newsCategory.code=${cl_3.value.code}" onclick="return confirm('确实要删除该分类吗？')">[ 删除  ]</a>
											<a href="javascript:updateCategory(${cl_3.value.code})" >[ 保存  ]</a>
											 [ <a href="/web/newsTemplate!jspToHtmlByCategoryOnline?code=${cl_3.value.code}">生成</a> ] [ 上线 ] [ <a target="_blank" href="/web/newsTemplate!jspToHtmlByCategory?code=${cl_3.value.code}">预览 </a> ] </td>
								      </tr>
									  <tr>
								        <td colspan="4">
								        	
								        	<table width="98%" border="0" cellspacing="0"  align="right" id="${cl_3.value.code}" style="display:none">
											    <s:iterator id="cl_4" value="#request.CategoryList_z[#cl_3.value.code]" >
											      <tr>
											        <td><a href="#" id="Tree_${cl_4.value.code}" onclick="categoryTree('${cl_4.value.code}')">[ + ]</a>
											        <input type="text" name="Tree_name_cn_${cl_4.value.code}" value="${cl_4.value.name_cn}" />{${cl_4.value.name_zh}}
											        <input type="hidden"" name="Tree_name_zh_${cl_4.value.code}" value="${cl_4.value.name_zh}" /></td>
											        <td><input type="text" name="Tree_description_${cl_4.value.code}" value="${cl_4.value.description}" style="width:300px"/></td>
											        <td align="center" width="7%"><select name="Tree_template_id_${cl_4.value.code}">
											          	<option value="0" <s:if test="#cl_4.value.template_id==0" >selected</s:if>>默认</option>
										      			<s:iterator value="#request.models" id="model">
														<option value="${model.id }"
														<s:if test="#cl_4.value.template_id==#model.id "> selected </s:if>> ${model.name }</option>
														</s:iterator> 
										        	</select></td>
											        <td align="center" width="7%">
											        	<select name="Tree_sequence_${cl_4.value.code}">
														<option value="0" <s:if test="#cl_4.value.sequence==0" >selected</s:if>>最低</option>
														<option value="1" <s:if test="#cl_4.value.sequence==1" >selected</s:if>>1</option>
														<option value="2" <s:if test="#cl_4.value.sequence==2" >selected</s:if>>2</option>
														<option value="3" <s:if test="#cl_4.value.sequence==3" >selected</s:if>>3</option>
														<option value="4" <s:if test="#cl_4.value.sequence==4" >selected</s:if>>4</option>
														<option value="5" <s:if test="#cl_4.value.sequence==5" >selected</s:if>>默认</option>
														<option value="6" <s:if test="#cl_4.value.sequence==6" >selected</s:if>>6</option>
														<option value="7" <s:if test="#cl_4.value.sequence==7" >selected</s:if>>7</option>
														<option value="8" <s:if test="#cl_4.value.sequence==8" >selected</s:if>>8</option>
														<option value="9" <s:if test="#cl_4.value.sequence==9" >selected</s:if>>9</option>
														<option value="10" <s:if test="#cl_4.value.sequence==10" >selected</s:if>>最高</option>
											    		</select>
											    	</td>
											        <td width="37%" >
											        	<a href="/web/newsCategory!del?newsCategory.code=${cl_4.value.code}" >[ 删除  ]</a>
														<a href="javascript:updateCategory(${cl_4.value.code})" >[ 保存  ]</a>
														 [ <a href="/web/newsTemplate!jspToHtmlByCategoryOnline?code=${cl_4.value.code}">生成</a> ] [ 上线 ] [ <a target="_blank" href="/web/newsTemplate!jspToHtmlByCategory?code=${cl_4.value.code}">预览 </a> ] </td>
											      </tr>
												  <tr>
											        <td colspan="4">
											        
													
													</td>
											      </tr>
											   
											</s:iterator>  
											</table>
										
										</td>
								      </tr>
								   
								</s:iterator>  
								</table>
					        	
							
							</td>
					      </tr>
					   
					</s:iterator>  
					</table>
				
				</td>
		      </tr>
		   
		</s:iterator>  
		</table>
		
		
		
		
		
		</td>
      </tr>
   </s:if>
</s:iterator>   
    </table>
  <p>实例说明：</p>
  <p>1.创建分类：创建分类时将隐藏的表单显示，填好后，点击【保存】按钮，即可提交表单（get方式）。点击【取消】则再次隐藏表单。</p>
  <p class="STYLE1">2.移动分类：将已经创建好的转移到另一个分类下，此功能不适用与使用以编号为Key的形式，更适用与自动生成ID并将ID作为子分类的｛父分类ID｝字段的值的形式。此功能可以在1.0版本中不做，但是必须考虑进去。</p>
  <p>3.删除：用jquery的ajax方式进行删除，删除成功后隐藏要删除的那行记录，删除操作为｛假删除｝。删除后，所有的子分类也无法再被获取，超过一定的时间后，可以通过清理垃圾数据程序将无用的数据清理掉。<span class="STYLE1">此处需要在数据库中增加一个state字段，标识删除状态</span>。</p>
  <p>4.保存：即编辑功能。所有的内容都展现在文本框中，具体的命名方式请查看源代码。提交方式为jquery。</p>
  <p>5.上线/下线：新的分类创建好后，前台使用状态（showflag）默认为&quot;否&quot;，但在后台是可以使用的，当点击上线，则会在前台的分类列表中显示。按钮的名字则变为【下线】。再点下线，则恢复初始状态。</p>
  <p>6.生成：将该分类的专有页面，重新生成。</p>
  <p>7.预览：弹出新窗口，访问jsp页面。</p>
</body>
</html>
