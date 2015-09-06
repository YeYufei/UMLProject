<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台管理_管理员列表</title>
<link rel="stylesheet" type="text/css" href="css/admin_manage/admin_user_list.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/admin_manage/admin_manager_list.js"></script>
</head>
<body>
<div style="width: 100%;height: 100%">
	<table style="width: 90%;font-size: 15px;margin:20px; font-weight: bolder">
		<tr>
			<td>
				<img src="images/user_list.png">&nbsp;&nbsp;管理员列表
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img alt="刷新列表" src="images/action_refresh.gif">&nbsp;&nbsp;
				<a href="javaScript:document.execCommand('Refresh')" style="font-size: 13px;">刷新列表</a>
			</td>
		</tr>
	</table>
	
	<c:choose>
		<c:when test="${users.totalCount=='0'}">
			<table style="width: 90%;margin:20px;">
				<tr>
					<td>
						<font style="font-size: 13px;color: red;">暂无任何管理员</font>
					</td>
				</tr>
			</table>
		</c:when>
		<c:otherwise>
		<table id="list" style="width: 90%;margin:20px;" cellspacing="0">
		<tr>
			<th>序号</th>
			<th>ID</th>
			<th>管理员名称</th>
			<th>管理员密码</th>
			<th>管理员邮箱</th>
			<th style="text-align: center">管理</th>
		</tr>
		<c:set value="1" var="i"/>
			<c:forEach var="userVO" items="${users.items}">
					<tr style="color: #FF8C00">
						<td style="color:#4169E1;font-weight: bolder;padding-left: 10px;">
							${i+(pageInfo.currentPage-1)*(pageInfo.itemNums)}
						</td>
						<td>${userVO.id}</td>
						<td align="left">
						<a class="a1" href="admin/user-viewManager?userVO.id=${userVO.id}&currentPage=${pageInfo.currentPage}">${userVO.username}</a>
						</td>
						<td>${userVO.userpwd}</td>
						<td align="left">${userVO.email}</td>
						<td style="text-align: center;width: 200px">
						<img alt="查看管理员详细信息" src="images/view_note.gif">
						<a href="admin/user-viewManager?userVO.id=${userVO.id}&currentPage=${pageInfo.currentPage}" onclick="showMask();">查看</a>
						<img alt="解除管理员身份" src="images/delete_manager.png">
						<a href="javaScript:void(0);" onclick="deleteManager(${userVO.id},${pageInfo.currentPage});" onclick="showMask();">解除管理员</a>
						</td>
					</tr>
				<c:set value="${i+1}" var="i"/>
			</c:forEach>
			</table>
			<!-- 分页工具条 -->
			<table style="width: 90%;margin:20px;font-size: 12px;color: blue">
				<tr>
					<td>
						共${users.totalCount}条&nbsp;&nbsp;
						每页${pageInfo.itemNums} 条&nbsp;&nbsp;
						本页${pageInfo.currentItemNums} 条&nbsp;&nbsp;
						共${pageInfo.allPages}页
					</td>
					<td align="right">
					<c:choose>
					<c:when test="${pageInfo.currentPage!=1}">
						<img onclick="window.location.href='admin/user-queryAllUser?currentPage=1'" src="images/resultset_first.png" alt="第一页" style="cursor: pointer;"/>
						<img onclick="window.location.href='admin/user-queryAllUser?currentPage=${pageInfo.currentPage-1}'" src="images/resultset_previous.png" alt="上一页" style="cursor: pointer;"/>
					</c:when>
					</c:choose>
					 第${pageInfo.currentPage}页
					 <c:choose>
						 <c:when test="${pageInfo.currentPage!=pageInfo.allPages}">
							<img onclick="window.location.href='admin/user-queryAllUser?currentPage=${pageInfo.currentPage+1}'" src="images/resultset_next.png" alt="下一页" style="cursor: pointer;"/>
						 	<img onclick="window.location.href='admin/user-queryAllUser?currentPage=${pageInfo.allPages}'" src="images/resultset_last.png" alt="最后一页" style="cursor: pointer;"/>
						 </c:when>
					 </c:choose>
					</td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>
