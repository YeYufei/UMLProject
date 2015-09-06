<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/system_manage/topic_list.css">
<script type="text/javascript" src="js/system_manage/topic_list.js"></script>
<title>浏览主题帖-${subSectionVO.name}</title>
</head>
<body>
	<!-- 头部 -->
	<jsp:include page="../header.jsp"/>
	<!-- LOGO部分 -->
	<jsp:include page="../logo.jsp"/>

	<!-- 正文部分 -->
	<div style="width:100%;height:200px;background-color:#337AB7">
      <p style="color:white;font-size:20px;padding-left:159px;padding-top:100px;">发帖开始新的一天吧~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-lg btn-success" >[&nbsp;Get Started Now!&nbsp;]</a></p>
    </div>
    <div style="height:20px;" ></div>
    <div class="container" >
	<table class="table" cellspacing="0" cellpadding="0">
		<tr>
			<td style="background-color: #F0F8FF;padding-left: 5px;">
				<a style="color: #2F4F4F" href="system/welcome-index.action">华南理工大学BBS论坛</a>&gt;&gt;<a style="color: #2F4F4F" href="system/topic-queryAllTopicBySid?currentPage=1&subSectionVO.id=${subSectionVO.id}">『${subSectionVO.name}』</a>
			</td>
			<td align="right" style="padding-right: 20px;background-color: #F0F8FF;">
			版主：
			<c:choose>
				<c:when test="${subSectionVO.manager.username==null}">
				暂无版主
				</c:when>
				<c:otherwise>
				${subSectionVO.manager.username}
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
	</table>
	<table class="table">
		<tr>
			<td style="width: 50%;padding-left: 5px">
				板块简介
			</td>
			<td style="width: 45%" align="right">
			</td>
			<td align="center">
				<img id="open" src="images/cate_fold.gif"
					style="cursor: pointer;">
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		$('#open').live('click',function(){
			$('#section').slideToggle("500");
			if($(this).attr('src')=='images/cate_fold.gif'){
				$(this).attr('src','images/cate_open.gif');
			}else {					
				$(this).attr('src','images/cate_fold.gif');
			}
		});
	</script>
	<table id="section" class="table">
		<tr>
			<td align="left" style="padding: 10px;color: red;font-size: 13px" valign="top">
				${subSectionVO.profile}
			</td>
		</tr>
	</table>
	
	<!-- 间隙 -->
	<div style="height: 50px;width: 100%"></div>
	<c:choose>
		<c:when test="${topics.totalCount==0}">
			<table class="table" style="width: 100%;height:80px;">
				<tr>
					<td align="left" valign="top" style="padding-left: 10px;">
					<c:if test="${user!=null}">
					<table style="width: 100%">
						<tr>
							<td style="padding-left: 5px;">
							<a href="/bbs/system/publish_topic.action" ><img alt="发帖" src="images/fatie.png"></a>
							</td>
						</tr>
					</table>
					</c:if>
					<br /><br />
					<font style="font-size: 18px;color: red;">此版块暂无任何帖子</font>
					</td>
				</tr>
			</table>
		</c:when>
		<c:otherwise>
		<!-- 分页链接 -->
			<div style="width:80%;float: left">
				<table  class="table" cellpadding="0" cellspacing="0" align="left">
					<tr>
					<td style="font-size: 13px;padding-left: 5px;padding-right:5px; color: #6495ED;border: 1px solid #F0F8FF;">
						共${topics.totalCount}条&nbsp;&nbsp;每页${pageInfo.itemNums}条
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						<c:choose>
							<c:when test="${pageInfo.currentPage==1}">
								<font style="color: gray">上一页</font>
								&nbsp;&nbsp;
								<font style="color: gray">第一页</font>
							</c:when>
							<c:otherwise>
								<a class="page_link" href="system/topic-queryAllTopicBySid?currentPage=1&subSectionVO.id=${subSectionVO.id}">第一页</a>
								&nbsp;&nbsp;
								<a class="page_link" href="system/topic-queryAllTopicBySid?currentPage=${pageInfo.currentPage-1}&subSectionVO.id=${subSectionVO.id}">上一页</a>
							</c:otherwise>
						</c:choose>
						&nbsp;&nbsp;
						<c:choose>
							<c:when test="${pageInfo.currentPage==pageInfo.allPages}">
								<font style="color: gray">下一页</font>
								&nbsp;&nbsp;
								<font style="color: gray">最末页</font>
							</c:when>
							<c:otherwise>
								<a class="page_link" href="system/topic-queryAllTopicBySid?currentPage=${pageInfo.currentPage+1}&subSectionVO.id=${subSectionVO.id}">下一页</a>
								&nbsp;&nbsp;
								<a class="page_link" href="system/topic-queryAllTopicBySid?currentPage=${pageInfo.allPages}&subSectionVO.id=${subSectionVO.id}">最末页</a>
							</c:otherwise>
						</c:choose>
						
					</td>
					<td style="width: 5px;"></td>
					<td style="width:160px;font-size: 13px;margin-left: 5px;color: #6495ED;border: 1px solid #F0F8FF;" align="center">
						Pages：${pageInfo.currentPage}/${pageInfo.allPages}&nbsp;&nbsp;	Go&nbsp;<input type="text" size="2" style="font-size: 8px" id="input_page_1" onblur="jumpToPage('#input_page_1',${subSectionVO.id},${pageInfo.allPages})">
					</td>
					</tr>
				</table>
			</div>
			<div style="width:20%;float: left;">
			<table class="table" style="width: 100%">
				<tr>
					<td style="padding-right: 5px;width: 100%" align="right">
						<c:choose>
							<c:when test="${user!=null}">
							<a href="/bbs/system/publish_topic.action" target="_blank"><img alt="发帖" src="images/fatie.png"></a>
							</c:when>
							<c:otherwise>
								<img src="images/blank.png"/>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
			</div>
			
			<table class="table">
				<tr>
					<td>
						<table class="table">
							<tr style="color: gray;">
								<td style="width: 45%;padding-left: 20px;" align="left">
									文章
								</td>
								<td style="width: 15%" align="center">
									作者/时间
								</td>
								<td style="width: 15%;" align="center">
									回复/人气
								</td>
								<td style="width: 25%;padding-right: 5px;" align="left">
									最近发表
								</td>
							</tr>
						</table>
						<c:forEach var="topic" items="${topics.items}">
						<table class="table" cellspacing="0">
							<tr class="subSection_tr">
							<td style="border-bottom: 1px solid #F0F8FF;padding-left: 3px" valign="middle">
								&nbsp;<a href=system/topic-viewReply.action?currentPage=1&topicVO.id=${topic.id}&subSectionVO.id=${subSectionVO.id}"><img src="images/topichot.gif"/></a>
							</td>
							<td style="border-bottom: 1px solid #F0F8FF;width: 42%;padding-left: 3px" valign="middle">
								&nbsp;<a style="color: #C71585;" href="system/topic-viewReply.action?currentPage=1&topicVO.id=${topic.id}&subSectionVO.id=${subSectionVO.id}">${topic.title}</a>
							</td>
							<td style="border-bottom: 1px solid #F0F8FF;width: 15%;" align="center" valign="middle">
								&nbsp;<font style="color: #6A5ACD">${topic.userVO.username}</font><br />
								<font style="font-size: 11px;color: gray;">${topic.sendTimeStr}</font>
							</td>
							<td style="border-bottom: 1px solid #F0F8FF;width: 15%;" align="center" valign="middle">
								&nbsp;<font style="color: #00BFFF">${topic.replyNum}/${topic.clickNum}</font>
							</td>
							<td style="border-bottom: 1px solid #F0F8FF;width: 25%;" valign="middle">
								&nbsp;
								<c:choose>
									<c:when test="${topic.lastReplyVO.userVO==null}">
										<font style="color: #6A5ACD">${topic.userVO.username}</font>
										<br />
										&nbsp;&nbsp;&nbsp;<font style="font-size: 11px;color: gray;">${topic.sendTimeStr}</font>
									</c:when>
									<c:otherwise>
										<font style="color: #6A5ACD">${topic.lastReplyVO.userVO.username}</font>
										<br />
										&nbsp;&nbsp;&nbsp;<font style="font-size: 11px;color: gray;">${topic.lastReplyVO.sendTimeStr}</font>
									</c:otherwise>
								</c:choose>
								
								
								
							</td>
							</tr>
						</table>
						</c:forEach>
						<table><tr><td>&nbsp;</td></tr></table>
					</td>
				</tr>
			</table>
			
			<div style="height: 10px;width: 100%;"></div>
			<!-- 发帖链接 -->
			<div style="width:80%;float: left">
				<table class="table" cellpadding="0" cellspacing="0" align="left">
					<tr>
					<td style="font-size: 13px;padding-left 5px;padding-right:5px; color: #6495ED;border: 1px solid #F0F8FF;">
						共${topics.totalCount}条&nbsp;&nbsp;每页${pageInfo.itemNums}条
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						<c:choose>
							<c:when test="${pageInfo.currentPage==1}">
								<font style="color: gray">上一页</font>
								&nbsp;&nbsp;
								<font style="color: gray">第一页</font>
							</c:when>
							<c:otherwise>
								<a class="page_link" href="system/topic-queryAllTopicBySid?currentPage=1&topicVO.id=${topic.id}&subSectionVO.id=${subSectionVO.id}">第一页</a>
								&nbsp;&nbsp;
								<a class="page_link" href="system/topic-queryAllTopicBySid?currentPage=${pageInfo.currentPage-1}&topicVO.id=${topic.id}&subSectionVO.id=${subSectionVO.id}">上一页</a>
							</c:otherwise>
						</c:choose>
						&nbsp;&nbsp;
						<c:choose>
							<c:when test="${pageInfo.currentPage==pageInfo.allPages}">
								<font style="color: gray">下一页</font>
								&nbsp;&nbsp;
								<font style="color: gray">最末页</font>
							</c:when>
							<c:otherwise>
								<a class="page_link" href="system/topic-queryAllTopicBySid?currentPage=${pageInfo.currentPage+1}&topicVO.id=${topic.id}&subSectionVO.id=${subSectionVO.id}">下一页</a>
								&nbsp;&nbsp;
								<a class="page_link" href="system/topic-queryAllTopicBySid?currentPage=${pageInfo.allPages}&topicVO.id=${topic.id}&subSectionVO.id=${subSectionVO.id}">最末页</a>
							</c:otherwise>
						</c:choose>
						
					</td>
					<td style="width: 5px;"></td>
					<td style="width:160px;font-size: 13px;margin-left: 5px;color: #6495ED;border: 1px solid #F0F8FF;" align="center">
						Pages：${pageInfo.currentPage}/${pageInfo.allPages}&nbsp;&nbsp;	Go&nbsp;<input type="text" size="2" style="font-size: 8px" id="input_page_2" onblur="jumpToPage('#input_page_2',${subSectionVO.id},${pageInfo.allPages})">
					</td>
					</tr>
				</table>
			</div>
			<div style="width:20%;float: left;">
			<table class="table" style="width: 100%">
				<tr>
					<td style="padding-right: 5px;width: 100%" align="right">
						<c:choose>
							<c:when test="${user!=null}">
							<a href="/bbs/system/publish_topic.action" target="_blank"><img alt="发帖" src="images/fatie.png"></a>
							</c:when>
							<c:otherwise>
								<img src="images/blank.png"/>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
			</div>
		</c:otherwise>
	</c:choose>
	
	
	<!-- 空隙 -->
	<div style="height: 50px"></div>
	</div>

	<!-- 底部 -->
	<jsp:include page="../footer.jsp"/>
</body>
</html>