<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册-成功</title>
</head>

<body>
<center>
<!-- 头部 --> 
<jsp:include page="../header.jsp" /> 
<!-- LOGO部分 -->
<jsp:include page="../logo.jsp" />

<div style="height: 20px;"></div>

<!--bar -->
<table
	style="width: 100%; height: 30px; background-image: url('images/bg_2.png'); background-repeat: repeat-x;">
	<tr>
		<td
			style="padding-top: 5px; padding-left: 10px; font-weight: bold; font-size: 15px;">
		注册成功</td>
	</tr>
</table>

<!-- 间隙 -->
<div style="height: 50px; width: 100%"></div>

<table align="center" style="font-size: 22px;color: green;width: 60%" cellspacing="15">
	<tr>
		<td rowspan="5">
			<img src="images/Register.png">
		</td>
		<td>
			恭喜您，注册成功！
		</td>
	</tr>
	<tr>
		<td>
			感谢您的支持，我们会竭诚为您服务！
		</td>
	</tr>
	<tr>
		<td style="font-size: 13px">
			<a href="/bbs/index.action">现在先去逛逛</a>
			<a href="system/update_userInfo.action">马上完善资料</a>
		</td>
	</tr>
</table>

<!-- 间隙 -->
<div style="height: 50px;"></div>

<!-- 底部 --> <jsp:include page="../footer.jsp" /></center>
</body>
</html>