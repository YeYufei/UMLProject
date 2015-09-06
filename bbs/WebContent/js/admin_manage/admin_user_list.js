Ext.onReady(function(){
	
	$('#list tr:even').addClass("bg_tr");
	
	
	
	$('.a1').hover(function(){
		$(this).css({'color':'blue'});
	},function(){
		$(this).css({'color':'#FF8C00'});
	});
	//$('.a1').mouseout(function(){
	//	$(this).css({'color':'#FF8C00'});
	//});
	
	//
	$('#query_value').focus(function(){
		if($(this).val()=='支持模糊查询'){
			$(this).val('');
			$(this).css({"color":"black"});	
		}
	});
	//
	$('#query_value').blur(function(){
		if($(this).val()==''){
			$(this).val('支持模糊查询');
			$(this).css({"color":"#DCDCDC"});	
		}
	});
	
	//检索用户
	$('#query_btn').click(function(){
		var value = $.trim($('#query_value').val());
		if(value!='支持模糊查询'){
			var type = $('#query_type').val();
			if(type=='01'){
				window.location.href='admin/user-queryUser.action?userVO.username='+value+'&currentPage=1&type='+type;
			}else if(type=='02'){
				window.location.href='admin/user-queryUser.action?userVO.idStr='+value+'&currentPage=1&type='+type;	
			}
		}
	});
	
	
	//激活函数
	doActiveUser = function(id,currentPage){
		if(confirm("确定要激活该用户吗？")){
			$.ajax({
		 		   url:'admin/user-doActiveUser.action',
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
	
	//禁言函数
	forbidUser = function(id,currentPage){
		if(confirm("确定要禁言该用户吗？")){
			$.ajax({
		 		   url:'admin/user-forbidUser.action',
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
	
	//锁定函数
	lockUser = function(id,currentPage){
		if(confirm("确定要锁定该用户吗？")){
			$.ajax({
		 		   url:'admin/user-lockUser.action',
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
	
	//添加管理员函数
	addManager = function(id,currentPage){
		if(confirm("确定要添加该管理员吗？")){
			$.ajax({
		 		   url:'admin/user-addManager.action',
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
	
	//选择板块
	selectSection = function(id,currentPage){
		if(confirm("确定要设置该用户为版主吗？")){
			var args='';
			window.showModalDialog("admin/user-selectSection.action?userVO.id="+id+'&currentPage='+currentPage,args,"dialogWidth:600px;center=yes;");
		}else{
			
		}
		var position = p.position();
		
		$('#subSections').css({"display":"block"});
	}
	
	$('#close_btn').click(function(){
		$('#subSections').fadeOut('slow');
	});
	
	$('.select_link').click(function(){
		var top = ($(document).height()-$('#subSections').height())/2;
		var left = ($(document).width()-$('#subSections').width())/2;
		$('#subSections').css({"top":top,"left":left});
		$('#subSections').fadeIn('slow');
	});
	
	$('.subSection').hover(function(){
		$(this).addClass('subSection_hover');
	},function(){
		$(this).removeClass('subSection_hover');
	});
	
	//$('.subSection').mouseout(function(){
	//	$(this).removeClass('subSection_hover');
	//});
	
	$('.subSection').click(function(){
		$('a').removeClass('subSection_selected');
		$(this).addClass('subSection_selected');
	});
	
	//得到用户ID
	var userId = '';
	
	chooseUser = function(userid){
		userId = userid;
	}
	
	//得到板块ID
	var subSectionId = '';
	
	select = function(id){
		subSectionId = id;
	}
	
	//提交设置版主
	$('#submit_btn').click(function(){
		if(subSectionId==''){
			alert('对不起，您还没有选择板块');
			return false;
		}else{
			
			$.ajax({
		 		   url:'admin/user-addSectionManager.action',
		 		   type:"POST",
		 		   cache : false,
		 		   dataType : "json",
		 		   data : { 
		 			  'userVO.id': userId,
					   	'subSectionVO.id':subSectionId,
					   	'subSectionVO.managerId':userId
					   	},
		 		   success:function(entry) {
		 			   if(entry.success==true){
		 				   alert("操作成功！");
		 				  $('#subSections').fadeOut('slow');
		 				  location.reload();
		 			   }
		 			   else
		 				   alert("系统发生错误，请与管理员联系！");
		 		    },
		 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
		 		    	 alert("系统发生错误，请与管理员联系！");
		 		    	//alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
				   	}});
		}
	});
});