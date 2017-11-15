<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/detail/bus.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>


<body>
<!--타이틀-->
<div class="subway_detail">
	<div class="Title">
			 <a href="#" target="_balnk">구일</a>
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
<div class="article">
	<div class="section_sway_time_tb">
		<div class="article">
	
	<div class="section_sway_exitbus_tb">
		<table cellspacing="0" cellpadding="0" class="tbs3">
		<caption>출구&middot;연계버스</caption>
		<colgroup>
		<col class="tbs3_col1">
		<col>
		</colgroup>
		<tbody>
			<tr class="tbs3_top">
			<th><span class="sub_exit_n sub_exit_n1">1</span>번 출구</th>
			<td>
					한샘인테리어
			</td>
			</tr>				
				<tr class="last">
				<th>
					<a href="/?enc=b64&busStationId=106027&pinType=site&pinId=13479550&lng=127.02133112&lat=37.5111471" target="_blank" data-nclicks="sei.station">영동시장
						(23-117)
					</a>
				</th>
				<td>
						<ul class="bus_lst">
							<li>
								<dl>
								<dt><span class="spbi spbi_d11">간선</span></dt>
								<dd>
									241
									,
									401
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d12">지선</span></dt>
								<dd>
									3412
									,
									3414
									,
									6411
								</dd>
								</dl>
							</li>
						</ul>
				</td>
				</tr>
			<tr class="tbs3_top">
			<th><span class="sub_exit_n sub_exit_n2">2</span>번 출구</th>
			<td>
					영동시장
					, 
					논현초등학교
					, 
					뤼미에르극장
			</td>
			</tr>
			<tr class="last">
				<th>
					<a href="/?enc=b64&busStationId=105959&pinType=site&pinId=13479550&lng=127.02133112&lat=37.5111471" target="_blank" data-nclicks="sei.station">영동시장논현역
						(23-123)
					</a>
				</th>
				<td>
						<ul class="bus_lst">	
							<li>
								<dl>
								<dt><span class="spbi spbi_d1">일반</span></dt>
								<dd>
									33
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d12">지선</span></dt>
								<dd>
									3412
									,
									4412
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d3">마을</span></dt>
								<dd>
									서초03
								</dd>
								</dl>
							</li>
						</ul>
				</td>
				</tr>
			<tr class="tbs3_top">
			<th><span class="sub_exit_n sub_exit_n3">3</span>번 출구</th>
			<td>
					한국보훈복지의료공단
					, 
					프레이즈음악신학교
			</td>
			</tr>
			<tr class="last">
				<th>
					<a href="/?enc=b64&busStationId=111951&pinType=site&pinId=13479550&lng=127.02133112&lat=37.5111471" target="_blank" data-nclicks="sei.station">논현역
						(22-191)
					</a>
				</th>
				<td>
						<ul class="bus_lst">	
							<li>
								<dl>
								<dt><span class="spbi spbi_d1">일반</span></dt>
								<dd>
									33
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d11">간선</span></dt>
								<dd>
									421
									,
									640
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d12">지선</span></dt>
								<dd>
									3412
									,
									4412									
								</dd>
								</dl>
							</li>
						</ul>
				</td>
				</tr>
				<tr class="last">
				<th>
					<a href="/?enc=b64&busStationId=195648&pinType=site&pinId=13479550&lng=127.02133112&lat=37.5111471" target="_blank" data-nclicks="sei.station">논현역
						(22-587)
					</a>
				</th>
				<td>
						<ul class="bus_lst">
							<li>
								<dl>
								<dt><span class="spbi spbi_d3">마을</span></dt>
								<dd>
									서초03
								</dd>
								</dl>
							</li>
						</ul>
				</td>
				</tr>
				<tr class="tbs3_top">
			<th><span class="sub_exit_n sub_exit_n4">4</span>번 출구</th>
			<td>
					반포파출소	
			</td>
			</tr>
			<tr class="last">
				<th>
					<a href="/?enc=b64&busStationId=105861&pinType=site&pinId=13479550&lng=127.02133112&lat=37.5111471" target="_blank" data-nclicks="sei.station">논현사거리.논현역4번출구
						(22-190)
					</a>
				</th>
				<td>
						<ul class="bus_lst">
							<li>
								<dl>
								<dt><span class="spbi spbi_d11">간선</span></dt>
								<dd>
									142
									,
									148
									,
									360
									,
									401
									,
									462
									,
									640
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d12">지선</span></dt>
								<dd>
									3414
									,
									4212
									,
									6411
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d14">광역</span></dt>
								<dd>
									9408
								</dd>
								</dl>
							</li>
						</ul>
				</td>
				</tr>
				<tr class="last">
				<th>
					<a href="/?enc=b64&busStationId=193759&pinType=site&pinId=13479550&lng=127.02133112&lat=37.5111471" target="_blank" data-nclicks="sei.station">논현사거리
						(22-817)
					</a>
				</th>
				<td>
						<ul class="bus_lst">
							<li>
								<dl>
								<dt><span class="spbi spbi_d5">공항</span></dt>
								<dd>
									6000
								</dd>
								</dl>
							</li>
						</ul>
				</td>
				</tr>
			<tr class="tbs3_top">
			<th><span class="sub_exit_n sub_exit_n5">5</span>번 출구</th>
			<td>	
					오렌지신용금고
			</td>
			</tr>
			<tr class="last">
				<th>
					<a href="/?enc=b64&busStationId=105845&pinType=site&pinId=13479550&lng=127.02133112&lat=37.5111471" target="_blank" data-nclicks="sei.station">논현사거리.논현역5번출구
						(22-183)
					</a>
				</th>
				<td>
						<ul class="bus_lst">
							<li>
								<dl>
								<dt><span class="spbi spbi_d11">간선</span></dt>
								<dd>
									142
									,
									148
									,
									360
									,
									401
									,
									462	
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d12">지선</span></dt>
								<dd>
									3414
									,
									4212
									,
									6411
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d14">광역</span></dt>
								<dd>
									9408
								</dd>
								</dl>
							</li>
						</ul>	
				</td>
				</tr>
				<tr class="last">
				<th>
					<a href="/?enc=b64&busStationId=166227&pinType=site&pinId=13479550&lng=127.02133112&lat=37.5111471" target="_blank" data-nclicks="sei.station">논현사거리
						(22-818)
					</a>
				</th>
				<td>
						<ul class="bus_lst">
							<li>
								<dl>
								<dt><span class="spbi spbi_d5">공항</span></dt>
								<dd>
									6000
								</dd>
								</dl>
							</li>
						</ul>
				</td>
				</tr>
				<tr class="tbs3_top">
			<th><span class="sub_exit_n sub_exit_n6">6</span>번 출구</th>
			<td>
					강남웨딩문화원
					, 
					논현웨딩홀
					, 
					푸른신용금고
			</td>
			</tr>
			<tr class="last">
				<th>
					<a href="/?enc=b64&busStationId=105872&pinType=site&pinId=13479550&lng=127.02133112&lat=37.5111471" target="_blank" data-nclicks="sei.station">신사역.푸른저축은행
						(22-015)
					</a>
				</th>
				<td>
						<ul class="bus_lst">
							<li>
								<dl>
								<dt><span class="spbi spbi_d11">간선</span></dt>
								<dd>
									140
									,
									144
									,
									145
									,
									241
									,
									400
									,
									402
									,
									407
									,
									420
									,
									421
									,
									440
									,
									441
									,
									470
									,
									471
									,
									542
									,
									N13
									,
									N37
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d4">직행좌석</span></dt>
								<dd>
									1005-1
									,
									1100
									,
									3030
									,
									3100
									,
									9600
									,
									9700
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d6">간선급행</span></dt>
								<dd>
									8001
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d14">광역</span></dt>
								<dd>
									9404
									,
									9711A
									,
									M7412
									,
									M7426
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d5">공항</span></dt>
								<dd>
									6009
									,
									6500
								</dd>
								</dl>
							</li>
						</ul>
				</td>
				</tr>
			<tr class="tbs3_top">
			<th><span class="sub_exit_n sub_exit_n7">7</span>번 출구</th>
			<td>
					전기공사공제조합
			</td>
			</tr>
			<tr class="last">
				<th>
					<a href="/?enc=b64&busStationId=105884&pinType=site&pinId=13479550&lng=127.02133112&lat=37.5111471" target="_blank" data-nclicks="sei.station">신사역
						(22-016)
					</a>
				</th>
				<td>
						<ul class="bus_lst">
							<li>
								<dl>
								<dt><span class="spbi spbi_d11">간선</span></dt>
								<dd>
									140
									,
									142
									,
									144
									,
									145
									,
									241
									,
									400
									,
									402
									,
									407
									,
									420
									,
									421
									,
									470
									,
									471
									,
									542
									,
									N13
									,
									N37
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d4">직행좌석</span></dt>
								<dd>
									1005-1
									,
									3030
									,
									3100
									,
									3600
									,
									9600
									,
									9700
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d14">광역</span></dt>
								<dd>
									9404
									,
									9711A
									,
									M7412
									,
									M7426	
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d5">공항</span></dt>
								<dd>
									6009
									,
									6500
								</dd>
								</dl>
							</li>
						</ul>
				</td>
				</tr>
			<tr class="tbs3_top">
			<th><span class="sub_exit_n sub_exit_n8">8</span>번 출구</th>
			<td>
					논현가구거리
					, 
					학동공원
			</td>
			</tr>
			<tr class="last">
				<th>
					<a href="/?enc=b64&busStationId=106040&pinType=site&pinId=13479550&lng=127.02133112&lat=37.5111471" target="_blank" data-nclicks="sei.station">영동시장
						(23-116)
					</a>
				</th>
				<td>
						<ul class="bus_lst">
							<li>
								<dl>
								<dt><span class="spbi spbi_d1">일반</span></dt>
								<dd>
									33
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d11">간선</span></dt>
								<dd>
									240
									,
									401									
								</dd>
								</dl>
							</li>
							<li>
								<dl>
								<dt><span class="spbi spbi_d12">지선</span></dt>
								<dd>
									3414
									,
									6411
								</dd>
								</dl>
							</li>
						</ul>
				</td>
				</tr>
		</tbody>
		</table>
	</div>
</div>
	</div>
</div>
</body>
</html>