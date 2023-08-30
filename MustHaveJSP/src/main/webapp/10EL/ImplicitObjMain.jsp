<%@ page import="java.util.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
pageContext.setAttribute("scopeValue", "페이지 영역");
request.setAttribute("scopeValue", "리퀘스트영역");
session.setAttribute("scopeValue", "세션영역");
application.setAttribute("scopeValue", "애플리케이션 영역");
%>   
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
<!-- Jquery 3.7.0 적용 -->
<script
  src="https://code.jquery.com/jquery-3.7.0.js"
  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
  crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>표현 언어(EL)-내장객체</title>
</head>
<body>
	<h2>ImplicitObjMain페이지</h2>
	<h3>각 영역에 저장된 속성 읽기(JSP 내장객체 사용)</h3>
	<ul>
		<li>페이지 영역 : <%= pageContext.getAttribute("scopeValue") %></li>
		<li>리퀘스트 영역: <%= request.getAttribute("scopeValue") %></li>
		<li>세션 영역: <%= session.getAttribute("scopeValue") %></li>
		<li>애플리케이현 영역: <%= application.getAttribute("scopeValue") %></li>
	</ul>
	<!-- 4가지 영역에 접근할 때는 EL의 내장객체를 통해 내용을 출력한다.
		모두 동일한 패턴으로 "영역명scope"와 같은 형태로 되어있다.
		EL의 내장객체에.(닷)을 추가하여 속성명을 기술한다.
	 -->
	<h3>각 영역에 저장된 속성 읽기(EL사용)</h3>
	<ul>
		<li>페이지 영역 : ${ pageScope.scopeValue }</li>
		<li>리퀘스트 영역: ${ requestScope.scopeValue }</li>
		<li>세션 영역: ${ sessionScope.scopeValue }</li>
		<li>애플리케이현 영역: ${ applicationScope.scopeValue }</li>
	</ul>
	
	<!-- 
		만약 영역명 지정없이 속성을 읽을때는 가장 좁은 영역을 우선으로 출력한다.
		즉, 여기서는 Page영역의 속성을 출력하게 도니다. 실무에서는 동일한 속성명으로 
		저장하는 경우가 거의 없으므로 대부분 이와같이 사용할 수 있다.
	 -->
	<h3>영역 지정 없이 속성 읽기</h3>
	<ul>
	
		<li>${ scopeValue }</li>
	</ul>
	
	<jsp:forward page="ImplicitForwardResult.jsp"></jsp:forward>
</body>
</html>