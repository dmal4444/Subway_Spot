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
var myLocation;
var hotmarkerList=[];


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
	     title: value.name,
	     clickable: true, draggable: false
	   });
	   
	   google.maps.event.addListener(marker, "click", function(){
		   var len = markerList.length;
		   for(i=0;i<len;i++){
			   markerList[i].setMap(null);
		   }
		   markerList = [];
		   
			 var len = hotmarkerList.length;
			   console.log(len+" :hotmarkerlen");
			   for(i=0;i<len;i++){
				   hotmarkerList[i].setMap(null);
			   }
			   hotmarkerList = [];
			   
		   //List 펼침
		   document.getElementById("mySideList").style.width = "350px";
		   
		   //Center
		   moveCenter(value.xpoint, value.ypoint);
		   
		// 리스트 부분
		   
		   myLocation={lat: value.xpoint, lng: value.ypoint};
		   var typeText= $("#restaurant_icon").attr("alt");
		   var funcName = typeText + "_callback";
		   smallwindow = new google.maps.InfoWindow();
		   var service = new google.maps.places.PlacesService(map);
			var results=service.nearbySearch({
		     location: myLocation,
		     radius: 500,
		     type: ["restaurant"]
		   }, restaurant_callback);
			
			//리스트 처음에 클릭했을때 열리는 Div를 고정하기
			openDefault();			
					   
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
	     title: value.name,
	     clickable: true, draggable: false	     
	   });
	   
	   
	   g.event.addListener(marker, "click", function(){
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
		   myLocation={lat: value.xpoint, lng: value.ypoint};
		   smallwindow = new google.maps.InfoWindow();
		   var service = new google.maps.places.PlacesService(map);
			var results=service.nearbySearch({
		     location: myLocation,
		     radius: 500,
		     type: ["restaurant"]
		   }, restaurant_callback);
			getHotMarker(value.xpoint, value.ypoint);
			var category='1';
			var nowPage=1;
			
			//추천정보 가져오기
			getHotplaceInfo(value.xpoint, value.ypoint, category, nowPage);
			
			//리스트 처음에 클릭했을때 열리는 Div를 고정하기
			openDefault();
			
			
			
			
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
   
/*   // Bias the SearchBox results towards current map's viewport.
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
   });*/
  
   
   /**
    * 길찾기 버튼
    */
//  the DIV to hold the control and call the CenterControl()
   // constructor passing in this DIV.
   var centerControlDiv = document.createElement('div');
   var centerControl = new CenterControl(centerControlDiv, map);

   centerControlDiv.index = 1;
   map.controls[google.maps.ControlPosition.TOP_LEFT].push(centerControlDiv);
      
 }


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

