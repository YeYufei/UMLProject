<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
	<!-- link rel="stylesheet" type="text/css" href="css/index.css"-->
	<!--link rel="stylesheet" type="text/css" href="comm/gallery/style.css"-->
	<script type="text/javascript" src="/bbs/comm/gallery/gallery.js"></script>
	<title>首页</title>
	</head>
	<body>
	<c:if test="${allSections==null}">
	<script type="text/javascript">
		window.location.href="/bbs/system/pageInit-init.action";
	</script>
	</c:if>
			<!-- 头部 -->
			<jsp:include page="header.jsp"/>
						<!-- Modal -->

			<!-- LOGO部分 -->
			<jsp:include page="logo.jsp"/>

			<!-- 正文部分 -->
			<!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" style="border:0px;padding:0px;height:auto;"data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="images/slide-First1.png" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1 style="font-size:40px">华工水水在线</h1>
              <p>加入我们<code>现在！马上！</code> ,你会收获华工大家庭！！</p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="images/slide-Second2.png"  alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>另外。。。</h1>
              <p>这里有性格迥异的朋友，这里有亲切的家人，这里是你永远的港湾~</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
    
			<!-- 论坛即时动态 
			<table style="color: gray; font-size: 13px; width: 100%">
				<tr>
					<td style="width: 50%; padding-left: 10px" align="left">
						今日:41 | 昨日:68 | 最高日:21376 | 标记已读
					</td>
					<td style="width: 50%; padding-right: 10px" align="right">
						主题:122052 | 帖子:645991 | 会员:42893 | 新会员:给太阳洒水
					</td>
				</tr>
			</table>
			-->
			
			<div class="container" >
			
			<!-- 空隙 -->
			<div style="height: 1px;"></div>
			
			<c:if test="${user!=null}">
				<table style="width: 100%">
					<tr>
						<td style="padding-left: 5px;">
						<a href="/bbs/system/publish_topic.action" ><img alt="发帖" src="images/fatie.png"></a>
						</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${user==null}">
				<table style="width: 100%">
					<tr>
						<td style="padding-left: 5px;">
						<img src="images/blank.png">
						</td>
					</tr>
				</table>
			</c:if>
			<!-- 论坛之最 -->
			<table class="table">
				<tr>
					<td style="width: 38%; color: #228B22;padding-top: 5px;" align="left">
						今日天气
					</td>
					<td style="width: 30%; color: #800000; padding-left: 10px;padding-top: 5px;"
						align="left">
						最新主题
					</td>
					<td style="width: 30%; color: #228B22;padding-top: 5px;" align="left">
						最新回复
					</td>
				</tr>
				<tr style="border-bottom: 1px dashed gray;">
					<td style="width: 30%;" align="left" >
							<c:choose>
								<c:when test="${imageList!=null}">
								<div id="container">
								  <div id="WeatherDiv">
									<!--div id="img_gallery">
										<div id="img1" class="big_image_div_show">
										<c:forEach var="imageVO" items="${imageList}" begin="0" end="0">
											<img id="show_image" src="${imageVO.url}" class="big_image"/>
										</c:forEach>
										</div-->
										</div>
									<!-- div id="img_description">
										<c:forEach var="imageVO" items="${imageList}">
											<img src="${imageVO.url}" class="small_image">
										</c:forEach>
									</div-->
								</div>
								</c:when>
								<c:otherwise>
									<div style="margin: 10px;">暂无图片</div>
								</c:otherwise>
							</c:choose>
					</td>
					<td style="width: 33% ; padding-left: 10px"
						align="left" valign="top">
						<ul class="toplist">
						<c:forEach var="topicVO" items="${latestTopicVOList}">
							<li>
								<c:choose>
									<c:when test="${fn:length(topicVO.title)>20}">
										<a style="color:#6A5ACD;" href="system/topic-viewReply.action?currentPage=1&topicVO.id=${topicVO.id}&subSectionVO.id=${topicVO.sid}"
										>${fn:substring(topicVO.title,'0','20')}……</a>
										&nbsp;&nbsp;<font style="color: gray;font-size: 10px;">${topicVO.sendTimeStr}</font>
									</c:when>
									<c:otherwise>
										<a style="color:#6A5ACD;" href="system/topic-viewReply.action?currentPage=1&topicVO.id=${topicVO.id}&subSectionVO.id=${topicVO.sid}""
										>${topicVO.title}</a>
										&nbsp;&nbsp; <font style="color: gray;font-size: 10px;">${topicVO.sendTimeStr}</font>
									</c:otherwise>
								</c:choose>
							</li>
						</c:forEach>
						</ul>
					</td>
					<td style="width: 33%;" align="left" valign="top">
						<ul class="toplist">
						<c:forEach var="replyVO" items="${latestReplyVOList}">
							<li>
								<c:choose>
									<c:when test="${fn:length(replyVO.title)>20}">
										<a style="color:#6A5ACD;" href="system/topic-locateViewReply.action?replyVO.id=${replyVO.id}&topicVO.id=${replyVO.tid}"
										>${fn:substring(replyVO.title,'0','20')}……</a>
										&nbsp;&nbsp;<font style="color: gray;font-size: 10px;">${replyVO.sendTimeStr}</font>
										
									</c:when>
									<c:otherwise>
										<a style="color:#6A5ACD;" href="system/topic-locateViewReply.action?replyVO.id=${replyVO.id}&topicVO.id=${replyVO.tid}"
										>${replyVO.title}</a>
										&nbsp;&nbsp;<font style="color: gray;font-size: 10px;">${replyVO.sendTimeStr}</font>
										
									</c:otherwise>
								</c:choose>
							</li>
						</c:forEach>
						</ul>
					</td>
				</tr>
			</table>
			
			<!-- 空隙 -->
			<div style="height: 10px;"></div>
			<%int i = 0; %>
			<c:forEach var="sectionVO" items="${allSections}">
			<div class="panel panel-primary">
            <div class="panel-heading">
            <table>
					<tr>
						<td style="color:white">
							<img src="images/forward.png">
							${sectionVO.name}
						</td>
						<td align="right">
							<img id="open<%=i%>" src="images/cate_fold.gif"
								style="cursor: pointer;">
						</td>
					</tr>
				</table>
            </div>
            <div class="panel-body">
            <div class="row featurette">
      
            <div class="col-md-12">
				<!-- 板块标题 -->
				
				<script type="text/javascript">
				var i1 = <%=i%>;
					$('#open'+i1).click(function(){
						$('#section'+i1).toggle("500");
						if($(this).attr('src')=='images/cate_fold.gif'){
							$(this).attr('src','images/cate_open.gif');
						}else {					
							$(this).attr('src','images/cate_fold.gif');
						}
					});
				</script>
				<!-- 子版块列表 -->
				<table id="section<%=i%>" class="table table-bordered">
				<tr>
					<td>
						<table style="width:100%;">
							<tr>
								<td style="width: 40%;text-align:center;" align="center" colspan="2">
									板块
								</td>
								<td style="width: 15%;text-align:center;" align="center">
									主题/文章
								</td>
								<td style="width: 25%;text-align:center;" align="left">
									最后主题
								</td>
								<td style="width: 20%;text-align:center;" align="left">
									版主
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<c:forEach var="subSectionVO" items="${sectionVO.subSectionList}">
				<tr>
					<td>
						<table>
							<tr>
								<td style="padding-left: 5px;"><a href="system/topic-queryAllTopicBySid?currentPage=1&subSectionVO.id=${subSectionVO.id}"><img src="images/old.gif"/></a></td>
								<td style="width: 38%; padding-left: 20px;" align="left" valign="middle">
									<a style="font-weight: bolder;color: red" href="system/topic-queryAllTopicBySid?currentPage=1&subSectionVO.id=${subSectionVO.id}">『${subSectionVO.name}』</a>
									<br /><br />
									&nbsp;&nbsp;
									<font style="font-size: 12px;color: gray">
									<c:choose>
										<c:when test="${fn:length(subSectionVO.profile)<=30}">
											${subSectionVO.profile}
										</c:when>
										<c:otherwise>
											${fn:substring(subSectionVO.profile,0,30)}……
										</c:otherwise>
									</c:choose>
									</font>
								</td>
								<td style="width: 15%;color: #00BFFF;text-align:center;" align="center">
									${subSectionVO.topicNum}/${subSectionVO.articleNum}
								</td>
								<td style="width: 25%;color:#6A5ACD;" align="left">
									<c:choose>
									<c:when test="${fn:length(subSectionVO.topicVO.title)>20}">
										<a style="color:#6A5ACD;" href="system/topic-viewReply.action?currentPage=1&topicVO.id=${subSectionVO.topicVO.id}&subSectionVO.id=${subSectionVO.topicVO.sid}"
										>${fn:substring(subSectionVO.topicVO.title,'0','20')}……</a>
										<br />&nbsp;<font style="color: gray;font-size: 10px;">${subSectionVO.topicVO.sendTimeStr}</font>
									</c:when>
									<c:otherwise>
										<a style="color:#6A5ACD;" href="system/topic-viewReply.action?currentPage=1&topicVO.id=${subSectionVO.topicVO.id}&subSectionVO.id=${subSectionVO.topicVO.sid}"
										>${subSectionVO.topicVO.title}</a>
										<br />&nbsp;<font style="color: gray;font-size: 10px;">${subSectionVO.topicVO.sendTimeStr}</font>
									</c:otherwise>
								</c:choose>
								</td>
								<td style="width: 20%;color:#FF4500;text-align:center;" align="left">
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
					</td>
				</tr>
				</c:forEach>
				</table>
				<!-- 空隙 -->
				<div style="height: 10px"></div>
				</div>
				</div>
				</div>
				</div>
				<%i++; %>
			</c:forEach>
			<!-- 空隙 -->
			<div style="height: 50px"></div>
			</div>
			<!-- 底部 -->
			<jsp:include page="footer.jsp"/>
			<script type="text/javascript" src="/bbs/js/index.js" ></script>
	</body>
</html>
