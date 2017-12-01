<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/detail/time.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	#exitinfo td{
		min-width:100px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	var good = ${code};
			// 이전, 이후 역 (ajax)
			$.ajax({
				url:"https://api.odsay.com/api/subwayStationInfo",
				data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&stationID='+good,
				dataType:'json',
				type:'POST',
				success:function(data){
			if(data.result.nextOBJ.station == null){
					var pre = [];
					var precode = [];
					var station;
					var stationcode;
					pre=data.result.prevOBJ.station[0].stationName;
					precode=data.result.prevOBJ.station[0].stationID;
					station=data.result.stationName;
					stationcode=data.result.stationID;
					$(".previous").html(pre);
					$("#preinfo").val(precode);
					$(".station").html(station);
					$("#good").val(good);
				}
				else if(data.result.prevOBJ.station == null){
					var next = [];
					var nextcode = [];
					var station;
					var stationcode;
					next=data.result.nextOBJ.station[0].stationName;
					nextcode=data.result.nextOBJ.station[0].stationID;
					station=data.result.stationName;
					stationcode=data.result.stationID;
					$(".next").html(next);
					$("#nextinfo").val(nextcode);
					$(".station").html(station);
					$("#good").val(good);
				}
				else{
					var pre = [];
					var precode = [];
					var next = [];
					var nextcode = [];
					var station;
					var stationcode;
					pre=data.result.prevOBJ.station[0].stationName;
					precode=data.result.prevOBJ.station[0].stationID;
					next=data.result.nextOBJ.station[0].stationName;
					nextcode=data.result.nextOBJ.station[0].stationID;
					station=data.result.stationName;
					stationcode=data.result.stationID;
					$(".previous").html(pre);
					$("#preinfo").val(precode);
					$(".next").html(next);
					$("#nextinfo").val(nextcode);
					$(".station").html(station);
					$("#good").val(good);
				}
			
			
			// 시간 정보(ajax)
			$.ajax({
				url:"https://api.odsay.com/api/subwayTimeTable",
				data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&stationID='+good,
				dataType:'json',
				type:'POST',
				success:function(data){
					$(".time1").find("tr").remove();
					$(".minute1_1").find("tr").remove();
					$(".minute1_2").find("tr").remove();
					var str = [];
					var str1 = [];
					var stime = [];
					var uptime = [];
					var downtime = []; 
					
					//하행이 존재하지 않을 때
					if(data.result.OrdList.down == null){
							for(var i=0; i < data.result.OrdList.up.time.length; i++){
								stime[i]=data.result.OrdList.up.time[i];
								uptime[i]=data.result.OrdList.up.time[i];
								
							}
						}
						
					//상행이 존재하지 않을 때
					else if(data.result.OrdList.up == null){
							for(var i=0; i < data.result.OrdList.down.time.length; i++){
								stime[i]=data.result.OrdList.down.time[i];
								downtime[i]=data.result.OrdList.down.time[i];
							}
						}
					
					//하행 & 상행이 존재할 때 
					else if(data.result.OrdList.down != null && data.result.OrdList.up != null){
						for(var i=0; i < data.result.OrdList.down.time.length; i++){
							downtime[i]=data.result.OrdList.down.time[i];
						}
						for(var i=0; i < data.result.OrdList.up.time.length; i++){
							uptime[i]=data.result.OrdList.up.time[i];
						}
						
						if(uptime >= downtime){
							stime=uptime;
						}
						else {
							stime=downtime;
						}
					}
					
					// 하행이 있을때만
					if(data.result.OrdList.down != null){
						str=data.result.OrdList.down.time;
					}
					
					// 상행이 있을때만 
					if(data.result.OrdList.up != null) {
						str1=data.result.OrdList.up.time;
					}

					// 하행 시간이 적을떄
					if(stime > downtime){
						for(var i=0; i < downtime.length; i++){
								if(str != 0){
									$(".minute1_2").append("<tr><td>"+str[i].list+"</td></tr>");
								}
						}
						for(var i=0; i < uptime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");

							if(str1 != 0){
								$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
							}
						}
					}
					
					// 상행 시간이 적을떄
					else if(stime > uptime){
						for(var i=0; i < downtime.length; i++){
							$(".time1").append("<tr><td>"+downtime[i].Idx+"</td></tr>");
								if(str != 0){
									$(".minute1_2").append("<tr><td>"+downtime[i].list+"</td></tr>");
								}
						}
						for(var i=0; i < uptime.length; i++){
							if(str1 != 0){
								$(".minute1_1").append("<tr><td>"+uptime[i].list+"</td></tr>");
							}
						}
					}
					
					else if(stime == uptime){
						for(var i=0; i < stime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
								if(str != 0){
									$(".minute1_2").append("<tr><td>"+str[i].list+"</td></tr>");
								}
						}
						for(var i=0; i < stime.length; i++){
							if(str1 != 0){
								$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
							}
						}
					}
					
					else if(downtime == null){
						for(var i=0; i < stime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
							$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
						}
					}
					
					else if(uptime == null){
						for(var i=0; i < stime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
							$(".minute1_2").append("<tr><td>"+str0[i].list+"</td></tr>");
						}
					}

				},
				error : function(){
					alert("???");
				}
		});// 시간정보 끝
			
		}, // 역정보 끝
		error : function(){
			alert("???");
		}
	});
		
			
	
	$(document).ready(function(){
		// 출구 정보(클릭)
		
		$("a.exitp").click(function(event){
			event.preventDefault();
			
			location.href="../Detail/exitp.sub?code="+good;
		});
		
		// 이전 정보
		$("a.previous").click(function(event){
			event.preventDefault();
			var preinfo = $("#preinfo").val();
			$("#good").val(preinfo);
			good = $("#good").val();
			$.ajax({
				url:"https://api.odsay.com/api/subwayStationInfo",
				data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&stationID='+preinfo,
				dataType:'json',
				type:'POST',
				success:function(data){
					if(data.result.prevOBJ.station == null){
						$(".previous").text("");
						var next = [];
						var nextcode = [];
						var station;
						var stationcode;
						next=data.result.nextOBJ.station[0].stationName;
						nextcode=data.result.nextOBJ.station[0].stationID;
						station=data.result.stationName;
						stationcode=data.result.stationID;
						$(".next").html(next);
						$("#nextinfo").val(nextcode);
						$(".station").html(station);
					}
					else{	
					var pre = [];
					var precode = [];
					var next = [];
					var nextcode = [];
					var station;
					var stationcode;
					pre=data.result.prevOBJ.station[0].stationName;
					precode=data.result.prevOBJ.station[0].stationID;
					next=data.result.nextOBJ.station[0].stationName;
					nextcode=data.result.nextOBJ.station[0].stationID;
					station=data.result.stationName;	
					$(".previous").html(pre);
					$("#preinfo").val(precode);
					$(".next").html(next);
					$("#nextinfo").val(nextcode);
					$(".station").html(station);
					}
					
					// 시간정보
					$.ajax({
						url:"https://api.odsay.com/api/subwayTimeTable",
						data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&stationID='+good,
						dataType:'json',
						type:'POST',
						success:function(data){
							$(".time1").find("tr").remove();	
							$(".minute1_1").find("tr").remove();
							$(".minute1_2").find("tr").remove();
							var str = [];
							var str1 = [];
							var stime = [];
							var uptime = [];
							var downtime = []; 
							
							//하행이 존재하지 않을 때
							if(data.result.OrdList.down == null){
									for(var i=0; i < data.result.OrdList.up.time.length; i++){
										stime[i]=data.result.OrdList.up.time[i];
										uptime[i]=data.result.OrdList.up.time[i];
										
									}
								}
								
							//상행이 존재하지 않을 때
							else if(data.result.OrdList.up == null){
									for(var i=0; i < data.result.OrdList.down.time.length; i++){
										stime[i]=data.result.OrdList.down.time[i];
										downtime[i]=data.result.OrdList.down.time[i];
									}
								}
							
							//하행 & 상행이 존재할 때 
							else if(data.result.OrdList.down != null && data.result.OrdList.up != null){
								for(var i=0; i < data.result.OrdList.down.time.length; i++){
									downtime[i]=data.result.OrdList.down.time[i];
								}
								for(var i=0; i < data.result.OrdList.up.time.length; i++){
									uptime[i]=data.result.OrdList.up.time[i];
								}
								
								if(uptime >= downtime){
									stime=uptime;
								}
								else {
									stime=downtime;
								}
							}
							
							// 하행이 있을때만
							if(data.result.OrdList.down != null){
								str=data.result.OrdList.down.time;
							}
							
							// 상행이 있을때만 
							if(data.result.OrdList.up != null) {
								str1=data.result.OrdList.up.time;
							}

							// 하행 시간이 적을떄
							if(stime > downtime){
								for(var i=0; i < downtime.length; i++){
										if(str != 0){
											$(".minute1_2").append("<tr><td>"+str[i].list+"</td></tr>");
										}
								}
								for(var i=0; i < uptime.length; i++){
									$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");

									if(str1 != 0){
										$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
									}
								}
							}
							
							// 상행 시간이 적을떄
							else if(stime > uptime){
								for(var i=0; i < downtime.length; i++){
									$(".time1").append("<tr><td>"+downtime[i].Idx+"</td></tr>");
										if(str != 0){
											$(".minute1_2").append("<tr><td>"+downtime[i].list+"</td></tr>");
										}
								}
								for(var i=0; i < uptime.length; i++){
									if(str1 != 0){
										$(".minute1_1").append("<tr><td>"+uptime[i].list+"</td></tr>");
									}
								}
							}
							
							else if(stime == uptime){
								for(var i=0; i < stime.length; i++){
									$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
										if(str != 0){
											$(".minute1_2").append("<tr><td>"+str[i].list+"</td></tr>");
										}
								}
								for(var i=0; i < stime.length; i++){
									if(str1 != 0){
										$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
									}
								}
							}
							
							else if(downtime == null){
								for(var i=0; i < stime.length; i++){
									$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
									$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
								}
							}
							
							else if(uptime == null){
								for(var i=0; i < stime.length; i++){
									$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
									$(".minute1_2").append("<tr><td>"+str0[i].list+"</td></tr>");
								}
							}
							},
							error : function(){
								alert("???");
							}
						}); // 시간정보 끝
						
				}, erroe : function() {
					alert("에러");
				}
			});// 역정보 끝
		
		}); // prev 클릭이벤트
			
		
		// 다음역 정보
		$("a.next").click(function(event){
			event.preventDefault();
			var nextinfo = $("#nextinfo").val();
			$("#good").val(nextinfo);
			good = $("#good").val();
			$.ajax({
				url:"https://api.odsay.com/api/subwayStationInfo",
				data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&stationID='+nextinfo,
				dataType:'json',
				type:'POST',
				success:function(data){
					if(data.result.nextOBJ.station == null){
						$(".next").text("");
						var pre = [];
						var precode = [];
						var station;
						var stationcode;
						pre=data.result.prevOBJ.station[0].stationName;
						precode=data.result.prevOBJ.station[0].stationID;
						station=data.result.stationName;
						stationcode=data.result.stationID;
						$(".previous").html(pre);
						$("#preinfo").val(precode);
						$(".station").html(station);
					}
					else{
					var pre = [];
					var precode = [];
					var next = [];
					var nextcode = [];
					var station;
					var stationcode;
					pre=data.result.prevOBJ.station[0].stationName;
					precode=data.result.prevOBJ.station[0].stationID;
					next=data.result.nextOBJ.station[0].stationName;
					nextcode=data.result.nextOBJ.station[0].stationID;
					station=data.result.stationName;
					stationcode=data.result.stationID;
					$(".previous").html(pre);
					$("#preinfo").val(precode);
					$(".next").html(next);
					$("#nextinfo").val(nextcode);
					$(".station").html(station);
					}	
					// 시간정보
					$.ajax({
						url:"https://api.odsay.com/api/subwayTimeTable",
						data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&stationID='+good,
						dataType:'json',
						type:'POST',
						success:function(data){
							$(".time1").find("tr").remove();
							$(".minute1_1").find("tr").remove();
							$(".minute1_2").find("tr").remove();
							var str = [];
							var str1 = [];
							var stime = [];
							var uptime = [];
							var downtime = []; 
							
							//하행이 존재하지 않을 때
							if(data.result.OrdList.down == null){
									for(var i=0; i < data.result.OrdList.up.time.length; i++){
										stime[i]=data.result.OrdList.up.time[i];
										uptime[i]=data.result.OrdList.up.time[i];
										
									}
								}
								
							//상행이 존재하지 않을 때
							else if(data.result.OrdList.up == null){
									for(var i=0; i < data.result.OrdList.down.time.length; i++){
										stime[i]=data.result.OrdList.down.time[i];
										downtime[i]=data.result.OrdList.down.time[i];
									}
								}
							
							//하행 & 상행이 존재할 때 
							else if(data.result.OrdList.down != null && data.result.OrdList.up != null){
								for(var i=0; i < data.result.OrdList.down.time.length; i++){
									downtime[i]=data.result.OrdList.down.time[i];
								}
								for(var i=0; i < data.result.OrdList.up.time.length; i++){
									uptime[i]=data.result.OrdList.up.time[i];
								}
								
								if(uptime >= downtime){
									stime=uptime;
								}
								else {
									stime=downtime;
								}
							}
							
							// 하행이 있을때만
							if(data.result.OrdList.down != null){
								str=data.result.OrdList.down.time;
							}
							
							// 상행이 있을때만 
							if(data.result.OrdList.up != null) {
								str1=data.result.OrdList.up.time;
							}

							// 하행 시간이 적을떄
							if(stime > downtime){
								for(var i=0; i < downtime.length; i++){
										if(str != 0){
											$(".minute1_2").append("<tr><td>"+str[i].list+"</td></tr>");
										}
								}
								for(var i=0; i < uptime.length; i++){
									$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");

									if(str1 != 0){
										$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
									}
								}
							}
							
							// 상행 시간이 적을떄
							else if(stime > uptime){
								for(var i=0; i < downtime.length; i++){
									$(".time1").append("<tr><td>"+downtime[i].Idx+"</td></tr>");
										if(str != 0){
											$(".minute1_2").append("<tr><td>"+downtime[i].list+"</td></tr>");
										}
								}
								for(var i=0; i < uptime.length; i++){
									if(str1 != 0){
										$(".minute1_1").append("<tr><td>"+uptime[i].list+"</td></tr>");
									}
								}
							}
							
							else if(stime == uptime){
								for(var i=0; i < stime.length; i++){
									$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
										if(str != 0){
											$(".minute1_2").append("<tr><td>"+str[i].list+"</td></tr>");
										}
								}
								for(var i=0; i < stime.length; i++){
									if(str1 != 0){
										$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
									}
								}
							}
							
							else if(downtime == null){
								for(var i=0; i < stime.length; i++){
									$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
									$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
								}
							}
							
							else if(uptime == null){
								for(var i=0; i < stime.length; i++){
									$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
									$(".minute1_2").append("<tr><td>"+str0[i].list+"</td></tr>");
								}
							}
						},
						error : function(){
							alert("시간정보 에러");
						}
				}); // 시간정보 끝
					
				}, error : function() {
					alert("역정보 에러");
				}
			}); // next ajax 끝
		}); // 다음클릭 이벤트 끝
		
		// 평일 시간
		$("#Ord").change(function(){
			var good = $("#good").val();
			$.ajax({
				url:"https://api.odsay.com/api/subwayTimeTable",
				data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&stationID='+good,
				dataType:'json',
				type:'POST',
				success:function(data){
					$(".time1").find("tr").remove();
					$(".minute1_1").find("tr").remove();
					$(".minute1_2").find("tr").remove();
					var str = [];
					var str1 = [];
					var stime = [];
					var uptime = [];
					var downtime = []; 
					
					//하행이 존재하지 않을 때
					if(data.result.OrdList.down == null){
							for(var i=0; i < data.result.OrdList.up.time.length; i++){
								stime[i]=data.result.OrdList.up.time[i];
								uptime[i]=data.result.OrdList.up.time[i];
								
							}
						}
						
					//상행이 존재하지 않을 때
					else if(data.result.OrdList.up == null){
							for(var i=0; i < data.result.OrdList.down.time.length; i++){
								stime[i]=data.result.OrdList.down.time[i];
								downtime[i]=data.result.OrdList.down.time[i];
							}
						}
					
					//하행 & 상행이 존재할 때 
					else if(data.result.OrdList.down != null && data.result.OrdList.up != null){
						for(var i=0; i < data.result.OrdList.down.time.length; i++){
							downtime[i]=data.result.OrdList.down.time[i];
						}
						for(var i=0; i < data.result.OrdList.up.time.length; i++){
							uptime[i]=data.result.OrdList.up.time[i];
						}
						
						if(uptime >= downtime){
							stime=uptime;
						}
						else {
							stime=downtime;
						}
					}
					
					// 하행이 있을때만
					if(data.result.OrdList.down != null){
						str=data.result.OrdList.down.time;
					}
					
					// 상행이 있을때만 
					if(data.result.OrdList.up != null) {
						str1=data.result.OrdList.up.time;
					}

					// 하행 시간이 적을떄
					if(stime > downtime){
						for(var i=0; i < downtime.length; i++){
								if(str != 0){
									$(".minute1_2").append("<tr><td>"+str[i].list+"</td></tr>");
								}
						}
						for(var i=0; i < uptime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");

							if(str1 != 0){
								$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
							}
						}
					}
					
					// 상행 시간이 적을떄
					else if(stime > uptime){
						for(var i=0; i < downtime.length; i++){
							$(".time1").append("<tr><td>"+downtime[i].Idx+"</td></tr>");
								if(str != 0){
									$(".minute1_2").append("<tr><td>"+downtime[i].list+"</td></tr>");
								}
						}
						for(var i=0; i < uptime.length; i++){
							if(str1 != 0){
								$(".minute1_1").append("<tr><td>"+uptime[i].list+"</td></tr>");
							}
						}
					}
					
					else if(stime == uptime){
						for(var i=0; i < stime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
								if(str != 0){
									$(".minute1_2").append("<tr><td>"+str[i].list+"</td></tr>");
								}
						}
						for(var i=0; i < stime.length; i++){
							if(str1 != 0){
								$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
							}
						}
					}
					
					else if(downtime == null){
						for(var i=0; i < stime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
							$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
						}
					}
					
					else if(uptime == null){
						for(var i=0; i < stime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
							$(".minute1_2").append("<tr><td>"+str0[i].list+"</td></tr>");
						}
					}
				},
				error : function(){
					alert("???");
				}
		});
	
	});

		
		// 토요일 시간
		$("#Sat").change(function(){
			var good = $("#good").val();
			$.ajax({
				url:"https://api.odsay.com/api/subwayTimeTable",
				data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&stationID='+good,
				dataType:'json',
				type:'POST',
				success:function(data){
					$(".time1").find("tr").remove();
					$(".minute1_1").find("tr").remove();
					$(".minute1_2").find("tr").remove();
					var str = [];
					var str1 = [];
					var stime = [];
					var uptime = [];
					var downtime = []; 
					
					//하행이 존재하지 않을 때
					if(data.result.SatList.down == null){
							for(var i=0; i < data.result.SatList.up.time.length; i++){
								stime[i]=data.result.SatList.up.time[i];
								uptime[i]=data.result.SatList.up.time[i];
								
							}
						}
						
					//상행이 존재하지 않을 때
					else if(data.result.SatList.up == null){
							for(var i=0; i < data.result.SatList.down.time.length; i++){
								stime[i]=data.result.SatList.down.time[i];
								downtime[i]=data.result.SatList.down.time[i];
							}
						}
					
					//하행 & 상행이 존재할 때 
					else if(data.result.SatList.down != null && data.result.SatList.up != null){
						for(var i=0; i < data.result.SatList.down.time.length; i++){
							downtime[i]=data.result.SatList.down.time[i];
						}
						for(var i=0; i < data.result.SatList.up.time.length; i++){
							uptime[i]=data.result.SatList.up.time[i];
						}
						
						if(uptime >= downtime){
							stime=uptime;
						}
						else {
							stime=downtime;
						}
					}
					
					// 하행이 있을때만
					if(data.result.SatList.down != null){
						str=data.result.SatList.down.time;
					}
					
					// 상행이 있을때만 
					if(data.result.SatList.up != null) {
						str1=data.result.SatList.up.time;
					}

					// 하행 시간이 적을떄
					if(stime > downtime){
						for(var i=0; i < downtime.length; i++){
								if(str != 0){
									$(".minute1_2").append("<tr><td>"+str[i].list+"</td></tr>");
								}
						}
						for(var i=0; i < uptime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");

							if(str1 != 0){
								$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
							}
						}
					}
					
					// 상행 시간이 적을떄
					else if(stime > uptime){
						for(var i=0; i < downtime.length; i++){
							$(".time1").append("<tr><td>"+downtime[i].Idx+"</td></tr>");
								if(str != 0){
									$(".minute1_2").append("<tr><td>"+downtime[i].list+"</td></tr>");
								}
						}
						for(var i=0; i < uptime.length; i++){
							if(str1 != 0){
								$(".minute1_1").append("<tr><td>"+uptime[i].list+"</td></tr>");
							}
						}
					}
					
					else if(stime == uptime){
						for(var i=0; i < stime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
								if(str != 0){
									$(".minute1_2").append("<tr><td>"+str[i].list+"</td></tr>");
								}
						}
						for(var i=0; i < stime.length; i++){
							if(str1 != 0){
								$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
							}
						}
					}
					
					else if(downtime == null){
						for(var i=0; i < stime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
							$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
						}
					}
					
					else if(uptime == null){
						for(var i=0; i < stime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
							$(".minute1_2").append("<tr><td>"+str0[i].list+"</td></tr>");
						}
					}
				},
				error : function(){
					alert("???");
				}
		});
		});
	
		
		// 일요일 시간
		$("#Sun").change(function(){
			var good = $("#good").val();
			$.ajax({
				url:"https://api.odsay.com/api/subwayTimeTable",
				data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&stationID='+good,
				dataType:'json',
				type:'POST',
				success:function(data){
					$(".time1").find("tr").remove();
					$(".minute1_1").find("tr").remove();
					$(".minute1_2").find("tr").remove();
					var str = [];
					var str1 = [];
					var stime = [];
					var uptime = [];
					var downtime = []; 
					
					//하행이 존재하지 않을 때
					if(data.result.SunList.down == null){
							for(var i=0; i < data.result.SunList.up.time.length; i++){
								stime[i]=data.result.SunList.up.time[i];
								uptime[i]=data.result.SunList.up.time[i];
								
							}
						}
						
					//상행이 존재하지 않을 때
					else if(data.result.SunList.up == null){
							for(var i=0; i < data.result.SunList.down.time.length; i++){
								stime[i]=data.result.SunList.down.time[i];
								downtime[i]=data.result.SunList.down.time[i];
							}
						}
					
					//하행 & 상행이 존재할 때 
					else if(data.result.SunList.down != null && data.result.SunList.up != null){
						for(var i=0; i < data.result.SunList.down.time.length; i++){
							downtime[i]=data.result.SunList.down.time[i];
						}
						for(var i=0; i < data.result.SunList.up.time.length; i++){
							uptime[i]=data.result.SunList.up.time[i];
						}
						
						if(uptime >= downtime){
							stime=uptime;
						}
						else {
							stime=downtime;
						}
					}
					
					// 하행이 있을때만
					if(data.result.SunList.down != null){
						str=data.result.SunList.down.time;
					}
					
					// 상행이 있을때만 
					if(data.result.SunList.up != null) {
						str1=data.result.SunList.up.time;
					}

					// 하행 시간이 적을떄
					if(stime > downtime){
						for(var i=0; i < downtime.length; i++){
								if(str != 0){
									$(".minute1_2").append("<tr><td>"+str[i].list+"</td></tr>");
								}
						}
						for(var i=0; i < uptime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");

							if(str1 != 0){
								$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
							}
						}
					}
					
					// 상행 시간이 적을떄
					else if(stime > uptime){
						for(var i=0; i < downtime.length; i++){
							$(".time1").append("<tr><td>"+downtime[i].Idx+"</td></tr>");
								if(str != 0){
									$(".minute1_2").append("<tr><td>"+downtime[i].list+"</td></tr>");
								}
						}
						for(var i=0; i < uptime.length; i++){
							if(str1 != 0){
								$(".minute1_1").append("<tr><td>"+uptime[i].list+"</td></tr>");
							}
						}
					}
					
					else if(stime == uptime){
						for(var i=0; i < stime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
								if(str != 0){
									$(".minute1_2").append("<tr><td>"+str[i].list+"</td></tr>");
								}
						}
						for(var i=0; i < stime.length; i++){
							if(str1 != 0){
								$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
							}
						}
					}
					
					else if(downtime == null){
						for(var i=0; i < stime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
							$(".minute1_1").append("<tr><td>"+str1[i].list+"</td></tr>");
						}
					}
					
					else if(uptime == null){
						for(var i=0; i < stime.length; i++){
							$(".time1").append("<tr><td>"+stime[i].Idx+"</td></tr>");
							$(".minute1_2").append("<tr><td>"+str0[i].list+"</td></tr>");
						}
					}
				},
				error : function(){
					alert("???");
				}
		});
	
	});
});
</script>





<body>
<!--타이틀-->
<div class="subway_detail">
	<div class="Title">
		<div id="st_container" style="background-image:url('../images/sway-Title1.png');">
		 <table id="test">
		 <tbody id="ttest">				
				<tr id="rtest1">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr id="rtest2">
					<td id="dtest1"></td>
					<td id="dtest2">
						<a href="" class="previous" id="pre"></a>
					</td>
					<td id="dtest3" class="station"></td>
					<td id="dtest4" >
						<a href="" class="next" id="next" style="float:center; right: 260px;"></a>
					</td>
					<td id="dtest5"></td>
				</tr>
				<tr id="rtest3"> 
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>				
			</tbody>
			</table>
			
			<div id="method"></div>
				<div id="content">
				</div>
			</div>		
		</div>
			<table id="tinfo">
				<!-- <tr>
					<td class="te">
						<a href="" class="timep">시간 정보</a>
					</td>
					<td class="te">
						<a href="" class="exitp">출구 정보</a>
					</td>
				</tr> -->
				<tr>
					<td>
						<a href="" class="timep">시간 정보</a>
					</td>
					<td>
						<a href="" class="exitp">출구 정보</a>
					</td>
				</tr>
			</table>
		<div id="map" style="width:1000px;height:400px;"></div>
    		<script>
    		var map;
    		 function initMap() {
     			  map = new google.maps.Map(document.getElementById('map'), {
      			   center: {lat: 37.503076, lng: 126.882084},
        		 zoom: 16
     				  });
    			 }
    		</script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLVQpMRYv7v9vUImMzhCRrcW-MJ3gPJb4&callback=initMap" async defer></script>
		</div>
</div>
<!--//타이틀-->
	
<!--첫차/막차시간 테이블-->
<div class="article" >
	<div class="section_sway_time_tb">
	<form method="POST" id="information" action="">
				<input type="hidden" id="preinfo" name="preinfo">
				<input type="hidden" id="nextinfo" name="nextinfo">
				<input type="hidden" id="good" name="good">
		<table cellspacing="0" cellpadding="0" summary="첫차막차시간표" class="tbs1 tbs2">
			<tbody>
				<tr>
					<th>상행</th>
					<th width="30">시간</th>
					<th>하행</th>
				</tr>
				<dl>
					<dd align="center" colspan="3" border="1">
						<input type="radio" id="Ord" name="Only" checked="checked">평일
						<input type="radio" id="Sat" name="Only">토요일
						<input type="radio" id="Sun" name="Only">일요일				
					</dd>
				</dl>
				<tr id="trid">
					<th class="minute1_1"></th>
					<th class="time1" width="30"></th>
					<th class="minute1_2"></th>
				</tr>
			</tbody>
		</table>
		</form>
	</div>
	</div>
</body>
</html>
