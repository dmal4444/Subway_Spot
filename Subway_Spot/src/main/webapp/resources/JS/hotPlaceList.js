function getHotplaceInfo(valuelat, valuelng, category){
	$.ajax({	
		url:'./hotPlaceList.sub',
		data: {lat: valuelat, lng: valuelng, category: category},
       /* contentType: "application/json; charset=UTF-8", */ 
        dataType:'json',
		type:'get',
		success:function(data){
			if (data.length==0){
				//console.log("data:" +data);
				console.log("no data");
				console.log(data.length+"  :length");
				$(".hotple").remove();
				$('.hotpl-result').hide();
				
				
			}else{
				$('#restaurant_hotpl').show();
				$('.hotple').remove();
				$('.paging').remove();
				for(var i=0; i<data.length; i++){
					
				    var hotPlaces=document.getElementById('restaurant_hotpl');
					var info=data[i];
					appendHotPlaces(hotPlaces, info);
				}
			}
			
			
		},
		error:function(xhr, status, error) {
			 console.log(xhr.responseText);
			 alert("fail");
		}
	});
}

function appendHotPlaces(hotPlaces, info){
	var newlat=info.xpoint;
	var newlng=info.ypoint;
	
	hotPlaces.innerHTML+=
		"<div class='hotple'>"+
			"<div class='section-result-text-content'>" +
				"<div class='section-result-header'>" +
					"<div class='section-result-name'>" +
						"<img src='./resources/icons/hotplace/star.png'>" +
						"<a href='#' onclick='moveTo("+newlat+","+newlng+");'>" +
							info.name+"("+info.ename+")"+
						"</a>" +
					"</div>" +
				"</div>" +
			"</div>" +
		"</div>";      	
	}