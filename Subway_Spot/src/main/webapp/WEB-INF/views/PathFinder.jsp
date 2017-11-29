 <%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

  <div id="myPath" style="width:250px;">
  	<img src="resources/icons/train.png">&nbsp&nbsp<a style="color:darkgrey; font-weight:bold; font-size:28px;">SUBWAY SPOT</a>
  	<p></p>
  	<form method="POST" id="stn_frm" action="">  		
		<div id="from_to">
	 		<!--  출발역 -->
			FROM <br>
			<input type="text" class="stn_input" id="from" name="from" placeholder="출발역을 입력해주세요.">
			<!-- 공백 주기 -->
			<p></p>
			<!-- 스위치 버튼 -->
			<div  align="left" id="div_switch" >
			<img src="./resources/icons/switch.png"/>&nbsp
			<input type="button" class="searchBtn" id="swtichBtn" value="SWITCH" style="font-size: 10px;">
			</div>
			<!-- 도착역 -->	
			TO <br>
			<input type="text" class="stn_input" id="to" name="to" placeholder="도착역을 입력해주세요.">
			<div align="left" id="btn_combo" style="font-size: 10px;">
			<p></p>
		
				<input type="button"  class="searchBtn" id="clearBtn" value="CLEAR">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="searchBtn" id="findBtn" value="FIND">
			</div>
		</div>
	</form>
	
	<!-- <hr id="pathline" style="color:black;display:block;"> -->
	<img src="resources/icons/line.png" style="width:275px;">
	<br><br> <!-- 나눔선 -->
	<div class="main_div" >
	<div class="buttons">
		<button class="button minTime" id="t_minTime" value=1>최단거리</button>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="button minTrans" id="t_minTrans" value=2>최소환승</button>
	</div>
		<div class="inner_div">

		<p style="height:6px;"></p>
			<div id="min_name" align='center' >
			<img src="./resources/icons/linenumber/line1.jpg" class="line" id="startLine"/>&nbsp;<a class="stn start">구로</a>역&nbsp;<img src="./resources/icons/path_arr.png"/>&nbsp;
			<img src="./resources/icons/linenumber/line1.jpg" class="line" id="endLine"/>&nbsp;<a class="stn end">금정</a>역
			</div>
			
			<p style="height:4px;"></p>
			<!-- 시간 설정-->
			<div id="time_btn" >
			시간설정<img src="./resources/icons/arrow_down.png" id="arrow_down" class="arrow_down"/>
			
			<!-- 전체/요약 버튼 설정 -->
			<input type="button" class="showBtn all" id="show_all" value="전체">
			<input type="button" class="showBtn short" id="show_short" value="요약">
			</div>
	
			<div class="timeSet" id="short_timeSet" >
				<hr id="divider_time"><!--나눔선-->
				<!-- 시간 설정 콤보박스 -->
		<select class="time_kind"> <!-- 변경 -->
			<option value="departure">출발시간</option>
			<option value="arrival">도착시간</option>
			<option value="first">첫차시간</option>
			<option value="last">막차시간</option>
		</select>
		<select class="time_day">
			<option value="weekday">평일</option>
			<option value="saturday">토요일</option>
			<option value="holiday">휴일</option>
		</select>
			<select class="time_hour">
			<% for(int i=0; i<24; i++){ %>
				<option value="<%=i%>"><%=i+"시"%></option>		
			<%	}%>
			</select>
			<select class="time_day">
			<% for(int i=0; i<61; i++){ %>
				<option value="<%=i%>"><%=i+"분"%></option>		
			<%	}%>
			</select>
			
			<input type="button" class="confirm_btn" value="확인"> 
		</div>
		<div id="minTime" class="targetDiv" >
			<!-- 요약 정보 보기  -->
		
		<div id="short_inner" class="inner_box" >
			<dl class="short" id="short_info1"  >
				<dd class="short_box">소요시간</dd>
					<em><a class="travelTime" id="travelTime1">0</a>분</em>
				<dd class="short_box">정차역</dd>
					<em><a class="travelDistance" id="travelDistance1">0</a>개</em>
				<dd class="short_box">환승</dd>
					<em><a class="exchangeCount" id="exchangeCount1">0</a>회</em>
			</dl>
			
			<dl class="short" id="short_info2">
				<dd class="short_box">카드요금</dd>
					<em><a class="cardFare" id="cardFare1">1234</a>원</em>
				<dd class="short_box">현금</dd>
					<em><a class="cashFare" id="cashFare1">1234</a>원</em>
			</dl>
		</div>
		<!-- 요약 리스트-->
		<div id="short_div" class="pathDiv short">
		<div id="short_list">
		<ul class="sbway_list">
		
			<!-- 출발역 -->
			<li class="sbway_departure">
			<span class="sbway_line_wrap_stn">
			</span>
			<dl class="sbway_dl_list"id="list_departure">
				<dt class="sbway_time" id="departure_time">
					15:16
				</dt>
				<dd>
					<a href="#" class="sbway_stn dept" id="departure_stn1">땡땡</a>역(<a class="sbway_line"id="departure_line1">0</a>호선)
				</dd>
				<dd class="departure_info">
					<a class="wayname" id="wayname1">땡땡</a>행 방면<br>
					<p class="fastExch" id="fastExch1">빠른 환승 <a class="fastTrain first"id="fastTrain1">0</a>-<a class="fastDoor first" id="fastDoor1">0</a>번 문</p>
				</dd>
			</dl>
			<div id="timetable_btn">
				<input type="button" class="act" style="float:right;"id="timetable" value="운행시간">
			</div>
			</li>
			
			<!-- 환승역 -->
			<div class="exchangeBox">
				<li class="sbway_transfer">
					<span class="sbway_line_wrap">
						<span class="sbway_line_img_transfer"></span>
					</span>
					<dl class="sbway_dl_list"id="list_exchange">
						<dt class="sbway_time" id="departure_time">
							15:00
						</dt>
						<dd>
							<a href="#" class="sbway_stn exch" id="exchange_stn2">땡땡</a>역(<a class="ex_line" id="ex_line2">0</a>호선)
						</dd>
						<dd class="departure_info">
							도보<a class="exWalkTime" id="exWalkTime1">0</a>분<br>
							<p class="fastExch2" id="fastExch2">빠른 환승 <a class="fastTrain2" id="fastTrain2">0</a>-<a class="fastDoor2" id="fastDoor2">0</a>번 문</p>
						</dd>
					</dl>
				</li>
			</div>
			<!--도착역 -->
			<li class="sbway_arrival">
				<span class="sbway_line_wrap_stn_arrival">
			</span>			
			<dl class="sbway_dl_list" id="list_arrival">
				<dt class="sbway_time" id="arrival_time">
					15:25
				</dt>
				<dd>
					<a href="#" class="sbway_stn arrival" id="arrival_stn">땡땡</a>역(<a class="arrival_line"id="arrival_line2">0</a>호선)
				</dd>
				<dd class="arrival_info">
					
				</dd>
			</dl>
			
			<div id="exit_btn">
				<input type="button" class="exit" style="float:right;"id="exit_info" value="출구·연계버스">
			</div>
			</li>
			</ul>
		</div>
	</div>
	

	<!-- 전체보기-->
		
		<div id="all_div" class="pathDiv all" style="display:none;">
		<!-- 전체 리스트-->
		<div id="short_list">
		<ul class="sbway_list">
		<!-- 출발역 -->
			<li class="sbway_departure">
			<span class="sbway_line_wrap_stn">
			</span>

			<dl class="sbway_dl_list"id="list_departure">
				<dt class="sbway_time" id="departure_time">
					15:16
				</dt>
				<dd>
					<a href="#" class="sbway_stn dept" id="departure_stn3">땡땡</a>역(<a class="sbway_line"id="departure_line3">0</a>호선)
				</dd>
				<dd class="departure_info">
					<a class="wayname" id="wayname3">땡땡</a>행 방면<br>
					<p class="fastExch" id="fastExch3">빠른 환승 <a class="fastTrain first"id="fastTrain1">0</a>-<a class="fastDoor first" id="fastDoor3">0</a>번 문</p>
				</dd>
			</dl>
			
			<div id="timetable_btn">
				<input type="button" class="act" style="float:right;"id="timetable" value="운행시간">
			</div>
			</li>
			
			<!--지나는 역-->
			<div class="detail_list">
			
			</div>
			
			<!-- 환승역 -->
			<div class="exchangeBox">
				<li class="sbway_transfer">
					<span class="sbway_line_wrap">
						<span class="sbway_line_img_transfer"></span>
					</span>
					<dl class="sbway_dl_list"id="list_exchange">
						<dt class="sbway_time" id="departure_time3">
							15:00
						</dt>
						<dd>
							<a href="#" class="sbway_stn exch" id="exchange_stn3">땡땡</a>역(<a class="ex_line" id="ex_line3">0</a>호선)
						</dd>
						<dd class="departure_info">
							도보<a class="exWalkTime" id="exWalkTime3">0</a>분<br>
							<p class="fastExch2" id="fastExch3">빠른 환승 <a class="fastTrain2" id="fastTrain2">0</a>-<a class="fastDoor3" id="fastDoor3">0</a>번 문</p>
						</dd>
					</dl>
				</li>
			</div>
			<!-- 환승 사이 지나는 역 -->
			<div class="detail_list_between">
			
			</div>
			
			<!-- 두번째 환승 -->
			<div class="exchangeBox2">
			
			</div>
			
			<!--지나는 역2-->
			<div class="detail_list_after">
				
			</div>
			
			<!-- 도착역 -->
			<li class="sbway_arrival">
				<span class="sbway_line_wrap_stn_arrival">
				
			</span>			
			<dl class="sbway_dl_list" id="list_arrival">
				<dt class="sbway_time" id="arrival_time">
					15:25
				</dt>
				<dd>
					<a href="#" class="sbway_stn arrival" id="arrival_stn3">땡땡</a>역(<a class="arrival_line" id="arrival_line3">1</a>호선)
				</dd>
				<dd class="arrival_info">
					
				</dd>
			</dl>
			
			<div id="exit_btn">
				<input type="button" class="exit" style="float:right;"id="exit_info" value="출구·연계버스">
			</div>
			</li>
			</ul>
		</div>
	</div>
	</div>
</div>

<!-- 최소환승 보여주기  -->
<div id="minTrans" class="targetDiv" style="display:none;">
	<div id="short_inner" class="inner_box" >
			<dl class="short" id="short_info2"  >
				<dd class="short_box">소요시간</dd>
					<em><a class="travelTime" 2id="travelTime2">1234</a>분</em>
				<dd class="short_box">정차역</dd>
					<em><a class="travelDistance" id="travelDistance2">0</a>개</em>
				<dd class="short_box">환승</dd>
					<em><a class="exchangeCount" id="exchangeCount2">0</a>회</em>
			</dl>
			<dl class="short" id="short_info2">
				<dd class="short_box">카드요금</dd>
					<em><a class="cardFare" id="cardFare2">1234</a>원</em>
				<dd class="short_box">현금</dd>
					<em><a class="cashFare" id="cashFare2">1234</a>원</em>
			</dl>
	</div>

<!-- 요약 자세히 보기-->
	<div id="short_div" class="pathDiv short">
	<!-- 요약 리스트-->
		<div id="short_list">
		<ul class="sbway_list">
			<!-- 출발역 -->
			<li class="sbway_departure">
			<span class="sbway_line_wrap_stn">
			</span>
			<dl class="sbway_dl_list"id="list_departure">
				<dt class="sbway_time" id="departure_time">
					15:16
				</dt>
				<dd>
					<a href="#" class="sbway_stn dept" id="departure_stn2">땡땡</a>역(<a class="sbway_line" id="departure_line2">0</a>호선)
				</dd>
				<dd class="departure_info">
					<a class="wayname" id="wayname2">땡땡</a>행 방면<br>
					<p class="fastExch" id="fastExch1">빠른 환승 <a class="fastTrain first"id="fastTrain1">0</a>-<a class="fastDoor first" id="fastDoor1">0</a>번 문</p>
				</dd>
			</dl>
			<div id="timetable_btn">
				<input type="button" class="act" style="float:right;"id="timetable" value="운행시간">
			</div>
			</li>
			
			<!-- 환승역 -->
			<div class="exchangeBox">
				<li class="sbway_transfer">
					<span class="sbway_line_wrap">
						<span class="sbway_line_img_transfer"></span>
					</span>
					<dl class="sbway_dl_list"id="list_departure">
						<dt class="sbway_time" id="departure_time">
							15:00
						</dt>
						<dd>
							<a href="#" class="sbway_stn exch" id="exchange_stn2">땡땡</a>역(<a class="ex_line" id="ex_line2">0</a>호선)
						</dd>
						<dd class="departure_info">
							도보<a class="exWalkTime" id="exWalkTime2">0</a>분<br>
							<p class="fastExch2" id="fastExch3">빠른 환승 <a class="fastTrain2" id="fastTrain3">0</a>-<a class="fastDoor2" id="fastDoor3">0</a>번 문</p>
						</dd>
					</dl>
				</li>
			</div>
			<!--도착역 -->
			<li class="sbway_arrival">
				<span class="sbway_line_wrap_stn_arrival">
				</span>			
			<dl class="sbway_dl_list" id="list_arrival">
				<dt class="sbway_time" id="arrival_time">
					15:25
				</dt>
				<dd>
					<a href="#" class="sbway_stn arrival" id="arrival_stn">땡땡</a>역(<a class="arrival_line"id="arrival_line2">0</a>호선)
				</dd>
				<dd class="arrival_info">

				</dd>
			</dl>
			<div id="exit_btn">
				<input type="button" class="exit" style="float:right;"id="exit_info" value="출구·연계버스">
			</div>
			</li>
			</ul>
		</div>
	</div>

	<!-- 전체보기-->

	<div id="all_div" class="pathDiv all" style="display:none;">
		
		<!-- 전체 리스트-->
		<div id="short_list">
		<ul class="sbway_list">
		<!-- 출발역 -->
			<li class="sbway_departure">
			<span class="sbway_line_wrap_stn">
			</span>
			
			<dl class="sbway_dl_list"id="list_departure">
				<dt class="sbway_time" id="departure_time">
					15:16
				</dt>
				<dd>
					<a href="#" class="sbway_stn dept" id="departure_stn4">땡땡</a>역(<a class="sbway_line"id="departure_line4">0</a>호선)
				</dd>
				<dd class="departure_info">
					<a class="wayname" id="wayname4">땡땡</a>행 방면<br>
					<p class="fastExch" id="fastExch4">빠른 환승 <a class="fastTrain first"id="fastTrain1">0</a>-<a class="fastDoor first" id="fastDoor4">0</a>번 문</p>
				</dd>
			</dl>
			<div id="timetable_btn">
				<input type="button" class="act" style="float:right;"id="timetable" value="운행시간">
			</div>
			</li>
			
			<!--지나는 역-->
			<div class="detail_list">
				
			</div>
			
			<!-- 환승역 -->
			<div class="exchangeBox">
				<li class="sbway_transfer">
					<span class="sbway_line_wrap">
						<span class="sbway_line_img_transfer"></span>
					</span>
					<dl class="sbway_dl_list"id="list_exchange">
						<dt class="sbway_time" id="departure_time3">
							15:00
						</dt>
						<dd>
							<a href="#" class="sbway_stn exch" id="exchange_stn4">땡땡</a>역(<a class="ex_line" id="ex_line4">0</a>호선)
						</dd>
						<dd class="departure_info">
							도보<a class="exWalkTime" id="exWalkTime4">0</a>분<br>
							<p class="fastExch2" id="fastExch4">빠른 환승 <a class="fastTrain2" id="fastTrain4">5</a>-<a class="fastDoor3" id="fastDoor4">0</a>번 문</p>
						</dd>
					</dl>
				</li>
			</div>
			
			<!-- 환승 사이 지나는 역 -->
			<div class="detail_list_between">

			</div>
			
			<!-- 두번째 환승 -->
			<div class="exchangeBox2">
			
			</div>
			
			<!--지나는 역2-->
			<div class="detail_list_after">
				
			</div>
			<!-- 도착역 -->
			<li class="sbway_arrival">
				<span class="sbway_line_wrap_stn_arrival">
			</span>			
			<dl class="sbway_dl_list" id="list_arrival">
				<dt class="sbway_time" id="arrival_time">
					15:25
				</dt>
				<dd>
					<a href="#" class="sbway_stn arrival" id="arrival_stn4">땡땡</a>역(<a class="arrival_line"id="arrival_line4">0</a>호선)
				</dd>
				<dd class="arrival_info">
					
				</dd>
			</dl>
			<div id="exit_btn">
				<input type="button" class="exit" style="float:right;"id="exit_info" value="출구·연계버스">
			</div>
			</li>
			</ul>
		</div>
		</div>
	</div>
	</div>
	<div>
		<a href="./ads/adsList.sub" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>광고 요청 게시판</a>
	</div>
</div>

	
