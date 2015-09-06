<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台管理_公告查看</title>
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
				<img src="images/anc.png">&nbsp;&nbsp;公告查看
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img alt="添加公告" src="images/add_note.gif">&nbsp;&nbsp;
				<a href="/bbs/admin/admin_notice_add.action" style="font-size: 13px;">添加公告</a>
			</th>
		</tr>
	</table>
	<table style="width: 90%;margin:20px;font-size: 13px;" cellspacing="0">
		<tr>
			<td style="padding:30px;">
				<font style="font-size: 18px;color: red">${noticeVO.title}</font>:<br/><br/>
				<span style="font-size: 14px;width: 30px"></span>${noticeVO.content}
			</td>
		</tr>
		<tr>
			<td style="padding-left: 30px;">
				${noticeVO.publisher} ${noticeVO.publishtimeStr}
				<span style="margin-left: 20px">
				<a href="javaScript:history.go(-1);"><img alt="返回" src="images/go_back.png" />返回</a>
				</span>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
