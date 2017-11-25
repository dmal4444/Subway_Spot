<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="../resources/detail/bus.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
var to=${to};
	$.ajax({
		url:"https://api.odsay.com/api/subwayStationInfo",
		data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&stationID='+to,
		dataType:'json',
		type:'POST',
		success:function(data){
			console.log(data);
			var exit = [];
			var info1 = [];
			var i = 0;
			var e = 0;
			exit=data.result.exitInfo.gate;
			
			for(i; i<exit.length; i++){
				//$(".exit").append("<tr><td><span>"+data.result.exitInfo.gate[i].gateNo+"</span>&nbsp;번 출구</td></tr>");		
				$(".exit").append("<tr><td><span>"+data.result.exitInfo.gate[i].gateNo+"<span>&nbsp;번 출구</td></tr>");
				info1 = data.result.exitInfo.gate[i].gateLink;
				$(".info").append("<tr><td>");
				for(e; e<info1.length; e++){
					$(".info").append(data.result.exitInfo.gate[i].gateLink[e]+"&nbsp;&nbsp;&nbsp;");
					
				}
				e=0;
				$(".info").append("</td></tr>");
			}
		},
		error : function(){
			alert("???");
		}
	});
</script>

<body>
<!--타이틀-->
<div class="subway_detail">
	<div class="Title">
			<a href="#" target="_balnk">구일</a>
			<img src="../images/sway-Title.png" alt="subway_title">
			<a href="#" target="_balnk">일산</a>
		<div class="local_tab">
			<img src="../images/local_tab.png">	
		</div>
		<div class="bus_bt">
			<img src="../images/bus_button.png" alt="bus_bt">
		</div>
		<div class="time_bt">
			<img src="../images/time_button.png" alt="time_bt">
		</div>  
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
<div class="article">
	<div class="section_sway_time_tb">
		<div class="article">
	
			<div class="section_sway_exitbus_tb">
				<table cellspacing="0" cellpadding="0" class="tbs3">
					<tbody>
						<tr>
							<td class="exit"></td>
							<td class="info"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>