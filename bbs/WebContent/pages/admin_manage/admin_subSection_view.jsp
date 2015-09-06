<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台管理_子板块查看</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{
	border: 1px solid #87CEEB;
}
td{
	width: 100%;
}
th{
	font-weight:bolder; 
}
</style>
</head>
<body>
<div style="width: 100%;height: 100%">
	<table style="width: 90%;font-size: 15px;margin:20px; font-weight: bolder">
		<tr>
			<th>
				<img src="images/section_list.png">&nbsp;&nbsp;子板块查看
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img alt="添加子板块" src="images/add_note.gif">&nbsp;&nbsp;
				<a href="admin/section-toAddSubSection" style="font-size: 13px;">添加子板块</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
			</th>
		</tr>
	</table>
	<table style="width: 90%;margin:20px;font-size: 13px;" cellspacing="0">
		<tr>
			<td style="padding:30px;">
				板块名称：<font style="color: red">${subSectionVO.name}</font><br/><br/>
				父版块名称：<font style="color: red">${subSectionVO.sectionName}</font><br/><br/>
				板块简介：${subSectionVO.profile}
			</td>
		</tr>
		<tr>
			<td style="padding-left: 30px;">
				${subSectionVO.createUser} ${subSectionVO.createtimeStr}
				<span style="margin-left: 20px">
				<a href="javaScript:history.go(-1);"><img alt="返回" src="images/go_back.png" />返回</a>
				</span>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
