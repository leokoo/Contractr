// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require bootstrap
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap-wysihtml5
//= require moment
//= require bootstrap-datetimepicker
//= require toastr
//= require pickers
//= require_tree .

jQuery(document).ready(function(){
	jQuery('.skillbar').each(function(){
		jQuery(this).find('.skillbar-bar').animate({
			width:jQuery(this).attr('data-percent')
		},6000);
	});

	jQuery('.completebar').each(function(){
		jQuery(this).find('.completebar-bar').animate({
	width:jQuery(this).attr('data-percent')
		},6000);
	});
});
