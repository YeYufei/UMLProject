<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- link rel="stylesheet" type="text/css" href="css/system_manage/reply_list.css"-->
<title>回帖列表-${topicVO.title}</title>
</head>
<body>
	<!-- 头部 -->
	<jsp:include page="../header.jsp"/>
	<!-- LOGO部分 -->
	<!-- jsp:include page="../logo.jsp"/-->
	
	<!-- 正文部分 -->
	<div style="width:100%;height:200px;background-color:#337AB7">
      <p style="color:white;font-size:20px;padding-left:159px;padding-top:100px;">发帖开始新的一天吧~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-lg btn-success" >[&nbsp;Get Started Now!&nbsp;]</a></p>
    </div>
    <div style="height:20px;" ></div>
    <div class="container" >
	
	<table class="table" cellspacing="0" cellpadding="0">
		<tr>
			<td style="background-color: #E0FFFF;padding-left: 5px;">
				<a style="color: #2F4F4F" href="system/welcome-index.action">华南理工大学BBS论坛</a>
				&gt;&gt;<a style="color: #2F4F4F" href="system/topic-queryAllTopicBySid.action?currentPage=1&subSectionVO.id=${subSectionVO.id}">『${subSectionVO.name}』</a>
				&gt;&gt;<a style="color: #2F4F4F" href="system/topic-viewReply.action?currentPage=1&topicVO.id=${topicVO.id}&subSectionVO.id=${subSectionVO.id}">${topicVO.title}</a>
			</td>
		</tr>
	</table>
	<!-- 间隙 -->
	<div style="height: 20px;"></div>
	<!-- 分页链接 -->
	<div style="width:80%;float: left">
		<table class="table" cellpadding="0" cellspacing="0" align="left">
			<tr>
			<td style="font-size: 13px;padding-left: 5px;padding-right:5px; color: #6495ED;border: 1px solid #F0F8FF;">
				共${replys.totalCount}条&nbsp;&nbsp;每页${pageInfo.itemNums}条
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<c:choose>
					<c:when test="${pageInfo.currentPage==1}">
						<font style="color: gray">上一页</font>
						&nbsp;&nbsp;
						<font style="color: gray">第一页</font>
					</c:when>
					<c:otherwise>
						<a class="page_link" href="system/topic-viewReply.action?currentPage=1&topicVO.id=${topicVO.id}&subSectionVO.id=${subSectionVO.id}">第一页</a>
						&nbsp;&nbsp;
						<a class="page_link" href="system/topic-viewReply.action?currentPage=${pageInfo.currentPage-1}&topicVO.id=${topicVO.id}&subSectionVO.id=${subSectionVO.id}">上一页</a>
					</c:otherwise>
				</c:choose>
				&nbsp;&nbsp;
				<c:choose>
					<c:when test="${pageInfo.currentPage==pageInfo.allPages}">
						<font style="color: gray">下一页</font>
						&nbsp;&nbsp;
						<font style="color: gray">最末页</font>
					</c:when>
					<c:otherwise>
						<a class="page_link" href="system/topic-viewReply.action?currentPage=${pageInfo.currentPage+1}&topicVO.id=${topicVO.id}&subSectionVO.id=${subSectionVO.id}">下一页</a>
						&nbsp;&nbsp;
						<a class="page_link" href="system/topic-viewReply.action?currentPage=${pageInfo.allPages}&topicVO.id=${topicVO.id}&subSectionVO.id=${subSectionVO.id}">最末页</a>
					</c:otherwise>
				</c:choose>
				
			</td>
			<td style="width: 5px;"></td>
			<td style="width:160px;font-size: 13px;margin-left: 5px;color: #6495ED;border: 1px solid #F0F8FF;" align="center">
				Pages：${pageInfo.currentPage}/${pageInfo.allPages}&nbsp;&nbsp;	Go&nbsp;<input type="text" size="2" style="font-size: 8px" id="input_page_1" onblur="jumpToPage('#input_page_1',${topicVO.id},${subSectionVO.id},${pageInfo.allPages})">
			</td>
			</tr>
		</table>
	</div>
	<!-- 回帖按钮 -->
	<div style="width:20%;float: left;">
	<table class="table" style="width: 100%">
		<tr>
			<td style="padding-right: 5px;width: 100%" align="right">
				<c:choose>
					<c:when test="${user!=null}">
					<img alt="发表回复" src="images/reply.png" style="cursor: pointer;" onclick="prepareReply(${topicVO.id},${subSectionVO.id});">
					</c:when>
					<c:otherwise>
						<img src="images/blank.png"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	</div>
	
	<!-- 楼层显示部分 -->
	<div style="width: 100%;height:auto;background-color: #F0F8FF;overflow:hidden" id="main_div" >
	<table class="table" style="width: 100%;height: 30px;">
		<tr>
			<td style="font-size:13px ;width: 100%;background-color:#E0FFFF;padding-left: 5px;">
				<font style="color: #1E90FF;">主题:</font>&nbsp;&nbsp;&nbsp;
				<font style="color: #1E90FF">${topicVO.title}</font>
			</td>
		</tr>
	</table>
	
	<!-- 第一页才显示主题帖 -->
	<c:if test="${pageInfo.currentPage==1}">
	<table class="table" style="width: 98%;height: 560px;margin-top:5px; border: 1px solid #B0C4DE;" cellspacing="0" cellpadding="0">
		<tr>
			<td valign="top" style="width:180px;padding: 20px;background-color: #E0FFFF;font-size: 13px;">
			<font style="font-weight: bolder;color: red;font-size: 15px">${topicVO.userVO.username }</font><br/><br/>
			<font style="color: gray;font-size: 13px">${topicVO.userVO.userInfoVO.userSign }</font><br/><br/>
			<img alt="${topicVO.userVO.username}" src="${topicVO.userVO.userInfoVO.image}" width="120" height="120">
			<br/><br/>UID：${topicVO.userVO.userInfoVO.uid }
			<br/><br/>注册时间：<font style="color: gray">${topicVO.userVO.userInfoVO.regTimeStr}</font>
			<br/><br/>最后登录：<font style="color: gray">${topicVO.userVO.userInfoVO.loginTimeStr }</font>
			</td>
			<td style="height: 90%;width:80%;font-size: 14px;background-color: white;" valign="top">
				<div>
					<table style="width: 100%;height: 25px;">
						<tr>
							<td style="padding-left:10px;color: orangered;;border-bottom: 1px dashed #DCDCDC;width: 100%;height:100%">
								0&nbsp;&nbsp;<ont style="font-size: 13px;color: gray">发表于：${topicVO.sendTimeStr}</font>
							</td>
						</tr>
					</table>
				</div>
				<div style="padding: 10px;" class="content">
				<font style="font-size: 24px;color: #1E90FF;">${topicVO.title}</font>
				<div style="height: 5px"></div>
				${topicVO.content}
				</div>
			</td>
		</tr>
		<tr>
			<td style="background-color:#E0FFFF;"></td>
			<!-- 个性签名 -->
			<td valign="middle" style="height:30px;width: 80%;margin-left: 10px;font-size: 12px;border-top: 1px dashed #DCDCDC;background-color: white;">
			${topicVO.userVO.userInfoVO.postSign}
			</td>
		</tr>
	</table>
	</c:if>
	
	<!-- 回帖楼层 -->
	<c:set value="1" var="i"/>
	<c:forEach var="reply" items="${replys.items}">
		<table class="table" style="width: 98%;height: 560px;margin-top:5px;border: 1px solid #B0C4DE;" cellspacing="0" cellpadding="0">
		<tr>
			<td valign="top" style="width:180px;padding: 20px;background-color: #E0FFFF;font-size: 13px;">
			<font style="font-weight: bolder;color: red;font-size: 15px">${reply.userVO.username }</font><br/><br/>
			<font style="color: gray;font-size: 13px">${reply.userVO.userInfoVO.userSign }</font><br/><br/>
			<img alt="${reply.userVO.username}" src="${reply.userVO.userInfoVO.image}" width="120" height="120">
			<br/><br/>UID：${reply.userVO.userInfoVO.uid }
			<br/><br/>注册时间：<font style="color: gray">${reply.userVO.userInfoVO.regTimeStr}</font>
			<br/><br/>最后登录：<font style="color: gray">${reply.userVO.userInfoVO.loginTimeStr }</font>
			</td>
			<td style="height: 90%;width:80%;font-size: 14px;background-color: white;" valign="top">
				<div>
					<table style="width: 100%;height: 25px;">
						<tr>
							<td style="padding-left:10px;color: orangered;;border-bottom: 1px dashed #DCDCDC;width: 100%;height:100%">
								${i+(pageInfo.currentPage-1)*(pageInfo.itemNums)}&nbsp;&nbsp;<font style="font-size: 13px;color: gray">发表于：${reply.sendTimeStr}</font>
							</td>
						</tr>
					</table>
				</div>
				<div style="padding: 10px;">
				${reply.content}
				</div>
			</td>
		</tr>
		<tr>
			<td style="background-color: #E0FFFF;"></td>
			<!-- 个性签名 -->
			<td valign="middle" style="height:30px;width: 80%;margin-left: 10px;font-size: 12px;border-top: 1px dashed #DCDCDC;background-color: white;">
			${reply.userVO.userInfoVO.postSign}
			</td>
		</tr>
	</table>
	<c:set value="${i+1}" var="i"/>
	</c:forEach>
	</div>
	<div style="height: 10px;width: 100%;"></div>
	<!-- 分页链接 -->
	<div style="width:80%;float: left;margin-bottom: 50px;">
		<table class="table" cellpadding="0" cellspacing="0" align="left">
			<tr>
			<td style="font-size: 13px;padding-left: 5px;padding-right:5px; color: #6495ED;border: 1px solid #F0F8FF;">
				共${replys.totalCount}条&nbsp;&nbsp;每页${pageInfo.itemNums}条
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<c:choose>
					<c:when test="${pageInfo.currentPage==1}">
						<font style="color: gray">上一页</font>
						&nbsp;&nbsp;
						<font style="color: gray">第一页</font>
					</c:when>
					<c:otherwise>
						<a class="page_link" href="system/topic-viewReply.action?currentPage=1&topicVO.id=${topicVO.id}&subSectionVO.id=${subSectionVO.id}">第一页</a>
						&nbsp;&nbsp;
						<a class="page_link" href="system/topic-viewReply.action?currentPage=${pageInfo.currentPage-1}&topicVO.id=${topicVO.id}&subSectionVO.id=${subSectionVO.id}">上一页</a>
					</c:otherwise>
				</c:choose>
				&nbsp;&nbsp;
				<c:choose>
					<c:when test="${pageInfo.currentPage==pageInfo.allPages}">
						<font style="color: gray">下一页</font>
						&nbsp;&nbsp;
						<font style="color: gray">最末页</font>
					</c:when>
					<c:otherwise>
						<a class="page_link" href="system/topic-viewReply.action?currentPage=${pageInfo.currentPage+1}&topicVO.id=${topicVO.id}&subSectionVO.id=${subSectionVO.id}">下一页</a>
						&nbsp;&nbsp;
						<a class="page_link" href="system/topic-viewReply.action?currentPage=${pageInfo.allPages}&topicVO.id=${topicVO.id}&subSectionVO.id=${subSectionVO.id}">最末页</a>
					</c:otherwise>
				</c:choose>
				
			</td>
			<td style="width: 5px;"></td>
			<td style="width:160px;font-size: 13px;margin-left: 5px;color: #6495ED;border: 1px solid #F0F8FF;" align="center">
				Pages：${pageInfo.currentPage}/${pageInfo.allPages}&nbsp;&nbsp;	Go&nbsp;<input type="text" size="2" style="font-size: 8px" id="input_page_2" onblur="jumpToPage('#input_page_2',${topicVO.id},${subSectionVO.id},${pageInfo.allPages})">
			</td>
			</tr>
		</table>
	</div>
	<!-- 回帖按钮 -->
	<div style="width:20%;float: left;">
	<table class="table" style="width: 100%">
		<tr>
			<td style="padding-right: 5px;width: 100%" align="right">
				<c:choose>
					<c:when test="${user!=null}">
					<img alt="发表回复" src="images/reply.png" style="cursor: pointer;" onclick="prepareReply(${topicVO.id},${subSectionVO.id});">
					</c:when>
					<c:otherwise>
						<img src="images/blank.png"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	</div>
	</div>
	
	<!-- 底部 -->
	<jsp:include page="../footer.jsp"/>
	<script type="text/javascript" src="/bbs/js/system_manage/reply_list.js" ></script>
</body>
</html>