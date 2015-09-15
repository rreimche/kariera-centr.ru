$(document).ready(function(){
	$('.courselist_item__btn').click(function(){
		var course_title = $(this).parent().siblings('.courselist_item__text-title').text();
		$('span#modal_course_title').html(course_title);
	});
});

