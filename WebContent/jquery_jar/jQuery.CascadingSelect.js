/*
* jQuery CascadingSelect AddOption
*
* Author: luq885
* http://blog.csdn.net/luq885 (chinese) 
*
* Licensed like jQuery, see http://docs.jquery.com/License
*
* ���ߣ���������
* blog: http://blog.csdn.net/luq885
*/

var selectCount = 0;
jQuery.fn.CascadingSelect = function(target,url,options,endfn,selName){
    $.ajaxSetup({async:false});        
	//if(target[0].tagName != "SELECT") throw "target must be SELECT";
    if(url.length == 0) throw "request is required";            
    if(options.parameter == undefined) throw "parameter is required";
	
    //this.change(function(){
		var newurl = "";
		urlstr = url.split("?");
		newurl = urlstr[0] + "?" + options.parameter + "=" + $(this).val() + "&" +urlstr[1];
		
		if($(this).val()!=-1){//正常顺序选择时调用
			$("#pcode").val($(this).val());
		}else{//选择之前父频道时调用
			if(selectCount==0){//如果重选了一级分类，则运行如下
				$("#pcode").val(-1);
			}else{//其他级别分类，则运行如下。
				$("#pcode").val($("select[name="+selName+(selectCount-1)+"]").val());
			}
		}	
		if ($("select[name="+selName+(selectCount+1)+"]").length > 0) {
			
		}else if($(this).val()>=0){
            //创建Select   
            var category = $("<select>");   
            $(category).attr("name", selName+(selectCount+1)); 
            $(category).attr("id", selName+(selectCount+1));
            $(category).attr("onChange", "selectLin("+(selectCount+1)+",'"+selName+"')");
            //$(category)[0].options.add(new Option("请选择", "-2"));   
            $("#category_select").append(category);
            $("#body").append(category);
            $("select[name="+selName+(selectCount+1)+"]").FillOptions(newurl,options);
		}
		if(typeof endfn =="function") endfn();
    //});
}

jQuery.fn.AddOption = function(text,value,selected,index){
    option = new Option(text,value);            
	this[0].options.add(option,index);
	this[0].options[index].selected = selected;
}
//<input type="hidden" id="leaf" name="newsCategoryMD.leaf" value="0" />
//<input type="hidden" id="pcode" name="newsCategoryMD.pcode" value="-1" />
//该功能需要如上两个隐藏于进行辅助，一个标识是否为子分类，另一个标识当前所选择的父分类
function selectLin(id,selName){
	
	for(var i = selectCount+1 ; i > id; i--){
		$("select[name="+selName+i+"]").remove();
	}
	selectCount = id;
	$("select[name="+selName+id+"]").CascadingSelect(
			$("select[name="+selName+id+"]"),
			"/web/newsCategory!getCategoryByPcode",
			{datatype:"json",textfield:"name_cn",valuefiled:"code",parameter:"pcode"},
			function(){
				$("select[name="+selName+(selectCount+1)+"]").AddOption("请选择",-1,true,0);
			},
			selName
		);
	
}
