<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录成功</title>
</head>
<body onload="t=2">
<center>
		<!-- 头部 -->
		<jsp:include page="header.jsp"/>
		<!-- LOGO部分 -->
		<jsp:include page="logo.jsp"/>
		
		<%
		UserVO userVO = (UserVO) session.getAttribute(Constants.USER_KEY);
		if (userVO != null) {
		%>
		<div style="width: 100%;height: 300px;">
			<div style="height: 100px"></div>
			<table>
				<tr>
					<td rowspan="2">
						<img src="images/Refresh.png">
					</td>
					<td style="padding-left: 30px;font-size: 22px;color: red">
						恭喜您，登录成功，欢迎您回来！&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td style="padding-left: 30px;font-size: 13px;color: blue">
						<span style="width: 300px"><a href="/bbs/system/pageInit-init.action" style="color: blue;text-decoration: none">如果网页不能自动跳转，请点击这里手动跳转&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/action_refresh_blue.gif"/></a></span>
					</td>
				</tr>
			</table>
			<script>
						t = -1; // 计数器
						setInterval("testTime()",1000); // 启动1秒定时
						
						function testTime() {
						   if(t<0) return; // 计数器值小于0，表示尚未开始倒计时
						   if(t == 1) // 计数器值为0，转向
						     window.location.href = "/bbs/system/pageInit-init.action";
						   //document.getElementById('view').innerHTML = "<b>"+t+"</b>"; // 显示倒计时
						   t--; // 计数器递减
						}
						</script>
		</div>
		<%}else if(userVO == null){%>
			<script type="text/javascript">
				window.location.href="/bbs/logout.action";
			</script>
		
		<%} %>
		<!-- 底部 --> 
		<jsp:include page="footer.jsp" />
	</center>
</body>
</html>