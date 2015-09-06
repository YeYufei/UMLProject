<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看公告-${noticeVO.title}</title>
</head>
<body>
<center>
	<!-- 头部 -->
	<jsp:include page="../header.jsp"/>
	<!-- LOGO部分 -->
	<jsp:include page="../logo.jsp"/>

	<!-- 正文部分 -->
	<div style="height: 20px;"></div>
	<table
		style="border: 1px solid #00BFFF; width: 100%; height: 30px; color: #1E90FF; font-size: 13px; background-image: url('images/bg_2.png'); background-repeat: repeat-x;">
		<tr>
			<td style="width: 100%">
				====${noticeVO.title}====
			</td>
		</tr>
	</table>
	<table
		style="border: 1px solid #00BFFF; width: 100%; height: 200px; font-size: 13px;">
		<tr>
			<td style="padding: 30px;">
				${noticeVO.content}
			</td>
		</tr>
		<tr>
			<td align="right" style="padding-right: 20px;">
				${noticeVO.publisher}&nbsp;&nbsp;${noticeVO.publishtimeStr }
			</td>
		</tr>
	</table>
</center>
</body>
</html>