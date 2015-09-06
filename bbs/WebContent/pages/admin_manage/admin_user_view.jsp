<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台管理_用户查看</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/admin_manage/admin_section_view.js"></script>
<style type="text/css">
body{
	border: 1px solid #87CEEB;
}
#info_table{
	width:100%;
	font-size: 13px;
}
#info_table td{
	border-bottom: 1px dashed #B0C4DE;
	vertical-align: middle;
	padding-top: 5px;
	padding-bottom: 2px;
	text-align: left;
}

.value_td{
	color: #800080;
	font-size: 15px
}

th{
	font-weight:bolder; 
}
</style>
</head>
<body>
<div style="width: 100%;height: 100%">
	<table style="width: 90%;font-size: 15px;margin:20px; font-weight: bolder">
		<tr>
			<th>
				<img src="images/user_list.png">&nbsp;&nbsp;用户查看
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</th>
		</tr>
	</table>
	<table style="width: 90%;margin:20px;font-size: 13px;" cellspacing="0">
		<tr>
			<td valign="top">
				用户头像：<br />
				<c:choose>
					<c:when test="${userVO.userInfoVO.image==''}">
						<c:choose>
							<c:when test="${userVO.userInfoVO.sex=='女'}">
								<img alt="用户头像" src="images/system_image/default_image_girl.gif" width="120" height="120">
							</c:when>
							<c:otherwise>
								<img alt="用户头像" src="images/system_image/default_image_boy.gif" width="120" height="120">
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<img alt="用户头像" src="${userVO.userInfoVO.image}" width="120" height="120">
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<table id="info_table" >
					<tr>
						<td>用户名称:</td>
						<td class="value_td">&nbsp;${userVO.username }</td>
						<td >性别:</td>
						<td class="value_td">&nbsp;${userVO.userInfoVO.sex }</td>
						
						<td>用户ID:</td>
						<td class="value_td">&nbsp;${userVO.id }</td>
					</tr>
					<tr>
						<td>真实姓名:</td>
						<td class="value_td">&nbsp;${userVO.userInfoVO.realname }</td>
						<td >生日:</td>
						<td class="value_td">&nbsp;${userVO.userInfoVO.birthday }</td>
						<td >个人主页:</td>
						<td class="value_td">&nbsp;<a href="${userVO.userInfoVO.webSite }">${userVO.userInfoVO.webSite }</a></td>
					</tr>
					<tr>
						<td>手机号码:</td>
						<td class="value_td">&nbsp;${userVO.userInfoVO.mobile}</td>
						<td >ＱＱ:</td>
						<td class="value_td">&nbsp;${userVO.userInfoVO.qq }</td>
						<td >ＭＳＮ:</td>
						<td class="value_td">&nbsp;${userVO.userInfoVO.msn }</td>
					</tr>
					<tr>
						<td>电话号码:</td>
						<td class="value_td">&nbsp;${userVO.userInfoVO.telephone}</td>
						<td >积分:</td>
						<td class="value_td">&nbsp;${userVO.userInfoVO.scores }</td>
						<td >用户角色:</td>
						<td class="value_td">&nbsp;${userVO.userInfoVO.sysrole }</td>
					</tr>
					<tr>
						<td>注册时间:</td>
						<td class="value_td">&nbsp;${userVO.userInfoVO.regTimeStr}</td>
						<td>登录时间:</td>
						<td class="value_td">&nbsp;${userVO.userInfoVO.loginTimeStr}</td>
						<td >登录IP:</td>
						<td class="value_td">&nbsp;${userVO.userInfoVO.loginIp }</td>
					</tr>
					<tr>
						<td>个人签名:</td>
						<td class="value_td" colspan="5">&nbsp;${userVO.userInfoVO.userSign}</td>
					</tr>
					<tr>
						<td>来自哪里:</td>
						<td class="value_td" colspan="5">&nbsp;${userVO.userInfoVO.address}</td>
					</tr>
					<tr>
						<td>自我简介:</td>
						<td class="value_td" colspan="5">&nbsp;${userVO.userInfoVO.introduction}</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table style="font-size: 13px;text-align: right;width: 90%;margin:20px;">
		<tr>
			<td style="padding-left: 30px;">
				<a href="javaScript:history.go(-1);"><img alt="返回" src="images/go_back.png" />返回</a>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
