<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
//注销函数
	function logout(){
		$.ajax({
	 		   url:'admin/user-logout.action',
	 		   type:"POST",
	 		   cache : false,
	 		   success:function(entry) {
	 			  window.parent.location.href="/bbs/admin/admin_login.action";
	 		    },
	 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
	 		    	alert("系统发生错误，请与管理员联系！");
	 		    	//alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
			   	}});
		}
</script>
<center>
<%
			UserVO userVO = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
			if (userVO == null) {
			%> 
			<script type="text/javascript">
			window.parent.location.href="/bbs/admin/admin_login.action";
			</script> 
			<%} else {
 			UserInfoVO userInfo = userVO.getUserInfoVO();
 			%> 
	 <!-- top -->
	<table style="font-size: 13px; width: 100%;" cellspacing="0">
		<tr style="width: 100%; height: 50px; background-color: #1E90FF">
			<td align="left" valign="middle"
				style="width:150px; padding-left: 50px; font-size: 20px; color: white; font-weight: bolder">
				后台管理中心
			</td>
			<td align="left">
			<div id="clock" style="font-size: 11px; color:white;"></div>
			</td>
			<td align="right" valign="middle" style="padding-right: 20px"><font
				style="color: white; font-weight: bolder; font-size: 15px">欢迎，管理员：<%=userVO.getUsername()%></font>
			&nbsp;&nbsp;&nbsp;&nbsp; <a style="cursor: pointer;color: white;"
				onClick="logout();">退出</a>
			</td>
		</tr>
	<%} %>
	</table>
</center>


<!-- 显示时间 -->
<script>
   function tick() {
   var hours, minutes, seconds, xfile;
   var intHours, intMinutes, intSeconds;
   var today, theday;
   today = new Date();
   function initArray(){
   this.length=initArray.arguments.length;
   for(var i=0;i<this.length;i++)
   this[i+1]=initArray.arguments[i] ;}
   var d=new initArray(
   " 星期日",
   " 星期一",
   " 星期二",
   " 星期三",
   " 星期四",
   " 星期五",
   " 星期六");
   theday = today.getYear()+"年" + [today.getMonth()+1]+"月" +today.getDate()+"日" + d[today.getDay()+1];
   intHours = today.getHours();
   intMinutes = today.getMinutes();
   intSeconds = today.getSeconds();
   if (intHours == 0) {
   hours = "12:";
   xfile = " 午夜 ";
   } else if (intHours < 12) {
   hours = intHours+":";
   xfile = " 上午 ";
   } else if (intHours == 12) {
   hours = "12:";
   xfile = " 正午 ";
   } else {
   intHours = intHours - 12;
   hours = intHours + ":";
   xfile = " 下午 ";
   }
   if (intMinutes < 10) {
   minutes = "0"+intMinutes+":";
   } else {
   minutes = intMinutes+":";
   }
   if (intSeconds < 10) {
   seconds = "0"+intSeconds+" ";
   } else {
   seconds = intSeconds+" ";
   }
   timeString = theday+xfile+hours+minutes+seconds;
   document.getElementById('clock').innerHTML = timeString;
   window.setTimeout("tick();", 100);
   }
   window.onload = tick;
</script>
</body>
</html>