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
		
		<div class="section-result" id="restaurant_result">
	<!-- 		<div class="section1">
				<div class="section-result-text-content">
					<div class="section-result-header">
						<div class="section-result-name">
							STARBUCKS
						</div>
						<span class="section-result-rating">
							<a class="rating">3.4 ¡Ú¡Ú¡Ú¡Ú¡Ú</a>(5)
						</span>
					</div>			
					<div class="section-result-details-container">
							<div class="section-result-address">
								°æ±âµµ ¾È¾Ó½Ã ¾È¾Óµ¿ ¾È¾ÓÈ£ ¾È¾Ó¾ÆÆÄÆ®
							</div>
							<div class="section-result-phone">
								010-2222-5555
							</div>
						</div>
					</div>
					<div class="section-imgage-container">
					<img id="hardy" src="./resources/icons/category/hardy.png">
				</div>
			</div>
			
			-->		
		</div>
		
		<div class="section-result" id="hotel_result">	 		
		</div>
		<div class="section-result" id="pub_result">	 		
		</div>
		<div class="section-result" id="tourism_result">
	 		<div class="section1">
				<div class="section-result-text-content">
					<div class="section-result-header">
						<div class="section-result-name">
							³²»êÅ¸¿ö
						</div>
						<span class="section-result-rating">
							<a class="rating">3.4 ¡Ú¡Ú¡Ú¡Ú¡Ú</a>(5)
						</span>
					</div>			
					<div class="section-result-details-container">
							<div class="section-result-address">
								°æ±âµµ ¾È¾Ó½Ã ¾È¾Óµ¿ ¾È¾ÓÈ£ ¾È¾Ó¾ÆÆÄÆ®
							</div>
							<div class="section-result-phone">
								010-2222-5555
							</div>
						</div>
					</div>
					<div class="section-imgage-container">
					<img id="hardy" src="./resources/icons/category/hardy.png">
				</div>
			</div>	
		</div>
		
		
		<div class="section-result" id="park_result">
	 		<div class="section1">
				<div class="section-result-text-content">
					<div class="section-result-header">
						<div class="section-result-name">
							¿¬Æ®·² ÆÄÅ©
						</div>
						<span class="section-result-rating">
							<a class="rating">3.4 ¡Ú¡Ú¡Ú¡Ú¡Ú</a>(5)
						</span>
					</div>			
					<div class="section-result-details-container">
							<div class="section-result-address">
								°æ±âµµ ¾È¾Ó½Ã ¾È¾Óµ¿ ¾È¾ÓÈ£ ¾È¾Ó¾ÆÆÄÆ®
							</div>
							<div class="section-result-phone">
								010-2222-5555
							</div>
						</div>
					</div>
					<div class="section-imgage-container">
					<img id="hardy" src="./resources/icons/category/hardy.png">
				</div>
			</div>	
		</div>
		
	</div>
</div>
