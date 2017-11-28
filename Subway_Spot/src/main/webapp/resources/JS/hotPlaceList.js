/*추천리스트 부분 이벤트및 함수처리 */

function getHotplaceInfo(valuelat, valuelng, category, nowPage){
	var reqData = {lat: valuelat, lng: valuelng, category: category, nowPage: nowPage};
	$.ajax({	
		url:'./hotPlaceList.sub',
		data: reqData,
       /* contentType: "application/json; charset=UTF-8", */ 
        dataType:'json',
		type:'get',
		success:function(data){
			var data1=$('#hDataLat').val(reqData.lat);
			var data2=$('#hDataLng').val(reqData.lng);
			var data3=$('#hDataCate').val(reqData.category);
			var data4=$('#hDataNow').val(reqData.nowPage);
			
			console.log($("#hDataLat").val()+":   hDataLat 넣을 때");
			
		
			if (data.LIST.length==0){
				console.log("no data");
				$(".hotple").remove();
				$('.hotpl-result').hide();
				
				
			}else{
				
				console.log(data.LIST.length+"  :length");
				$('#restaurant_hotpl').show();
				$('.hotple').remove();
				$('.paging').remove();
				var hotPlaces=document.getElementById('restaurant_hotpl');
				hotPlaces.innerHTML = '';
				appendPaging(hotPlaces, data, reqData);
				
				
				for(var i=0; i<data.LIST.length; i++){					
					var info=data.LIST[i];
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
	
	hotPlaces.innerHTML +=
		"<div class='hotple'>" +
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

	function appendPaging(hotPlaces, data, reqData){
		// 첫 번째 페이지, 마지막 페이지, 전체개수
		// 서버로 ajax 요청을 보낼 때 현재 페이지 번호, 전체 글 수를 받아서 여기서 페이징 처리
		// 현재 페이지가 몇번인지
		hotPlaces.innerHTML =
			"<div class='paging' data-page='" + data.nowPage + "' " 
			+ "data-lastpage='" + data.PINFO.lastPage + "'>"
			+	"<span id='hotPrev' class='hotPrev'>◀이전</span> / " 	
			+ 	"<span id='hotNext' class='hotNext'>다음▶</span>" 	
			+"</div>";
		console.log(data.nowPage+": data.nowPage");	
		console.log(".page-length : " + $(".paging").length);
		
	}
	
$(document).ready(function(){		
	$(document).on("click", ".hotPrev", function(e) {
		
		var hLat = $("#hDataLat").val();
		var hLng = $("#hDataLng").val();
		var hCate = $("#hDataCate").val();
		var hNow = $("#hDataNow").val();
		
		var curPage = $(this).parent().attr("data-page");
		//var curPage=hNow;
		if(curPage <= 1) {
			alert("맨 앞 페이지 입니다.");
			console.log(curPage+" :맨 앞에서");
			return false; 
		}
		curPage -= 1;
		$(this).parent().attr("data-page", curPage);
		console.log("curPage: "+curPage);			
		getHotplaceInfo2(hLat, hLng, hCate, curPage);
			
	});
	
	$(document).on("click", ".hotNext", function(e) {
		
		var hLat = $("#hDataLat").val();
		var hLng = $("#hDataLng").val();
		var hCate = $("#hDataCate").val();
		var hNow = $("#hDataNow").val();
		
		
		var tempPage = $(this).parent().attr("data-page");
		var curPage = new Number(tempPage);
		var lastPage = $(this).parent().attr("data-lastpage");
		curPage += 1;
		if(curPage > lastPage) {
			alert("마지막 페이지 입니다.");	
			console.log(curPage+" :맨 뒤에서");
			curPage--;
			return false;
		}		
		$(this).parent().attr("data-page", curPage);
		console.log("curPage: "+curPage);
		
		getHotplaceInfo2(hLat, hLng, hCate, curPage);		
	});
});

function getHotplaceInfo2(valuelat, valuelng, category, nowPage){
	var reqData = {lat: valuelat, lng: valuelng, category: category, nowPage: nowPage};
	$.ajax({	
		url:'./hotPlaceList.sub',
		data: reqData,
       /* contentType: "application/json; charset=UTF-8", */ 
        dataType:'json',
		type:'get',
		success:function(data){
			
			if (data.LIST.length==0){
				console.log("no data");
				$(".hotple").remove();
				$('.hotpl-result').hide();
				
				
			}else{
				
				console.log(data.LIST.length+"  :length");
				$('#restaurant_hotpl').show();
				$('.hotple').remove();
				
				var hotPlaces=document.getElementById('restaurant_hotpl');
								
				for(var i=0; i<data.LIST.length; i++){					
					var info=data.LIST[i];
					appendHotPlaces(hotPlaces, info);
				}
			}
			
			//nowPage++; // 나중에 삭제 예정인 변수
		},
		error:function(xhr, status, error) {
			 console.log(xhr.responseText);
			 alert("fail");
		}
	});
}

//이전/다음 단추는 그냥 만들어 놓은채 클릭하면 
//컨트롤러에서 단추를 눌러서 nowPage가 1이면 아무것도 실행안하고 1이 아니면 실행되게 