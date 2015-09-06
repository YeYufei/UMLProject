<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台管理_欢迎</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{
	border: 1px solid #87CEEB;
}
</style>
</head>
<body>

<c:if test="${admin==null}">
	<script type="text/javascript">
		window.parent.location='admin/admin_login.action';
	</script>
</c:if>
 <table style="width:100%;height:100%;font-size: 13px;">
		<tr>
			<td valign="top" style="padding: 50px;">
				管理员&nbsp;&nbsp;
				<font style="color: red;font-size: 15px">${admin.username }</font>
				&nbsp;&nbsp;欢迎您再次登录管理中心！
			</td>
		</tr>
	</table>
</body>
</html>
