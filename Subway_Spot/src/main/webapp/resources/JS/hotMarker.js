function getHotMarker(valuelat, valuelng){	   
	  $.ajax({
          url: "./Hotplace.sub",
          data: {lat: valuelat, lng: valuelng},
          type: "get",
          dataType: "json",
          success: function(data) {
        	  var iw_content = document.getElementById("wrapper1");
              var g = google.maps;
             for(var i = 0; i < data.length; i++){
                 var marker = new google.maps.Marker({   
                  position: new google.maps.LatLng(data[i].xpoint, data[i].ypoint),
                  icon: data[i].category,
                  map: map,
                  clickable: true, draggable: false        
               });

          	   g.event.addListener(marker, "click", function(){
        		   
        		   //tab 펼침
          		 
        		   getTabId();
        		   infowindow.setContent(iw_content);
        		   iw_content.style.display = "block";
        		   infowindow.open(map, this);
          	   });
             }
          },
          error: function(xhr, statusText, err) {
             console.log(statusText);
             alert("FAIL!!");
          }
       });
}