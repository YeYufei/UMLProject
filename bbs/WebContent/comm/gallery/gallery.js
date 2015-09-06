$(document).ready(function(){
  var urls;
	$('.small_image').click(function(){
		var url  = $(this).attr("src");
		$('#show_image').hide();
		$('#show_image').attr({src:url});
		$('#show_image').fadeIn('slow');
	});
	
	//
	urls = $('.small_image').toArray();
	var	size = 1;
	
	$.each( urls, function(i, n){
//	  alert( "Item #" + i + ": " + $(n).attr("src"));
		size =i;
	});
	size = size + 1;
	
	i = 1;
	play = function(){
		n = urls[i];
		url = $(n).attr("src");
		$('#show_image').hide();
		$('#show_image').attr({src:url});
		$('#show_image').fadeIn('slow');
		i = i+1;
		if(i==size){
			i = 0;
		}
	}
	if(size>1){
		setInterval("play()",3000);
	}
	
});