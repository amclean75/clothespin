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
//= require turbolinks
//= require_tree .

$(document).ready(function() {
	var div_form = $('.item_form').html()
	var brand_form = $('.brand_form').html()
	var max_fields = 10;
	var wrapper = $(".input_fields_wrap");
	var add_button = $(".add_field_button");
	var add_button_brand = $(".add_field_button_brand");
	
	var x = 1; // Initial box count
	$(add_button).click(function(e){
		e.preventDefault();
		if(x < max_fields){
			x++;
			$(wrapper).append('<div>' + div_form + '<a href="#" class="remove_field">Remove</a></div>'); //add input box
		}
	});
	$(add_button_brand).click(function(e){
		e.preventDefault();
		if(x < max_fields){
			x++;
			$(wrapper).append('<div>' + brand_form + '<a href="#" class="remove_field">Remove</a></div>'); //add input box
		}
	});
	
	$(wrapper).on("click",".remove_field", function(e){ //click remove field
		e.preventDefault(); $(this).parent('div').remove(); x--;
	})

	$(".clothesitems").hide().fadeOut();
	$("#likebutton").on("click", function() {
		$(".clothesitems").show();
	});
});


$(document).on("page:change", function() {
	$(".item_form").on("ajax:success", function() {
		console.log("console log works")
	});
	$(".brand_form").on("ajax:success", function() {
		console.log("console log works")
	});
	$("#unlikebutton").on("ajax:success", function() {
		console.log("console log works")
	});
	$("#likebutton").on("ajax:success", function() {
		console.log("console log works")
	});
});

// Function for photo upload preview
$(function() {
  $('#pictureInput').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      console.log(file);
      img.src = file.target.result;
      $('#target').html(img);
    }
    reader.readAsDataURL(image);
    console.log(files);
  });
});

