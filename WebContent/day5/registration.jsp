<%@page import="day5.dao.MybatisDao"%>
<%@page import="day3.dao.CustomerDao"%>
<%@page import="day3.dto.Customer"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//서버에서 데이터 처리를 위한 자바코드
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");   
	String email = request.getParameter("email");
	int age = Integer.parseInt(request.getParameter("age"));   //Vo 객체에 저장할 때 필요합니다.
	String addr = request.getParameter("addr");
	if(addr.equals("기타")) addr= request.getParameter("addr_etc");
	
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");
	String hobbies = Arrays.toString(request.getParameterValues("hobby"));
	hobbies = hobbies.substring(1, hobbies.length()-1);
	//참고 : hobby는 배열입니다. -> getParamterValues() 메소드로 데이터를 받습니다. -> 변수 타입은 String[]			
	String password = request.getParameter("password");
	
	Customer cus = new Customer(0,name,password,email,addr,gender,age,hobbies);		
	MybatisDao dao = MybatisDao.getInstance();
	
	int idx = dao.insert(cus); 
	cus.setIdx(idx);// idx값을 dao.insert로 return하고 setIdx로 저장하고 전달하기 위해
	
	request.setAttribute("cus", cus);    //위에 2줄의 동작을 안하면 여기서 cus 객체는 idx값이 0인 상태
	pageContext.forward("registration_view.jsp");
%>
