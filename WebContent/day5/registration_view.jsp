<%@page import="day3.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<h3>WELCOME!!! 환영합니다.</h3>
<ul>
	<li id="name">이름 :${cus.name} 님</li>
	<li>email :${cus.email}</li>
	<li>나이 : ${cus.age}세</li>
	<li>주소 : ${cus.addr}</li>
	<li>성별 : ${cus.gender eq 'male'?'남성':'여성'}</li>
	<li>취미 : ${cus.hobby}</li>
</ul>
<a href="update.jsp?idx=${cus.idx}">정보 수정</a>
</body>
</html>












