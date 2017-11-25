<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel = "stylesheet" type = "text/css" href = "../resources/detail/subway.css" />

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	var good = ${from};
			$.ajax({
				url:"https://api.odsay.com/api/subwayTimeTable",
				data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&stationID='+good,
				dataType:'json',
				type:'POST',
				success:function(data){
					console.log(data);
					$(".time1").find("tr").remove();
					$(".minute1_1").find("tr").remove();
					$(".minute1_2").find("tr").remove();
					var str = [];
					str=data.result.OrdList.down.time;
					str1=data.result.OrdList.up.time;
					
					$.each(str, function(index, obj) {
						console.log(obj.Idx);
						//$(".time1").append("<tr><td>"+obj.Idx+"</td></tr>");
						$(".time1").append("<tr><td>"+obj.Idx+"</td></tr>");
						$(".minute1_2").append("<tr><td>"+obj.list+"</td></tr>");
					});
					
					$.each(str1, function(index, obj){
						$(".minute1_1").append("<tr><td>"+obj.list+"</td></tr>");
					});
				},
				error : function(){
					alert("???");
				}
		});
	$(document).ready(function(){
		$("#Ord").change(function(){
			$.ajax({
				url:"https://api.odsay.com/api/subwayTimeTable",
				data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&stationID='+good,
				dataType:'json',
				type:'POST',
				success:function(data){
					console.log(data);
					$(".time1").find("tr").remove();
					$(".minute1_1").find("tr").remove();
					$(".minute1_2").find("tr").remove();
					var str = [];
					str=data.result.OrdList.down.time;
					str1=data.result.OrdList.up.time;
					
					$.each(str, function(index, obj) {
						console.log(obj.Idx);
						$(".time1").append("<tr><td>"+obj.Idx+"</td></tr>");
						$(".minute1_2").append("<tr><td>"+obj.list+"</td></tr>");
					});
					
					$.each(str1, function(index, obj){
						$(".minute1_1").append("<tr><td>"+obj.list+"</td></tr>");
					});
				},
				error : function(){
					alert("???");
				}
		});
	
	});

		
		// 토요일
		$("#Sat").change(function(){
			$.ajax({
				url:"https://api.odsay.com/api/subwayTimeTable",
				data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&stationID='+good,
				dataType:'json',
				type:'POST',
				success:function(data){
					$(".time1").find("tr").remove();
					$(".minute1_1").find("tr").remove();
					$(".minute1_2").find("tr").remove();
					console.log(data);
					var str = [];
					str=data.result.SatList.down.time;
					str1=data.result.SatList.up.time;
					
					$.each(str, function(index, obj) {
						console.log(obj.Idx);
						$(".time1").append("<tr><td>"+obj.Idx+"</td></tr>");
						$(".minute1_2").append("<tr><td>"+obj.list+"</td></tr>");
					});
					
					$.each(str1, function(index, obj){
						$(".minute1_1").append("<tr><td>"+obj.list+"</td></tr>");
					});
				},
				error : function(){
					alert("???");
				}
		});
	
	});
		
		// 일요일
		$("#Sun").change(function(){
			$.ajax({
				url:"https://api.odsay.com/api/subwayTimeTable",
				data:'apiKey=EP6opbh6Snt8fsH6J/Gb3dxsmCmTj3APxjd/oTeK8o0&lang=0&stationID='+good,
				dataType:'json',
				type:'POST',
				success:function(data){
					$(".time1").find("tr").remove();
					$(".minute1_1").find("tr").remove();
					$(".minute1_2").find("tr").remove();
					console.log(data);
					var str = [];
					str=data.result.SunList.down.time;
					str1=data.result.SunList.up.time;
					
					$.each(str, function(index, obj) {
						console.log(obj.Idx);
						$(".time1").append("<tr><td>"+obj.Idx+"</td></tr>");
						$(".minute1_2").append("<tr><td>"+obj.list+"</td></tr>");
					});
					
					$.each(str1, function(index, obj){
						$(".minute1_1").append("<tr><td>"+obj.list+"</td></tr>");
					});
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
			<img src="../images/sway-Title.png" alt="subway_title">
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
<div class="article" >
	<div class="section_sway_time_tb">
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
	</div>
	</div>
</div>
</body>
</html>