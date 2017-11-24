
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
	   console.log(type+"  :type");
	 
}

//레스토랑 결과 호출
function restaurant_callback(results, status) {	
	console.log("restaurant_callback 호출됨");
	var icon="restaurant";
	if (status === google.maps.places.PlacesServiceStatus.OK) {
    	
    var placesList=document.getElementById('restaurant_result');
    	$(".section").remove();	
      for (var i = 0; i < results.length; i++) {
        createListMarker(results[i], icon);
        appendPlacesList(placesList, results[i]);
      }
    }
 }

//호텔 결과 호출
function hotel_callback(results, status) {
	console.log("hotel_callback 호출됨");
	  console.log(results);
	var icon="hotel";

    if (status === google.maps.places.PlacesServiceStatus.OK) {
    	
    var placesList=document.getElementById('hotel_result');
    	$(".section").remove();	
      for (var i = 0; i < results.length; i++) {
        createListMarker(results[i], icon);
        appendPlacesList(placesList, results[i]);
      }
    }
 }

//펍 결과 호출
function pub_callback(results, status) {
	console.log("pub_callback 호출됨");
	var icon="pub";
    if (status === google.maps.places.PlacesServiceStatus.OK) {
    	
    var placesList=document.getElementById('pub_result');
    	$(".section").remove();	
      for (var i = 0; i < results.length; i++) {
        createListMarker(results[i], icon);
        appendPlacesList(placesList, results[i]);
      }
    }
 }

//투어리즘 결과 호출
function tourism_callback(results, status) {
	console.log("tourism_callback 호출됨");
	var icon="tourism";

    if (status === google.maps.places.PlacesServiceStatus.OK) {
    	
    var placesList=document.getElementById('tourism_result');
    	$(".section").remove();	
      for (var i = 0; i < results.length; i++) {
        createListMarker(results[i], icon);
        appendPlacesList(placesList, results[i]);
      }
    }
 }

//공원 결과 호출
function park_callback(results, status) {
	console.log("park_callback 호출됨");
	console.log(results);
	var icon="park";

    if (status === google.maps.places.PlacesServiceStatus.OK) {
    	
    var placesList=document.getElementById('park_result');
    	$(".section").remove();	
      for (var i = 0; i < results.length; i++) {
        createListMarker(results[i], icon);
        appendPlacesList(placesList, results[i]);
      }
    }
 }

var mark;

function createListMarker(place, icon) {
     placeLoc = place.geometry.location;
    //var placesList=document.getElementById('restaurant_result');
	
    mark =markerList.push(new google.maps.Marker({
    	map: map,
    	position: place.geometry.location,
    	title:place.name,
    	icon:'./resources/icons/category/'+icon+'_marker_icon.png'
	  //icon:photos[0].getUrl({'maxWidth':35, 'maxHeight':35})
    }));

    google.maps.event.addListener(markerList[markerList.length-1], 'click', function() {
      smallwindow.setContent(place.name);
      smallwindow.open(map, this);
    });   
  }


	function appendPlacesList(placesList, place){
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
        	"</div>"   	
        		;
 	}
	
	function moveTo(newlat, newlng){
		console.log("placeeddd");
		map.setCenter({
			lat: newlat,
			lng: newlng
		});
		map.setZoom(19);

	    smallwindow.open(map, this.mark);
	}
