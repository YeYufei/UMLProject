$(document).ready(function(){
	//基本信息单击事件
	$("#info").click(function(){
		$(this).css({"color":"red"});
		$("#connect").css({"color":"blue"});
		$("#image").css({"color":"blue"});
		$("#password").css({"color":"blue"});
		$("#infoDiv").css({"display":"block"});
		$("#connectDiv").css({"display":"none"});
		$("#imageDiv").css({"display":"none"});
		$("#passswordDiv").css({"display":"none"});
	});
	
	//联系方式单击事件
	$("#connect").click(function(){
		$(this).css({"color":"red"});
		$("#info").css({"color":"blue"});
		$("#image").css({"color":"blue"});
		$("#password").css({"color":"blue"});
		$("#infoDiv").css({"display":"none"});
		$("#connectDiv").css({"display":"block"});
		$("#imageDiv").css({"display":"none"});
		$("#passswordDiv").css({"display":"none"});
	});
	
	//修改头像单击事件
	$("#image").click(function(){
		$(this).css({"color":"red"});
		$("#info").css({"color":"blue"});
		$("#connect").css({"color":"blue"});
		$("#password").css({"color":"blue"});
		$("#infoDiv").css({"display":"none"});
		$("#connectDiv").css({"display":"none"});
		$("#imageDiv").css({"display":"block"});
		$("#passswordDiv").css({"display":"none"});
	});
	
	//修改密码单击事件
	$("#password").click(function(){
		$(this).css({"color":"red"});
		$("#info").css({"color":"blue"});
		$("#image").css({"color":"blue"});
		$("#connect").css({"color":"blue"});
		$("#infoDiv").css({"display":"none"});
		$("#connectDiv").css({"display":"none"});
		$("#imageDiv").css({"display":"none"});
		$("#passswordDiv").css({"display":"block"});
	});
	
	
	//鼠标移入保存资料按钮事件
	//$(".saveInfoBtn").hover(function(){
	//	$(this).attr({src:"images/saveInfo_2.png"});
	//},function(){
	//	$(this).attr({src:"images/saveInfo_1.png"});
	//});
	
	//鼠标移出保存资料按钮事件
	//$(".saveInfoBtn").mouseout()function(){
	//	$(this).attr({src:"images/saveInfo_1.png"});
	//};
	
	//保存用户基本资料
	$("#saveInfoBtn_1").click(function(){
		var sex =  $("input[name=sex][checked]").val();
		var birthday = $("input[name=birthday]").val();
		var address = $("input[name=address]").val();
		var website = $("input[name=website]").val();
		var usersign = $("input[name=usersign]").val();
		var introduction = $("textarea[name=introduction]").val();
		var postsign = $("textarea[name=postsign]").val();
		var birthdayPatrn = /^\d{4}-\d{2}-\d{2}$/;
		if(birthday!='' && !birthdayPatrn.exec(birthday)){
			alert("日期格式不正确");
			return false;
		}else if(address.length>300){
			alert("网址太长，长度限300字节");
			return false;
		}else if(website.length>100){
			alert("网址太长，长度限100字节");
			return false;
		}else if(usersign.length>100){
			alert("个性签名太长，长度限100字节");
			return false;
		}else if(introduction.length>500){
			alert("自我简介太长，长度限500字节");
			return false;
		}else if(postsign.length>500){
			alert("帖子签名太长，长度限1000字节");
			return false;
		}else{
			$.ajax({
		 		   url:'system/user-updateUserBasicInfo.action',
		 		   type:"POST",
		 		   cache : false,
		 		   dataType : "json",
		 		   data : { 
		 			  'userInfoVO.sex': $.trim(sex),
					   	'userInfoVO.birthday': $.trim(birthday),
					   	'userInfoVO.webSite': $.trim(website),
					   	'userInfoVO.address': $.trim(address),
					   	'userInfoVO.userSign': $.trim(usersign),
					   	'userInfoVO.introduction':$.trim(introduction),
					   	'userInfoVO.postSign':$.trim(postsign)
					   	},
		 		   success:function(entry) {
		 			  if(entry.success==true){
							alert("保存成功！");
							return true;
						}else{
							alert("系统出错，请与管理员联系！");
							return false;
						}
		 		    },
		 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
		 		    	alert("系统出错，请与管理员联系！");
						return false;
		 		    	//alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
				   	}});
		}
	});
	
	//保存用户联系方式
	$("#saveInfoBtn_2").click(function(){
		var telephone = $("input[name=telephone]").val();
		var mobile = $("input[name=mobile]").val();
		var qq = $("input[name=qq]").val();

		$.ajax({
	 		   url:'system/user-updateUserConnectInfo.action',
	 		   type:"POST",
	 		   cache : false,
	 		   dataType : "json",
	 		   data : { 
	 			  'userInfoVO.telephone': $.trim(telephone),
				   	'userInfoVO.mobile': $.trim(mobile),
				   	'userInfoVO.qq': $.trim(qq),
				   	'userInfoVO.msn': $.trim(msn)
				   	},
	 		   success:function(entry) {
	 			  if(entry.success==true){
						alert("保存成功！");
						return true;
					}else{
						alert("系统出错，请与管理员联系！");
						return false;
					}
	 		    },
	 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
	 		    	alert("系统出错，请与管理员联系！");
					return false;
	 		    	//alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
			   	}});
	});
	
	//保存用户密码
	$("#saveInfoBtn_4").click(function(){
		var oldPassword= $("input[name=old_password]").val();
		var userpwd = $("input[name=userpwd]").val();
		var userpwdConfirm = $("input[name=userpwd_confirm]").val();
		if(oldPassword.length<6){
			alert('旧密码长度不确');
			return false;
		}else if($.trim(userpwd).length<6){
			alert('新密码长度不正确');
			return false;
		}else if($.trim(userpwd)!=$.trim(userpwdConfirm)){
			alert('确认密码输入的不一致');
			return false;
		}else{

			$.ajax({
		 		   url:'system/user-updateUserPassword.action',
		 		   type:"POST",
		 		   cache : false,
		 		   dataType : "json",
		 		   data : { 
		 			  'userVO.oldPassword': $.trim(oldPassword),
				   		'userVO.userpwd': $.trim(userpwd)
					   	},
		 		   success:function(entry) {
		 			  if(entry.success==true){
							alert("保存成功！");
							$("input[name=old_password]").val('');
							$("input[name=userpwd]").val('');
							$("input[name=userpwd_confirm]").val('');
							return true;
						}else{
							alert("系统出错，请与管理员联系！");
							$("input[name=old_password]").val('');
							return false;
						}
		 		    },
		 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
		 		    	alert("系统出错，请与管理员联系！");
		 		    	$("input[name=old_password]").val('');
						return false;
		 		    	//alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
				   	}});
			}
		});
	
		
		/*头像修改部分-开始*/
	$("#btnUpload").click(function(event){
		event.preventDefault();
		if($("#imgphoto").attr("src")=="image/man.GIF"){
			alert("请选择新的头像");
			return ;
		}
		$.ajax({
	 		   url:'system/user-updateUserImage.action',
	 		   type:"POST",
	 		   cache : false,
	 		   dataType : "json",
	 		   data : { 
	 			  'userInfoVO.image': $.trim($("#imgphoto").attr("src"))
				   	},
	 		   success:function(entry) {
	 			  if(entry.success==true){
						alert("保存成功！");
						$("#bg-shadow").hide();
						window.location.href='/bbs/system/update_userInfo.action?step=4';

						return true;
					}else{
						alert("系统出错，请与管理员联系！");
						return false;
					}
	 		    },
	 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
	 		    	alert("系统出错，请与管理员联系！");
					return false;
	 		    	//alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
			   	}});
	});
		
		var system_image_path = '';
		
		//系统头像的单选按钮被选中处理事件
		$('#system_image_radio').click(function(){
			system_image_path = '';
			$('#system_image_div').css({display:"block"});
			$('#upload_image_div').css({display:"none"});
		});
		
		//头像上传的单选按钮被选中处理事件
		$('#upload_image_radio').click(function(){
			system_image_path = '';
			$('#upload_image_div').css({display:"block"});
			$('#system_image_div').css({display:"none"});
		});
		
		//默认是头像上传被选中
		$('#upload_image_radio').click();
		
		//系统头像单击事件
		$(".small_image").click(function(){
			system_image_path = $(this).attr("src");
			$("#image_show").attr({src:system_image_path});
			$(".small_image").filter(".small_image_select").removeClass("small_image_select");
			$(this).addClass("small_image_select");
		});
		
//		$(".upload_small_image").click(function(){
//			system_image_path = $(this).attr("src");
//			alert(system_image_path);
//			$("#image_show").attr({src:system_image_path});
//			$(".upload_small_image").filter(".small_image_select").removeClass("small_image_select");
//			$(this).addClass("small_image_select");
//		});
		
		//saveInfoBtn_3_1被单击事件
		$('#saveInfoBtn_3_1,#save_upload_image_btn').click(function(){
			if(system_image_path==''){
				alert('您还没有选择头像');
				return false;
			}else{

				$.ajax({
			 		   url:'system/user-updateUserImage.action',
			 		   type:"POST",
			 		   cache : false,
			 		   dataType : "json",
			 		   data : { 
			 			  'userInfoVO.image': $.trim(system_image_path)
						   	},
			 		   success:function(entry) {
			 			  if(entry.success==true){
								alert("保存成功！");
								return true;
							}else{
								alert("系统出错，请与管理员联系！");
								return false;
							}
			 		    },
			 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
			 		    	alert("系统出错，请与管理员联系！");
							return false;
			 		    	//alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
					   	}});
				}
		});
		
		function Step1() {
			$("#Step2Container").hide();
			$("#bg-shadow").hide();
        }

        function Step2() {
        	$("#image").click();
            $("#CurruntPicContainer").hide();
        }
        function Step3() {
            $("#Step2Container").hide();
            $("#bg-shadow").css("display","none");
       }
        $(document).ready(function(){
        	var bodyHeight=$("body").height();
        	var bodyWidth=$("body").width();
        	var $container=$("#Step2Container");
        	var containerHeight=$container.height();
        	var containerWidth=$container.width();
        	$container.css("top",(bodyHeight-containerHeight)/2-100);
        	$container.css("left",(bodyWidth-containerWidth)/2);
        	$('#bg-shadow').css('height',bodyHeight+50);
            $('#bg-shadow').css('width',bodyWidth+50);
            
        	$('#uploadExit').click(function(event){
        		event.preventDefault();
        		Step1();
        		return false;
        	});
        });
		//创建上传组件
		/*$('#upload_image_btn').click(function() 
			{ 
			    dialog =  new  Ext.ux.UploadDialog.Dialog({ 
			          title:  '上传头像' ,  
			          url:'system/upload-uploadImage.action' ,  
			          post_var_name:'uploadFiles',
			          width : 450, 
			          height : 300, 
			          minWidth : 450, 
			          minHeight : 300, 
			          draggable :  true , 
			          resizable :  true , 
			           //autoCreate: true,    
			          constraintoviewport:  true ,  
			          permitted_extensions:[ 'JPG' , 'jpg' , 'jpeg' , 'JPEG' , 'GIF' , 'gif' , 'png' , 'PNG' ],    
			          modal:  true , 
			          reset_on_hide:  false ,  
			          allow_close_on_upload:  false ,    //关闭上传窗口是否仍然上传文件 
			          upload_autostart:  true     //是否自动上传文件 
//			          upload_autostart:  false
			    }); 
			         
			    dialog.show(); //'show-button' 
			    dialog.on( 'uploadsuccess' , onUploadSuccess); 
			    dialog.on( 'uploadfailed' , onUploadFailed); 
			    dialog.on( 'uploaderror' , onUploadFailed); 
//			    dialog.on( 'uploadcanceled' , onUploadcanceled); 
			    dialog.on( 'uploadcomplete' , onUploadComplete); 
			});
			
			//文件上传成功后的回调函数
			 onUploadSuccess = function(dialog, filename, resp_data, record){
			    html = '<img src="';
				html = html+resp_data.data+'" class="upload_small_image"/>';
				$('#upload_small_div').append(html);
				system_image_path = resp_data.data;
				$("#image_show").attr({src:system_image_path});
				$('#save_upload_image_btn').css({display:"inline"});
			 }
			 
			 //文件上传失败后的回调函数
			 onUploadFailed = function(dialog, filename, resp_data, record){
			 	bbs.ErrorAlert(resp_data.data);
			 }
			 
			 //文件上传完成后的回调函数
			 onUploadComplete = function(dialog){
			 	dialog.hide();
			 }
			 
		/*头像修改部分-结束*/
});