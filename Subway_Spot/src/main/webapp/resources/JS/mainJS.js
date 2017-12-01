/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openNav() {
    document.getElementById("mySidenav").style.width = "350px";
    
    	//일반역 마커 제거
		var len = rMarkerList.length;
		   for(i=0;i<len;i++){
			   rMarkerList[i].setVisible(false);
		   };
		
		//핫플레이스역 마커 제거
	    var len2 = hMarkerList.length;
		   for(i=0;i<len2;i++){
			   hMarkerList[i].setVisible(false);
		   };
		   
		//카테고리별 마커 제거
		var len3 = markerList.length;
		   for(i=0;i<len3;i++){
			   markerList[i].setMap(null);
		   }
		   markerList = [];
		   
		//추천마커 제거
 		var len4 = hotMarkerList.length;
  			for(i=0;i<len4;i++){
  				hotMarkerList[i].setMap(null);
  			}
  			hotMarkerList = [];
		   
  		//센터로이동 및 줌
		   map.setCenter({
				lat: 37.5608381,
				lng: 126.9859019
			});
			map.setZoom(14);
		   

}
/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    
		var len = pathMarker.length;
		   for(i=0;i<len;i++){
			   pathMarker[i].setMap(null);
		   }
		   pathMarker = [];
		   
		   markerVisible();
	   
		var len2 = wayMarker.length;
		   for(i=0;i<len2;i++){
			   wayMarker[i].setMap(null);
		   }
		   wayMarker = [];

}