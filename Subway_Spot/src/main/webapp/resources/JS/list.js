$(document).ready(function(){

  var clicked = false;
  
  
  $('.clickme').on('click',function(e){ 
	  e.preventDefault();

	  if($(this).attr("data-type") == 'restaurant') {
		//  typeView("restaurant", restaurant_callback);
		  $("#restaurant_result").show();
		  console.log("restaurant 선택");
	  } else if($(this).attr("data-type") == 'hotel') {
		  typeView('hotel', hotel_callback);
		  $("#hotel_result").show();
		  console.log("hotel 선택");
	  }
	  $('.clickme').removeClass('btn_selected');
	  $(this).addClass('btn_selected');
//	  $('.section-result').hide();
	  $("#restaurant_result").hide();
	  //$(".section-result").not($(this).toggleClass('open').next('.section-result').fadeToggle("fast")).fadeOut('fast');
	  
  });
	  	
	  
	  	/*
		$('.clickme2').on('click',function(e){ 
		
		e.preventDefault();
	   
		this.clicked = !(this.clicked);
	  
		if(this.clicked){ 
				$('.clickme2').addClass('selected2');
				$('.clickme1').removeClass('selected1');
				$('.clickme3').removeClass('selected3');
				$('.clickme4').removeClass('selected4');
				$('.clickme5').removeClass('selected5');

				$('#restaurant_result').hide();
				$('#hotel_result').show();
				$('#pub_result').hide();
				$('#tourism_result').hide();
				$('#park_result').hide();
				
				var value=$('#hotel_icon').attr("alt");

				}else{
				$('.clickme2').removeClass('selected2');
				}
				   
		});

		$('.clickme3').on('click',function(e){ 
		
		e.preventDefault();
	   
		this.clicked = !(this.clicked);
	  
		if(this.clicked){ 
				$('.clickme3').addClass('selected3');
				$('.clickme2').removeClass('selected2');
				$('.clickme1').removeClass('selected1');
				$('.clickme4').removeClass('selected4');
				$('.clickme5').removeClass('selected5');

				$('#restaurant_result').hide();
				$('#hotel_result').hide();
				$('#pub_result').show();
				$('#tourism_result').hide();
				$('#park_result').hide();
				
				var value=$('#pub_icon').attr("alt");

				}else{
				$('.clickme3').removeClass('selected3');
				}
				   
		});

		$('.clickme4').on('click',function(e){ 
		
		e.preventDefault();
	   
		this.clicked = !(this.clicked);
	  
		if(this.clicked){ 
				$('.clickme4').addClass('selected4');
				$('.clickme2').removeClass('selected2');
				$('.clickme1').removeClass('selected1');
				$('.clickme3').removeClass('selected3');
				$('.clickme5').removeClass('selected5');

				$('#restaurant_result').hide();
				$('#hotel_result').hide();
				$('#pub_result').hide();
				$('#tourism_result').show();
				$('#park_result').hide();
				
				var value=$('#tourism_icon').attr("alt");

				}else{
				$('.clickme4').removeClass('selected4');
				}
				   
		});

		$('.clickme5').on('click',function(e){ 
		
		e.preventDefault();
	   
		this.clicked = !(this.clicked);
	  
		if(this.clicked){ 
				$('.clickme5').addClass('selected5');
				$('.clickme1').removeClass('selected1');
				$('.clickme2').removeClass('selected2');
				$('.clickme3').removeClass('selected3');
				$('.clickme4').removeClass('selected4');

				$('#restaurant_result').hide();
				$('#hotel_result').hide();
				$('#pub_result').hide();
				$('#tourism_result').hide();
				$('#park_result').show();
				
				var value=$('#park_icon').attr("alt");

				}else{
				$('.clickme5').removeClass('selected5');
				}
				   
		});
		*/
});