<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<!-- script type="text/javascript" src="js/system_manage/register.js"></script-->
<link rel="stylesheet" type="text/css" href="/bbs/css/system_manage/register.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
</head>

<body>
<!-- 头部 --> 
<nav class="navbar navbar-fixed-top navbar-inverse">
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
        </div><!-- /.nav-collapse -->
        
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
    <div style="height:50px;" ></div>
    <div style="width:100%;height:120px;background-color:#337AB7">
      <p style="color:white;font-size:20px;padding-left:50px;padding-top:40px;">加入我们！赶紧注册吧~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-lg btn-success" >[&nbsp;Get Started Now!&nbsp;]</a></p>
    </div>
<div class="container" >
<!--bar -->
<table class="table">
	<tr>
		<td
			style="padding-top: 5px; padding-left: 10px; font-weight: bold; font-size: 15px;">
		注册</td>
	</tr>
</table>

<!-- 间隙 -->
<div style="height: 20px; width: 100%"></div>

<!-- 注册表单 -->
<div>
<table class="table" >
	<tr>
		<td colspan="3" align="left"
			style="font-weight: bold; font-size: 15px">请填写以下必填信息完成注册</td>
	</tr>
	<tr>
		<td width="20%" align="right">用户名&nbsp;<font color="red">*</font>
		</td>
		<td width="20%" align="center">
		<div class="input_div"><input id="username" name="username"
			tabindex="1" type="text" style="border: none;" size="30"
			maxlength="20" align="middle" /></div>
		</td>
		<td width="50%" align="left">
		<div class="validate_div" id="username_validate_div">
		不能有空格，可以是中文，长度控制在 3-20字节以内</div>
		</td>
	</tr>
	<tr>
		<td width="20%" align="right">密码&nbsp;<font color="red">*</font>
		</td>
		<td width="20%" align="center">
		<div class="input_div"><input id="userpwd" name="userpwd"
			tabindex="2" type="password" style="border: none;" size="30"
			maxlength="20" align="middle" /></div>
		</td>
		<td width="50%" align="left">
		<div id="password_validate_div" class="validate_div">最小长度:6
		最大长度:20</div>
		</td>
	</tr>
	<!-- 密码强度验证 -->
	<tr>
		<td width="20%" align="right">
		</td>
		<td width="20%" align="center">
			<div class="strong_div">
				<img id="strong_1" src="images/strong_false.png">
			</div>
			<div class="strong_div" >
				<img id="strong_2" src="images/strong_false.png">
			</div>
			<div class="strong_div" >
				<img id="strong_3" src="images/strong_false.png">
			</div>
			<div class="strong_div" >
				<img id="strong_4" src="images/strong_false.png">
			</div>
		</td>
		<td width="50%" align="left">
		<div id="password_strong_div" class="validate_div">
		</div>
		</td>
	</tr>
	<tr>
		<td width="20%" align="right">确认密码&nbsp;<font color="red">*</font>
		</td>
		<td width="20%" align="center">
		<div class="input_div"><input id="userpwdConfirm"
			name="userpwdConfirm" tabindex="3" type="password"
			style="border: none;" size="30" maxlength="20" align="middle" /></div>
		</td>
		<td width="50%" align="left">
		<div id="password_confirm_validate_div" class="validate_div">
		请再输入一遍您上面填写的密码</div>
		</td>
	</tr>
	<tr>
		<td width="20%" align="right">Email&nbsp;<font color="red">*</font>
		</td>
		<td width="20%" align="center">
		<div class="input_div"><input id="email" name="email"
			tabindex="4" type="text" style="border: none;" size="30"
			maxlength="30" align="middle" /></div>
		</td>
		<td width="50%" align="left">
		<div id="email_validate_div" class="validate_div">请填写真实并且最常用的邮箱
		</div>
		</td>
	</tr>
	<!-- tr>
		<td width="20%" align="right">安全问题</td>
		<td width="20%" align="center">
		<div class="input_div"><select tabindex="5" name="question"
			id="question" style="border: none; width: 100%">
			<option>无安全问题</option>
			<option>我父亲的姓名</option>
			<option>我母亲的姓名</option>
			<option>我父亲的生日</option>
			<option>我母亲的生日</option>
			<option>我最爱的人是谁</option>
			<option>我喜欢的运动</option>
			<option>我的大学名称</option>
		</select></div>
		</td>
		<td width="50%" align="left">
		<div class="validate_div">如果启用了安全问题，需要填写正确的答案才能登录站点</div>
		</td>
	</tr>
	<tr>
		<td width="20%" align="right">您的答案</td>
		<td width="20%" align="center">
		<div class="input_div"><input disabled="disabled" id="answer"
			name="answer" tabindex="6" type="text" style="border: none;"
			size="30" maxlength="50" align="middle" /></div>
		</td>
		<td width="50%" align="left">
		<div id="answer_validate_div" class="validate_div"></div>
		</td>
	</tr-->
	<tr>
		<td width="20%" align="right">验证码&nbsp;<font color="red">*</font>
		</td>
		<td width="20%" align="center">
		<div class="input_div" style="float: left; width: 40%"><input
			id="randCode" name="randCode" tabindex="7" type="text"
			style="border: none;" size="10" maxlength="4" align="middle" /></div>
		</td>
		<td width="50%" align="left">
		<div id="randCode_validate_div" class="validate_div">请输入验证码</div>
		</td>
	</tr>
	<tr>
		<td width="20%" align="right"></td>
		<td width="20%" align="left" valign="middle">
			<span>
			<img id="randCodeImg"
			alt="换一张" src="pages/system_manage/randCode.jsp?" +<%=Math.random()%>
			style="cursor: pointer;"> 
			</span>
			<!--<a id="changeRandCode" tabindex="8"
			style="color: blue; text-decoration: none; cursor: pointer;">
			&nbsp;&nbsp;&nbsp;看不清楚，换一张
			</a>
		-->
			<span style="color:red">
				<a id="changeRandCode"  style="cursor: pointer;">看不清楚，换一张</a>
			</span>
			
		</td>
		<td width="50%" align="left"></td>
	</tr>
	<tr>
		<td width="20%" align="right"></td>
		<td width="20%" align="left"><span style="width: 40%"> 
			<input type="submit" id="registerButton" tabindex="9" value="提交注册"
			 class="btn btn-primary" />
		</span> <span style="width: 40%; margin-left: 40px"> <input
			type="button" id="reset" alt="重置" tabindex="10"
			class="btn btn-default" value="重置" ></span></td>
		<td width="50%" align="left"></td>
	</tr>
</table>
</div>


<!-- 间隙 -->
<div style="height: 20px;"></div>
</div>

<!-- 底部 --> <jsp:include page="../footer.jsp" />
<script type="text/javascript" src="/bbs/comm/jquery/jquery.js"></script>
<script type="text/javascript" src="/bbs/js/system_manage/register.js" ></script>
</body>
</html>