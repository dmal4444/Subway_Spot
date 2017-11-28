<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<!-- <meta charset="UTF-8"> -->
<title>SUBWAY SPOT</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8;" />

 <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
<style>
	body {
	  overflow-x: hidden;
	  font-family: 'Roboto Slab', 'Helvetica Neue', Helvetica, Arial, sans-serif; }

	 header.masthead {
	  text-align: center;
	  color: white;
	  background-image: url("./images/header-bg3.jpg");
	  filter:grayscale(50%);
	  background-repeat: no-repeat;
	  background-attachment: scroll;
	  background-position: center center;
	  -webkit-background-size: cover;
	  -moz-background-size: cover;
	  -o-background-size: cover;
	  background-size: cover; }
	  header.masthead .intro-text {
		padding-top: 150px;
		padding-bottom: 100px; }
		header.masthead .intro-text .intro-lead-in {
		  font-size: 22px;
		  font-style: italic;
		  line-height: 22px;
		  margin-bottom: 25px;
		  font-family: 'Droid Serif', 'Helvetica Neue', Helvetica, Arial, sans-serif; }
		header.masthead .intro-text .intro-heading {
		  font-size: 50px;
		  font-weight: 700;
		  line-height: 50px;
		  margin-bottom: 25px;
		  font-family: 'Montserrat', 'Helvetica Neue', Helvetica, Arial, sans-serif; }

@media (min-width: 768px) {
  header.masthead .intro-text {
    padding-top: 300px;
    padding-bottom: 200px; }
    header.masthead .intro-text .intro-lead-in {
      font-size: 40px;
      font-style: italic;
      line-height: 40px;
      margin-bottom: 25px;
      font-family: 'Droid Serif', 'Helvetica Neue', Helvetica, Arial, sans-serif; }
    header.masthead .intro-text .intro-heading {
      font-size: 75px;
      font-weight: 700;
      line-height: 75px;
      margin-bottom: 50px;
      font-family: 'Montserrat', 'Helvetica Neue', Helvetica, Arial, sans-serif; } }
	</style>

  <body id="page-top">
   <!-- Header -->
    <header class="masthead" style="height:1400px;">
      <div class="container">
        <div class="intro-text">
          <div class="intro-lead-in">Welcome!</div>
          <div class="intro-heading text-uppercase">It's SUBWAY SPOT</div>

        </div>
      </div>
    </header>

    </body>
<script src= "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
$(document).ready(function(){
	$(".intro-heading").click(function(){
		$(location).attr("href","http://192.168.137.44:8080/sub/main.sub");
	});
});
</script>
</html>
