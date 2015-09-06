<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/comm/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="comm/js/ddaccordion.js">

</script>

<script type="text/javascript">


ddaccordion.init({
	headerclass: "silverheader", //Shared CSS class name of headers group
	contentclass: "submenu", //Shared CSS class name of contents group
	revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
	mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
	collapseprev: true, //Collapse previous content (so only one open at any time)? true/false
	defaultexpanded: [0], //index of content(s) open by default [index1, index2, etc] [] denotes no content
	onemustopen: true, //Specify whether at least one header should be open always (so never all headers closed)
	animatedefault: false, //Should contents open by default be animated into view?
	persiststate: true, //persist state of opened contents within browser session?
	toggleclass: ["", "selected"], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
	togglehtml: ["", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
	animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
	oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
		//do nothing
	},
	onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
		//do nothing
	}
});

</script>

<style type="text/css">

.applemenu{
margin: 0 0;
padding: 0;
width: 170px; /*width of menu*/
border: 1px solid #9A9A9A;
}

.applemenu div.silverheader a{
background: black url(/bbs/images/silvergradient.gif) repeat-x center left;
font: normal 15px Tahoma, "Lucida Grande", "Trebuchet MS", Helvetica, sans-serif;
color: white;
display: block;
position: relative; /*To help in the anchoring of the ".statusicon" icon image*/
width: auto;
padding: 5px 0;
padding-left: 8px;
text-decoration: none;
cursor: pointer;
}

.applemenu div.silverheader a:visited, .applemenu div.silverheader a:active{
color: white;
}

.applemenu div.selected a, .applemenu div.silverheader a:hover{
background-image: url(/bbs/images/silvergradientover.gif);
color: white;
}

.applemenu div.submenu{ /*DIV that contains each sub menu*/
background: white;
padding: 5px;
height: 300px; /*Height that applies to all sub menu DIVs. A good idea when headers are toggled via "mouseover" instead of "click"*/
}

.link_item{
	text-decoration: none;
	font-size: 13px;
	color: blue;
}
.link_item:hover{
	text-decoration: underline;
	font-size: 14px;
	color: red;
}
</style>

</head>

<body>

<div class="applemenu">
<div class="silverheader"><a><img src="/bbs/images/go_foward.png">用户管理</a></div>
	<div class="submenu" style="margin-left: 20px;">
		<ul>
			<li><img src="/bbs/images/go_foward.png"><a href="admin/user-queryAllManager?currentPage=1"  class="link_item" target="mainFrame">管理员列表</a>
			</li>
			<li><img src="/bbs/images/go_foward.png"><a href="admin/user-queryAllUser?currentPage=1"  class="link_item" target="mainFrame">用户列表</a>
			</li>
			<li><img src="/bbs/images/go_foward.png"><a href="admin/user-queryAllSectionManager?currentPage=1"  class="link_item" target="mainFrame">版主列表</a>
			</li>
		</ul>
	</div>
<div class="silverheader"><a><img src="/bbs/images/go_foward.png">板块管理</a></div>
	<div class="submenu" style="margin-left: 20px;">
		<ul>
		<li><img src="/bbs/images/go_foward.png"><a href="admin/section-queryAllSection?currentPage=1" class="link_item" target="mainFrame" >父板块列表</a>
		</li>
		<li><img src="/bbs/images/go_foward.png"><a href="/bbs/admin/admin_section_add.action" class="link_item" target="mainFrame">新增父板块</a>
		</li>
		<li><img src="/bbs/images/go_foward.png"><a href="admin/section-queryAllSubSection?currentPage=1" class="link_item" target="mainFrame">子板块列表</a>
		</li>
		<li><img src="/bbs/images/go_foward.png"><a href="admin/section-toAddSubSection" class="link_item" target="mainFrame">新增子板块</a>
		</ul>
	</div>
<div class="silverheader"><a><img src="/bbs/images/go_foward.png">公告管理</a></div>
	<div class="submenu" style="margin-left: 20px;">
		<ul>
		<li><img src="/bbs/images/go_foward.png"><a href="admin/notice-queryAllNotice?currentPage=1" class="link_item" target="mainFrame">公告列表</a>
		</li>
		<li><img src="/bbs/images/go_foward.png"><a href="admin/admin_notice_add.action" class="link_item" target="mainFrame">添加公告</a>
		</li>
		</ul>
	</div>
</div>

</body>
</html>
