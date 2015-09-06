<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提示</title>
</head>
<body>
	<center>
		<div style="width: 100%;height: 300px;">
			<div style="height: 100px"></div>
			<table>
				<tr>
					<td rowspan="2">
						<img src="images/Alert.png">
					</td>
					<td style="padding-left: 30px;font-size: 22px;color: red">
						对不起，您已经退出登录，请您重新登录！&nbsp;&nbsp;
						<a href="javaScript:void(0);" onclick="window.parent.location.href='admin/admin_login.action'">登录</a>
					</td>
				</tr>
			</table>
		</div>
	</center>
</body>
</html>