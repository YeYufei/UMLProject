$(document).ready(function(){

	/*var mask = new Ext.LoadMask(Ext.getDom('main_div'), {msg:"请稍候……"});
    showMask = function(){
    	mask.show();
	}
	
	 hideMask = function(){
    	mask.hide();
	}*/
	
	$('.subSection').hover(function(event){
		$(this).addClass('subSection_hover');	
	},function(event){
		$(this).removeClass('subSection_hover');		
	});
	
	//$('.subSection').mouseout(function(){
	//	$(this).removeClass('subSection_hover');		
	//});
	
	//
	show_sections = function(){
		$('#subSections').fadeIn('slow');
	}
	
	//
	var subSectionName = '';
	var subSectionId = '';
	select = function(id){
	    subSectionId = id;
	}
	
	$('.subSection').click(function(){
		$('.subSection').removeClass('subSection_visited');
		$(this).addClass('subSection_visited');
		subSectionName = $(this).html();
		$('#section_name').html('&gt;&gt;'+subSectionName);
		$('#sName').val(subSectionName);
		$('#sid').val(subSectionId);
		$('#subSections').fadeOut('slow');
		//hideMask();
	});
	
	//页面加载时就请用户选择板块
	var top = ($(document).height()-$('#subSections').height())/2;
	var left = ($(document).width()-$('#subSections').width())/2;
	$('#subSections').css({"top":top,"left":left});
	if($('#sName').val()==''){
		$('#subSections').fadeIn('slow');
		//showMask();
	}else{
		$('#section_name').html('&gt;&gt;'+$('#sName').val());
	}
	
	//发布函数
	$('#publish_btn').click(function(){
		//KE.util.setData('content');
		var content = $('#content').val();
		var title = $.trim($('#title').val());
		if(title==''){	
			alert('帖子标题不能为空');
			return false;
		}else if(($.trim(content)).length<5){
			alert('帖子内容不能为空,并且不能少于5个字符');
			return false;
		}else{
			//showMask();
			document.topicForm.action = 'system/topic-publishTopic.action';
			document.topicForm.target = '_self';
			document.topicForm.submit();
		}
	});
	
	//预览按钮单击事件
	$('#scan_btn').click(function(){
		//KE.util.setData('content');
		var content = $('#content').val();
		var title = $.trim($('#title').val());
		if(title==''){	
			alert('帖子标题不能为空');
			return false;
		}else if(($.trim(content)).length<5){
			alert('帖子内容不能为空,并且不能少于5个字符');
			return false;
		}else{
			document.topicForm.target="_blank"
			document.topicForm.submit();
		}
	});
});
/*$(document).ready(function(){
	alert("I am back");
	/*var mask = new Ext.LoadMask(Ext.getDom('main_div'), {msg:"请稍候……"});
    showMask = function(){
    	mask.show();
	}
	
	 hideMask = function(){
    	mask.hide();
	} //
	
	$('.subSection').hover(function(event){
		$(this).addClass('subSection_hover');		
	},function(event){
		$(this).removeClass('subSection_hover');		
	});
	
	//$('.subSection').mouseout(function(){
	//	$(this).removeClass('subSection_hover');		
	//});
	
	//
	show_sections = function(){
		$('#subSections').fadeIn('slow');
	}
	
	//
	var subSectionName = '';
	var subSectionId = '';
	select = function(id){
	    subSectionId = id;
	}
	
	$('.subSection').click(function(){
		$('.subSection').removeClass('subSection_visited');
		$(this).addClass('subSection_visited');
		subSectionName = $(this).html();
		$('#section_name').html('&gt;&gt;'+subSectionName);
		$('#sName').val(subSectionName);
		$('#sid').val(subSectionId);
		$('#subSections').fadeOut('slow');
		hideMask();
	});
	
	//页面加载时就请用户选择板块
	var top = ($(document).height()-$('#subSections').height())/2;
	var left = ($(document).width()-$('#subSections').width())/2;
	$('#subSections').css({"top":top,"left":left});
	if($('#sName').val()==''){
		$('#subSections').fadeIn('slow');
		showMask();
	}else{
		$('#section_name').html('&gt;&gt;'+$('#sName').val());
	}
	
	//发布函数
	$('#publish_btn').click(function(){
		alert("Get In")
		//KE.util.setData('content');
		var content = $('#content').val();
		var title = $.trim($('#title').val());
		if(title==''){	
			alert('<font color="red">帖子标题不能为空</font>');
			return false;
		}else if(($.trim(content)).length<5){
			alert('<font color="red">帖子内容不能为空,并且不能少于5个字符</font>');
			return false;
		}else{
			showMask();
			document.topicForm.action = 'system/topic-publishTopic.action';
			document.topicForm.target = '_self';
			document.topicForm.submit();
		}
	});
	
	//预览按钮单击事件
	$('#scan_btn').click(function(){
		//KE.util.setData('content');
		var content = $('#content').val();
		var title = $.trim($('#title').val());
		if(title==''){	
			alert('<font color="red">帖子标题不能为空</font>');
			return false;
		}else if(($.trim(content)).length<5){
			alert('<font color="red">帖子内容不能为空,并且不能少于5个字符</font>');
			return false;
		}else{
			document.topicForm.target="_blank"
			document.topicForm.submit();
		}
	});
});*/