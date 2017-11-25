
function restaurant_callback(results, status) {	
	if (status === google.maps.places.PlacesServiceStatus.OK) {
    	
    var placesList=document.getElementById('restaurant_result');
    	$(".section").remove();	
      for (var i = 0; i < results.length; i++) {
        createListMarker(results[i]);
        appendPlacesList(placesList, results[i]);
      }
    }
 }

function hotel_callback(results, status) {
	console.log("hotel_callback 호출됨");
    if (status === google.maps.places.PlacesServiceStatus.OK) {
    	
    var placesList=document.getElementById('hotel_result');
    	$(".section").remove();	
      for (var i = 0; i < results.length; i++) {
        createListMarker(results[i]);
        appendPlacesList(placesList, results[i]);
      }
    }
 }

	
function createListMarker(place) {
    var placeLoc = place.geometry.location;
    //var placesList=document.getElementById('restaurant_result');
	var photos = place.photos;
	if(!photos){
		return;
	}
	
    markerList.push(new google.maps.Marker({
    	map: map,
    	position: place.geometry.location,
    	title:place.name,
    	icon:'./resources/icons/category/restaurant_marker_icon.png'
	  //icon:photos[0].getUrl({'maxWidth':35, 'maxHeight':35})
    }));

    google.maps.event.addListener(markerList[markerList.length-1], 'click', function() {
      smallwindow.setContent(place.name);
      smallwindow.open(map, this);
    });
  }

  
	function appendPlacesList(placesList, place){
		var i=0;
 		placesList.innerHTML+=
    		"<div class='section'>"+
        		"<div class='section-result-text-content'>" +
        			"<div class='section-result-header'>" +
        				"<div class='section-result-name'>" +
        					place.name+
        				"</div>" +
        				"<span class='section-result-rating'>" +
        					"<a class='rating'>"+place.rating+"★★★★★</a>(5)"+
        				"</span>" +
        			"</div>" +
        			"<div class='section-result-details-container'>"+
        				"<div class='section-result-address'>"+
        					place.vicinity +
        				"</div>" +
        				"<div class='section-result-phone'>"+
        				"010-2222-5555"+
        				"</div>" +
        			"</div>" +
        			"<div class='section-imgage-container'>" +
        				//"<img id='hardy' src='"+place.photos[0].getUrl({'maxWidth':35, 'maxHeight':35})+"'>" +
        			"<img id='hardy' src='./resources/icons/white-image.png'>" +
        			"</div>"+
        		"</div>"+
        		"<span><hr></span>" +
        	"</div>"   	
        		;
 	}
	/*
    // Deletes all markers in the array by removing references to them.
    function deleteMarkers() {
      clearMarkers();
      markers = [];
    }
    
    */
	
	function callList(myLocation, type){
		var service = new google.maps.places.PlacesService(map);
		var results=service.nearbySearch({
		     location: myLocation,
		     radius: 500,
		     type: [type]
		   }, hotel_callback);
	}