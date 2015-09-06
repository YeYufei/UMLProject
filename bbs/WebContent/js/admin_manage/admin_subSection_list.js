$(document).ready(function(){
	
	//删除函数
	deleteSection = function(id,currentPage){
		if(confirm("确认要删除吗？")){
			window.location.href = 'admin/section-deleteSubSection?subSectionVO.id='+id+'&currentPage='+currentPage
		}else{
			
		}
	}

});