
/**
 * List버튼 누를 때 결과 호출 함수
 **/
var results;

function typeView(type, typeCallback) {
	  var len = markerList.length;
	   for(i=0;i<len;i++){
		   markerList[i].setMap(null);
	   }
	   markerList = [];

	   smallwindow = new google.maps.InfoWindow();
	   var service = new google.maps.places.PlacesService(map);
	   results=service.nearbySearch({
	     location: myLocation,
	     radius: 500,
	     type: [type]
	   }, typeCallback);
	 
}

//레스토랑 결과 호출
function restaurant_callback(results, status) {	
	var icon="restaurant";
	if (status === google.maps.places.PlacesServiceStatus.OK) {
    	
    var placesList=document.getElementById('restaurant_result');
    	$(".section").remove();	
      for (var i = 0; i < results.length; i++) {
        createListMarker(results[i], icon);
        appendPlacesList(placesList, results[i], i);
	    

      }
    }
 }

//호텔 결과 호출
function hotel_callback(results, status) {
	var icon="hotel";

    if (status === google.maps.places.PlacesServiceStatus.OK) {
    	
    var placesList=document.getElementById('hotel_result');
    	$(".section").remove();	
      for (var i = 0; i < results.length; i++) {
        createListMarker(results[i], icon);
        appendPlacesList(placesList, results[i], i);
      }
    }
 }

//펍 결과 호출
function pub_callback(results, status) {
	var icon="pub";
    if (status === google.maps.places.PlacesServiceStatus.OK) {
    	
    var placesList=document.getElementById('pub_result');
    	$(".section").remove();	
      for (var i = 0; i < results.length; i++) {
        createListMarker(results[i], icon);
        appendPlacesList(placesList, results[i], i);
      }
    }
 }

//투어리즘 결과 호출
function tourism_callback(results, status) {
	var icon="tourism";

    if (status === google.maps.places.PlacesServiceStatus.OK) {
    	
    var placesList=document.getElementById('tourism_result');
    	$(".section").remove();	
      for (var i = 0; i < results.length; i++) {
        createListMarker(results[i], icon);
        appendPlacesList(placesList, results[i], i);
      }
    }
 }

//공원 결과 호출
function park_callback(results, status) {
	var icon="park";

    if (status === google.maps.places.PlacesServiceStatus.OK) {
    	
    var placesList=document.getElementById('park_result');
    	$(".section").remove();	
      for (var i = 0; i < results.length; i++) {
        createListMarker(results[i], icon);
        appendPlacesList(placesList, results[i], markerList[i]);
      }
    }
 }

var mark;

function createListMarker(place, icon) {
     placeLoc = place.geometry.location;
	
    mark =markerList.push(new google.maps.Marker({
    	map: map,
    	position: place.geometry.location,
    	title:place.name,
    	icon:'./resources/icons/category/'+icon+'_marker_icon.png'
    }));

    google.maps.event.addListener(markerList[markerList.length-1], 'click', function() {
      smallwindow.setContent(place.name);
      smallwindow.open(map, this);
    });	

  }


	function appendPlacesList(placesList, place, marker){
		var i=0;
		var photos = place.photos;
		if(!photos){
			return;
		}
		var newlat=place.geometry.location.lat();
		var newlng=place.geometry.location.lng();
		
		var placeName=place.name
				
 		placesList.innerHTML+=
    		"<div class='section'>"+
        		"<div class='section-result-text-content'>" +
        			"<div class='section-result-header'>" +
        				"<div class='section-result-name'>" +
        				"<a href='#' onclick='moveTo("+newlat+","+newlng+");'>"+
        					place.name+
        					"</a>"+
        				"</div>" +
        				"<span class='section-result-rating'>" +
        					"<a class='rating'>"+place.rating+"★★★★★</a>"+
        				"</span>" +
        			"</div>" +
        			"<div class='section-result-details-container'>"+
        				"<div class='section-result-address'>"+
        					place.vicinity +
        				"</div>" +
        			"</div>" +
        			"<div class='section-imgage-container'>" +
        				"<img id='photo' src='"+place.photos[0].getUrl({'maxWidth':100, 'maxHeight':100})+"'>" +
        			"</div>"+
        		"</div>"+
        		"<span><hr></span>" +
        	"</div>";
			
		google.maps.event.trigger(mark[1], 'click');
			
		
        		
 	}
	
	function moveTo(newlat, newlng){
		map.setCenter({
			lat: newlat,
			lng: newlng
		});
		map.setZoom(19);


	}
	
	function openSmall(){
		
		var mark=markerList[markerList.length-1];
		
		google.maps.event.addListener(mark, 'click', function() {
			   smallwindow.open(map,mark);
			});

			smallwindow.open(map,mark);
		
	}
	
	function openDefault(){
		$(".hotpl-result").hide();
		$('.clickme').removeClass('btn_selected');
		$(".clickme1").addClass('btn_selected');
		$("#restaurant_result").show();
		$("#hotel_result").hide();
		$("#pub_result").hide();
		$("#tourism_result").hide();
		$("#park_result").hide();
	}
