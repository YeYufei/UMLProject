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
	deleteSectionManager = function(id,currentPage){
		if(confirm("确定要解除该版主吗？")){
			$.ajax({
		 		   url:'admin/user-deleteSectionManager.action',
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
		 			   else
		 				   alert("系统发生错误，请与管理员联系！");
		 		    },
		 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
		 		    	 alert("系统发生错误，请与管理员联系！");
		 		    	//alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
				   	}});
		}else{
			
		}
	}
});