<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台管理_子板块列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/admin_manage/admin_subSection_list.js"></script>
<style type="text/css">
body{
	border: 1px solid #87CEEB;
}

#list td{
	font-size: 13px;
	vertical-align: middle;
	border-top: 1px dashed #B0C4DE;
	padding-top: 5px;
	padding-bottom: 2px;
}
.bg_tr{
	background-color: #F0F8FF;
}

th{
	font-size: 15px;
	color: #4169E1;
	background-color: white;
	font-weight: bolder;
}
a:visited{
	color:blue;
}
</style>
<script type="text/javascript">
		$(document).ready(function(){
			$('#list tr:even').addClass("bg_tr");
		});
</script>
</head>
<body>
<div style="width: 100%;height: 100%">
	<table style="width: 90%;font-size: 15px;margin:20px; font-weight: bolder" >
		<tr>
			<td>
				<img src="images/section_list.png">&nbsp;&nbsp;子板块列表
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img alt="添加子板块" src="images/add_note.gif">&nbsp;&nbsp;
				<a href="admin/section-toAddSubSection" style="font-size: 13px;">添加子板块</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<img alt="刷新列表" src="images/action_refresh.gif">&nbsp;&nbsp;
				<a href="javaScript:document.execCommand('Refresh')" style="font-size: 13px;">刷新列表</a>
			</td>
		</tr>
	</table>
	
	<c:choose>
		<c:when test="${subSections.totalCount=='0'}">
			<table style="width: 90%;margin:20px;">
				<tr>
					<td>
						<font style="font-size: 13px;color: red;">暂无任何子板块</font>
					</td>
				</tr>
			</table>
		</c:when>
		<c:otherwise>
		<table id="list" style="width: 90%;margin:20px;" cellspacing="0">
		<tr>
			<th>序号</th>
			<th>板块名称</th>
			<th>板块简介</th>
			<th>父版块</th>
			<th>创建时间</th>
			<th style="text-align: center">管理</th>
		</tr>
		<c:set value="1" var="i"/>
			<c:forEach var="subSectionVO" items="${subSections.items}">
				<tr>
					<td style="color:#4169E1;font-weight: bolder;padding-left: 10px;">${i+(pageInfo.currentPage-1)*8}</td>
					<td align="left"><a href="admin/section-viewSubSection?subSectionVO.id=${subSectionVO.id}&currentPage=${pageInfo.currentPage}">&nbsp;${subSectionVO.name}</a></td>
					<td align="left">
					<c:choose>
						<c:when test="${fn:length(subSectionVO.profile)<=15}">
							&nbsp;${subSectionVO.profile}"
						</c:when>
						<c:otherwise>
							&nbsp;${fn:substring(subSectionVO.profile,0,15)}……
						</c:otherwise>
					</c:choose>
					</td>
					<td>&nbsp;${subSectionVO.sectionName}</td>
					<td>&nbsp;${subSectionVO.createtimeStr}</td>
					<td style="text-align: center;width: 200px">
					<img alt="查看子板块" src="images/view_note.gif">
					<a href="admin/section-viewSubSection?subSectionVO.id=${subSectionVO.id}&currentPage=${pageInfo.currentPage}" onclick="showMask();">查看</a>
					<img alt="删除子板块" src="images/delete_note.gif">
					<a href="javaScript:void(0);" onclick="deleteSubSection(${subSectionVO.id},${pageInfo.currentPage});" onclick="showMask();">删除</a>
					<img alt="修改子板块" src="images/edit_note.gif">
					<a href="admin/section-editSubSection?subSectionVO.id=${subSectionVO.id}&currentPage=${pageInfo.currentPage}" onclick="showMask();">修改</a>
					</td>
				</tr>
				<c:set value="${i+1}" var="i"/>
			</c:forEach>
			</table>
			<!-- 分页工具条 -->
			<table style="width: 90%;margin:20px;font-size: 12px;color: blue">
				<tr>
					<td>
						共${subSections.totalCount}条&nbsp;&nbsp;
						每页${pageInfo.itemNums} 条&nbsp;&nbsp;
						本页${pageInfo.currentItemNums} 条&nbsp;&nbsp;
						共${pageInfo.allPages}页
					</td>
					<td align="right">
					<c:choose>
					<c:when test="${pageInfo.currentPage!=1}">
						<img onclick="window.location.href='admin/section-queryAllSubSection?currentPage=1'" src="images/resultset_first.png" alt="第一页" style="cursor: pointer;"/>
						<img onclick="window.location.href='admin/section-queryAllSubSection?currentPage=${pageInfo.currentPage-1}'" src="images/resultset_previous.png" alt="上一页" style="cursor: pointer;"/>
					</c:when>
					</c:choose>
					 第${pageInfo.currentPage}页
					 <c:choose>
						 <c:when test="${pageInfo.currentPage!=pageInfo.allPages}">
							<img onclick="window.location.href='admin/section-queryAllSubSection?currentPage=${pageInfo.currentPage+1}'" src="images/resultset_next.png" alt="下一页" style="cursor: pointer;"/>
						 	<img onclick="window.location.href='admin/section-queryAllSubSection?currentPage=${pageInfo.allPages}'" src="images/resultset_last.png" alt="最后一页" style="cursor: pointer;"/>
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
