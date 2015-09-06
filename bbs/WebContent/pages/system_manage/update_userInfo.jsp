<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/comm/jsp/common.jsp"%>
<%request.setCharacterEncoding("UTF-8");
  String picUrl = request.getParameter("Picurl");
  System.out.println(" picUrl is  "+ picUrl);
  String  step = request.getParameter("step"); 
  String defaultPic ="image/man.GIF";
  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style type="text/css">
.link{
	background-image: url("images/link_bg.png");
}
.small_image{
	width: 60px;
	height:60px;
	margin: 10px;
	cursor: pointer;
}
.upload_small_image{
	width: 60px;
	height:60px;
	margin: 10px;
	cursor: pointer;
}

.small_image_select{
	border: 1px dashed red;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- link rel="stylesheet" type="text/css" href="comm/extjs/UploadDialog/css/Ext.ux.UploadDialog.css" />
<script type="text/javascript" src="comm/extjs/UploadDialog/Ext.ux.UploadDialog.js"></script>
<script type="text/javascript" src="comm/extjs/UploadDialog/locale/ru.utf-8_zh.js"></script-->
<style type="text/css">
body
{
	font-size:12px;
	font-family:'Microsoft Yahei';
}
.left
{
    float:left;	
    width:30%;
}
.right
{
    float:left;
    width:40%;
    margin-left:5px;
}
.title
{
    border-bottom:solid 1px #ccc;	
}
.photocontainer
{
	margin-top:10px;
	background:url("../image/bg_120.gif") no-repeat left top;   
	padding:7px 12px 12px 7px;                                        
}  
.uploadtooltip
{
	margin-top:10px;
	color: #555;	
	line-height:150%;
}
.uploaddiv
{
	margin-top:10px;
}
input
{
	padding:3px;  
}

#Step2Container{
	width:600px;
	padding-left:100px;
	padding-top:20px;
	padding-bottom:20px;
	padding-right:100px;
	margin:auto;
	height:auto;
	position:absolute;
	z-index:1003;
	background-color: #fff;
	border: 1px solid #000;
	border-radius: 5px;
	border-color: #000;
	box-shadow: 0px 0px 30px ;color: #000;
	}

#Canvas
{
    position: relative;
    width:600px;
    height:266px;
    border:2px solid #888888;
    overflow:hidden;	          
    cursor:pointer;	
}
.smallbig
{
    cursor:pointer;	
}
 #bar
{
	 width: 211px;
     height: 18px;
     background-image: url("/bbs/image/track.gif");
     background-repeat: no-repeat;
     position: relative;
 }
.child
{
    width: 11px;
    height: 16px;
    background-image: url("/bbs/image/grip.gif");
    background-repeat: no-repeat;
    left: 0;top:2px;
    position: absolute;
    left:100px;
}
.imagePhoto
{
	border-width:0px;
	position:relative;
}
#IconContainer
{
	position:relative;    
	left:0px;
	top:-120px;    
	      	          	
}  
#IconContainer img
{
	FILTER:alpha(opacity=60);
	opacity:0.6;    
	background-color:#ccc;	   
}
#ImageDragContainer 
{
	border: 1px solid #ccc;
    width: 120px;
    height: 120px;
    cursor: pointer;
    position: relative;
    top: 73px; 
    left: 82px	;
    overflow: hidden;
    z-index:10002;
}   
    #Step2Container{width:400px;padding-left:100px;padding-top:20px;padding-bottom:20px;padding-right:50px;height:auto;position:absolute;z-index:1003;background-color: #fff;border: 1px solid #000;border-radius: 5px;border-color: #000;box-shadow: 0px 0px 30px ;color: #000;}
    #uploadExit{float: right;margin-right: 6px;margin-bottom:3px;font-size: 14px;color: #000;font-family:"Microsoft YaHei";cursor:pointer;}
    #bg-shadow{top:-20px;left:0px;position: absolute;z-index: 1000;background-color: #000;filter:alpha(opacity=70);-moz-opacity:0.70; opacity:0.70;display: block;}
</style>
<title>修改个人信息</title>
</head>
<script type="text/javascript" src="/bbs/js/system_manage/update_userInfo.js"></script>
<body>

<script type="text/javascript">
//注销函数
function logout(){
	if(!confirm("确认要退出登陆吗？")) return;
	$.ajax({
 		   url:'system/user-logout.action',
 		   type:"POST",
 		   cache : false,
 		   success:function(entry) {
 			      window.location.href="/bbs/logout_success.action";
 		    },
 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
 		    	window.location.href="/bbs/logout_success.action";
 		    	//alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
		   	}});
}
</script>
<center>
<%
	UserVO userVO = (UserVO) session.getAttribute(Constants.USER_KEY);
	if (userVO == null) {
%> <script type="text/javascript">
		window.location.href="/bbs/logout.action";
	</script> <%
 	} else {
 	UserInfoVO userInfo = userVO.getUserInfoVO();
 	if(userInfo.getImage()!=null&&!userInfo.getImage().equals(""))
 		defaultPic = userInfo.getImage();
 	if("3".equals(step))
 	    defaultPic = "/bbs/UserFiles/User/UserHeadImage/"+picUrl;
 %> 
 <div id="bg-shadow"></div>
 <!-- top -->
<table class="table" style="font-size: 13px; width: 98%;" cellspacing="0">

	<tr style="width: 98%; height: 50px; background-color: #1E90FF">
		<td align="left" valign="middle"
			style="padding-left: 50px; font-size: 20px; color: white; font-weight: bolder">管理中心</td>
		<td align="right" valign="middle" style="padding-right: 20px"><font
			style="color: white; font-weight: bolder; font-size: 15px"><%=userVO.getUsername()%></font>
		&nbsp;&nbsp;&nbsp;&nbsp; <a style="cursor: pointer;color: white;"
			onClick="logout();">注销</a> <font
			style="color: white; font-size: 12px">|</font>
			<a style="cursor: pointer;color: white;" onClick="javaScript:window.location.href='/bbs/welcome.jsp'">回到首页</a>
		</td>
	</tr>

	<tr style="height: 600px; width: 98%; background-color: #F0FFFF">
		<td height="50px" width="100%" style="padding: 20px" colspan="2">
		<ul style="margin-left: 50px; margin-bottom: 10px">
			<li style="display: inline; padding-left: 10px; padding-right: 10px">
			<a id="info" style="color: blue;font-size: 14px;cursor: pointer;">基本资料</a>
			</li>
			<li style="display: inline; padding-left: 10px; padding-right: 10px">
			<a id="connect" style="color: blue;font-size: 14px;cursor: pointer;">联系方式</a>
			</li>
			<li style="display: inline; padding-left: 10px; padding-right: 10px">
			<a id="image" style="color: blue;font-size: 14px;cursor: pointer;">修改头像</a>
			</li>
			<li style="display: inline; padding-left: 10px; padding-right: 10px">
			<a id="password" style="color: blue;font-size: 14px;cursor: pointer;">修改密码</a>
			</li>
		</ul>
		<div id="infoDiv" style="width: 100%; height: 550px; background-color: white;" align="center" >
		<table class="table" style="padding: 20px; margin: 5px; width: 96%; font-size: 13px"
			cellspacing="0">
			<tr style="height: 50px">
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px;width: 20%">
				性别
				</td>
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
					<%if("男".equals(userInfo.getSex())){ %>
						<input type="radio" name="sex" id="secret_radio" value="00">保密
						<input type="radio" name="sex" id="man_radio"  value="01" checked="checked">男
						<input type="radio" name="sex" id="woman_radio" value="02">女
					<%}else if("女".equals(userInfo.getSex())){ %>
						<input type="radio" name="sex" id="secret_radio"  value="00">保密
						<input type="radio" name="sex" id="man_radio" value="01">男
						<input type="radio" name="sex" id="woman_radio" value="02" checked="checked">女
					<%}else{ %>
						<input type="radio" name="sex" id="secret_radio"  value="00" checked="checked">保密
						<input type="radio" name="sex" id="man_radio" value="01">男
						<input type="radio" name="sex" id="woman_radio" value="02">女
					<%} %>
				</td>
			</tr>
			<tr style="border-top: 1px dashed #B0E0E6; height: 50px">
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
				生日
				</td>
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
					<input id="birthday" type="text" name="birthday" value="<%=userInfo.getBirthday()%>">
					<font style="12px">（格式：年-月-日，如2010-05-10）</font>
				</td>
			</tr>
			<tr style="border-top: 1px dashed #B0E0E6; height: 50px">
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
				来自
				</td>
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
					<input type="text" name="address" size="35" value="<%=userInfo.getAddress()%>">
				</td>
			</tr>
			<tr style="border-top: 1px dashed #B0E0E6; height: 50px">
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
				个人主页
				</td>
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
					<input type="text" name="website" size="35" value="<%=userInfo.getWebSite()%>">
				</td>
			</tr>
			<tr style="border-top: 1px dashed #B0E0E6; height: 50px">
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
				个性签名
				</td>
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
					<input type="text" name="usersign" size="35" value="<%=userInfo.getUserSign()%>">
					<font style="12px">（将在我的首页和帖子页面用户信息处显示,限100字节）</font>
				</td>
			</tr>
			<tr style="border-top: 1px dashed #B0E0E6; height: 100px">
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
				自我简介
				</td>
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
					<textarea rows="4" cols="35" name="introduction" style="overflow-x:hidden;" ><%=userInfo.getPostSign()%></textarea>
					<br><font style="12px">限500字节</font>
				</td>
			</tr>
			<tr style="border-top: 1px dashed #B0E0E6; height:100px">
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
				帖子签名
				</td>
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
					<textarea rows="4" cols="35"  name="postsign" style="overflow-x:hidden;"><%=userInfo.getPostSign()%></textarea>
					<br><font style="12px">（将在每个帖子下方显示，限1000字节）</font>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<div style="height: 30px"></div>
					<input class="btn btn-success" type="submit" id="saveInfoBtn_1" style="cursor: pointer;" value="保存资料" alt="保持资料">
				</td>
			</tr>
		</table>
		</div>
		<div id="connectDiv" style="width: 100%; height: 550px; background-color: white;">
			<table class="table" style="padding: 20px; margin: 5px; width: 96%; font-size: 13px"
			cellspacing="0">
			<tr style="border-top: 1px dashed #B0E0E6; height: 50px">
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
				邮箱
				</td>
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
					<%=userVO.getEmail()%>
				</td>
			</tr>
			<tr style="height: 50px">
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px;width: 20%">
				电话
				</td>
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
					<input name="telephone" type="text" value="<%=userInfo.getTelephone()%>">
				</td>
			</tr>
			<tr style="border-top: 1px dashed #B0E0E6; height: 50px">
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
				手机
				</td>
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
					<input name="mobile" type="text" value="<%=userInfo.getMobile()%>">
				</td>
			</tr>
			<tr style="border-top: 1px dashed #B0E0E6; height: 50px">
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
				QQ
				</td>
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
					<input type="text" name="qq" value="<%=userInfo.getQq()%>">
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<div style="height: 30px"></div>
					<input class="btn btn-success" type="submit" id="saveInfoBtn_2" style="cursor: pointer;" value="保存资料" alt="保持资料">
				</td>
			</tr>
		</table>
		</div>
		<div id="imageDiv" style="width: 100%; height: 550px; background-color: white;">
		
		
		
		
		
		<!--Step 2-->
         <div id="Step2Container">
           <div class="title"><b> 裁切头像照片</b><a id="uploadExit">X</a></div>
           <div class="uploadtooltip">您可以拖动照片以裁剪满意的头像</div>                              
                   <div id="Canvas" class="uploaddiv">
                   
                            <div id="ImageDragContainer">                               
                               <img id="ImageDrag" class="imagePhoto" src="/bbs/UserFiles/UploadPhoto/<%=picUrl %>" style="border-width:0px;" />                                                        
                            </div>
                            <div id="IconContainer">                               
                               <img id="ImageIcon" class="imagePhoto" src="/bbs/UserFiles/UploadPhoto/<%=picUrl%>" style="border-width:0px;" />                                                        
                            </div>                          
                    </div>
                    <div class="uploaddiv">
                       <table>
                            <tr>
                                <td id="Min">
                                        <img alt="缩小" src="image/_c.gif" onmouseover="this.src='image/_c.gif';" onmouseout="this.src='image/_h.gif';" id="moresmall" class="smallbig" />
                                </td>
                                <td>
                                    <div id="bar">
                                        <div class="child">
                                        </div>
                                    </div>
                                </td>
                                <td id="Max">
                                        <img alt="放大" src="image/c.gif" onmouseover="this.src='image/c.gif';" onmouseout="this.src='image/h.gif';" id="morebig" class="smallbig" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <form action="/bbs/servlet/ZoomImage" method="post">
                    <input type="hidden" name="picture" value="<%=picUrl%>"/>
                    <div class="uploaddiv">
                        <input type="submit" name="btn_Image" class="btn btn-success" value="保存头像" id="btn_Image" />
                    </div>           
                    <div>
                    图片实际宽度： <input name="txt_width" type="text" value="1" id="txt_width" /><br />
                    图片实际高度： <input name="txt_height" type="text" value="1" id="txt_height" /><br />
                    距离顶部： <input name="txt_top" type="text" value="82" id="txt_top" /><br />
                    距离左边： <input name="txt_left" type="text" value="73" id="txt_left" /><br />
                    截取框的宽： <input name="txt_DropWidth" type="text" value="120" id="txt_DropWidth" /><br />
                    截取框的高： <input name="txt_DropHeight" type="text" value="120" id="txt_DropHeight" /><br />
                    放大倍数： <input name="txt_Zoom" type="text" id="txt_Zoom" value="1"/>
                   </div>  </form>
         </div>
      

	<div class="container">
		<table class="table table-striped">
		    <tr>
				<td>
					上传头像:
				</td>
				<td>
				    <div class="left">
                    <!--当前照片-->
                    <div id="CurruntPicContainer">
                    <div class="title"><b>当前照片</b></div>
                    <div class="photocontainer">
                    <img id="imgphoto" src="<%=defaultPic%>" style="border-width:0px;" />
                    </div>
                    </div>
                    </div>
					<!-- form method="post" action="uploadFile" enctype="multipart/form-data">
                    <input type="file" name="file1" /><br/>
                    <button type="submit" >上传</button>
                    </form-->
                    <form name="form1" method="POST" action="/bbs/servlet/UpLoadUserHeadImage" id="form1" enctype="multipart/form-data">
                    <div class="right">
                    <!--Step 1-->
                    <div id="Step1Container">
                    <div class="title"><b>更换照片</b></div>
                    <div id="uploadcontainer">
                    <div class="uploadtooltip">请选择新的照片文件，文件需小于2.5MB</div>
                    <div class="uploaddiv"><input type="file" name="file" id="fuPhoto" title="选择照片" class="btn btn-primary" onchange="this.form.submit();"/></div>
                    <div class="uploaddiv"><input type="submit" name="btnUpload" value="上 传" class="btn btn-primary" id="btnUpload" /></div>
                    </div>
                    </div>
                    </div>
                    </form>
                    <%if(picUrl==null){
				       session.setAttribute("userImage", "./UserFiles/User/UserHeadImage/man.gif");
			        }else{
			           session.setAttribute("userImage", "/bbs/UserFiles/User/UserHeadImage/"+picUrl);
			        }
			           System.out.println("客户端发送地址"+defaultPic);
			        %>
				</td>
			</tr>
		</table>
		</div>
			<!-- table class="table" style="padding: 20px; margin: 5px; width: 96%; font-size: 13px"
				cellspacing="0">
				<tr style="font-size: 12px;">
					<td rowspan="2" style="width: 130px;border-top: 1px dashed #B0E0E6;" valign="top">
						<%if(StringUtil.isNullOrEmpty(userInfo.getImage())){ %>
							<img id="image_show" src="images/system_image/default_image_boy.gif" width="120px" height="120px" style="margin: 20px">
						<%}else{ %>
							<img id="image_show" src="<%=userInfo.getImage()%>" width="120px" height="120px" style="margin: 20px">
						<%} %>
					</td>
					<td style="width:100%;border-top: 1px dashed #B0E0E6;padding-top: 20px" valign="top">
						<input type="radio" name="image_type" id="system_image_radio">系统头像
						<input type="radio" name="image_type" id="upload_image_radio" checked="checked">头像上传
					</td>
				</tr>
				<tr>
					<td style="width:100%;height:400px; border-top: 1px dashed #B0E0E6;">
						<div id="system_image_div" style="width: 100%;height: 100%;display: none;">
							<ul>
								<li style="display: inline">
									<img src="images/system_image/default_image_boy.gif" class="small_image">
								</li>
								<li style="display: inline">
									<img src="images/system_image/default_image_girl.gif" class="small_image">
								</li>
							</ul>
							
							<div style="margin-top:  30px" align="center">
							<input type="submit" id="saveInfoBtn_3_1"  style="cursor: pointer;" value="保存资料" alt="保持资料">
							</div>
						</div>
						<!--div id="upload_image_div" style="width: 100%;height: 100%">
							<table style="font-size: 12px;margin: 20px">
								<tr>
									<td>
										<img id="upload_image_btn" src="/bbs/images/upload_image.png" style="cursor: pointer;display: inline;">
										<img id="save_upload_image_btn" src="/bbs/images/save_image.png" style="margin-left:20px;cursor: pointer;display: none;">
									</td>
								</tr>
								<tr>
									<td style="padding-top: 10px">
										<font color="red">*</font>支持JPG、JPEG、GIF、PNG文件格式,最大1M
									</td>
								</tr>
								<tr>
									<td style="padding-top: 50px;width: 100%">
										<div id="upload_small_div" style="width: 100%;" >
										</div>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table-->
			
			
			
			
			
			
			
			
			
			
			
			</div>
			
			
		<div id="passswordDiv" style="width: 100%; height: 550px; background-color: white;">
			<table class="table" style="padding: 20px; margin: 5px; width: 96%; font-size: 13px"
			cellspacing="0">
			<tr style="border-top: 1px dashed #B0E0E6; height: 50px">
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
				旧密码
				</td>
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
					<input name="old_password" type="password">
				</td>
			</tr>
			<tr style="height: 50px">
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px;width: 20%">
				新密码
				</td>
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
					<input name="userpwd" type="password">
					<font style="12px">（最小长度:6	最大长度:20）</font>
				</td>
			</tr>
			<tr style="border-top: 1px dashed #B0E0E6; height: 50px">
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
				确认新密码
				</td>
				<td style="border-top: 1px dashed #B0E0E6; padding-left: 20px">
					<input name="userpwd_confirm" type="password">
					<font style="12px">（请再输入一遍您上面填写的密码）</font>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<div style="height: 30px"></div>
					<input class="btn btn-success" type="submit" id="saveInfoBtn_4"  style="cursor: pointer;" value="保存资料" alt="保持资料">
				</td>
			</tr>
		</table>
		</div>
		</td>
	</tr>

	<%
		}
	%>
</table>

<!-- 间隙 -->
<div style="height: 20px;"></div>

<!-- 底部 --> <jsp:include page="../footer.jsp" /></center>
<% 
      if(step==null&&(null==picUrl||"".equals(picUrl)))
      {%>
          <script type='text/javascript'> 
          $("#info").css({"color":"red"});
		$("#connect").css({"color":"blue"});
		$("#image").css({"color":"blue"});
		$("#password").css({"color":"blue"});
		$("#infoDiv").css({"display":"block"});
		$("#passswordDiv").css({"display":"none"});
		$("#connectDiv").css({"display":"none"});
		$("#imageDiv").css({"display":"none"});
		$("#bg-shadow").hide();
		$("#Step2Container").hide();</script>
      <%}else if(!"".equals(picUrl)&& "2".equals(step)){
      %>
      <script type='text/javascript'>
        $("#image").css({"color":"red"});
		$("#info").css({"color":"blue"});
		$("#connect").css({"color":"blue"});
		$("#password").css({"color":"blue"});
		$("#infoDiv").css({"display":"none"});
		$("#connectDiv").css({"display":"none"});
		$("#imageDiv").css({"display":"block"});
		$("#passswordDiv").css({"display":"none"});
        //$("#bg-shadow").show();
       $("#Step2Container").show();</script>
      <%}else if(!"".equals(picUrl)&& "3".equals(step)){
      %>
      <script type='text/javascript'>
      
        $("#bg-shadow").hide();
        $("#image").css({"color":"red"});
		$("#info").css({"color":"blue"});
		$("#connect").css({"color":"blue"});
		$("#password").css({"color":"blue"});
		$("#infoDiv").css({"display":"none"});
		$("#connectDiv").css({"display":"none"});
		$("#imageDiv").css({"display":"block"});
		$("#passswordDiv").css({"display":"none"});
		$("#Step2Container").hide();</script>
      <%}else if("4".equals(step)){
    	  System.out.println("Get in");
      %>
      <script type='text/javascript'>
        $("#bg-shadow").hide();
        $("#image").css({"color":"red"});
		$("#info").css({"color":"blue"});
		$("#connect").css({"color":"blue"});
		$("#password").css({"color":"blue"});
		$("#infoDiv").css({"display":"none"});
		$("#connectDiv").css({"display":"none"});
		$("#imageDiv").css({"display":"block"});
		$("#passswordDiv").css({"display":"none"});
		$("#Step2Container").hide();</script>
      <%}%>
<script type="text/javascript" src="/bbs/js/system_manage/jquery1.2.6.pack.js"></script>
<script  type="text/javascript" src="/bbs/js/system_manage/ui.core.packed.js" ></script>
<script type="text/javascript" src="/bbs/js/system_manage/ui.draggable.packed.js" ></script>
<script type="text/javascript" src="/bbs/js/system_manage/CutPic.js"></script>
</body>
</html>