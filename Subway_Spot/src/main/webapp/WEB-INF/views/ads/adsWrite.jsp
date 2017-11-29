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
      <button class="w3-button w3-black" id="rBtn">목록</button>
      <button class="w3-button w3-white" id="wBtn"><i class="fa fa-diamond w3-margin-right"></i>글쓰기</button>
    </div>
    </div>
  </header>

 <form method="post" id="frm" action="../ads/adsWriteProc.sub" enctype="multipart/form-data">
  <div class="w3-row-padding" style="margin-left:350px">
    <div class="w3-third w3-container w3-margin-bottom" style="width:700px;" >
      <div class="w3-container w3-white">
	  <br>
		title: <input type="text" id="title" name="title" placeholder="type title"> 
		password: <input type="password" id="pw" name="pw" placeholder="type password"><br>
		<br>
		<input type="file" id="path" name="path">
		<br><br>

		<textarea id="body" name="body" style="width:100%; height:500px;"  placeholder="광고주 여러분. 사진과 식당관련 간략한정보와 전화번호를 꼭 기입해주세요"></textarea>

      </div>
    </div>
  </div>
</form>

  
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
	
	//글쓰기 버튼 
	$("#wBtn").click(function(){
		$("#frm").submit();
		//$(location).attr("href","./adsWriteProc.sub");
	});
	
	//목록 버튼
	$("#rBtn").click(function(){
		$(location).attr("href","../ads/adsList.sub");
	});
});
</script>

</body>
</html>
