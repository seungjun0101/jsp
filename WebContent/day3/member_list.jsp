<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="day3.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="day3.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day3[4]-DB 회원리스트</title>
<style>
	.list > li{
		background-color : tomato;
		color : white;
	}
	ul{
		display : flex;
		list-style: none;
		justify-content: space-between;
		padding-inline-start:0px; /* 목록 들여쓰기 */ 
	}
	ul #name{
		padding : 5px 20px;
		margin: 5px 0px;
		/* background-color : aqua;
		color: blue; */ 
		font-weight: bold; /* 폰트 굵기 : bold(굵다) */
	}
	ul #email{width : 20vW;}  /*vw는 화면크기를 100으로 하여 비율값 정합니다.  */
	ul #hobby{width : 20vW;}
	li{
		padding : 5px 20px;
		margin: 5px 0px;
		border : 1px solid gray;
		border-radius: 3px;
		width : 10vW;
	}
</style>
</head>
<body>
<%
CustomerDao dao = CustomerDao.getInstance();
List<Customer> list = dao.selectAll();
//out.print(list);

%>
<h3>고객 리스트 WELCOME!!</h3>
<ul class= "list">
	<li id="name">이름</li>
	<li id="email">email</li>
	<li>나이</li>
	<li>성별</li>
	<li>주소</li>
	<li id="hobby">취미</li>
</ul>
<%
	for(Customer cus : list ){ 
%>
<ul>
	<li id="name"><%=cus.getName() %> </li>
	<li id="email"><%=cus.getEmail() %> </li>
	<li><%=cus.getAge() %></li>
	<li><%= cus.getGender().equals("male")?"남":"여"%></li>
	<li><%=cus.getAddr() %></li>
	<li id="hobby"><%= cus.getHobby()%></li>
</ul>
<%} %>
</body>
</html>