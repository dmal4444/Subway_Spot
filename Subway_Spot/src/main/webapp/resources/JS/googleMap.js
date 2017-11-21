/* Google Map JavaScript*/

 /*
 	GoogleMap 연동
 */
var list = voList; //일반 마커 변수
var hlist = hvoList; //핫플레이스 마커 변수
var map;

//tab Window를 위한 변수들
var infowindow, player;

//지도 연동 시작
function initMap() {
   map = new google.maps.Map(document.getElementById('map'), {
	   center: {lat: 37.5608381, lng: 126.9859019},
       zoom: 14,
       mapTypeId: 'roadmap',
       disableDefaultUI: true //지도 스타일변경 버튼 안만들기
});
   //tab기능 실행
   var iw_content = document.getElementById("wrapper1");
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
	});	 
   
   /**
    * 핫플레이스 마커 생성
    * 
    * @param value
    * @param index
    * @returns
	*/   
    hlist.forEach(function(value, index) {
 	
       var g = google.maps;
	   var marker = new google.maps.Marker({		 
	     position: new google.maps.LatLng(value.xpoint, value.ypoint),
	     icon: 'resources/icons/line/hot.png',
	     map: map,
	     clickable: true, draggable: false	     
	   });
	   
	   g.event.addListener(marker, "click", function(){
		   
		   var iw_content=document.getElementById("wrapper1");
		   infowindow.setContent(iw_content);
		   iw_content.style.display = "block";
		   infowindow.open(map, this); 
	   });
	});	
   
   /**
    * SerachBox
    */
   // Create the search box and link it to the UI element.
   var input = document.getElementById('pac-input');
   var searchBox = new google.maps.places.SearchBox(input);
   map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
   
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
 }

//Tab window 
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
	        if (msie) removeVideo();
	        else if (player) player.pauseVideo();
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

