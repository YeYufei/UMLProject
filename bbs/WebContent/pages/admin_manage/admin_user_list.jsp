<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台管理_用户列表</title>
<link rel="stylesheet" type="text/css" href="css/admin_manage/admin_user_list.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/admin_manage/admin_user_list.js"></script>
</head>
<body>
<div style="width: 100%;height: 100%">
	<table style="width: 96%;font-size: 15px;margin:20px; font-weight: bolder">
		<tr>
			<td>
				<img src="images/user_list.png">&nbsp;用户列表
				&nbsp;&nbsp;
				<img alt="刷新列表" src="images/action_refresh.gif">
				<a href="javaScript:document.execCommand('Refresh')" style="font-size: 13px;">刷新列表</a>
				&nbsp;
				<img src="images/all_user.png">&nbsp;<a style="color: #228B22;font-size: 13px" href="admin/user-queryAllUser?currentPage=1" onclick="showMask();">所有用户</a>
				<img src="images/active_user.png">&nbsp;<a style="color: #FF8C00;font-size: 13px" href="admin/user-queryAllActiveUser?currentPage=1" onclick="showMask();">激活用户</a>
				<img src="images/nospeak_user.png">&nbsp;<a style="color: red;font-size: 13px"  href="admin/user-queryAllNospeakUser?currentPage=1" onclick="showMask();">禁言用户</a>
				<img src="images/locked_user.png">&nbsp;<a style="color: gray;font-size: 13px"  href="admin/user-queryAllLockedUser?currentPage=1" onclick="showMask();">锁定用户</a>
				<select id="query_type" style="font-size: 10px;">
					<option value="01">用户名</option>
					<option value="02">用户ID</option>
				</select>
				<input id="query_value" type="text" style="font-size: 10px;color: #DCDCDC;" value="支持模糊查询">
				<img src="images/query.png" alt="检索" style="cursor: pointer;" id="query_btn">
			</td>
		</tr>
	</table>
	
	<c:choose>
		<c:when test="${users.totalCount=='0'}">
			<table style="width: 90%;margin:20px;">
				<tr>
					<td>
						<font style="font-size: 13px;color: red;">暂无任何符合条件用户</font>
					</td>
				</tr>
			</table>
		</c:when>
		<c:otherwise>
		<table id="list" style="width: 96%;margin:20px;" cellspacing="0">
		<tr>
			<th>序号</th>
			<th>ID</th>
			<th>用户名</th>
			<th>用户密码</th>
			<th style="text-align: center">管理</th>
		</tr>
		<c:set value="1" var="i"/>
			<c:forEach var="userVO" items="${users.items}">
			<c:choose>
				<c:when test="${userVO.status=='01'}">
					<tr style="color: #FF8C00">
						<td style="color:#4169E1;font-weight: bolder;padding-left: 10px;">
							${i+(pageInfo.currentPage-1)*8}
						</td>
						<td>${userVO.id}</td>
						<td align="left">
						<a class="a1" href="admin/user-viewUser?userVO.id=${userVO.id}&currentPage=${pageInfo.currentPage}">${userVO.username}</a>
						</td>
						<td>${userVO.userpwd}</td>
						<td style="text-align: center;width: 400px">
						<img alt="查看用户详细信息" src="images/view_note.gif">
						<a href="admin/user-viewUser?userVO.id=${userVO.id}&currentPage=${pageInfo.currentPage}" onclick="showMask();">查看</a>
						<img alt="锁定用户" src="images/group_link.png">
						<a href="javaScript:void(0);" onclick="lockUser(${userVO.id},${pageInfo.currentPage});" >锁定</a>
						<img alt="禁言用户" src="images/group_delete.png">
						<a href="javaScript:void(0);" onclick="forbidUser(${userVO.id},${pageInfo.currentPage});">禁言</a>
						<img alt="设为版主" src="images/add_manager.png">
						<a class="select_link" href="javaScript:void(0);" onclick="chooseUser(${userVO.id});">设为版主</a>
						<img alt="设为管理员" src="images/add_manager.png">
						<a href="javaScript:void(0);" onclick="addManager(${userVO.id},${pageInfo.currentPage});">设为管理员</a>
						</td>
					</tr>
				</c:when>
				<c:when test="${userVO.status=='02'}">
					<tr style="color: red">
						<td style="color:#4169E1;font-weight: bolder;padding-left: 10px;">
							${i+(pageInfo.currentPage-1)*8}
						</td>
						<td>${userVO.id}</td>
						<td align="left">
						<a class="a2" href="admin/user-viewUser?userVO.id=${userVO.id}&currentPage=${pageInfo.currentPage}">
						${userVO.username}
						</a>
						</td>
						<td>${userVO.userpwd}</td>
						<td style="text-align: center;width: 400px">
						<img alt="查看用户详细信息" src="images/view_note.gif">
						<a href="admin/user-viewUser?userVO.id=${userVO.id}&currentPage=${pageInfo.currentPage}" onclick="showMask();">查看</a>
						<img alt="激活用户" src="images/group_key.png">
						<a href="javaScript:void(0);" onclick="doActiveUser(${userVO.id},${pageInfo.currentPage});" onclick="showMask();">激活</a>
						<img alt="锁定用户" src="images/group_link.png">
						<a href="javaScript:void(0);" onclick="lockUser(${userVO.id},${pageInfo.currentPage});" onclick="showMask();">锁定</a>
						<img alt="设为版主" src="images/add_manager.png">
						<font color="gray">设为版主</font>
						<img alt="设为管理员" src="images/add_manager.png">
						<font color="gray">设为管理员</font>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr style="color: gray">
					<td style="color:#4169E1;font-weight: bolder;padding-left: 10px;">
						${i+(pageInfo.currentPage-1)*8}
					</td>
					<td>${userVO.id}</td>
					<td align="left">
					<a class="a3" href="admin/user-viewUser?userVO.id=${userVO.id}&currentPage=${pageInfo.currentPage}">
					${userVO.username}
					</a>
					</td>
					<td>${userVO.userpwd}</td>
					<td style="text-align: center;width: 400px">
					<img alt="查看用户详细信息" src="images/view_note.gif">
					<a href="admin/user-viewUser?userVO.id=${userVO.id}&currentPage=${pageInfo.currentPage}" onclick="showMask();">查看</a>
					<img alt="激活用户" src="images/group_key.png">
					<a href="javaScript:void(0);" onclick="doActiveUser(${userVO.id},${pageInfo.currentPage});" onclick="showMask();">激活</a>
					<img alt="禁言用户" src="images/group_delete.png">
					<font color="gray">禁言</font>
					<img alt="设为版主" src="images/add_manager.png">
					<font color="gray">设为版主</font>
					<img alt="设为管理员" src="images/add_manager.png">
					<font color="gray">设为管理员</font>
					</td>
				</tr>
				</c:otherwise>
			</c:choose>
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
<div style="position: absolute;display: none;background-color:#F0FFFF ;width:500px; border: 5px solid #D2691E;" id="subSections">
	<div style="width: 100%;padding: 5px" align="right">
		<span style="width: 90%;text-align: left;font-weight: bolder;color: blue">请选择板块:</span>
		<img alt="关闭" src="images/cancel.png" style="cursor: pointer;" id="close_btn"/>
	</div>
	<table style="width:90%;margin:10px; font-size: 13px;" align="center">
 		<c:choose>
 			<c:when test="${sections==null}">
 				<tr>
					<td>
						<font style="color: red;font-size: 13px;">暂时没有任何板块存在</font>
					</td>
				</tr>
 			</c:when>
 			<c:otherwise>
			<c:forEach items="${sections}" var="sectionVO">
				<tr style="margin: 5px;">
					<td style="font-size: 16px">
						<font color="red">${sectionVO.name}：</font>
					</td>
				</tr>
				<tr style="margin: 5px;">
					<td>
					<c:choose>
						<c:when test="${fn:length(sectionVO.subSectionList)==0}">
							<font style="color: red;font-size: 13px;">暂时没有任何子板块存在</font>
						</c:when>
						<c:otherwise>
							<c:forEach items="${sectionVO.subSectionList}" var="subSectionVO">
								<a class="subSection" onclick="select(${subSectionVO.id});">[${subSectionVO.name}]</a>&nbsp;&nbsp;
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
	<div style="width: 100%;padding: 5px" align="center">
		<img alt="提交" src="images/submit.png" style="cursor: pointer;" id="submit_btn">
	</div>
</div>
</body>
</html>
