<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
try{
	Class.forName("org.mariadb.jdbc.Driver");
	String url = "jdbc:mariadb://192.168.137.221:3306/subwayspot";
	String user = "root";
	String pw = "1234";
	DriverManager.getConnection(url, user, pw);
}
catch(Exception e) {
	System.out.println("에러 = " + e);
}
%>
</body>
</html>