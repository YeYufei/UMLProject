$(document).ready(function(){
				
				$('#myModal').css({
					'margin-top': function () {
					return 70;//(document.documentElement.clientHeight-$(this).height())/2;
					},
					'margin-left':function(){
						return ($(window).width()-$(this).width())/2;
					}
					});
				$(window).resize(function(){
					$('#myModal').css({
						'margin-top': function () {
						return 70;//($(window).innerHeight()-$(this).height())/2;
						},
						'margin-left':function(){
							return ($(window).width()-$(this).width())/2;
						}
					});
				});
				
				$("#loginBut").click(function(event){
					event.preventDefault();
				   $('#myModal').modal('show');
				   return false;
				});
				
				$("#checkCodelink").click(function(event){
					event.preventDefault();
					changecheckPIC();
					return false;
				});
				function changecheckPIC(){
				     document.getElementById("changePic").src='pages/randCode.jsp?t='+Date.parse(new Date());//改变验证码图片,此处加参数防止IE7(及以上)和FireFox的缓存导致图片不刷新
				}
				
				changecheckPIC();
				
				$("#submitLog").click(function(event){
					//alert("Get In"+document.getElementById('username').value+","+document.getElementById('userPwd').value+","+document.getElementById('PICPassword').value);
					event.preventDefault();
					$.ajax({
				 		   url:'system/user-login.action',
				 		   type:"POST",
				 		   cache : false,
				 		   dataType : "json",
				 		   data : { 
				 			  'userVO.username' : $.trim(document.getElementById('username').value),
								'userVO.userpwd' : $.trim(document.getElementById('userPwd').value),
								'randCode' : $.trim(document.getElementById('PICPassword').value)
							   	},
				 		   success:function(entry) {
				 			   if(entry.success==true)
				 			      window.location.href="/bbs/login_success.action";
				 			   else
				 				   alert("登录失败，请您检查用户名,密码和验证码！");
				 		    },
				 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
				 		    	alert("登录失败，请您检查用户名,密码和验证码！");
				 		    	document.getElementById('username').value="";
				 		    	document.getElementById('userPwd').value="";
				 		    	document.getElementById('PICPassword').value="";
				 		    	changecheckPIC();
				 		    	//alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
						   	}});
				});
			
			$("#logout").click(function(event){
				//alert("Get In"+document.getElementById('username').value+","+document.getElementById('userPwd').value+","+document.getElementById('PICPassword').value);
				event.preventDefault();
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
			});
});
/*Ext.onReady(function() {

	
	// 收起
	$("#up").live("click", function() {
		$("#topTable_right").show();
		$("#topTable").fadeOut(1);
	});

	// 展开
	$("#down").live("click", function() {
		$("#topTable").fadeIn(1);
		$("#topTable_right").hide();
	});
	
	//
	$('#loginHref').mouseover(function(){
		$(this).css({'color':'red'});
	});
	
	$('#loginHref').mouseout(function(){
		$(this).css({'color':'blue'});
	});
	
	$('#registerHref').mouseover(function(){
		$(this).css({'color':'red'});
	});
	
	$('#registerHref').mouseout(function(){
		$(this).css({'color':'blue'});
	});
	$('#logout').mouseover(function(){
		$(this).css({'color':'red'});
	});
	
	$('#logout').mouseout(function(){
		$(this).css({'color':'blue'});
	});
	
	
	// 用户名
	var username = new Ext.form.TextField({
		fieldLabel : l_username,
		id : 'username',
		name : 'username',
		allowBlank : false,
		minLength :3,
		minLengthText :l_usernameMinLengthText,
		maxLength:20,
		maxLengthText :l_usernameMaxLengthText,
		blankText : l_usernameEmpty,
		emptyText : l_usernameEmpty,
		// msgTarget :'side',
		anchor : '85%',
		validateOnBlur : false,
		validationDelay : '3000'
	});

	// 密码
	var userpwd = new Ext.form.TextField({
		fieldLabel : l_userpwd,
		id : 'userpwd',
		name : 'userpwd',
		inputType : 'password',
		allowBlank : false,
		minLength :6,
		minLengthText :l_passwordMinLengthText,
		maxLength:20,
		maxLengthText :l_passwordMaxLengthText,
		blankText : l_userpwdEmpty,
		// msgTarget :'side',
		anchor : '85%',
		validateOnBlur : false,
		validationDelay : '3000'
	});
	
	//安全问题
	var question =  new Ext.form.ComboBox({
		fieldLabel: l_question,
		name:'question',
		id:'question',
		anchor : '85%',
		editable:false,
		store :new Ext.data.SimpleStore({
			fields:['code','name'],
			data:[
				['01','无安全问题'],
				['02','我父亲的姓名'],
				['03','我母亲的姓名'],
				['04','我父亲的生日'],
				['05','我母亲的生日'],
				['06','我最爱的人是谁'],
				['07','我喜欢的运动'],
				['08','我的大学名称']
			]
		}),
		valueField:'code',
		displayField:'name',
		mode: 'local',
		triggerAction: 'all'
	});
	question.setValue('01');
	
	//问题答案
	var answer = new Ext.form.TextField({
		fieldLabel : l_answer,
		id : 'answer',
		name : 'answer',
		anchor : '85%'
	});

	// 验证码
	var validate = new Ext.form.TextField({
		fieldLabel : l_validate,
		id : 'validate',
		name : 'validate',
		allowBlank : false,
		blankText : l_validateEmpty,
		// msgTarget :'side',
		anchor : '62%',
		validateOnBlur : false,
		validationDelay : '3000',
		maxLength : '4'
	});

	// 登陆form
	var loginForm = new Ext.FormPanel({
		labelAlign : 'right',
		frame : true,
		items : [{
			layout : 'column',
			autoHeight : true,
			collapsible : true,
			labelSeparator : '：',
			items : [{
				labelWidth : 80,
				style : 'padding-top:20px',
				columnWidth : 1,
				layout : 'form',
				items : [username, userpwd,question,answer, validate]
			}],
			buttonAlign : 'center',
			buttons : [{
				text : l_login,
				handler : login
			}, {
				text : l_reset,
				style : 'margin-left:5px',
				handler : function() {
					loginForm.form.reset();
				}
			}],
			keys : [{
				key : 13,
				fn : login,
				scope : this
			}]
		}]

	});

	// 登陆浮窗

	var loginWin = new Ext.Window({
		iconCls : 'loginIco',
		animateTarget : 'loginHref',
		title : l_login,
		resizable : false,
		plain : true,
		frame : true,
		cls : 'loginWinBody',
		shadow : true,
		closeAction : 'hide',
		layout : 'fit',
		width : 350,
		height : 250,
		bodyStyle : 'padding:5px;',
		items : [loginForm]
	});

	showLoginWin = function () {
		loginForm.form.reset();
		$('#randImg').remove();
		loginWin.show();
		Ext.fly(Ext.getDom('validate').parentNode).createChild({
			id : 'randImg',
			tag : 'img',
			src : 'pages/randCode.jsp?' + Math.random(),
			alt : '换一张',
			align : 'absbottom',
			style : 'cursor:pointer;'
		});
		$('#randImg').live("click", function() {
			$(this).attr({
				src : 'pages/randCode.jsp?' + Math.random()
			});
		});
	Ext.fly('username').focus();
	}

	// 登陆函数
	function login() {
		if (loginForm.form.isValid()) {
			loginForm.form.submit({
				waitMsg : "正在登录，请稍候……",	
				params : {
					'userVO.username' : username.getValue().trim(),
					'userVO.userpwd' : userpwd.getValue().trim(),
					'userVO.question' : question.getValue().trim(),
					'userVO.answer' : answer.getValue().trim(),
					'randCode' : validate.getValue().trim()
				},
				url : 'system/user-login.action',
				success : function(form, action) {
					window.location.href="/bbs/login_success.action";
				},
				failure : function(form, action) {
					bbs.ErrorAlert(Ext.isEmpty(action.result.msg)
							? "登录失败，请您检查用户名和密码！"
							: action.result.msg);
				}
			});
		}
	}

	// 注销函数
	function logout(){
		Ext.Msg.confirm("提示", "确定要注销吗？", function(btn) {
			if(btn=='yes'){
			Ext.Ajax.request({
				url : 'system/user-logout.action',
				success : function(form,action) {
					window.location.href="/bbs/logout_success.action";
				},
				failure : function(form,action) {
					
				}
			});
			}
		},this);
	}
	
	//绑定注销函数
	$('#logout').live('click',logout);
});*/

/***************************************************************************
 * 收起-展开效果
 **************************************************************************/

/***************************************************************************
	 * 登陆
	 **************************************************************************/
