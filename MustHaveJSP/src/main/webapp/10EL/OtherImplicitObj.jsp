<%@page import="utils.CookieManager"%>
<%@ page import="java.util.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
//쿠키 유틸리티 클래스를 사용해서 유지시간이 10초인 쿠키를 만든다.
CookieManager.makeCookie(response, "ELCookie", "EL좋아요", 10);
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
<!-- jquery 3.7.0 적용 -->
<script  src="https://code.jquery.com/jquery-3.7.0.js"
  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>표현 언어(EL) - 그 외 내장 객체</title>
</head>
<body>
	
	<h3>쿠키값 읽기</h3>
	<!-- 
		EL로 읽을 때 cookie.쿠키명.value로 기술한다.
		단, 쿠키는 생성직후에는 읽을 수 없다. (쿠키의 특성)
	 -->
	<li>ELCookie값: ${cookie.ELCookie.value }</li>
	
	<h3>HTTP 헤더 읽기</h3>
	<ul>
		<li>host: ${header.host}</li>
		<!-- 
			user-agent 와 같이 속성명에 -(하이픈)이 포함된 경우에는 .으로 출력할 수 없다.
			이 때는 반드시 대괄호("[]")를 사용해야 한다.
			"header.user-agent"와 같이 사용하면 값이 출력되지 않는다.
		 -->
		<li>user_agent: ${header['user-agent'] }</li>
		<li>cookie: ${header.cookie }</li>
	</ul>
	
	<!-- web.xml에 기술한 내용을 읽어온다. -->
	<h3>컨텍스트 초기화 매개변수 읽기</h3>
	<li>OracleDriver: ${ initParam.OracleDriver }</li>
	
	<!-- 이클립스 환경에서는 "/프로젝트명" 으로 출력된다. -->
	<h3>컨텍스트 루트 경로 읽기</h3>
	<li>${pageContext.request.contextPath }</li>
	
</body>
</html>