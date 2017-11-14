<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<!-- <meta charset="UTF-8"> -->
<title>SUBWAY SPOT</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8;" />

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel = "stylesheet" type = "text/css" href = "resources/CSS/googleMap.css" />
<link rel = "stylesheet" type = "text/css" href = "resources/CSS/main.css" />
<link rel = "stylesheet" type = "text/css" href = "resources/CSS/myPathStyle.css" />

<body style="height:900px; width:100%">

<script src= "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="http://www.html5andcss3.org/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="resources/JS/googleMap.js"></script>
<script type="text/javascript" src="resources/JS/mainJS.js"></script>
<script type="text/javascript" src="resources/JS/myPathJS.js"></script>

<div id="mySidenav" class="sidenav" style="background-color:white;">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	<jsp:include page="WEB-INF/views/PathFinder.jsp"/>
	
</div>

<!-- Use any element to open the sidenav -->
<span onclick="openNav()"></span>

 
<div id="main_div" style="height:100%; width:100%;">
	<input id="pac-input" class="controls" type="text" placeholder="Search Box">
	<div id="map" >
	</div>
</div> 

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDhoF35DeeyJ6MerXtYAZhRNvq2vr2rcP0&libraries=places&callback=initMap" async defer></script>

</body>
</html>