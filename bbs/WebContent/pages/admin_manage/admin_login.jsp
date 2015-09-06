<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/admin_manage/admin_login.js"></script>
<title>华南理工大学论坛_后台管理_登录</title>
</head>
<body>
<center>
	<!-- LOGO部分 -->
	<jsp:include page="../logo.jsp"/>

	<!-- 正文部分 -->
	<div style="height: 20px;"></div>
	<table style="width:500px;height: 400px;font-size: 12px;">
		<tr>
			<td style="height: 300px" colspan="3">
				<img id="login_bg" src="image/dachunwu.jpg" class="glossy" />
			</td>
		</tr>
		<tr>
			<td style="padding-left: 20px;color: maroon;">
				管理员名称：
			</td>
			<td>
				<span style="border: 1px solid green;"><input id="username" name="username" type="text" style="border: none;" size="20"></span>
				<span id="username_msg" style="width: 130px;color: red;"></span>
			</td>
			<td rowspan="2">
				<input type="button" class="btn btn-success" onclick="login();" value="登陆" />
			</td>
		</tr>
		<tr>
			<td style="padding-left: 20px;color: maroon">
				管理员密码：
			</td>
			<td>
				<span style="border: 1px solid green;"><input id="userpwd" name="userpwd" type="password" style="border: none;" size="22"></span>
				<span id="userpwd_msg" style="width: 130px;color: red;"></span>
			</td>
		</tr>
	</table>
	<!-- 间隙 -->
	<div style="height: 20px;"></div>
	
	<!-- 底部 --> 
	<jsp:include page="../footer.jsp" />
</center>
</body>
</html>