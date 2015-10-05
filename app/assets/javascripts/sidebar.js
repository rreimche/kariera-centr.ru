$(document).ready(function(){
	$('.switchable span').click(function(){
		if( $(this).hasClass('active') ) return;
		$(this).addClass('active');
		$(this).siblings().removeClass('active'); 
		$(this).parents('.switchable').children('div').toggle();
	});
});