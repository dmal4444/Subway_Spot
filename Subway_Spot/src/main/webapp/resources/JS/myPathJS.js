/*길찾기 JavaScript*/
 
$(document).ready(function() {
	//스위치 버튼
	 $("#swtichBtn").on('click',function(){
	        var pickup = $('#from').val();
	        $('#from').val($('#to').val());
	        $('#to').val(pickup);
	 });
        
	//길찾기 내역 숨기기 버튼
	$("#clearBtn").click(function(){
		if($('.main_div').css("display")=="none"){
			$('.main_div').show();	
		}
		else{
			$('.main_div').hide();
		}
	});
	
	//최소거리와 최소환승 버튼	
    $('#t_minTime').click(function() {
    	
        $('#minTrans').hide();
        $('#minTime').show();

    });
    $('#t_minTrans').click(function() {
        $('#minTime').hide();
        $('#minTrans').show();
    });
    
//시간설정 보이기 숨기기 버튼 
	$(".arrow_down").click(function(){
		var arrow = $(this).attr("src");
		if(arrow=='resources/icons/arrow_up.png'){
			$(this).attr("src","resources/icons/arrow_down.png");
			$('.timeSet').hide();
		}
		else{
			$(this).attr("src","resources/icons/arrow_up.png");	
			$('.timeSet').show();
		}
	});
	
//요약과 전체 버튼
	 $('.showBtn.all').click(function() {
        $('.pathDiv.short').hide();
        $('.pathDiv.all').show();

    });
    $('.showBtn.short').click(function() {
        $('.pathDiv.all').hide();
        $('.pathDiv.short').show();
    });
});

//ajax
$(document).ready(function(){

	$("#findBtn").click(function(){
		var firstStn = $("#from").val();
		var lastStn = $("#to").val();
		
		if($("#minTime").css("display")=="blcok"){
			var min = 1;
		}
		else{
			var min =2;
		}
		alert("min"+min);
	
	$.ajax({	
			url:"https://api.odsay.com/api/subwayPath",
			data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&CID=1000&SID='+firstStn+'&EID='+lastStn+'&Sopt='+min,
			dataType:'json',
			type:'POST',
			success:function(data){
			/*	alert("startName= "+data.result.stationSet.stations[1].startName);*/
				
				alert("exchange"+data.result.cashFare);
				
				$('.main_div').show();	
				if($('.main_div').css("display")=="none"){
					$('.main_div').show();	
				}
				//출발역, 도착역 검색부분
				$("#from").val(data.result.globalStartName);
				$("#to").val(data.result.globalEndName);
				
				//출발역 도착역 표시 
				$("a.stn.start").html(data.result.globalStartName);
				$("a.stn.end").html(data.result.globalEndName);
				
				//상세보기 박스 
				$("#travelTime").html(data.result.globalTravelTime);
				$("#travelDistance").html(data.result.globalStationCount);
				$("#cardFare").html(data.result.fare);
				$("#cashFare").html(data.result.cashFare);
				
				
				if(data.result.exChangeInfoSet.exChangeInfo.length == null) {
					$("#exchangeCount").html("0");
				}
				else {
					$("#exchangeCount").html(data.result.exChangeInfoSet.exChangeInfo.length);
					
				}
				
				//리스트
				//$("#departure_stn").html()
	

				//console.log(data);
				console.log(data.result.exChangeInfoSet);

				
				
			},
			error:function(){
				alert("FAIL!!!!!");
			}
		});
	});
});


