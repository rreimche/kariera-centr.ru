$(document).ready(function(){
	$('.courselist_item__btn').click(function(){
		var course_title = $(this).parent().siblings('.courselist_item__text-title').text();
		$('span#modal_course_title').html(course_title);
	});
	$('#container_signup input[type=submit]').click(function(){
		yaCounter24396481.reachGoal('yaSignup');
	})
});

