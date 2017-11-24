/* Google Map JavaScript*/

 /*
 	GoogleMap 연동
 */
var list = voList; //일반 마커 변수
var hlist = hvoList; //핫플레이스 마커 변수
var map;

//tab Window를 위한 변수들
var infowindow, player;
var iw_content = document.getElementById("wrapper1");

//List를 위한 변수
var smallwindow;
var markerList=[];


//지도 연동 시작
function initMap(type, icon) {
   map = new google.maps.Map(document.getElementById('map'), {
	   center: {lat: 37.5608381, lng: 126.9859019},
       zoom: 14,
       mapTypeId: 'roadmap',
       disableDefaultUI: true //지도 스타일변경 버튼 안만들기
   });
   //tab기능 실행
  
   infowindow = new google.maps.InfoWindow();
   var tabs = new TabCard("firstTabs", "firstCard");

   var styles = {
   default: null,
   hide: [
	     {
	       featureType: 'poi.business',
	       stylers: [{visibility: 'off'}]
	     },
	     {
	       featureType: 'transit',
	       elementType: 'labels.icon',
	       stylers: [{visibility: 'off'}]
	     }
	   ]
   };
   map.setOptions({styles: styles['hide']});
   
   /**
    * 일반역 마커 생성  
      */
   
   list.forEach(function(value, index) {
	   var marker = new google.maps.Marker({
	     position: new google.maps.LatLng(value.xpoint, value.ypoint),
	     icon: value.iconpath,
	     map: map,
	     clickable: true, draggable: false
	   });
	   
	   google.maps.event.addListener(marker, "click", function(){
		   var len = markerList.length;
		   for(i=0;i<len;i++){
			   markerList[i].setMap(null);
		   }
		   markerList = [];
		   //List 펼침
		   document.getElementById("mySideList").style.width = "350px";
		   
		   //Center
		   moveCenter(value.xpoint, value.ypoint);
		   
		// 리스트 부분
		   
		   var myLocation={lat: value.xpoint, lng: value.ypoint};
		   var typeText= $("#restaurant_icon").attr("alt");
		   var funcName = typeText + "_callback";
		   smallwindow = new google.maps.InfoWindow();
		   var service = new google.maps.places.PlacesService(map);
			var results=service.nearbySearch({
		     location: myLocation,
		     radius: 500,
		     type: ["restaurant"]
		   }, restaurant_callback);
					   
	   });
	});	 
   
   /**
    * 핫플레이스 마커 생성
    * 
    * @param value
    * @param index
    * @returns
	*/   
    hlist.forEach(function(value, index) {
    	var iw_content = document.getElementById("wrapper1");

       var g = google.maps;
	   var marker = new google.maps.Marker({		 
	     position: new google.maps.LatLng(value.xpoint, value.ypoint),
	     icon: 'resources/icons/line/hot.png',
	     map: map,
	     clickable: true, draggable: false	     
	   });
	   
	   g.event.addListener(marker, "click", function(){
		   var len = markerList.length;
		   console.log("실행 = " + len);
		   for(i=0;i<len;i++){
			   markerList[i].setMap(null);
		   }
		   markerList = [];
		   //tab 펼침
		   getTabId();
		   infowindow.setContent(iw_content);
		   iw_content.style.display = "block";
		   infowindow.open(map, this); 
		   
		   //List 펼침
		   document.getElementById("mySideList").style.width = "350px";
		   
		   //Center
		   moveCenter(value.xpoint, value.ypoint);
		   
		   // 리스트 부분
		   var myLocation={lat: value.xpoint, lng: value.ypoint};
		   //var type= $("#restaurant_icon").attr("alt"); //document.getElementById("restaurant_icon").getAttribute("alt");
		   //console.log(type+"    :type");
		   smallwindow = new google.maps.InfoWindow();
		   var service = new google.maps.places.PlacesService(map);
			var results=service.nearbySearch({
		     location: myLocation,
		     radius: 500,
		     type: ["restaurant"]
		   }, restaurant_callback);
	   });
	});	
   
   /**
    * SerachBox
    */
   // Create the search box and link it to the UI element.
   var input = document.getElementById('pac-input');
   var searchBox = new google.maps.places.SearchBox(input);
   map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
   
   input.style.zIndex = "100";
   
   // Bias the SearchBox results towards current map's viewport.
   map.addListener('bounds_changed', function() {
     searchBox.setBounds(map.getBounds());
   });	
   
   // Create markers.
   var markers = [];
   // Listen for the event fired when the user selects a prediction and retrieve
   // more details for that place.
   searchBox.addListener('places_changed', function() {
     var places = searchBox.getPlaces();

     if (places.length == 0) {
       return;
     }

     // Clear out the old markers.
     markers.forEach(function(marker) {
       marker.setMap(null);
     });
     markers = [];

     
     // For each place, get the icon, name and location.
     var bounds = new google.maps.LatLngBounds();
     places.forEach(function(place) {
       if (!place.geometry) {
         console.log("Returned place contains no geometry");
         return;
       }
       var icon = {
         url: place.icon,
         size: new google.maps.Size(10, 10),
         scaledSize: new google.maps.Size(25, 25)
       };
       thisStateMarker.setIcon(icon)
       
       // Create a marker for each place.
       markers.push(new google.maps.Marker({
         map: map,
         icon: icon,
         title: place.name,
         position: place.geometry.location
       }));

       if (place.geometry.viewport) {
         // Only geocodes have viewport.
         bounds.union(place.geometry.viewport);
       } else {
         bounds.extend(place.geometry.location);
       }
     });
     map.fitBounds(bounds);     
   });

   

   
   
   
   
   /**
    * 길찾기 버튼
    */
// Create the DIV to hold the control and call the CenterControl()
   // constructor passing in this DIV.
   var centerControlDiv = document.createElement('div');
   var centerControl = new CenterControl(centerControlDiv, map);

   centerControlDiv.index = 1;
   map.controls[google.maps.ControlPosition.TOP_LEFT].push(centerControlDiv);
   
   // 리스트 부분
/*   var hongdae={lat:37.557192, lng: 126.925381};
   
   smallwindow = new google.maps.InfoWindow();
   var service = new google.maps.places.PlacesService(map);
	var results=service.nearbySearch({
     location: hongdae,
     radius: 500,
     type: ['restaurant']
   }, callback);*/
   
 }


/**
 * 
 **/
function typeView(type, typeCallback) {
	console.log(list);
	console.log(typeCallback);
   list.forEach(function(value, index) {
	   var marker = new google.maps.Marker({
	     position: new google.maps.LatLng(value.xpoint, value.ypoint),
	     icon: value.iconpath,
	     map: map,
	     clickable: true, draggable: false
	   });
	   
	   google.maps.event.addListener(marker, "click", function(){
		   var len = markerList.length;
		   for(i=0;i<len;i++){
			   markerList[i].setMap(null);
		   }
		   markerList = [];
		   //List 펼침
		   document.getElementById("mySideList").style.width = "350px";
		   
		   //Center
		   moveCenter(value.xpoint, value.ypoint);
		   
		// 리스트 부분
		   
		   var myLocation={lat: value.xpoint, lng: value.ypoint};
		   
		   smallwindow = new google.maps.InfoWindow();
		   var service = new google.maps.places.PlacesService(map);
			var results=service.nearbySearch({
		     location: myLocation,
		     radius: 500,
		     type: [type]
		   }, typeCallback);
					   
	   });
	});
}


/**
 * 길찾기 버튼 
 */
/* var map;
*/ function CenterControl(controlDiv, map) {

	   // Set CSS for the control border.
	   var controlUI = document.createElement('div');
	   controlUI.style.backgroundColor = '#fff';
	   controlUI.style.border = '2px solid #fff';
	   controlUI.style.borderRadius = '3px';
	   controlUI.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
	   controlUI.style.cursor = 'pointer';
	   controlUI.style.marginTop = '10px';
	   controlUI.style.marginLeft = '8px';
	   controlUI.style.marginBottom = '20px';
	   controlUI.style.textAlign = 'center';
	   controlUI.title = 'Find';
	   controlDiv.appendChild(controlUI);
	   
	   
	   // Set CSS for the control interior.
	   var controlText = document.createElement('div');
	   controlText.style.color = 'rgb(25,25,25)';
	   controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
	   controlText.style.fontSize = '16px';
	   controlText.style.lineHeight = '30px';
	   controlText.style.paddingLeft = '5px';
	   controlText.style.paddingRight = '5px';
	   controlText.innerHTML =  "<img src='resources/icons/direction.png' onclick='openNav()'/>";
	   controlUI.appendChild(controlText);

	   // Setup the click event listeners: simply set the map to Chicago.
	   controlUI.addEventListener('click', function() {
		   
	 
	   });
	 }

/**
 * TabWindow
 * @param tabid
 * @param cardid
 * @returns
 */
function TabCard(tabid, cardid){
	 this.tabid = tabid;
	 this.cardid = cardid;
	 this.handleTabs = handleTabs;
	 this.handleTabs(1);

}

function handleTabs(num){
	var me = this;
	  var tabsdiv = document.getElementById(this.tabid);
	  this.newcard = this.cardid + num;
	  if (!this.card) this.card = this.newcard;
	  // Switch cards
	  document.getElementById(this.card).style.display = "none";
	  document.getElementById(this.newcard).style.display = "block";

	  // Store active card
	  this.card = this.newcard;

	  // Handle tab events
	  for (var i = 0, tab; tab = tabsdiv.getElementsByTagName("span")[i]; i++) {

	    // Make clicked tab active and
	    // unregister event listener for active tab
	    if (tab.getAttribute("data-name")*1 == num) {
	     tab.className = "activeTab";
	     tab.onmouseover = null;
	     tab.onmouseout = null;
	     tab.onclick = null;
	    }
	    // Register mouse event listener for tabs
	    else {

	     // Reset tabs
	     tab.className = "passiveTab";

	     tab.onmouseover = function() {
	      this.className = "hoverTab";
	     };

	     tab.onmouseout = function() {
	      this.className = "passiveTab";
	     };

	     tab.onclick = function() {
	      // 'this' refers to the tab here
	      var tabnum = this.getAttribute("data-name")*1;
	      var label = this.firstChild.nodeValue;
	      me.handleTabs(tabnum);
	      // Displays street view in tab #2 
	      if (tabnum == 2) {
	    	  //viewStreet(me.card, me.point);
	      // Display either mini map or video in tab #3
	      }
	      else if (label == "Mini Map"){
	         //seeMiniMap(me.card, me.point);
	      }
	      else if (label == "Video"){ 
	        // showVideo(me.card);
	      }

	      // Stop possibly running video
	      if (tabnum != 3) {
	        //if (msie) removeVideo();
	        //else if (player) player.pauseVideo();
	      }
	      return false;
	     };
	    }
	  }
}


function viewStreet(div, point) {

  /*var g = google.maps;
  var pano = new g.StreetViewPanorama(document.getElementById(div), {
    position: point });
//  map.setStreetView(pano);
 pano.setVisible(true);*/
}


function seeMiniMap(div, point) {

/*  var g = google.maps;
  var mini = new g.Map(document.getElementById(div), {
    center: point,
    zoom: 18,
    streetViewControl: false,
    mapTypeId: "hybrid",
    mapTypeControlOptions: {
     style: g.MapTypeControlStyle.DROPDOWN_MENU
    }
  });*/
}

function getTabId(){
	   var iw_content = document.getElementById("wrapper1");
	   return iw_content;
	}

window.onload = getTabId();


/**
 * 가운데 놓기
 * @param newLat
 * @param newLng
 * @returns
 */

function moveCenter(newLat, newLng){
	map.setCenter({
		lat: newLat,
		lng: newLng
			
	});
	map.setZoom(18);
		
}

//===================================================

function restaurant_callback(results, status) {	
	console.log("restaurant_callback 호출됨");
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
		   }, type + "_callback");
	}