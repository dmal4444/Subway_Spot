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
      <button class="w3-button w3-white" id="mBtn"><i class="fa fa-diamond w3-margin-right"></i>수정</button>
      <button class="w3-button w3-white w3-hide-small" id="dBtn"><i class="fa fa-photo w3-margin-right"></i>삭제</button>
      
    </div>
    </div>
  </header>

 <form method="post" id="frm" action="../ads/adsModifyProc.sub" enctype="multipart/form-data">
 <input type="hidden" id="oriNo" name="oriNo" value="${INFO.oriNo}">
 <input type="hidden" id="nowPage" name="nowPage" value="${INFO.nowPage}">
	<div class="w3-row-padding" style="margin-left:350px">
	    <div class="w3-third w3-container w3-margin-bottom" style="width:700px;" >
	      <div class="w3-container w3-white">
		  <br>
			title: <input type="text" id="title" name="title" value="${LIST.title}"> 
			password: <input type="password" id="pw" name="pw" placeholder="비밀번호를 다시 입력해주세요." style="width:200px;"><br>
			<br>
			<input type="file" id="path" name="path" value="${LIST.saveName}">
			<br><br>
	
			<textarea id="body" name="body" style="width:100%; height:500px;">${LIST.body}</textarea>
	
	      </div>
	   </div>
	</div>
</form>

  
  <div class="w3-black w3-center w3-padding-24">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div>

<!-- End page content -->
<form id="dfrm" method="post" action="../ads/adsDeleteProc.sub">
 <input type="hidden" id="oriNo" name="oriNo" value="${INFO.oriNo}">
 <input type="hidden" id="pw" name="pw" value="${LIST.pw}">
 
</form>

  	
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
	
	//수정 버튼 
	$("#mBtn").click(function(){
		var pw=$("#pw").val();
		var fileName=$("#path").val();
		if(pw==''){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		if(fileName==''){
			alert("파일을 추가해주세요.");
			return;
		}
		$("#frm").submit();
	});
	
	//삭제 버튼
	$("#dBtn").click(function(){
		var pw=$("#pw").val();
		if(pw=='' || pw!='${LIST.pw}'){
			alert("비밀번호가 다릅니다.");
			return;
		}
		
		$("#dfrm").submit();
	});
	
	//목록 버튼
	$("#rBtn").click(function(){
		$(location).attr("href","../ads/adsList.sub");
	});
});
</script>

</body>
</html>
