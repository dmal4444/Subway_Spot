function getHotMarker(valuelat, valuelng){
	  $.ajax({
          url: "./Hotplace.sub",
          data: {lat: valuelat, lng: valuelng},
          type: "get",
          dataType: "json",
          success: function(data) {
        	  console.log(valuelat+" marker:value");
             for(var i = 0; i < data.length; i++){
                 var marker = new google.maps.Marker({   
                  position: new google.maps.LatLng(data[i].xpoint, data[i].ypoint),
                  icon: data[i].category,
                  map: map,
                  clickable: true, draggable: false        
               });
             }
              console.log(data);
            
          },
          error: function(xhr, statusText, err) {
             console.log(statusText);
             alert("FAIL!!");
          }
       });
}