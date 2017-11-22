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
			<div class="category">
				<span id="restaurant">				
					<img src="./resources/icons/category/restaurant_list_icon.png" alt="restaurant" title="restaurant" class="img-bottom">
					<img src="./resources/icons/category/restaurant_list_selected_icon.png" alt="restaurant" title="restaurant" class="img-top">
				</span>
				<span id="hotel">
					<img src="./resources/icons/category/hotel_list_icon.png" alt="hotel" title="hotel" class="img-bottom">
					<img src="./resources/icons/category/hotel_list_selected_icon.png" alt="hotel" title="hotel" class="img-top">
				</span>
				<span id="pub">
					<img src="./resources/icons/category/pub_list_icon.png" alt="pub" title="pub" class="img-bottom">
					<img src="./resources/icons/category/pub_list_selected_icon.png" alt="pub" title="pub" class="img-top">
				</span>
				<span id="tourism">
					<img src="./resources/icons/category/tourism_list_icon.png" alt="tourism" title="tourism" class="img-bottom">
					<img src="./resources/icons/category/tourism_list_selected_icon.png" alt="tourism" title="tourism" class="img-top">
				</span>
				<span id="park">
					<img src="./resources/icons/category/park_list_icon.png" alt="park" title="park" class="img-bottom">
					<img src="./resources/icons/category/park_list_selected_icon.png" alt="park" title="park" class="img-top">
				</span>
			</div>			
		<hr></hr>
		
		<div class="section-result">
			<div class="section1" id="section">
<!-- 				<div class="section-result-text-content">
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
					</div> -->
					<div class="section-imgage-container">
					<img id="hardy" src="./resources/icons/category/hardy.png">
				</div>
			</div>
			
			<!-- µÎ¹øÂ°-->
			<c:forEach begin="1" end="10">
				<hr>
				<div class="section1">
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
		</c:forEach>				
		</div>
	</div>
</div>
