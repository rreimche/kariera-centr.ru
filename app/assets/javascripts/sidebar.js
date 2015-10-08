$(document).ready(function(){
	$('.switchable span.switchme').click(function(){
		if( $(this).hasClass('active') ) return;
		$(this).addClass('active');
		$(this).siblings().removeClass('active'); 
		var to_show = $(this).attr('data-switch');
		$(this).parents('.switchable').children('div#' + to_show).show();
		$(this).parents('.switchable').children('div').not('#' + to_show).hide();
	});
});