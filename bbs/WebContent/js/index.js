$(document).ready(function(){
			$.ajax({
		 		   url:'/bbs/servlet/GetWeather',
		 		   type:"POST",
		 		   cache : false,
		 		  dataType : "json",
		 		   data : {
		 			   },
		 		   success:function(entry){
		 			  for(var i=1;i<entry.CWeather.length;i++){
		 				  if(entry.CWeather[i].cityname=="广州市"){
		 				   var html= '<div class="row">'+
		 	 	             '<div class="thumbnail">'+
		 	 	             '<div class="caption">'+
		 	 	             '<h3>'+entry.CWeather[i].cityname+'</h3>'+
		 	 	             '<p>'+entry.CWeather[i].stateDetailed+'<img src="/bbs/image/lei.png"style="margin-left:120px;width:102;height:120;" /></p>'+
		 	 	           '<p><span>风速:'+entry.CWeather[i].windState+'</span>&nbsp;<span>风向:'+entry.CWeather[i].windDir+'</span>&nbsp;<span>湿度:'+entry.CWeather[i].humidity+'</span></p>'+
		 	 	         '<p><span>最高温度:'+entry.CWeather[i].tem1+'</span>&nbsp;<span>最低温度：'+entry.CWeather[i].tem2+'</span><span>实时温度：'+entry.CWeather[i].temNow+'</span></p>'+
		 	 	             '</div>'+
		 	 	            '</div>'+
		 	 	           '</div>'+
		 	 	          '</div>';
		 			      $("#WeatherDiv").append(html);
		 				  }
		 			   }
		 		    },
		 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
		 		    	//window.location.href="/bbs/logout_success.action";
		 		    	alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
			}});
			
			var timerID;
			
			timerID = window.setInterval(getWeather,900000);
			
			function getWeather(){
				$.ajax({
			 		   url:'/bbs/servlet/GetWeather',
			 		   type:"POST",
			 		   cache : false,
			 		  dataType : "json",
			 		   data : {
			 			   },
			 		   success:function(entry){
			 			  for(var i=1;i<entry.CWeather.length;i++){
			 				  if(entry.CWeather[i].cityname=="广州市"){
			 				   var html= '<div class="row">'+
			 	 	             '<div class="thumbnail">'+
			 	 	             '<div class="caption">'+
			 	 	             '<h3>'+entry.CWeather[i].cityname+'</h3>'+
			 	 	             '<p>'+entry.CWeather[i].stateDetailed+'<img src="/bbs/image/lei.png"style="margin-left:120px;width:102;height:120;" /></p>'+
			 	 	           '<p><span>风速:'+entry.CWeather[i].windState+'</span>&nbsp;<span>风向:'+entry.CWeather[i].windDir+'</span>&nbsp;<span>湿度:'+entry.CWeather[i].humidity+'</span></p>'+
			 	 	         '<p><span>最高温度:'+entry.CWeather[i].tem1+'</span>&nbsp;<span>最低温度：'+entry.CWeather[i].tem2+'</span><span>实时温度：'+entry.CWeather[i].temNow+'</span></p>'+
			 	 	             '</div>'+
			 	 	            '</div>'+
			 	 	           '</div>'+
			 	 	          '</div>';
			 				  $("#WeatherDiv").html("");
			 			      $("#WeatherDiv").append(html);
			 				  }
			 			   }
			 		    },
			 		    error:function(XMLHttpRequest, textStatus, errorThrown) {
			 		    	//window.location.href="/bbs/logout_success.action";
			 		    	alert("XMLHttpRequest.status="+XMLHttpRequest.status+"\nXMLHttpRequest.readyState="+XMLHttpRequest.readyState+"\ntextStatus="+textStatus);
				}});
			}
			
});
/*Ext.onReady(function(){
	var mask = new Ext.LoadMask(Ext.getBody(), {msg:"正在跳转……"});
	
    showMask = function(){
    	mask.show();
	}
	
	 hideMask = function(){
    	mask.hide();
	}
	
	
	$('.subSection_tr').mouseover(function(){
		$(this).children('td').addClass('subSection_tr_hover');
	});
	
	$('.subSection_tr').mouseout(function(){
		$(this).children('td').removeClass('subSection_tr_hover');
	});
	
});*/