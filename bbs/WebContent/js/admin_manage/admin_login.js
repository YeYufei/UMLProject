$(document).ready(function(){

	$('#username').focus(function(){
		$('#username_msg').html('');
	});
	
	$('#userpwd').focus(function(){
		$('#userpwd_msg').html('');
	});
	
	$('#username').focus();
	//登陆按钮单击事件
	
	login = function(){
		var username = $.trim($('#username').val());
		var userpwd = $.trim($('#userpwd').val());
		if(username==''){
			$('#username_msg').html('&nbsp;&nbsp;&nbsp;*用户名不能为空');
			return false;
		}else if(userpwd==''){
			$('#userpwd_msg').html('&nbsp;&nbsp;&nbsp;*密码不能为空');
			return false;
		}else{
 
			$.ajax({
		 		   url:'admin/user-adminLogin.action',
		 		   type:"POST",
		 		   cache : false,
		 		   dataType : "json",
		 		   data : { 
		 			  'userVO.username': username, 
					   	'userVO.userpwd':userpwd
					   	},
		 		   success:function(entry) {
		 			  if(entry.success==true){
		 				 window.location.href='/bbs/admin/admin_index.action';
							return true;
						}else{
							$('#username_msg').html('&nbsp;&nbsp;&nbsp;*'+entry.data);
							return false;
						}
		 		    },
		 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
		 		    	alert("发生错误，请与管理员联系");
		 		    	//alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
				   	}});
		}
	}
});