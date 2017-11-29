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
		$('#from').val('');
		$('#to').val('');

	});
	
	//최소거리와 최소환승 버튼	
    $('#t_minTime').click(function() {
    	
        $('#minTrans').hide();
        $('#minTime').show();
        firstStn = $("#from").val();
		lastStn = $("#to").val();
		min=1;
		getCode(firstStn, lastStn, min);

    });
    $('#t_minTrans').click(function() {
        $('#minTime').hide();
        $('#minTrans').show();
        firstStn = $("#from").val();
		lastStn = $("#to").val();
        min=2;
        getCode(firstStn, lastStn, min);

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
		
		getCode(firstStn, lastStn, min);

    });
	 //요약버튼
    $('.showBtn.short').click(function() {
        $('.pathDiv.all').hide();
        $('.pathDiv.short').show();
        
		firstStn = $("#from").val();
		lastStn = $("#to").val();
		getCode(firstStn, lastStn, min);
        
    });
    
    //출구정보버튼
    $(".exit").click(function(){
		$("#stn_frm").attr("action", "./findProc.sub").submit();
		
    });
    //운행시간버튼
    $(".act").click(function(){
    	$("#stn_frm").attr("action", "./findProc2.sub").submit();
		
    });
    //길찾기 버튼
	$("#findBtn").click(function(){
		
		firstStn = $("#from").val();
		lastStn = $("#to").val();
		min = 1;
		
		getCode(firstStn, lastStn, min);
		map.setCenter({
			lat: 37.5608381,
			lng: 126.9859019
		});
		map.setZoom(14);
		
		createMarkers();
		
	});
});

//ajax
	function getData(firstStn, lastStn, min){
		$.ajax({	
				url:"https://api.odsay.com/api/subwayPath",
				data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&CID=1000&SID='+firstStn+'&EID='+lastStn+'&Sopt='+min,
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
                dataType:'json',
				type:'POST',
				success:function(data){
										
													
					$('.main_div').show();	
					if($('.main_div').css("display")=="none"){
						$('.main_div').show();	
					}
					
					var info=data.result;
					var exchange = data.result.exChangeInfoSet;
					var driveinfo=data.result.driveInfoSet;
					var stationinfo = data.result.stationSet;
					var length=0;
					length=driveinfo.driveInfo.length;
					var stringLen=driveinfo.driveInfo[length-1].laneName.slice(-3);
					
					var firstLine=driveinfo.driveInfo[0].laneName.slice(-3);
					var count=1;
				

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
					else{
						$(".exchangeCount").html(exchange.exChangeInfo.length);	
					}
					
					//리스트
					//출발역
					
					$(".sbway_stn.dept").html(driveinfo.driveInfo[0].startName);
					$(".sbway_line").html(firstLine.substr(0,1));	
					$(".wayname").html(driveinfo.driveInfo[0].wayName);
					
					$(".sbway_line_wrap_stn").children('span').remove();
					$(".sbway_line_wrap_stn").append("<span class='sbway_line_img"+firstLine.substr(0,1)+" start'></span>");					

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
						
						$(".append").remove();
						var child=$(".detail_list").children("li");
						child.hide();
						
						for(count;count<indexes[0];count++){	
							console.log(firstLine+" :firstLine");
							AppendDetail(count, firstLine);
							$(".sbway_stn.detail"+count).html(stationinfo.stations[count].startName);
							$(".sbway_stn.detail_line"+count).html(firstLine.substr(0,1));
						}
						
						count++;
													
						//환승정보가 1개만 있을 때
						if(exLen==1){						
							
							$(".sbway_stn.exch").html(exchange.exChangeInfo[0].exName);
							$(".fastTrain.first").html(exchange.exChangeInfo[0].fastTrain);
							$(".fastDoor.first").html(exchange.exChangeInfo[0].fastDoor);
							$(".exWalkTime").html(Math.round((exchange.exChangeInfo[0].exWalkTime)/60));
							
							$(".ex_line").html(stringLen1.substr(0,1));						
							$(".fastExch").show();
							$(".sbway_transfer").show();		
							$(".fastExch2").hide();
						
						}
						//환승정보가 2개 이상일 때
						else if(exLen>1){
							//$(".append").remove();
							var children=$(".detail_list").children("li");
							children.hide();
												
							var child=$(".exchangeBox").children("li");
							child.hide();
							
							var child2=$(".detail_list_between").children("li");
							child2.hide();
							
							if($(".pathDiv.all").is(":visible")){
							//첫번째 환승
							AppendExchange(0);
							
							$(".sbway_stn.exch.append"+0).html(exchange.exChangeInfo[0].exName);
							$(".fastTrain.first.append"+0).html(exchange.exChangeInfo[0].fastTrain);
							$(".fastDoor.first.append"+0).html(exchange.exChangeInfo[0].fastDoor);
							$(".exWalkTime.append"+0).html(Math.round((exchange.exChangeInfo[0].exWalkTime)/60));		
								
								var stringLen1=exchange.exChangeInfo[0].laneName.slice(-3);

							$(".ex_line.append"+0).html(stringLen1.substr(0,1));						
							$(".fastExch.append"+0).show();
							$(".sbway_transfer.append"+0).show();
													
							$(".fastExch2.append"+0).show();
							
							var children2=$(".exchangeBox2").children("li");
							children2.hide();
							
							//n번째 환승역 for문
							for(i=1; i<exLen; i++){
								//환승역이후 자세히보기
								for(count;count<indexes[i];count++){	
									AppendBetween(count, firstLine);
									$(".sbway_detail_btw"+count).html(stationinfo.stations[count].startName);
									$(".sbway_detail_line_btw"+count).html(firstLine.substr(0,1));	
								
								}
								count++;
								
								AppendExchBetween(i);
								$(".sbway_stn_btw"+i).html(exchange.exChangeInfo[i].exName);
								$(".fastTrain2_btw"+i).html(exchange.exChangeInfo[i].fastTrain);
								$(".fastDoor3_btw"+i).html(exchange.exChangeInfo[i].fastDoor);
								$(".exWalkTime_btw"+i).html(Math.round((exchange.exChangeInfo[i].exWalkTime)/60));
								
									var stringLen1=exchange.exChangeInfo[i].laneName.slice(-3);

								$(".ex_line_btw"+i).html(stringLen1.substr(0,1));						
								
								}
							}
							else{
								for(i=0; i<exLen; i++){
									AppendExchange(i);
									
									$(".sbway_stn.exch.append"+i).html(exchange.exChangeInfo[i].exName);
									$(".fastTrain.first.append"+i).html(exchange.exChangeInfo[i].fastTrain);
									$(".fastDoor.first.append"+i).html(exchange.exChangeInfo[i].fastDoor);
									$(".exWalkTime.append"+i).html(Math.round((exchange.exChangeInfo[i].exWalkTime)/60));
																											
									
										var stringLen1=exchange.exChangeInfo[i].laneName.slice(-3);

									$(".ex_line.append"+i).html(stringLen1.substr(0,1));						
									$(".fastExch.append"+i).show();
									$(".sbway_transfer.append"+i).show();
															
									$(".fastExch2.append"+i).show();
								}
							}
						}
						
						var child=$(".detail_list_after").children("li");
						child.hide();		
					
						for(count;count<stationinfo.stations.length;count++){

						AppendDetailAfter(count, stringLen);	
						
							$(".sbway_stn_after"+count).html(stationinfo.stations[count].startName);
							$(".sbway_stn_after_line"+count).html(stringLen.substr(0,1));
						
						}
						count=1;
					}
						//환승정보가 존재하지 않을 때
					else{
						
						$(".append").remove();						
						var child=$(".detail_list").children("li");
							child.hide();
							
						for(i=1; i<stationinfo.stations.length;i++){
							
							AppendDetail(i, firstLine);
							

							$(".sbway_stn.detail"+i).html(stationinfo.stations[i].startName);
							$(".sbway_stn.detail_line"+i).html(firstLine.substr(0,1));
						
						}
						
										
						$(".fastExch").hide();
						$(".sbway_transfer").hide();
	
					}
					console.log(data);
					
					//도착역 정보
					$(".sbway_stn.arrival").html(info.globalEndName);
					$(".arrival_line").html(stringLen.substr(0,1));
					
					//line 그림 바꾸기
					var line= firstLine.substr(0,1); //출발역 호선
					var line3=stringLen.substr(0,1);
					
					$(".sbway_line_wrap_stn_arrival").children('span').remove();
					$(".sbway_line_wrap_stn_arrival").append("<span class='sbway_line_img"+stringLen.substr(0,1)+" arrival'></span>");					
					
					
					$("#myPath").on("click", "a", function(e) {
						var station=$(this).html();
						 moveToStation(station);						 
					});
					
					$("#startLine").attr("src", "./resources/icons/linenumber/line"+firstLine.substr(0,1)+".jpg");
					$("#endLine").attr("src", "./resources/icons/linenumber/line"+stringLen.substr(0,1)+".jpg");
					
										
					
				},
				error:function(){
					alert("FAIL!!!!!");
				}
			});
		
	}

	//환승 HTML 추가
	function AppendExchange(i){
		$(".exchangeBox").append("<div class='append'><li class='sbway_transfer'>" +
				"<span class='sbway_line_wrap'>" +
				"<span class='sbway_line_img_transfer'></span>" +
				"</span>" +
				"<dl class='sbway_dl_list' id='list_exchange'>" +
				"<dt class='sbway_time' id='departure_time'>" +
					"15:00" +
				"</dt>" +
				"<dd>" +
					"<a href='#' class='sbway_stn exch append"+i+"' id='exchange_stn2'>땡땡</a>역(" +
					"<a class='ex_line append"+i+"' id='ex_line2'>0</a>호선)" +
				"</dd>" +
				"<dd class='departure_info'>" +
					"도보<a class='exWalkTime append"+i+"' id='exWalkTime1'>1</a>분<br>" +
					"<p class='fastExch2 append"+i+"' id='fastExch2'>빠른 환승" +
					"<a class='fastTrain2 append"+i+"' id='fastTrain2'>5</a>-<a class='fastDoor2 append"+i+"' id='fastDoor2'>1</a>번 문</p>" +
				"</dd>" +
				"</dl>" +
			"</li></div>");
		}
	
	//자세히보기 HTML 추가
	function AppendDetail(i, first){
		console.log(first+" :first");
		$(".detail_list").append("<div class='append'><li class='sbway_departure'>" +
				"<span class='sbway_line_wrap'>" +
				"<span class='sbway_line_img"+first.substr(0, 1)+"'></span>" +
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
	
	//환승 1개이상일 때 자세히 보기 HTML 추가
	function AppendDetailAfter(i, first){
		$(".detail_list_after").append("<div class='append'><li class='sbway_departure_after'>" +
				"<span class='sbway_line_wrap'>" +
				"<span class='sbway_line_img"+first.substr(0, 1)+"'></span>" +
				"</span>" +
					"<dl class='sbway_dl_list' id='list_departure'>" +
					"<dt class='sbway_time' id='departure_time'>" +
					"15:17" +
				"</dt>" +
				"<dd>" +
					"<a href='#' class='sbway_stn_after"+i+"' id='detail_stn_after'>땡땡</a>역(" +
					"<a class='sbway_stn_after_line"+i+"' id='detail_line_after'>0</a>호선)" +
				"</dd>" +
				"</dl>" +
				"</li></div>"	);
	
	}
	
	//환승역 사이에 자세히 보기 HTML 추가
	function AppendBetween(i, first){
		$(".detail_list_between").append("<div class='append'><li class='sbway_departure_btw'>" +
				"<span class='sbway_line_wrap'>" +
				"<span class='sbway_line_img"+first.substr(0, 1)+"'></span>" +
				"</span>" +
					"<dl class='sbway_dl_list' id='list_departure'>" +
					"<dt class='sbway_time' id='departure_time'>" +
					"15:17" +
				"</dt>" +
				"<dd>" +
					"<a href='#' class='sbway_detail_btw"+i+"' id='detail_stn_btw'>땡땡</a>역" +
					"(<a class='sbway_detail_line_btw"+i+"' id='detail_line_btw'>0</a>호선)" +
				"</dd>" +
				"</dl>" +
				"</li>" +
				"</div>");
	}
	
	//환승역 2개일때 환승역 HTML 추가
	function AppendExchBetween(i){
		$(".exchangeBox2").append("<div class='append'><li class='sbway_transfer_btw'>" +
				"<span class='sbway_line_wrap'>" +
				"<span class='sbway_line_img_transfer'></span>" +
				"</span>" +
					"<dl class='sbway_dl_list' id='list_exchange'>" +
					"<dt class='sbway_time' id='departure_time3'>" +
					"15:00" +
				"</dt>" +
				"<dd>" +
					"<a href='#' class='sbway_stn_btw"+i+"' id='exchange_stn4'>땡땡</a>역(<a class='ex_line_btw"+i+"' id='ex_line4'>0</a>호선)" +
				"</dd>" +
				"<dd class='departure_info'>" +
					"도보<a class='exWalkTime_btw"+i+"' id='exWalkTime4'>0</a>분<br>" +
					"<p class='fastExch2"+i+"' id='fastExch4'>빠른 환승" +
					"<a class='fastTrain2_btw"+i+"' id='fastTrain4'>0</a>-<a class='fastDoor3_btw"+i+"' id='fastDoor4'>0</a>번 문</p>" +
				"</dd>" +
				"</dl>" +
				"</li>" +
				"</div>");
	}
	
	function moveToStation(station){
		$.ajax({
			url:'./findStnCoords.sub',
			data:{station: station},
			dataType:'json',
			type:'POST',
			success : function(data) {
				map.setCenter({
					lat: data[0].xpoint,
					lng: data[0].ypoint
				});
				map.setZoom(19);
			},
			error:function(){
				alert("FAIL!!!!");
				
			}
		});
	}

	
	function getCode(firstStn, lastStn, min){
		var fcode=firstStn.substring(0, firstStn.length- 1);		
		var tcode=lastStn.substring(0, lastStn.length- 1);
		
		$.ajax({
			url:'./findStnCode.sub',
			data:{from: fcode, to: tcode},
			dataType:'json',
			type:'POST',
			success : function(data) {
				getData(data.FCODE, data.TCODE, min);				
				var fxpoint=data.FXPOINT;
				var fypoint=data.FYPOINT;
				var txpoint=data.TXPOINT;
				var typoint=data.TYPOINT;
								
				createMarkers(fxpoint, fypoint, txpoint, typoint, fcode, tcode);
				
				
			},
			error:function(){
				alert("FAIL!!!!");
				
			}
			
		
		});
	}
	
	function createMarkers(fxpoint, fypoint, txpoint, typoint, fname, tname){
		var len = markerList.length;
		   for(i=0;i<len;i++){
			   markerList[i].setMap(null);
		   }
		   markerList = [];

		var marker1 = new google.maps.Marker({   
            position: new google.maps.LatLng(fxpoint, fypoint),
            icon: './resources/icons/category/pub_list_icon.png',
            map: map,
            clickable: true, draggable: false,
            title: fname+'역'
           });
		
		var marker2 = new google.maps.Marker({   
            position: new google.maps.LatLng(txpoint, typoint),
            icon: './resources/icons/category/hotel_list_icon.png',
            map: map,
            clickable: true, draggable: false,
            title: tname+'역'
           });
	}
