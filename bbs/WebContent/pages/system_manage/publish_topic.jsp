<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/bbs/css/system_manage/public_topic.css" />
<link href="comm/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/bbs/comm/bootstrap/css/carousel.css" />
<script src="/bbs/comm/kindeditor/kindeditor.js" charset="utf-8" ></script>
<title>发帖</title>
<script type="text/javascript">
//
KE.show({
	id:'content',
	items:['source', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 
	'paste','plainpaste', 'wordpaste', 'justifyleft', 'justifycenter', 
	'justifyright','justifyfull', 'insertorderedlist', 'insertunorderedlist', 
	'indent', 'outdent', 'subscript','superscript', 'selectall','title', 
	'fontname', 'fontsize', 'textcolor', 'bgcolor','-', 'bold','italic', 'underline',
	'strikethrough', 'removeformat', 'image','flash', 'media', 'table', 'hr',
	'emoticons', 'link', 'unlink'],
	height:'400px',
	resizeMode:0,
	//skinType:'default',
	imageUploadJson:'/bbs/system/topic-uploadImage'//上传图片的服务器地址
});
</script>
</head>

<body>
<c:if test="${user==null}">
	<script type="text/javascript">
		window.parent.location='/bbs/logout.action';
	</script>
</c:if>
	<!-- 头部 -->
	<jsp:include page="../header.jsp"/>
	<!-- LOGO部分 -->
	<!--jsp:include page="../logo.jsp"/-->
	<div style="width:100%;height:200px;background-color:#337AB7">
      <p style="color:white;font-size:20px;padding-left:159px;padding-top:100px;">发帖开始新的一天吧~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-lg btn-success" >[&nbsp;Get Started Now!&nbsp;]</a></p>
    </div>
    <div style="height:20px;" ></div>
    <div class="container" >
	<div style="width: 100%;border: solid 1px #00BFFF;border-radius:5px;z-index: 0" id="main_div" >
	<form class="form-inline" method="post" action="system/topic-scanTopic.action" name="topicForm" id="topicForm">
	<table style="width: 100%;height: 30px;" class="table">
		<tr>
			<td style="font-size:13px ;width: 100%;padding-left: 20px;">
				<font style="color: #1E90FF;font-weight: bolder;">发表帖子</font>&nbsp;&nbsp;&nbsp;
				<a style="color: #2F4F4F" href="system/welcome-index.action">华南理工大学BBS论坛</a>
				<span id="section_name"></span><span style="margin-left: 50px"><a href="javaScript:void(0);" onclick="show_sections();">选择版块</a></span>
				<input type="hidden" id="sName" name="topicVO.sName" value="">
				<input type="hidden" id="sid" name="topicVO.sid" value="">
			</td>
		</tr>
	</table>
	
	<table class="table" style="width: 100%;" id="main_table">
		<tr>
			<td valign="top" style="width:180px;padding: 20px;background-color: #E0FFFF;font-size: 13px;">
			<font style="font-weight: bolder;color: red;font-size: 15px">${user.username }</font><br/><br/>
			<font style="color: gray;font-size: 13px">${user.userInfoVO.userSign }</font><br/><br/>
			<img alt="${user.username}" src="${user.userInfoVO.image}" width="120" height="120">
			<br/><br/>UID：${user.userInfoVO.uid }
			<br/><br/>注册时间：<font style="color: gray">${user.userInfoVO.regTimeStr}</font>
			<br/><br/>最后登录：<font style="color: gray">${user.userInfoVO.loginTimeStr }</font>
			</td>
			<td style="height: 100%" valign="top">
				<input id="title" class="form-control" name="topicVO.title" size="100" style="margin-top: 3px;margin-bottom: 3px;"/>
				<textarea  class="form-control" id="content" name="topicVO.content" cols="105" rows="20"></textarea>
				<table style="width: 100%;margin-top: 10px;">
					<tr>
						<td style="width: 100%;">
						<input id="publish_btn" alt="发布" type="button" value="发布" style="cursor:pointer" class="btn btn-primary" />
						<input id="scan_btn" alt="预览" type="button" value="预览" style="cursor:pointer" class="btn btn-default" />
							<!--img id="publish_btn" alt="发布" src="images/publish.png" style="cursor: pointer;">
							<img id="scan_btn" alt="预览" src="images/scan.png" style="margin-left: 10px;cursor: pointer;"-->
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
	</div>
	</div>
	<!-- 空隙 -->
	<div style="height: 20px"></div>
	
	<!-- 底部 -->
	<jsp:include page="../footer.jsp"/>
	
	<!-- 板块选择区 -->
	<div style="position: absolute;z-index:4; display: none;background-color:#F0FFFF ;width:500px; border: 5px solid #D2691E;border-radius:5px;" id="subSections">
	<div style="width: 100%;padding: 5px" align="left">
		<span style="width: 98%;text-align: left;font-weight: bolder;color: blue">请选择板块:</span>
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
</div>
<script type="text/javascript" src="/bbs/js/system_manage/publish_topic.js"></script>
</body>
</html>