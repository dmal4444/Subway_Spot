function getHotplaceInfo(valuelat, valuelng){
	$.ajax({	
		url:'./hotPlace.sub',
		data: {lat: valuelat, lng: valuelng},
       /* contentType: "application/json; charset=UTF-8", */ 
        dataType:'json',
		type:'get',
		success:function(data){
			if (data.length==0){
				//console.log("data:" +data);
				console.log("no data");
				console.log(data.length+"  :length");
				$(".hotple").remove();
				$('#restaurant_hotpl').hide();
				
				
			}else{
				for(var i=0; i<3/*data.length*/; i++){
					console.log(data[i].xpoint+"   :lat");
					console.log(data[i].ypoint+"   :lng");
					console.log(data[i].station+"   :station");
					console.log(data[i].category+"   :category");
					console.log(data[i].name+"   :name");
					console.log(data[i].ename+"   :ename");
					console.log(data[i].address+"   :address");
					console.log(data[i].info+"   :info");
					console.log("=================================");
					$('.hotple').remove();
					$('#restaurant_hotpl').show();
				    var hotPlaces=document.getElementById('restaurant_hotpl');
					var info=data[i];
					$('.hotple').remove();
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
	hotPlaces.innerHTML+=
		"<div class='hotple'>"+
			"<div class='section-result-text-content'>" +
				"<div class='section-result-header'>" +
					"<div class='section-result-name'>" +
						"<img src='./resources/icons/hotplace/star.png'>" +
						"<a href='#' onclick=''>" +
							info.name+"("+info.ename+")"+
						"</a>" +
					"</div>" +
				"</div>" +
			"</div>" +
		"</div>";      	
	}