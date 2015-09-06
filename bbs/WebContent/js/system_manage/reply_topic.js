$(document).ready(function(){
	
	$('.subSection').hover(function(){
		$(this).addClass('subSection_hover');		
	},function(){
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
	});
	
//	//页面加载时就请用户选择板块
//	var top = ($(document).height()-$('#subSections').height())/2;
//	var left = ($(document).width()-$('#subSections').width())/2;
//	$('#subSections').css({"top":top,"left":left});
//	if($('#sName').val()==''){
//		$('#subSections').fadeIn('slow');
//	}else{
//		$('#section_name').html('&gt;&gt;'+$('#sName').val());
//	}
	
	//发布函数
	$('#publish_btn').click(function(){
		//KE.util.setData('content');
		var content = $('#content').val();
		if(($.trim(content)).length<5){
			alert('帖子内容不能为空,并且不能少于5个字符');
			return false;
		}else{
			//showMask();
			document.topicForm.action = 'system/topic-replyTopic.action';
			document.topicForm.target = '_self';
			document.topicForm.submit();
		}
	});
	
	//预览按钮单击事件
	$('#scan_btn').click(function(){
		//KE.util.setData('content');
		var content = $('#content').val();
		if(($.trim(content)).length<5){
			alert('帖子内容不能为空,并且不能少于5个字符');
			return false;
		}else{
			document.topicForm.target="_blank"
			document.topicForm.submit();
		}
	});
});