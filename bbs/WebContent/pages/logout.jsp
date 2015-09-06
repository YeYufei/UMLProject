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
		<!-- 头部 -->
		<jsp:include page="header.jsp"/>
		<!-- LOGO部分 -->
		<jsp:include page="logo.jsp"/>
		
		<%
		UserVO userVO = (UserVO) session.getAttribute(Constants.USER_KEY);
		if (userVO == null) {
		%>
		<div style="width: 100%;height: 300px;">
			<div style="height: 100px"></div>
			<table>
				<tr>
					<td rowspan="2">
						<img src="images/Alert.png">
					</td>
					<td style="padding-left: 30px;font-size: 22px;color: red">
						对不起，您已经退出登录，请您重新登录！
					</td>
				</tr>
				<tr>
					<td style="padding-left: 30px;font-size: 13px;" align="center">
						<a href="javaScript:void(0);" onclick="showLoginWin();">登录</a>
						<a href="/bbs/system/register.action">注册</a>
					</td>
				</tr>
			</table>
		</div>
		<%}else{%>
			<script type="text/javascript">
				window.location.href="/bbs/index.action";
			</script>
		<%} %>
		<!-- 底部 --> 
		<jsp:include page="footer.jsp" />
	</center>
</body>
</html>