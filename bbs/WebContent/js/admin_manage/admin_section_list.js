$(document).ready(function(){
	
	$('#list tr:even').addClass("bg_tr");
	
	//删除函数
	deleteSection = function(id,currentPage){
		if(confirm("确认要删除吗？")){
			window.location.href = 'admin/section-deleteSection?sectionVO.id='+id+'&currentPage='+currentPage;
		}else{
			
		}
	}

});