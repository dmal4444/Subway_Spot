/* Google Map JavaScript*/

 /*
 	GoogleMap 연동
 */
 var map;
 function initMap() {
   map = new google.maps.Map(document.getElementById('map'), {
	   center: {lat: 37.5608381, lng: 126.9859019},
       zoom: 13,
       mapTypeId: 'roadmap',
       disableDefaultUI: true //지도 스타일변경 버튼 안만들기

   });
   
   
   /**
    * 마커 생성
    */
   var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
   var icons = {
     station: {
       icon: 'resources/icons/circle1.png'
     },
     station_1: {
         icon: 'resources/icons/circle_r.png'
       }
   };

   var features = [
     {
       position: new google.maps.LatLng(37.561517, 126.993974),
       type: 'station_1'
     }, {
       position: new google.maps.LatLng(37.560831, 126.986424),
       type: 'station'
     }, {
       position: new google.maps.LatLng(37.544613, 126.971985),
       type: 'station'
     }
   ];

   // Create markers.
   features.forEach(function(feature) {
     var marker = new google.maps.Marker({
       position: feature.position,
       icon: icons[feature.type].icon,
       map: map
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
         size: new google.maps.Size(71, 71),
         origin: new google.maps.Point(0, 0),
         anchor: new google.maps.Point(17, 34),
         scaledSize: new google.maps.Size(25, 25)
       };

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
   

 }
 
 /**
  * 길찾기 버튼 
  */
 var map;


 