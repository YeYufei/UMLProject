<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%><html>
<head>
<title>后台管理_添加父板块</title>
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
//校验表单是否有空项
var mask = new Ext.LoadMask(Ext.getBody(), {msg:"请稍候……"});
	function submit(){
		var name =	$.trim($('#name').val());
		var profile = $.trim($('#profile').val());
		if(name==''){
			alert("请填写板块名称");
			return false;
		}else if(name.length>30){
			alert("板块名称太长，限30个字符");
			return false;
		}else if(profile!='' && profile.length>300){
			alert("板块内容太长，限300个字符");
			return false;
		}else{
			
			$.ajax({
		 		   url:'admin/section-addSection.action',
		 		   type:"POST",
		 		   cache : false,
		 		   dataType : "json",
		 		   data : { 
		 			  'sectionVO.name': name, 
					   	'sectionVO.profile':profile
					   	},
		 		   success:function(entry) {
		 			  if(entry.success==true){
//							bbs.InfoAlert('<font color="red">恭喜,注册成功</font>');
							$('#name').val('');
							$('#profile').val('');
							alert("板块添加成功");
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
		$('#name').val('');
		$('#profile').val('');
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
				<img src="images/section_list.png">&nbsp;&nbsp;添加父板块
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</th>
		</tr>
	</table>
	<table id="list" style="width: 90%;margin:20px;font-size: 13px" cellspacing="0">
		<tr>
			<td width="20%">
				板块名称<font color="red">*</font>
			</td>
			<td width="80%">
				<input id="name" name="sectionVO.name" size="50">
			</td>
		</tr>
		<tr>
			<td valign="top">
				板块简介
			</td>
			<td>
				<textarea id="profile" name="sectionVO.profile" cols="40" rows="10"></textarea>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="image" src="images/save.png" value="提交" onclick="submit();">
				<span style="width: 20px"></span>
				<input type="image" src="images/reset_1.png"  value="重置" onclick="reset();">
				<span style="margin-left: 20px">
				<a href="javaScript:javaScript:history.go(-1);"><img alt="返回" src="images/go_back.png" />返回</a>
				</span>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
