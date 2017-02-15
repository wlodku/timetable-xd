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
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).on('page:change', function() {
    $('.dropdown-button').dropdown();
});


$(function() {
    $(".button-collapse").sideNav();
  //   $('.button-collapse').sideNav({
  //     menuWidth: 300, // Default is 240
  //     edge: 'right', // Choose the horizontal origin
  //     closeOnClick: true
  //   }
  // );
    var boxes = $('.box');
    boxes.each(function(){
    	var devides = $(this).find('.divided');
    	var counter = $(this).find('.divided').length;
    	if(counter == 1)
    		counter = 2;
    	

    	devides.each(function(){
    		$(this).css('height', 'calc(100% / ' + counter+ ')');
    	});
    	

    });
});