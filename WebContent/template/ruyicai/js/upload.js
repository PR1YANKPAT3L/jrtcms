function ajaxFileUpload(upload,type)
    {
	    var fileName=$("#upload").val();
	    if(fileName == ""){
	    	 openAlert(decodeURI(EncodeUtf8("您选择的球不能构成一注彩票！请检查您选择的号码。")));
			return false;
		}
	    var file=fileName.substring(fileName.indexOf(".")+1,fileName.length);
	    	if(!(file=="txt")){
	    		$("#upload").val("");
	    		$(".UploadFileInput").val("");
			 openAlert(decodeURI(EncodeUtf8("您上传的必须是txt文本文件。")));
			return false;
		}
		$.ajaxFileUpload
          (
            {
                 url:'/chlw/function/upload!doUploadFile?type='+type, //你处理上传文件的服务端
                 secureuri:false,
                 fileElementId:upload,
                 dataType: 'json',
                 success: function (data)
                   {
                		if(data.bool){
                			
                					var multiple = Number($("#tb_Multiple").val());
                					$("#codes").append("<li class='numberlan' onmouseover='add_css($(this));' >单式上传   <input type='hidden' name='hidpath' value='#"+data.errorCode+"@#"+data.realpath+"' /><font class='blue'><a target='_blank' href='"+data.uploadFileName+"'>查看详情</a></font> 投注金额"+data.rmb+"元 <a href=\"javascript:btn_ClearSelectdanshio("+data.okNum+","+data.rmb+",'"+data.real+"')\" id='btn_ClearSelect' title='"+decodeURI(EncodeUtf8('删除'))+"'><span class='numberdel'>"+decodeURI(EncodeUtf8('删除'))+"</span></a></li>");
                					$("#list_LotteryNumber").append("<option id='单式上传' value='' wangfang='dssc'>单式上传</option>");
                					$("#lab_Num").text(Number($("#lab_Num").text())+data.okNum);
                					if($("#oneMoney").attr("checked")=='checked' && $("#zhuijia").is(":visible")){ 
                						$("#investField").text(Number($("#investField").text())+data.rmb*multiple*3/2);
                					}else{
                						$("#investField").text(Number($("#investField").text())+data.rmb*multiple);
                					}
									$("#current_money").text(Number($("#current_money").text())+data.rmb);
									$("#upload").val("");
									$(".UploadFileInput").val("");
									//追号设置 用的
									if($("#daiGouHemai") != null && $("#qishuList") != null  && ($("#daiGouHemai").val()=="zhuihao" || $("#daiGouHemai").val()=="ziyouZhuihao")){
										setQishuList(55,$('#betchZhuihaoNum').val(),false,'qishuList',$('#lotNo').val());
									}
									if($("#lotNo").val()=="F47104"||$("#lotNo").val()=="T01001"){
										chooseBallToMoney();
									}
                        		}else{
                            		if(data.rmb==0){
                            					openAlert(decodeURI(EncodeUtf8("抱歉，您上传的格式全不正确，请参照标准格式。")));
		                            			$("#upload").val("");
		    									$(".UploadFileInput").val("");
												$.ajax({
	                                				type: "POST",
	                            				    url: "/chlw/function/upload!deleteFile?path="+data.realpath
	                            				   });
                                		}else{
		                    			if(confirm(decodeURI(EncodeUtf8("您选择的有"+data.errorNum+"行错误，确认提交有效注数吗？")))){
		                    				var multiple = Number($("#tb_Multiple").val());
		                    				$("#codes").append("<li class='numberlan' onmouseover='add_css($(this));' >单式上传   <input type='hidden' name='hidpath' value='#"+data.errorCode+"@#"+data.realpath+"' /><font class='blue'><a target='_blank' href='"+data.uploadFileName+"'>查看详情</a></font> 投注金额"+data.rmb+"元 <a href=\"javascript:btn_ClearSelectdanshio("+data.okNum+","+data.rmb+",'"+data.real+"')\" id='btn_ClearSelect' title='"+decodeURI(EncodeUtf8('删除'))+"'><span class='numberdel'>"+decodeURI(EncodeUtf8('删除'))+"</span></a></li>");	
		                    				$("#list_LotteryNumber").append("<option id='单式上传' value='' wangfang='dssc'>单式上传</option>");
		                    					$("#lab_Num").text(Number($("#lab_Num").text())+data.okNum);
		                    					if($("#oneMoney").attr("checked")=='checked' && $("#zhuijia").is(":visible")){ 
		                    						$("#investField").text(Number($("#investField").text())+data.rmb*multiple*3/2);
		                    					}else{
		                    						$("#investField").text(Number($("#investField").text())+data.rmb*multiple);
		                    					}
		    									$("#current_money").text(Number($("#current_money").text())+data.rmb);
		                            			$("#upload").val("");
		    									$(".UploadFileInput").val("");
		    									//追号设置 用的
		    									if($("#daiGouHemai") != null && $("#qishuList") != null  && ($("#daiGouHemai").val()=="zhuihao" || $("#daiGouHemai").val()=="ziyouZhuihao")){
		    										setQishuList(55,$('#betchZhuihaoNum').val(),false,'qishuList',$('#lotNo').val());
		    									}
		    									if($("#lotNo").val()=="F47104"||$("#lotNo").val()=="T01001"){
		    										chooseBallToMoney();
		    									}
		                    				}else{
		                            			$("#upload").val("");
		    									$(".UploadFileInput").val("");
		                            				$.ajax({
		                                				type: "POST",
		                            				    url: "/chlw/function/upload!deleteFile?path="+data.realpath
		                            				   });
		                            		}
                            		}
                        	}   
                    }    
           		 })
            return false;
      }

	function showDiv(){
			$("#yb").css("display","block");
		}
	function closeDiv(){
		$("#yb").css("display","none");	
	}

	$(function() {
		$(".UploadFileBGpub[type='file']").change(function(){
			$(".UploadFileInputpub").attr("value", $(".UploadFileBGpub").attr("value"));
		});
	});
	
	function getType(){
		return $("#type").val();
	}