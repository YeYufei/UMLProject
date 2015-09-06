<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/comm/jsp/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<link rel="stylesheet" type="text/css" href="css/index.css">
		<title>华南理工大学论坛_后台管理_首页</title>
	</head>
	<frameset rows="80px,*" border="0" frameborder="no" framespacing="0" >
		<noframes> 
			<body> 
			很抱歉，您使用的浏览器不支援框架功能，请换用新的浏览器。 
			</body> 
		</noframes>
		<frame name="top" frameborder="0" src="/bbs/admin/top.action" scrolling="no" noresize="noresize">
		<frameset rows="*,70px">
			<frameset cols="200px,*">
				<frame name="menu" src="/bbs/admin/menu.action" scrolling="no"  noresize="noresize" style="padding-left: 10px;">
				<frame name="mainFrame" src="/bbs/admin/admin_welcome.action"  noresize="noresize">
			</frameset>
			<frame name="foot" frameborder="0" src="/bbs/common/footer.action" scrolling="no" noresize="noresize">
		</frameset>
	</frameset>
</html>
