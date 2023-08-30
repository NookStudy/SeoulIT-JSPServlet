<%@ page import="java.util.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- BootStrap 5.3.1  및 4.6.2 적용 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script  src="https://code.jquery.com/jquery-3.7.0.js" 
 integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>표현 언어(EL) - 내장객체</title>
</head>
<body>
	<h2>ImplicitFowardResult 페이지</h2>
	<h3>각 영역에 저장된 속성 읽기</h3>
	<!-- 
		포워드 되면 page영역은 소멸되고, request영역은 공유됨.
		따라서 페이지 영역 부분은 아무것도 출력되지 않음  
	-->
	<!-- 표현식으로 표현할 경우 null이 뜸 -->
	<%=pageContext.getAttribute("scopeValue") %> <%-- null --%> 
	<ul>
		<li>페이지 영역 : ${ pageScope.scopeValue }</li>
		<li>리퀘스트 영역: ${ requestScope.scopeValue }</li>
		<li>세션 영역: ${ sessionScope.scopeValue }</li>
		<li>애플리케이현 영역: ${ applicationScope.scopeValue }</li>
	</ul>
	<!-- 
		포워드 된 페이지에서는 page영역이 소멸되므로, request영역이 가장 좁은 영익임.
		즉 아래는 request영역의 속성값이 출력된다.
	 -->
		<h3>영역 지정 없이 속성 읽기</h3>
	<ul>
	
		<li>${ scopeValue }</li>
	</ul>
	<!-- 
		앞의 Main파일을 한번 실행하면 4가지 영역 전체에 속성값을 저장하므로
		session, application 영역에도 저장된다.
		이 값들은 브라우저를 종료하거나 혹은 서버를 종료해야 소멸되는 영역이므로
		해당파일을 단독으로 실행하더라도 값이 출력된다.
		이 때 가장 좁은 영역은 session이 된다.
		1. 메인 실행시 request가 가장 작은 영역
		2. 브라우저 미종료상태에서 foward실행하면 session이 가장 작은영역.
		3. 서버 종료 전까지 application값은 안사라짐.
	 -->
</body>
</html>