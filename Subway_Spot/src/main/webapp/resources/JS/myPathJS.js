/*길찾기 JavaScript*/
 
$(document).ready(function() {
	var firstStn = $("#from").val();
	var lastStn = $("#to").val();
	var min=1;
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
        firstStn = $("#from").val();
		lastStn = $("#to").val();
		min=1;
		getData(firstStn, lastStn, min);

    });
    $('#t_minTrans').click(function() {
        $('#minTime').hide();
        $('#minTrans').show();
        firstStn = $("#from").val();
		lastStn = $("#to").val();
        min=2;
		getData(firstStn, lastStn, min);

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
	//전체버튼
	 $('.showBtn.all').click(function() {
        $('.pathDiv.short').hide();
        $('.pathDiv.all').show();
        
		firstStn = $("#from").val();
		lastStn = $("#to").val();
		
        getData(firstStn, lastStn, min);

    });
	 //요약버튼
    $('.showBtn.short').click(function() {
        $('.pathDiv.all').hide();
        $('.pathDiv.short').show();
        
		firstStn = $("#from").val();
		lastStn = $("#to").val();
        getData(firstStn, lastStn, min);
    });
    
    //출구정보버튼
    $(".exit").click(function(){
    	$(location).attr("href","./Detail/Bus.sub");
    });
    //운행시간버튼
    $(".act").click(function(){
    	$(location).attr("href","./Detail/DetailForm.sub");
    });
    //길찾기 버튼
	$("#findBtn").click(function(){
		firstStn = $("#from").val();
		lastStn = $("#to").val();
		min = 1;
		getData(firstStn, lastStn, min);
	});
});
/*
$(document).ready(function(){*/

//ajax
	function getData(firstStn, lastStn, min){	
		$.ajax({	
				url:"https://api.odsay.com/api/subwayPath",
				data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&CID=1000&SID='+firstStn+'&EID='+lastStn+'&Sopt='+min,
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
                dataType:'json',
				type:'POST',
				success:function(data){
				/*	alert("startName= "+data.result.stationSet.stations[1].startName);*/
									
					$('.main_div').show();	
					if($('.main_div').css("display")=="none"){
						$('.main_div').show();	
					}
					//출발역, 도착역 검색부분
					//$("#from").val(data.result.globalStartName);
					//$("#to").val(data.result.globalEndName);
					
					var info=data.result;
					var exchange = data.result.exChangeInfoSet;
					var driveinfo=data.result.driveInfoSet;
					var stationinfo = data.result.stationSet;
					
					//출발역 도착역 표시 
					$("a.stn.start").html(info.globalStartName);
					$("a.stn.end").html(info.globalEndName);
					
					//상세보기 박스 
					$(".travelTime").html(info.globalTravelTime);
					$(".travelDistance").html(info.globalStationCount);
					$(".cardFare").html(info.fare);
					$(".cashFare").html(info.cashFare);
					
						//환승 횟수 
					if((exchange == null)){
						$(".exchangeCount").html("0");
					}
					else {

						$(".exchangeCount").html(exchange.exChangeInfo.length);	
					}
					
					//리스트
					//도착역
					var firstLine=driveinfo.driveInfo[0].laneName.slice(-3);
					$(".sbway_stn.dept").html(driveinfo.driveInfo[0].startName);
					$(".sbway_line").html(firstLine.substr(0,1));	
					$(".wayname").html(driveinfo.driveInfo[0].wayName);
					
					//자세히보기 
					
					var count=1;

					//환승역
					//환승정보가 존재할때
					if(exchange!=null){
						var exchange = data.result.exChangeInfoSet;
						var exLen = exchange.exChangeInfo.length;
						var stringLen1=exchange.exChangeInfo[exLen-1].laneName.slice(-3);
														
						//전체보기 배열에서 환승정보 index 구하기 
						var indexes = [];
				
						for(i=0; i<exchange.exChangeInfo.length; i++){
							var exID=data.result.exChangeInfoSet.exChangeInfo[i].exSID;
							indexes[i] = $.map(data.result.stationSet.stations, function(obj, index) {
							    if(obj.startID == exID) {    	
							    	return index;
							   	};						 	
							});						
						};
/*							
						for(i=0; i<indexes.length;i++){
							console.log(indexes[i]+"["+i+"]index");
						};*/

							
						//환승정보가 1개만 있을 때
						if(exLen==1){						
								
							$(".append").remove();
							var child=$(".detail_list").children("li");
							child.hide();


							for(count=1; count<indexes[0];count++){	

								AppendDetail();
								$(".sbway_stn.detail"+i).html(stationinfo.stations[i].startName);
								$(".sbway_stn.detail_line"+i).html(firstLine.substr(0,1));	
							}
							alert("working?");
							
							$(".sbway_stn.exch").html(exchange.exChangeInfo[0].exName);
							$(".fastTrain.first").html(exchange.exChangeInfo[0].fastTrain);
							$(".fastDoor.first").html(exchange.exChangeInfo[0].fastDoor);
							$(".exWalkTime").html(Math.round((exchange.exChangeInfo[0].exWalkTime)/60));
							$(".arrival_line").html(driveinfo.driveInfo[0].laneID);
							
							$(".ex_line").html(stringLen1.substr(0,1));						
							$(".fastExch").show();
							$(".sbway_transfer").show();		
							$(".fastExch2").hide();
						/*//-------------------------------
						var count = 1;
						for(count=1; count<indexes[0];count++){
							
							AppendDetail();
							$(".sbway_stn.detail"+i).html(stationinfo.stations[i].startName);
							$(".sbway_stn.detail_line"+i).html(firstLine.substr(0,1));
						}				
						//환승역추가
						//blahblah
						
							if(indexes.length<2){
								for(i=1; i<indexes.length; i++){
									for(count; count<indexes[i]; count++){
										appendDetail();
										//blahblah
										appendExchange();
										//blahblah
									}
								}
									
							}
							
						for(count; count<stations.length; count++){
							appendDetail();
							//blahblah
							
							}
						
						//-------------------------------*/
						
						}
						//환승정보가 2개 이상일 때
						else if(exLen>1){
							
							$(".append").remove();						
							var child=$(".exchangeBox").children("li");
							child.hide();
							for(i=0; i<exLen; i++){
								AppendExchange();
																
								$(".sbway_stn.exch.append"+i).html(exchange.exChangeInfo[i].exName);
								$(".fastTrain.first.append"+i).html(exchange.exChangeInfo[i].fastTrain);
								$(".fastDoor.first.append"+i).html(exchange.exChangeInfo[i].fastDoor);
								$(".exWalkTime.append"+i).html(Math.round((exchange.exChangeInfo[i].exWalkTime)/60));
								$(".arrival_line.append"+i).html(driveinfo.driveInfo[i].laneID);
								
									
									var exLen = exchange.exChangeInfo.length;
									var stringLen1=exchange.exChangeInfo[i].laneName.slice(-3);

								$(".ex_line.append"+i).html(stringLen1.substr(0,1));						
								$(".fastExch.append"+i).show();
								$(".sbway_transfer.append"+i).show();
														
								$(".fastExch2.append"+i).show();
							}
							
						}
					}
						//환승정보가 존재하지 않을 때
					else{
						
						$(".append").remove();						
						var child=$(".detail_list").children("li");
							child.hide();
							
						for(i=1; i<stationinfo.stations.length;i++){
							
							AppendDetail();
							
							$(".sbway_stn.detail"+i).html(stationinfo.stations[i].startName);
							$(".sbway_stn.detail_line"+i).html(firstLine.substr(0,1));
						
						}
						
						
						$(".fastExch").hide();
						$(".sbway_transfer").hide();
	
					}
					console.log(data);
					
					
					var length=0;
					length=driveinfo.driveInfo.length;
					var stringLen=driveinfo.driveInfo[length-1].laneName.slice(-3);
					//도착역 정보
					$(".sbway_stn.arrival").html(info.globalEndName);
					$(".arrival_line").html(stringLen.substr(0,1));

					//console.log(data);
				
				},
				error:function(){
					alert("FAIL!!!!!");
				}
			});
		
	}

	function AppendExchange(){
		$(".exchangeBox").append("<div class='append'><li class='sbway_transfer'>" +
				"<span class='sbway_line_wrap'>" +
				"<span class='sbway_line_img transfer'></span>" +
				"</span>" +
				"<dl class='sbway_dl_list' id='list_exchange'>" +
				"<dt class='sbway_time' id='departure_time'>" +
					"15:00" +
				"</dt>" +
				"<dd>" +
					"<a href='#' class='sbway_stn exch append"+i+"' id='exchange_stn2'>사당</a>역(" +
					"<a class='ex_line append"+i+"' id='ex_line2'>4</a>호선)" +
				"</dd>" +
				"<dd class='departure_info'>" +
					"도보<a class='exWalkTime append"+i+"' id='exWalkTime1'>1</a>분<br>" +
					"<p class='fastExch2 append"+i+"' id='fastExch2'>빠른 환승" +
					"<a class='fastTrain2 append"+i+"' id='fastTrain2'>5</a>-<a class='fastDoor2 append"+i+"' id='fastDoor2'>1</a>번 문</p>" +
				"</dd>" +
				"</dl>" +
			"</li></div>");
		
		
}
	function AppendDetail(){
		$(".detail_list").append("<div class='append'><li class='sbway_departure'>" +
				"<span class='sbway_line_wrap'>" +
				"<span class='sbway_line_img'></span>" +
				"</span>" +
				"<dl class='sbway_dl_list' id='list_departure'>" +
				"<dt class='sbway_time' id='departure_time'>" +
				"15:17" +
				"</dt>" +
				"<dd>" +
				"<a href='#' class='sbway_stn detail"+i+"' id='detail_stn'>땡땡</a>역(" +
				"<a class='sbway_stn detail_line"+i+"' id='detail_line'>0</a>호선)" +
				"</dd>" +
				"</dl>" +
				"</li></div>"	);
	
	}



