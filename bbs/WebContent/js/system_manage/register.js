$(document).ready(function(){
	
	//验证数组
	var validateFlag = [true,true,true,true,true,true];
	
	//登陆按钮的动作
$('#registerButton').click(function(event){
	event.preventDefault();
	
	//验证标记
	var flag = true;
	
	//验证输入是否符合条件
	var flagFirst = true;
	for(i = 0;i<validateFlag.length;i++){
		if(validateFlag[i]!=true){
			flagFirst = false;
		}
	}
	
	if(flagFirst!=true){
		flag = false;
	}
	
	//验证用户名是否为空
	if(document.getElementById('username').value ==''){
		html='<img src="images/error.png">'+
		'<font color="red">用户名不能为空，请输入用户名</font>';
		$('#username_validate_div').addClass('validate_div_border');
		$('#username_validate_div').html(html);
		flag =false;
	}
	//验证密码是否为空
	if(document.getElementById('userpwd').value ==''){
		html='<img src="images/error.png">'+
		'<font color="red">密码不能为空，请输入密码</font>';
		$('#password_validate_div').addClass('validate_div_border');
		$('#password_validate_div').html(html);
		flag =false;
	}
	//验证确认密码是否为空
	if(document.getElementById('userpwdConfirm').value ==''){
		html='<img src="images/error.png">'+
		'<font color="red">确认密码不能为空，请确认密码</font>';
		$('#password_confirm_validate_div').addClass('validate_div_border');
		$('#password_confirm_validate_div').html(html);
		flag =false;
	}
	//验证Email是否为空
	if(document.getElementById('email').value ==''){
		html='<img src="images/error.png">'+
		'<font color="red">E-mail不能为空，请输入邮箱</font>';
		$('#email_validate_div').addClass('validate_div_border');
		$('#email_validate_div').html(html);
		flag =false;
	}
	//如果安全问题状态打开，验证安全问题答案是否为空
	/*if($('#question').val()!='无安全问题' 
		&& document.getElementById('answer').value ==''){
		html='<img src="images/error.png">'+
		'<font color="red">您启用了安全问题，答案不能为空</font>';
		$('#answer_validate_div').addClass('validate_div_border');
		$('#answer_validate_div').html(html);
		flag =false;
	}
	//校验验证码是否为空
	if(document.getElementById('randCode').value ==''){
		html='<img src="images/error.png">'+
		'<font color="red">验证码能为空，请输入验证码</font>';
		$('#randCode_validate_div').addClass('validate_div_border');
		$('#randCode_validate_div').html(html);
		flag =false;
	}*/
	
	//如果上述条件都满足了，则提交数据注册
	if(flag==true){
	$.ajax({
 		   url:'system/user-register.action',
 		   type:"POST",
 		   cache : false,
 		   dataType : "json",
 		   data : { 
			   	'userVO.username': $('#username').val(),
			   	'userVO.userpwd': $('#userpwd').val(),
			   	//'userVO.question': $('#question').val(),
			   	//'userVO.answer': $('#answer').val(),
			   	'userVO.email': $('#email').val()
			   	},
 		   success:function(entry) {
 			  if(entry.success==true){
//					bbs.InfoAlert('<font color="red">恭喜,注册成功</font>');
					window.location.href="/bbs/system/register_success.action";
					return true;
				}else{
					//bbs.WarnAlert('<font color="red">'+entry.data+'</font>');
					return false;
				}
 		    },
 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
 		    	alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
		   	}});
	}
});



//用户名获得焦点
$('#username').focus(function(){
	var value = $.trim($('#username').val());
	$(this).parent('.input_div').css({"border-color":"#7FFFD4"});
	if(value == ''){
		html='<img src="images/info.png">'+
		'<font color="white">不能有空格，可以是中文，长度控制在 3-20字节以内 </font>';
		$('#username_validate_div').addClass('validate_div_border');
		$('#username_validate_div').html(html);
		return false;
	}
});

//用户名失去焦点
$('#username').blur(function(){
	$('#username_validate_div').html('<img src="images/load_1.gif"><font color="red">正在检测……</font>');
	var patrn = /^[\w\u4E00-\u9FA5@.][\w\u4E00-\u9FA5@.]{2,19}$/;
	$(this).parent('.input_div').css({"border-color":"#D3D3D3"});
	var value = $.trim($(this).val());
	if(value == ''){
		html='<img src="images/info.png">'+
		'<font color="white">不能有空格，可以是中文，长度控制在 3-20字节以内 </font>';
		$('#username_validate_div').addClass('validate_div_border');
		$('#username_validate_div').html(html);
		validateFlag[0]=false;
		return false;
	}else if(!patrn.exec(value)){
		html='<img src="images/error.png">'+
		'<font color="red">用户名输入的不符合要求！</font>';
		$('#username_validate_div').addClass('validate_div_border');
		$('#username_validate_div').html(html);
		validateFlag[0]=false;
		return false;
	}else{
		$.ajax({
	 		   url:'system/user-checkUsername.action',
	 		   type:"POST",
	 		   cache : false,
	 		   dataType : "json",
	 		   data : { 
	 			  'userVO.username': document.getElementById('username').value
				   	},
	 		   success:function(entry) {
	 			   
	 			  if(entry.success==true){
						html='<img src="images/right.png">'+
						'<font color="green">恭喜您，该用户名还未被注册，您可以使用这个用户名注册</font>';
						$('#username_validate_div').removeClass('validate_div_border');
						$('#username_validate_div').html(html);
						validateFlag[0]=true;
						return true;
					}else{
						
						html='<img src="images/error.png">'+
						'<font color="red">'+entry.data+'</font>';
						$('#username_validate_div').addClass('validate_div_border');
						$('#username_validate_div').html(html);
						validateFlag[0]=false;
						return false;
					}
	 		    },
	 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
	 		    	alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
			   	}});
	}
});

//密码获得焦点
$('#userpwd').focus(function(){
	var value = $.trim($('#userpwd').val());
	$(this).parent('.input_div').css({"border-color":"#7FFFD4"});
	if(value == ''){
		html='<img src="images/info.png">'+
		'<font color="white">最小长度:6 最大长度:20</font>';
		$('#password_validate_div').addClass('validate_div_border');
		$('#password_validate_div').html(html);
		$('#strong_1').attr("src","images/strong_false.png");
		$('#strong_2').attr("src","images/strong_false.png");
		$('#strong_3').attr("src","images/strong_false.png");
		$('#strong_4').attr("src","images/strong_false.png");
		//return false;
	}
});
//验证密码强度
$('#userpwd').keyup(function(e){
	e.preventDefault();
	var strongClass = passwordGrade(document.getElementById("userpwd").value);
	//alert(strongClass);
	if(document.getElementById("userpwd").value==""){
		$('#strong_1').attr("src","images/strong_false.png");
		$('#strong_2').attr("src","images/strong_false.png");
		$('#strong_3').attr("src","images/strong_false.png");
		$('#strong_4').attr("src","images/strong_false.png");
		$('#password_strong_div').html('');
	}
	if(strongClass > 13 && strongClass<= 18){
		$('#strong_1').attr("src","images/strong_true_1.png");
		$('#strong_2').attr("src","images/strong_false.png");
		$('#strong_3').attr("src","images/strong_false.png");
		$('#strong_4').attr("src","images/strong_false.png");
		$('#password_strong_div').html('<font color="#880C2E">弱</font>');
	}
	if(strongClass >= 19 &&strongClass<=24){
		$('#strong_1').attr("src","images/strong_true_2.png");
		$('#strong_2').attr("src","images/strong_true_2.png");
		$('#strong_3').attr("src","images/strong_false.png");
		$('#strong_4').attr("src","images/strong_false.png");
		$('#password_strong_div').html('<font color="#FF8F00">一般</font>');
	}
	if(strongClass >= 24 &&strongClass<=30){
		$('#strong_1').attr("src","images/strong_true_3.png");
		$('#strong_2').attr("src","images/strong_true_3.png");
		$('#strong_3').attr("src","images/strong_true_3.png");
		$('#strong_4').attr("src","images/strong_false.png");
		$('#password_strong_div').html('<font color="#0099CC">很好</font>');
	}
	if(strongClass >= 31){
		$('#strong_1').attr("src","images/strong_true_4.png");
		$('#strong_2').attr("src","images/strong_true_4.png");
		$('#strong_3').attr("src","images/strong_true_4.png");
		$('#strong_4').attr("src","images/strong_true_4.png");
		$('#password_strong_div').html('<font color="green">极佳</font>');
	}
});

function passwordGrade(pwd) {
    var score = 0;
    var regexArr = ['[0-9]', '[a-z]', '[A-Z]', '[\\W_]'];
    var repeatCount = 0;
    var prevChar = '';
    //check length
    var len = pwd.length;
    score += len > 12 ? 12 : len;
    //check type
    for (var i = 0, num = regexArr.length; i < num; i++) { if (eval('/' + regexArr[i] + '/').test(pwd)) score += 4; }
    //bonus point
    for (var i = 0, num = regexArr.length; i < num; i++) {
    if (pwd.match(eval('/' + regexArr[i] + '/g')) && pwd.match(eval('/' + regexArr[i] + '/g')).length >= 2) score += 2;
    if (pwd.match(eval('/' + regexArr[i] + '/g')) && pwd.match(eval('/' + regexArr[i] + '/g')).length >= 5) score += 2;
    }
    //deduction
    for (var i = 0, num = pwd.length; i < num; i++) {
    if (pwd.charAt(i) == prevChar) repeatCount++;
    else prevChar = pwd.charAt(i);
    }
    score -= repeatCount * 1;
    return score;
}


//返回强度系数
function Evaluate(word) 
{
    return word.replace(/^(?:([a-z])|([A-Z])|([0-9])|(.)){5,}|(.)+$/g, "$1$2$3$4$5").length; 
} 


//密码失去焦点
$('#userpwd').blur(function(){
	$('#password_validate_div').html('<img src="images/load_1.gif"><font color="red">正在检测……</font>');
	$(this).parent('.input_div').css({"border-color":"#D3D3D3"});
	var value = $.trim($(this).val());
	if(value == ''){
		html='<img src="images/info.png">'+
		'<font color="white">最小长度:6 最大长度:20 </font>';
		$('#password_validate_div').addClass('validate_div_border');
		$('#password_validate_div').html(html);
		$('#strong_1').attr("src","images/strong_false.png");
		$('#strong_2').attr("src","images/strong_false.png");
		$('#strong_3').attr("src","images/strong_false.png");
		$('#strong_4').attr("src","images/strong_false.png");
		validateFlag[1]=false;
		return false;
	}else if(value.length<6 || value.length>20){
		html='<img src="images/error.png">'+
		'<font color="red">密码长度错误</font>';
		$('#password_validate_div').addClass('validate_div_border');
		$('#password_validate_div').html(html);
		validateFlag[1]=false;
		return false;
	}else{
		html='<img src="images/right.png">'+
		'<font color="green">填写正确</font>';
		$('#password_validate_div').removeClass('validate_div_border');
		$('#password_validate_div').html(html);
		validateFlag[1]=true;
		if($.trim($('#userpwdConfirm').val())!=''){
			$('#userpwdConfirm').focus();
		}
	}
});

//确认密码获得焦点
$('#userpwdConfirm').focus(function(){
	var value = $.trim($('#userpwdConfirm').val());
	$(this).parent('.input_div').css({"border-color":"#7FFFD4"});
	if(value == ''){
		html='<img src="images/info.png">'+
		'<font color="white">请再输入一遍您上面填写的密码</font>';
		$('#password_confirm_validate_div').addClass('validate_div_border');
		$('#password_confirm_validate_div').html(html);
		return false;
	}
});


//确认密码失去焦点
$('#userpwdConfirm').blur(function(){
	$('#password_confirm_validate_div').html('<img src="images/load_1.gif"><font color="red">正在检测……</font>');
	$(this).parent('.input_div').css({"border-color":"#D3D3D3"});
	var value = $.trim($(this).val());
	if(value == ''){
		html='<img src="images/info.png">'+
		'<font color="white">请再输入一遍您上面填写的密码</font>';
		$('#password_confirm_validate_div').addClass('validate_div_border');
		$('#password_confirm_validate_div').html(html);
		validateFlag[2]=false;
		return false;
	}else if(value.length<6 || value.length>20){
		html='<img src="images/error.png">'+
		'<font color="red">密码长度错误</font>';
		$('#password_confirm_validate_div').addClass('validate_div_border');
		$('#password_confirm_validate_div').html(html);
		validateFlag[2]=false;
		return false;
	}else if(value !=  $.trim($('#userpwd').val())){
		html='<img src="images/error.png">'+
		'<font color="red">两次输入的密码不一致,请再输入一次您上面输入的密码</font>';
		$('#password_confirm_validate_div').addClass('validate_div_border');
		$('#password_confirm_validate_div').html(html);
		validateFlag[2]=false;
		return false;
	}else{
		html='<img src="images/right.png">'+
		'<font color="green">填写正确</font>';
		$('#password_confirm_validate_div').removeClass('validate_div_border');
		$('#password_confirm_validate_div').html(html);
		validateFlag[2]=true;
	}
});

//邮箱获得焦点
$('#email').focus(function(){
	var value = $.trim($('#email').val());
	if(value == ''){
		html='<img src="images/info.png">'+
		'<font color="white">请填写真实并且最常用的邮箱 </font> ';
		$(this).parent('.input_div').css({"border-color":"#7FFFD4"});
		$('#email_validate_div').addClass('validate_div_border');
		$('#email_validate_div').html(html);
		return false;
	}
});

//邮箱失去焦点
$('#email').blur(function(){
	$('#email_validate_div').html('<img src="images/load_1.gif"><font color="red">正在检测……</font>');
	var patrn = /^[_a-z0-9-A-Z]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)+$/;
	$(this).parent('.input_div').css({"border-color":"#D3D3D3"});
	var value = $.trim($(this).val());
	if(value == ''){
		html='<img src="images/info.png">'+
		'<font color="white">请填写真实并且最常用的邮箱 </font>';
		$('#email_validate_div').addClass('validate_div_border');
		$('#email_validate_div').html(html);
		validateFlag[3]=false;
		return false;
	}else if(!patrn.exec(value)){
		html='<img src="images/error.png">'+
		'<font color="red">邮箱地址格式错误，请填写正确的邮箱地址</font>';
		$('#email_validate_div').addClass('validate_div_border');
		$('#email_validate_div').html(html);
		validateFlag[3]=false;
		return false;
	}else{
		html='<img src="images/right.png">'+
		'<font color="green">填写正确</font>';
		$('#email_validate_div').removeClass('validate_div_border');
		$('#email_validate_div').html(html);
		validateFlag[3]=true;
	}
});

//验证码获得焦点
$('#randCode').focus(function(){
	var value = $.trim($('#randCode').val());
	$(this).parent('.input_div').css({"border-color":"#7FFFD4"});
	if(value == ''){
		html='<img src="images/info.png">'+
		'<font color="white">请输入验证码</font>';
		$('#randCode_validate_div').addClass('validate_div_border');
		$('#randCode_validate_div').html(html);
		return false;
	}
});


//验证码失去焦点
$('#randCode').blur(function(){
	$('#randCode_validate_div').html('<img src="images/load_1.gif"><font color="red">正在检测……</font>');
	var value = $.trim($('#randCode').val());
	$(this).parent('.input_div').css({"border-color":"#D3D3D3"});
	if(value == ''){
		html='<img src="images/info.png">'+
		'<font color="white">请输入验证码</font>';
		$('#randCode_validate_div').addClass('validate_div_border');
		$('#randCode_validate_div').html(html);
		validateFlag[6]=false;
		return false;
	}else{
		$.ajax({
	 		   url:'system/user-checkRandCode.action',
	 		   type:"POST",
	 		   cache : false,
	 		   dataType : "json",
	 		   data : { 
	 			  'randCode': document.getElementById('randCode').value
				   	},
	 		   success:function(entry) {
	 			  if(entry.success==true){
						html='<img src="images/right.png">'+
						'<font color="green">填写正确</font>';
						$('#randCode_validate_div').removeClass('validate_div_border');
						$('#randCode_validate_div').html(html);
						validateFlag[6]=true;
						return true;
					}else{
						html='<img src="images/error.png">'+
						'<font color="red">'+entry.data+'</font>';
						$('#randCode_validate_div').addClass('validate_div_border');
						$('#randCode_validate_div').html(html);
						validateFlag[6]=false;
						return false;
					}
	 		    },
	 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
	 		    	alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
			   	}});
	}
});



//重置
$('#reset').click(function(){
//	document.execCommand('Refresh');
	$('#username').val('');
	$('#username_validate_div').removeClass('validate_div_border');
	$('#username_validate_div').html('不能有空格，可以是中文，长度控制在 3-20字节以内');
   	$('#userpwd').val('');
   	$('#password_validate_div').removeClass('validate_div_border');
	$('#password_validate_div').html('最小长度:6	 最大长度:20');
   	$('#userpwdConfirm').val('');
   	$('#password_confirm_validate_div').removeClass('validate_div_border');
	$('#password_confirm_validate_div').html('请再输入一遍您上面填写的密码');
	//$('#question').val('无安全问题');
    //$('#answer').val('');
    //$('#answer').parent('.input_div').css({"border-color":"#D3D3D3"});
   	//$('#answer').attr({disabled:'disabled'});
   	//$('#answer_validate_div').removeClass('validate_div_border');
	//$('#answer_validate_div').html('');
   	$('#email').val('');
   	$('#email_validate_div').removeClass('validate_div_border');
	$('#email_validate_div').html('请填写真实并且最常用的邮箱');
	$('#randCode').val('');
	$('#randCode_validate_div').removeClass('validate_div_border');
	$('#randCode_validate_div').html('请输入验证码');
	$('#strong_1').attr({src:"images/strong_false.png"});
	$('#strong_2').attr({src:"images/strong_false.png"});
	$('#strong_3').attr({src:"images/strong_false.png"});
	$('#strong_4').attr({src:"images/strong_false.png"});
});



$('#changeRandCode').click(function(){
	document.getElementById("randCodeImg").src='pages/system_manage/randCode.jsp?t='+Date.parse(new Date());//改变验证码图片,此处加参数防止IE7(及以上)和FireFox的缓存导致图片不刷新
	return false;
});

$('#randCodeImg').click(function(){
	document.getElementById("randCodeImg").src='pages/system_manage/randCode.jsp?t='+Date.parse(new Date());//改变验证码图片,此处加参数防止IE7(及以上)和FireFox的缓存导致图片不刷新
	return false;
});

});