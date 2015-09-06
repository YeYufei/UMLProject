<%@ page language="java" pageEncoding="UTF-8"%>
<%@	page import="cn.edu.ahut.vo.UserVO"%>
<%@	page import="cn.edu.ahut.vo.UserInfoVO"%>
<%@	page import="cn.edu.ahut.util.Constants"%>
<%@	page import="cn.edu.ahut.util.StringUtil"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<!-- link rel="stylesheet" type="text/css" href="css/header.css"-->
<link rel="stylesheet" type="text/css" href="/bbs/comm/bootstrap/css/carousel.css" />
<link href="/bbs/comm/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>

<body>
<div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">413Project</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
          <div class="navbar-right" style="padding-top:10px;padding-right:20px;">
		<%
			UserVO userVO = (UserVO) session.getAttribute(Constants.USER_KEY);
			if (userVO == null) {
		%>

	    <a href="#myModal" id="loginBut" role="button" data-toggle="modal" class="btn btn-success">登录</a> <img src="images/sparator.png">
		<a target="blank" href="/bbs/system/register.action" class="btn btn-primary" id="registerHref">注册</a>
		<%
			} else {
				UserInfoVO userInfoVO = userVO.getUserInfoVO();
				String imagePath = userInfoVO.getImage();
				if(StringUtil.isNullOrEmpty(imagePath)){
					String sex = userInfoVO.getSex();
					if(StringUtil.isNullOrEmpty(sex) || "男".equals(sex)){
						imagePath = "images/system_image/default_image_boy.gif";
					}else{
						imagePath = "images/system_image/default_image_girl.gif";
					}
				}
		%>
		<img src="<%=imagePath%>" class="img-circle" width="40px" height="40px"/>
		<span style="color:white;"><%=userVO.getUsername()%>,&nbsp;欢迎回来!&nbsp;</span>
		<a href="/bbs/system/update_userInfo.action">管理中心</a>
		<a id="logout" href="javaScript:void(0);" class="a1" id="logout">注销</a>
		<%
			}
		%>
</div>
        </div><!-- /.nav-collapse -->
        
      </div><!-- /.container -->
        </nav>

      </div>
    </div>
    <div id="myModal" style="background-color:white;width:561px;height:540px;border-radius:5px;" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">登陆弹窗</h3>
    </div>
    <div class="modal-body">
    <form>
  <div class="form-group">
    <label for="username">用户名</label>
    <input type="text" class="form-control" id="username" placeholder="Username">
  </div>
  <div class="form-group">
    <label for="userPwd">密码</label>
    <input type="password" class="form-control" id="userPwd" placeholder="Password">
  </div>
  <label for="PICPassword">验证码</label>
  <input type="text" id="PICPassword" name="checkCode" class="form-control" placeholder="CheckCode" required><img id="changePic"style="margin-top:5px;margin-right:20px;width:100px;height:50px;" border="0"  /><a class="btn btn-primary" id="checkCodelink" >换一张</a>
  
</form>
    </div>
    <div class="modal-footer">
    <button id="submitLog" type="submit" class="btn btn-default">登陆</button>
    <button class="btn btn-primary">重置</button>
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    
    </div>
    </div>
<!-- table id="topTable_right"
	style="width: 100%; height: 30px; text-align: right; display: none;">
	<tr>
		<td><img id="down" src="images/down.png" style="cursor: pointer;"
			alt="展开"></td>
	</tr>
</table-->
<script type="text/javascript" src="js/header.js" charset="UTF-8"></script>
</body>
</html>
