$(document).ready(function(){
	$('.notice').fadeOut(5000);
	$('.notice').mouseover(function(){
		$(this).stop();
		$(this).fadeOut('fast');
	});
})