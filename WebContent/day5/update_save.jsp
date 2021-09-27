<%@page import="day5.dao.MybatisDao"%>
<%@page import="day3.dto.Customer"%>
<%@page import="day3.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int idx = Integer.parseInt(request.getParameter("idx")); // update_view에서 input태그를 추가해서 idx를 불러올수있게 한다
	String email = request.getParameter("email"); 
	String addr = request.getParameter("addr"); 
	if(addr.equals("기타")) addr = request.getParameter("addr_etc"); 
	
	Customer cus = new Customer();
	cus.setEmail(email);
	cus.setAddr(addr);
	cus.setIdx(idx);
	
	MybatisDao dao = MybatisDao.getInstance();
	dao.update(cus); //매소드 실행에 필요한 모든 값이 cus 객체에 저장되어있는지 확인이 필요합니다.
	
//	response.sendRedirect("list.jsp"); //고객정보 수정을 완료하고 돌아갈 url
	response.sendRedirect("update.jsp?alert=&idx="+idx); //예,http://localhost:8082/jsp1/member/update.jsp?idx=11
//위 2개중 하나씩만

%>