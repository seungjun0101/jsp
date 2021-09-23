<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP1 프로젝트[5]</title>
</head>
<body>
<!-- 이 jsp파일의 역할 : 사용자가 서버에게 전송할 데이터를 입력하도록 합니다. -->
<h3>Request Parameter 연습 </h3>
<h5>::데이터를 사용작 입력하고 서버에 전송합니다.</h5>
<hr>

<!--Request Method 확인해보세요 -> GET -->
<h5>Request Method 를 GET로 실행합니다.(method 기본값은 get)</h5>
<form action="request_parameter.jsp"> <!-- action 은 데이터를 받을 서버의 url(파일명)  -->
	<input name="name" placeholder="이름을 입력"> <!--request.getParameter(이름) 로 실행할 이름과 같은 name을 설정합니다.  -->
	<input name="age" placeholder="나이를 입력">
	<input name="location" placeholder="지역을 입력">
	<input type="submit" value="전송(GET)">	<!--form 태그 요소의 값들을 서버에 전송합니다.  -->
</form>
 <hr>
<h5>Request Method 를 Post로 실행합니다.</h5>
<form action="request_parameter.jsp"  method="POST"> <!-- action 은 데이터를 받을 서버의 url(파일명)  -->
	<input name="name" placeholder="이름을 입력"> <!--request.getParameter(이름) 로 실행할 이름과 같은 name을 설정합니다.  -->
	<input name="age" placeholder="나이를 입력">
	<input name="location" placeholder="지역을 입력">
	<input type="submit" value="전송(POST)">	<!--form 태그 요소의 값들을 서버에 전송합니다.  -->
</form>
<!--
Request Method
GET : 입력데이터를 Query String으로 전달. 문자인코딩은 자동 UTF-8. 검색(조회) 로 사용한다.
POST : 입력데이터를 form data 로 전달. 문자인코딩은 꼭 설정 해줘야한다. 새로운 데이터의 저장 목적으로 사용한다. 
  -->




</body>
</html>