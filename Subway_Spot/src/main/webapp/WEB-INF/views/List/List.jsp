<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script>
function closeNav2() {
    document.getElementById("mySideList").style.width = "0";
}

</script> 
	<div id="mySideList" class="sidelist" style="background-color:white;">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav2()">&times;</a>
		<div class="listView">		
			<div class="category" id="btn_parent">
				<a href="#" class="clickme clickme1" data-type="restaurant">
					<span class="btn_selected">				
						<img src="./resources/icons/category/restaurant_list_icon.png" alt="restaurant" title="restaurant" id="restaurant_icon">
					</span>
					<span class="btn_icon">
						<img src="./resources/icons/category/restaurant_list_selected_icon.png" alt="restaurant" title="restaurant" >
					</span>
				</a>					
				<a href="#" class="clickme clickme2" data-type="hotel">
					<span class="btn_selected">				
						<img src="./resources/icons/category/hotel_list_icon.png" alt="hotel" title="hotel" id="hotel_icon">
					</span>
					<span class="btn_icon">
						<img src="./resources/icons/category/hotel_list_selected_icon.png" alt="hotel" title="hotel" >
					</span>
				</a>
				<a href="#" class="clickme clickme3" data-type="pub">
					<span class="btn_selected">
						<img src="./resources/icons/category/pub_list_icon.png" alt="pub" title="pub" id="pub_icon">
					</span>
					<span class="btn_icon">
						<img src="./resources/icons/category/pub_list_selected_icon.png" alt="pub" title="pub">
					</span>
				</a>
				<a href="#" class="clickme clickme4" data-type="tourism">
					<span class="btn_selected">
						<img src="./resources/icons/category/tourism_list_icon.png" alt="tourism" title="tourism" id="tourism_icon">
					</span>
					<span class="btn_icon">
						<img src="./resources/icons/category/tourism_list_selected_icon.png" alt="tourism" title="tourism">
					</span>
				</a>					
				<a href="#" class="clickme clickme5" data-type="park">
					<span class="btn_selected">
						<img src="./resources/icons/category/park_list_icon.png" alt="park" title="park" id="park_icon">
					</span>
					<span class="btn_icon">
						<img src="./resources/icons/category/park_list_selected_icon.png" alt="park" title="park">
					</span>
				</a>
			</div>			
		<hr></hr>
		<input id="hDataLat" type="hidden" name="hDataLat" value=''>
		<input id="hDataLng" type="hidden" name="hDataLng" value=''>
		<input id="hDataCate" type="hidden" name="hDataCate" value=''>
		<input id="hDataNow" type="hidden" name="hDataNow" value=''>
		
		<div class="section-all" id="restaurant_all" >
			<!--restaurant 관련 결과 -->
			<div class="hotpl-result" id="restaurant_hotpl">

        	</div>
        	
        	<div class="section-result" id="restaurant_result">
			</div> 
        	 	   	
			<!-- hotel 관련 결과 -->
			<div class="hotpl-result" id="hotel_hotpl"> 

        	</div>
        			
			<div class="section-result" id="hotel_result">		 		
			</div>
			        	
        	<!-- pub 관련 결과 -->		
        	<div class="hotpl-result" id="pub_hotpl"> 

        	</div>
        	
			<div class="section-result" id="pub_result">
			
			</div>
			        	
        	<!-- tourism 관련 결과 -->
        	<div class="hotpl-result" id="tourism_hotpl"> 

        	</div>
        				
			<div class="section-result" id="tourism_result">
			
			</div>
			        	
        	<!-- park 관련 결과 -->
        	<div class="hotpl-result" id="park_hotpl"> 

        	</div>
        		
			<div class="section-result" id="park_result">
			
			</div>
		</div> 
	</div>
</div>
