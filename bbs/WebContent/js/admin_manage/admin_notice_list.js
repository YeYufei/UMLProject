$(document).ready(function(){

	//删除函数
	deleteNotice = function(id,currentPage){
		if(confirm("确认要删除吗？")){
			window.location.href = 'admin/notice-deleteNotice?noticeVO.id='+id+'&currentPage='+currentPage;
		}else{
			
		}
	}
});