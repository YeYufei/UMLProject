<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@	page import="cn.edu.ahut.util.Constants"%>
<%@	page import="cn.edu.ahut.vo.UserVO"%>
<%@	page import="cn.edu.ahut.vo.UserInfoVO"%>
<%@	page import="cn.edu.ahut.util.StringUtil"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>"></base>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="icon" href="/bbs/images/netIcon.png" type="image/x-icon" />
	<link rel="shortcut icon" href="/bbs/images/netIcon.png" type="image/x-icon" />
	<script type="text/javascript" src="/bbs/comm/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="/bbs/comm/bootstrap/js/bootstrap.js"></script>

	<link rel="stylesheet" type="text/css" href="/bbs/comm/bootstrap/css/bootstrap.min.css">
	
	
	
    <!-- script type="text/javascript" src="comm/js/common.js"></script-->
	<!-- 圆角效果 -->
	<!-- script type="text/javascript" src="comm/js/DD_roundies.js"></script>
	<script type="text/javascript" src="comm/js/glossy.js"></script-->
	
	<!-- link rel="stylesheet" type="text/css" href="comm/css/common.css">
	<link rel="stylesheet" type="text/css" href="comm/extjs/resources/css/ext-all.css"-->
	<!-- script type="text/javascript" src="comm/extjs/adapter/ext/ext-base.js"></script>
	<script type="text/javascript" src="comm/extjs/ext-core.js"></script>
	<script type="text/javascript" src="comm/extjs/ext-all.js"></script>
	<script type="text/javascript" src="comm/extjs/resources/locale/ext-lang-zh_CN.js"></script-->
