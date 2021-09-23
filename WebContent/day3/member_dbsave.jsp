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
<!-- 이 파일에서는 사용자 정보를 전달 받아서 화면에 출력. 그리고 이후에는 데이터베이스에 데이터를 저장합니다. -->
<%
	//서버에서 데이터 처리를 위한 자바코드
	//form data(method post)로 전달된 데이터의 인코딩 필요합니다.
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name"); 
	String email = request.getParameter("email"); 
	int age = Integer.parseInt(request.getParameter("age"));  //Vo 객체 저장할떄 필요
	String addr = request.getParameter("addr"); 
	if(addr.equals("기타")) addr = request.getParameter("addr_etc"); 
	
	String gender = request.getParameter("gender"); 
	//참고 : hobby는 배열입니다. -> getParameterValues() 메소드로 데이터를 받습니다. ->리턴  타입은 String[]
	String[] hobby = request.getParameterValues("hobby"); 
	String hobby1 = Arrays.toString(hobby).substring(1, Arrays.toString(hobby).length()-1);
	String password = request.getParameter("password");
	
	Customer cus = new Customer(0,name,password,email,addr,gender,age,hobby1);
	CustomerDao dao = CustomerDao.getInstance();
	dao.insert(cus);
%>
<h3>WELCOME!!! 환영합니다.</h3>
<ul>
	<li id="name">이름 : <%= name %> 님</li>
	<li>email : <%= email%></li>
	<li>나이 : <%= age%>세</li>
	<li>주소 : <%= addr%></li>
	<li>성별 : <%= gender.equals("male")?"남":"여"%></li>
	<li>취미 : <%= hobby1%></li>
</ul>
<a href="member_list.jsp">회원 리스트</a>
</body>
</html>