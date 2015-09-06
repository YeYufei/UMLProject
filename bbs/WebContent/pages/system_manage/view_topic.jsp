<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/bbs/css/system_manage/public_topic.css" />
<script type="text/javascript" src="js/system_manage/view_topic.js"></script>
<title>浏览帖子</title>
</head>
<body>
<c:if test="${user==null}">
	<script type="text/javascript">
		window.parent.location='/bbs/logout.action';
	</script>
</c:if>
<center>
	<!-- 头部 -->
	<jsp:include page="../header.jsp"/>
	<!-- LOGO部分 -->
	<jsp:include page="../logo.jsp"/>
	<table style="width: 100%;">
		<tr>
			<td style="width: 100%;padding-right: 10px;padding-top: 10px" align="right">
				<img alt="发表回复" src="images/reply.png" style="cursor: pointer;" onclick="prepareReply(${topicVO.id});">
			</td>
		</tr>
	</table>
	<div style="width: 100%;height:600px;border: solid 1px #00BFFF;" id="main_div" >
	
	<table style="width: 100%;height: 30px;">
		<tr>
			<td style="font-size:13px ;width: 100%;background-image: url('images/bodybg.png');padding-left: 20px;">
				<font style="color: #1E90FF;">主题:</font>&nbsp;&nbsp;&nbsp;
				<font style="color: #1E90FF">${topicVO.title}</font>
			</td>
		</tr>
	</table>
	
	<table style="width: 100%;height: 560px;" cellspacing="0" cellpadding="0">
		<tr>
			<td valign="top" style="width:180px;padding: 20px;background-color: #F0FFFF;font-size: 13px;">
			<font style="font-weight: bolder;color: red;font-size: 15px">${topicVO.userVO.username }</font><br/><br/>
			<img alt="${topicVO.userVO.username}" src="${topicVO.userVO.userInfoVO.image}" width="120" height="120">
			<br/><br/>UID：${topicVO.userVO.userInfoVO.uid }
			<br/><br/>注册时间：<font style="color: gray">${topicVO.userVO.userInfoVO.regTimeStr}</font>
			<br/><br/>登录时间：<font style="color: gray">${topicVO.userVO.userInfoVO.loginTimeStr }</font>
			</td>
			<td style="height: 90%;width:80%;font-size: 14px" valign="top">
				<div>
					<table style="width: 100%;height: 25px;">
						<tr>
							<td style="padding-left:10px;color: orangered;;border-bottom: 1px dashed #DCDCDC;width: 100%;height:100%">
								0&nbsp;&nbsp;<font style="font-size: 13px;color: gray">发表于：${topicVO.sendTimeStr}</font>
							</td>
						</tr>
					</table>
				</div>
				<div style="padding: 10px;">
				<font style="font-size: 24px;color: #1E90FF;">${topicVO.title}</font>
				<div style="height: 5px"></div>
				${topicVO.content}
				</div>
			</td>
		</tr>
		<tr>
			<td style="background-color: #F0FFFF;"></td>
			<!-- 个性签名 -->
			<td valign="middle" style="height:30px;width: 80%;margin-left: 10px;font-size: 12px;border-top: 1px dashed #DCDCDC;">
			${topicVO.userVO.userInfoVO.postSign}
			</td>
		</tr>
	</table>
	</div>
	<table style="width: 100%;">
		<tr>
			<td style="width: 100%;padding-right: 10px;padding-top: 10px" align="right">
				<img alt="发表回复" src="images/reply.png" style="cursor: pointer;" onclick="prepareReply(${topicVO.id});">
			</td>
		</tr>
	</table>
	<!-- 空隙 -->
	<div style="height: 20px"></div>
	
	<!-- 底部 -->
	<jsp:include page="../footer.jsp"/>
	
</center>
</body>
</html>