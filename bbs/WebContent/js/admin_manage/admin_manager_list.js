$(document).ready(function(){
	
	$('#list tr:even').addClass("bg_tr");
	
	
	
	$('.a1').hover(function(){
		$(this).css({'color':'blue'});
	},function(){
		$(this).css({'color':'#FF8C00'});
	});
	//$('.a1').mouseout(function(){
	//	$(this).css({'color':'#FF8C00'});
	//});
	
	//解除管理员函数
	deleteManager = function(id,currentPage){
			//alert("Get In"+document.getElementById('username').value+","+document.getElementById('userPwd').value+","+document.getElementById('PICPassword').value);
			if(confirm("确认要删除该管理员吗？")){
				$.ajax({
			 		   url:'admin/user-deleteManager.action',
			 		   type:"POST",
			 		   cache : false,
			 		   dataType : "json",
			 		   data : { 
			 			  'userVO.id': id,
						  'currentPage':currentPage
					   },
			 		   success:function(entry) {
			 			      if(entry.success==true){
			 			    	  alert("操作成功！");
			 			    	  location.reload();
			 			      }
			 		    },
			 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
			 		    	alert("操作失败，请与管理员联系！");
			 		    	//alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
					   	}});
			}else{
				
			}
	}
});