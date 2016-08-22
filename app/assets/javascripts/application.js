// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require ckeditor/init
//= require_tree ./ckeditor
//= require bootstrap-sprockets
//= require blueimp-gallery-all
//= require blueimp
//= require homepage_controller
//= require courses
//= require sidebar
//= require_tree . 

$('body').on('click.collapse-next.data-api', '[data-toggle=collapse-next]', function (e) {
  var $target = $(this).parent().parent().next();
  $target.collapse('toggle');
  /*
  $this = $(this);
  $parent = $(this).parents('.accordion-wrapper');
  if ( $parent.length != 0 ){
  	var $panels = $parent.children('.panel');
  	$panels.each(function(i, o){
  		if( $(o).is($this.parent().parent().parent()) ){
  			$(o).children('.panel-collapse').collapse('toggle');
  		}
  	});
  }*/
  //$target.data('collapse') ? $target.collapse('toggle') : $target.collapse()
})

