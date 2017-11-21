/* Google Map JavaScript*/

 /*
 	GoogleMap 연동
 */
var list = voList;
var hlist = hvoList;
var map;
function initMap() {
   map = new google.maps.Map(document.getElementById('map'), {
	   center: {lat: 37.5608381, lng: 126.9859019},
       zoom: 14,
       mapTypeId: 'roadmap',
       disableDefaultUI: true //지도 스타일변경 버튼 안만들기
});     

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
	     map: map
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
	   var marker = new google.maps.Marker({		 
	     position: new google.maps.LatLng(value.xpoint, value.ypoint),
	     icon: 'resources/icons/line/hot.png',
	     map: map
	   });
	});	

   // Create markers.
   features.forEach(function(feature) {
     var marker = new google.maps.Marker({
       position: feature.position,
       icon: icons[feature.type].icon,
       map: map,
       title: 'Click me.' 
     });
   });
   
   /**
    * SerachBox
    */
   // Create the search box and link it to the UI element.
   var input = document.getElementById('pac-input');
   var searchBox = new google.maps.places.SearchBox(input);
   map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
   
   // Bias t  he SearchBox results towards current map's viewport.
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