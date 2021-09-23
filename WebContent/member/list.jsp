<%@page import="day3.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="day3.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	CustomerDao dao = CustomerDao.getInstance();
	List<Customer> list = dao.selectAll();
	
	request.setAttribute("list", list); 
	pageContext.forward("list_view.jsp");  //view :화면출력을 위해서 작성되는 파일.
%>


<!--list.jsp 파일은 사용자 입력과 출력은 포함하고 있지
	 않고 데이터 처리,db sql 실행 메소드 호출 등으로 프로그래밍되어 있어서
    .jsp 형식으로도 작성될 수 있습니다.-->