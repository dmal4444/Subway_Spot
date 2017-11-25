$(document).ready(function(){

  var clicked = false;
  
  
  $('.clickme').on('click',function(e){ 
	  e.preventDefault();

	  if($(this).attr("data-type") == 'restaurant') {
		  typeView('restaurant', restaurant_callback);
		  
		  $("#restaurant_result").show();
		  $("#hotel_result").hide();
		  $("#pub_result").hide();
		  $("#tourism_result").hide();
		  $("#park_result").hide();
		  
		  getHotplaceInfo(myLocation.lat, myLocation.lng, '1');

		  
		  console.log("restaurant 선택");
		  
	  } else if($(this).attr("data-type") == 'hotel') {
		  typeView('lodging', hotel_callback);
		  
		  $("#hotel_result").show();
		  $("#restaurant_result").hide();
		  $("#pub_result").hide();
		  $("#tourism_result").hide();
		  $("#park_result").hide();

		  getHotplaceInfo(myLocation.lat, myLocation.lng, '2');
		  
		  console.log("hotel 선택");
		  
	  } else if($(this).attr("data-type") == 'pub'){
		  typeView('bar', pub_callback);

		  $("#pub_result").show();
		  $("#restaurant_result").hide();
		  $("#hotel_result").hide();
		  $("#tourism_result").hide();
		  $("#park_result").hide();

		  getHotplaceInfo(myLocation.lat, myLocation.lng, '3');

		  console.log("pub 선택");
		  
	  } else if($(this).attr("data-type") == 'tourism'){
		  typeView('museum', tourism_callback);
		  
		  $("#tourism_result").show();
		  $("#restaurant_result").hide();
		  $("#hotel_result").hide();
		  $("#pub_result").hide();
		  $("#park_result").hide();

		  getHotplaceInfo(myLocation.lat, myLocation.lng, '4');
	
		  
		  console.log("tourism 선택");
		  
	  } else if($(this).attr("data-type") == 'park'){
		  typeView('park', park_callback);
		  
		  $("#park_result").show();
		  $("#restaurant_result").hide();
		  $("#hotel_result").hide();
		  $("#pub_result").hide();
		  $("#tourism_result").hide();

		  getHotplaceInfo(myLocation.lat, myLocation.lng, '5');

		  
		  console.log("park 선택");

	  }
	  
	  $('.clickme').removeClass('btn_selected');
	  $(this).addClass('btn_selected');
//	  
	  
  });
	  	
	 
});