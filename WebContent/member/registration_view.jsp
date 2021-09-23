<%@page import="day3.dao.CustomerDao"%>
<%@page import="day3.dto.Customer"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day3[3]</title>
<style>
	ul{
		list-style: none;
		padding-inline-start:0px; /* 목록 들여쓰기 */ 
	}
	ul #name{
		background-color : aqua;
		margin: 5px;
		color: blue; 
		font-weight: bold; /* 폰트 굵기 : bold(굵다) */
	}
	li{
		padding : 5px 20px;
	}
</style>
</head>
<body>
<%
	Customer cus = (Customer)request.getAttribute("cus");
%>
<h3>WELCOME!!! 환영합니다.</h3>
<ul>
	<li id="name">이름 : <%= cus.getName()%> 님</li>
	<li>email : <%= cus.getEmail()%></li>
	<li>나이 : <%= cus.getAge()%>세</li>
	<li>주소 : <%= cus.getAddr()%></li>
	<li>성별 : <%= cus.getGender().equals("male")?"남":"여"%></li>
	<li>취미 : <%= cus.getHobby()%></li>
</ul>
<a href="list.jsp">회원 리스트</a>
</body>
</html>