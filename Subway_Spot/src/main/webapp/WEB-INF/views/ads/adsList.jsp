<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>Subway Spot_ADS</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
img {width:330px; height:330px;}
.txt_line { width:200px; padding:0.5px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }
</style>
<body class="w3-light-grey w3-content" style="max-width:1600px">

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:75px">

  <!-- Header -->
  <header id="portfolio">
    <div class="w3-container">
    <h1><b>광고 요청 게시판</b></h1>
	 <div class="w3-section w3-bottombar w3-padding-16">
      <span class="w3-margin-right"></span> 
      <button class="w3-button w3-black" id="hBtn">HOME</button>
      <button class="w3-button w3-white" id="wBtn"><i class="fa fa-diamond w3-margin-right"></i>글쓰기</button>
    </div>
    </div>
  </header>
  
  <!-- First Photo Grid-->
 <div class="w3-row-padding">
  <c:forEach var="data" items="${LIST}">
    <div class="w3-third w3-container w3-margin-bottom">
      <a href="../ads/adsDetail.sub?nowPage=${PINFO.nowPage}&oriNo=${data.oriNo}">
      <img src='../imgupload/${data.saveName}' alt="사진" style="width:100%" class="w3-hover-opacity">
      </a>
      <div class="w3-container w3-white">
        <p><b>${data.title}</b></p>
        <p class="txt_line">${data.body}</p>
      </div>
    </div>
   </c:forEach>
 </div>
  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <c:if test="${PINFO.startPage eq 1}">	
      	<span class="w3-bar-item w3-button w3-hover-black">«</span>
      </c:if>
      <c:if test="${PINFO.startPage ne 1}">
      	<a href="../ads/adsList.sub?nowPage=${PINFO.startPage-1}" class="w3-bar-item w3-button w3-hover-black">«</a>
      </c:if>
      <c:forEach var="page" begin="${PINFO.startPage}" end="${PINFO.lastPage}">
      	<a href="../ads/adsList.sub?nowPage=${page}" class="w3-bar-item w3-button w3-hover-black">${page}</a>
      </c:forEach>
      <c:if test="${PINFO.lastPage eq 1}">
      <a class="w3-bar-item w3-button w3-hover-black">»</a>
      </c:if>
      <c:if test="${PINFO.lastPage ne 1}">
      <a href="../ads/adsList.sub?nowPage=${PINFO.lastPage+1}" class="w3-bar-item w3-button w3-hover-black">»</a>
      </c:if>
    </div>
  </div>


  
  <div class="w3-black w3-center w3-padding-24">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div>

<!-- End page content -->
</div>

<script src= "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

$(document).ready(function(){
	
	//글쓰기 요청 버튼
	$("#wBtn").click(function(){
		$(location).attr("href","../ads/adsWrite.sub");
	});
	
	//홈 버튼
	$("#hBtn").click(function(){
		$(location).attr("href","../main.sub");
	});
});
</script>

</body>
</html>
