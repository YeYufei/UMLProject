<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%><html>
<head>
<title>后台管理_添加公告</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="all" href="comm/dateInput/jsDatePick_ltr.min.css" />
<script type="text/javascript" src="comm/dateInput/jsDatePick.min.1.2.js"></script>
<style type="text/css">
body{
	border: 1px solid #87CEEB;
}

td{
 	padding-left: 50px;
 	padding-top: 10px;
}
</style>
<script type="text/javascript">
	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"publishtime",
			dateFormat:"%Y-%M-%d"
			/*selectedDate:{				This is an example of what the full configuration offers.
				day:5,						For full documentation about these settings please see the full version of the code.
				month:9,
				year:2006
			},
			yearsRange:[1978,2020],
			limitToToday:false,
			cellColorScheme:"beige",
			dateFormat:"%m-%d-%Y",
			imgPath:"img/",
			weekStartDay:1*/
		});
	};
</script>
<script type="text/javascript">
//校验表单是否有空项
	function submit(){
		var title =	$.trim($('#title').val());
		var content = $.trim($('#content').val());
		var publisher = $.trim($('#publisher').val());
		var publishtime = $.trim($('#publishtime').val());
		if(title==''){
			alert("请填写公告标题");
			return false;
		}else if(title.length>30){
			alert("公告标题太长，限30个字符");
			return false;
		}else if(content==''){
			alert("请填写公告内容");
			return false;
		}else if(content.length>5000){
			alert("公告内容太长，限5000个字符");
			return false;
		}else if(publisher==''){
			alert("请填写公告发布人");
			return false;
		}else if(publishtime==''){
			alert("请填写公告发布时间");
			return false;
		}else{

			$.ajax({
		 		   url:'admin/notice-addNotice.action',
		 		   type:"POST",
		 		   cache : false,
		 		   dataType : "json",
		 		   data : { 
		 			  'noticeVO.title': title, 
					   	'noticeVO.content':content,
					   	'noticeVO.publisher':publisher,
						'noticeVO.publishtime':publishtime
					   	},
		 		   success:function(entry) {
		 			  if(entry.success==true){
//							bbs.InfoAlert('<font color="red">恭喜,注册成功</font>');
							$('#title').val('');
							$('#content').val('');
							alert("公告添加成功！");
							return true;
						}else{
							alert(entry.data);
							//bbs.WarnAlert('<font color="red">'+entry.data+'</font>');
							return false;
						}
		 		    },
		 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
		 		    	alert("系统发生错误，请与管理员联系！");
		 		    	//alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
				   	}});
		}
	}

//重置
	function reset(){
		$('#title').val('');
		$('#content').val('');
		$('#publisher').val('');
		$('#publishtime').val('');
	}
</script>
</head>
<body>
<div style="width: 100%;height: 100%">
 
<c:if test="${admin==null}">
	<script type="text/javascript">
		window.parent.location='admin/admin_login.action';
	</script>
</c:if>
	<table style="width: 90%;font-size: 15px;margin:20px; font-weight: bolder">
		<tr>
			<th>
				<img src="images/anc.png">&nbsp;&nbsp;添加公告
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</th>
		</tr>
	</table>
	<table id="list" style="width: 90%;margin:20px;font-size: 13px" cellspacing="0">
		<tr>
			<td width="20%">
				公告标题<font color="red">*</font>
			</td>
			<td width="80%">
				<input id="title" name="noticeVO.title" size="50">
			</td>
		</tr>
		<tr>
			<td valign="top">
				公告内容<font color="red">*</font>
			</td>
			<td>
				<textarea id="content" name="noticeVO.content" cols="40" rows="10"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				发布人<font color="red">*</font>
			</td>
			<td>
				<input id="publisher" name="noticeVO.publisher" value="${admin.username}">
			</td>
		</tr>
		<tr>
			<td>
				发布时间<font color="red">*</font>
			</td>
			<td>
				<%
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					String today = df.format(new Date());
				%>
				<input id="publishtime" name="noticeVO.publishtime" id="publishtime" value="<%=today%>">
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="image" src="images/save.png" value="提交" onclick="submit();">
				<span style="width: 20px"></span>
				<input type="image" src="images/reset_1.png"  value="重置" onclick="reset();">
				<span style="margin-left: 20px">
				<a href="javaScript:history.go(-1);"><img alt="返回" src="images/go_back.png" />返回</a>
				</span>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
