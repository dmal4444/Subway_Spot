<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/detail/subway.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
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
<div class="article">
	<div class="section_sway_time_tb">
		<table cellspacing="0" cellpadding="0" summary="첫차막차시간표" class="tbs1 tbs2">
			<caption class="cap1">상행 - 소요산방면</caption>
			<colgroup>
				<col class="tbs2_col1">
				<col class="tbs2_col1">
				<col class="tbs2_col1">
				<col class="tbs2_col1">
				<col>
			</colgroup>
		<!-- 테이블 헤드 -->
		<thead>
			<tr>
				<th scope="col">첫/막차</th>
				<th scope="col">종착역</th>
				<th scope="col">평일</th>
				<th scope="col" class="sat">토요일</th>
				<th scope="col" class="sun">일.공휴일</th>
			</tr>
		</thead>
		<!-- 테이블 바디-->	
			<tbody>
				<tr>
					<th rowspan="11" class="thf">첫차</th>
					<td calss="t">의정부</td>
					<td>05:00</td>
					<td>05:34</td>
					<td>05:34</td>
				</tr>
				<tr>
					<td calss="t">소요산</td>
					<td>05:11</td>
					<td>05:13</td>
					<td>05:13</td>
				</tr>
				<tr>
					<td calss="t">동두천</td>
					<td>05:28</td>
					<td>05:00</td>
					<td>05:00</td>
				</tr>
				<tr>
					<td calss="t">광운대</td>
					<td>05:52</td>
					<td>05:52</td>
					<td>05:52</td>
				</tr>
				<tr>
					<td calss="t">동두천(급)</td>
					<td>05:58</td>
					<td>-</td>
					<td>-</td>
				</tr>
				<tr>
					<td calss="t">청량리</td>
					<td>06:02</td>
					<td>06:16</td>
					<td>06:16</td>
				</tr>
				<tr>
					<td calss="t">양주</td>
					<td>06:25</td>
					<td>06:44</td>
					<td>06:44</td>
				</tr>
				<tr>
					<td calss="t">영등포</td>
					<td>06:37</td>
					<td>06:37</td>
					<td>06:37</td>
				</tr>
				<tr>
					<td calss="t">동묘앞</td>
					<td>08:23</td>
					<td>09:23</td>
					<td>09:23</td>
				</tr>
				<tr>
					<td calss="t">창동</td>
					<td>09:29</td>
					<td>09:11</td>
					<td>09:11</td>
				</tr>
				<tr>
					<td calss="t">용산(급)</td>
					<td>10:02</td>
					<td>09:53</td>
					<td>09:53</td>
				</tr>
				<tr>
					<td calss="t">용산(급)</td>
					<td>10:02</td>
					<td>09:53</td>
					<td>09:53</td>
				</tr>
				<tr>
					<th rowspan="11" class="thf">막차</th>
					<td calss="t">동두천</td>
					<td>21:52</td>
					<td>20:43</td>
					<td>20:43</td>
				</tr>
				<tr>
					<td calss="t">소요산</td>
					<td>22:41</td>
					<td>22:49</td>
					<td>22:49</td>
				</tr>
				<tr>
					<td calss="t">양주</td>
					<td>22:55</td>
					<td>22:31</td>
					<td>22:31</td>
				</tr>
				<tr>
					<td calss="t">영등포</td>
					<td>23:06</td>
					<td>23:06</td>
					<td>23:06</td>
				</tr>
				<tr>
					<td calss="t">용산(급)</td>
					<td>23:10</td>
					<td>23:21</td>
					<td>23:21</td>
				</tr>
				<tr>
					<td calss="t">의정부</td>
					<td>23:18</td>
					<td>23:18</td>
					<td>23:18</td>
				</tr>
				<tr>
					<td calss="t">창동</td>
					<td>23:28</td>
					<td>23:02</td>
					<td>23:02</td>
				</tr>
				<tr>
					<td calss="t">광운대</td>
					<td>23:40</td>
					<td>23:49</td>
					<td>23:49</td>
				</tr>
				<tr>
					<td calss="t">청량리</td>
					<td>23:55</td>
					<td>22:46</td>
					<td>22:46</td>
				</tr>
				<tr>
					<td calss="t">동묘앞</td>
					<td>00:00</td>
					<td>23:36</td>
					<td>23:36</td>
				</tr>
				<tr>
					<td calss="t">서울역</td>
					<td>-</td>
					<td>00:00</td>
					<td>00:00</td>
				</tr>
			</tbody>
		</table>
		<table cellspacing="0" cellpadding="0" summary="첫차막차시간표" class="tbs1 tbs2">
			<caption class="cap1">하행 - 인천,신창방면</caption>
			<colgroup>
				<col class="tbs2_col1">
				<col class="tbs2_col1">
				<col class="tbs2_col1">
				<col class="tbs2_col1">
				<col>
			</colgroup>
		<!-- 테이블 헤드 -->
		<thead>
			<tr>
				<th scope="col">첫/막차</th>
				<th scope="col">종착역</th>
				<th scope="col">평일</th>
				<th scope="col" class="sat">토요일</th>
				<th scope="col" class="sun">일.공휴일</th>
			</tr>
		</thead>
		<!-- 테이블 바디-->	
			<tbody>
				<tr>
					<th rowspan="11" class="thf">첫차</th>
					<td calss="t">인천</td>
					<td>05:00</td>
					<td>05:00</td>
					<td>05:00</td>
				</tr>
				<tr>
					<td calss="t">신창</td>
					<td>05:00</td>
					<td>05:00</td>
					<td>05:00</td>
				</tr>
				<tr>
					<td calss="t">신창</td>
					<td>05:00</td>
					<td>05:00</td>
					<td>05:00</td>
				</tr>
				<tr>
					<td calss="t">천안</td>
					<td>05:32</td>
					<td>07:08</td>
					<td>07:08</td>
				</tr>
				<tr>
					<td calss="t">광명</td>
					<td>05:35</td>
					<td>05:35</td>
					<td>05:35</td>
				</tr>
				<tr>
					<td calss="t">서동탄</td>
					<td>05:41</td>
					<td>05:15</td>
					<td>05:15</td>
				</tr>
				<tr>
					<td calss="t">신창(급)</td>
					<td>06:19</td>
					<td>13:59</td>
					<td>13:59</td>
				</tr>
				<tr>
					<td calss="t">부평(급)</td>
					<td>06:28</td>
					<td>-</td>
					<td>-</td>
				</tr>
				<tr>
					<td calss="t">인천(급)</td>
					<td>08:23</td>
					<td>-</td>
					<td>-</td>
				</tr>
				<tr>
					<td calss="t">병점</td>
					<td>08:32</td>
					<td>09:01</td>
					<td>09:01</td>
				</tr>
				<tr>
					<td calss="t">천안(급)</td>
					<td>09:15</td>
					<td>06:22</td>
					<td>06:22</td>
				</tr>
				<tr>
					<td calss="t">동인천(급)</td>
					<td>09:26</td>
					<td>09:53</td>
					<td>09:53</td>
				</tr>
				<tr>
					<td calss="t">병점(급)</td>
					<td>10:56</td>
					<td>-</td>
					<td>-</td>
				</tr>
				<tr>
					<td calss="t">병점(급)</td>
					<td>10:56</td>
					<td>-</td>
					<td>-</td>
				</tr>	
				<tr>
					<th rowspan="11" class="thf">막차</th>
					<td calss="t">병점(급)</td>
					<td>15:38</td>
					<td>-</td>
					<td>-</td>
				</tr>
				<tr>
					<td calss="t">신창(급)</td>
					<td>17:10</td>
					<td>19:13</td>
					<td>19:13</td>
				</tr>
				<tr>
					<td calss="t">천안(급)</td>
					<td>21:56</td>
					<td>21:56</td>
					<td>21:56</td>
				</tr>
				<tr>
					<td calss="t">광명</td>
					<td>22:06</td>
					<td>22:06</td>
					<td>22:06</td>
				</tr>
				<tr>
					<td calss="t">신창</td>
					<td>22:27</td>
					<td>22:27</td>
					<td>22:27</td>
				</tr>
				<tr>
					<td calss="t">천안</td>
					<td>22:46</td>
					<td>22:48</td>
					<td>22:48</td>
				</tr>
				<tr>
					<td calss="t">동인천(급)</td>
					<td>23:18</td>
					<td>23:27</td>
					<td>23:27</td>
				</tr>
				<tr>
					<td calss="t">서동탄</td>
					<td>23:21</td>
					<td>23:26</td>
					<td>23:26</td>
				</tr>
				<tr>
					<td calss="t">부평(급)</td>
					<td>23:31</td>
					<td>23:44</td>
					<td>23:44</td>
				</tr>
				<tr>
					<td calss="t">병점</td>
					<td>23:42</td>
					<td>23:41</td>
					<td>23:41</td>
				</tr>
				<tr>
					<td calss="t">인천</td>
					<td>00:01</td>
					<td>23:48</td>
					<td>23:48</td>
				</tr>
			</tbody>
		</table>
	</div>
	</div>
</div>
</body>
</html>