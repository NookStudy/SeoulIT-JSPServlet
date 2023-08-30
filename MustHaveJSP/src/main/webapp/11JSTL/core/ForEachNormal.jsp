<%@ page import="java.util.*"%>
<%-- core 라이브러리 적용 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- BootStrap 5.3.1  및 4.6.2 적용 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<!-- jQuery 3.7.0 적용 -->
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>JSTL - forEach 1</title>
</head>
<body>
	<!-- 
	
 -->
	<h4>일반 for문 형태의 forEach태그</h4>
	<!-- 1부터 3까지 3번반복 -->
	<c:forEach begin="1" end="3" step="1" var="i">
		<p>반복 ${ i} 입니다</p>
	</c:forEach>
	<!-- 5~7까지 3번반복 -->
	<c:forEach begin="5" end="7" step="1" var="i">
		<p>반복 ${ i} 입니다</p>
	</c:forEach>

	<!-- 
		일반 for문에서 varStatus 속성: 반복과 관련된 정보를 추상화 한 클래스를 통해
		정보를 반환한다.
		count: 실제 반복횟수를 반환한다. 1부터 시작한다.
		index: 변수 i의 변환하는 값을 반환한다.
		first: 루프의 처음일때 true를 반환한다.
		current: 현재 loop의 변수값을 반환한다.(var 속성에 지정된 변수)
		*즉 일반 for문에서는 index와 current는 동일한 값을 반환한다.
	 -->
	<h4>varStatus 속성 살펴보기</h4>
	<table border="1">
		<c:forEach begin='3' end="5" var="i" varStatus="loop">
			<tr>
				<td>count: ${loop.count }</td>
				<td>index: ${loop.index }</td>
				<td>current: ${loop.current }</td>
				<td>first: ${loop.first}</td>
				<td>last: ${loop.last }</td>
			</tr>
		</c:forEach>
	</table>

	<h4>1에서 100까지 정수 중 홀수의 합</h4>
	<c:forEach begin="1" end="100" var="j">
		<c:if test="${j mod 2 ne 0 }">
			<c:set var="sum" value="${sum+j }" />
		</c:if>
	</c:forEach>
	1~100 사이의 정수 중 홀수의 합은? ${sum }

	<h4>연습문제01</h4>
	<!-- 
		연습문제] 아래 모양을 출력하시오. 단, JSTL의 foreach문과 if문을 활용하시오
		1 0 0 0 0 
		0 1 0 0 0
		0 0 1 0 0
		0 0 0 1 0
		0 0 0 0 1 
	 -->
	<c:forEach begin="1" end="5" var="i">
		<c:forEach begin="1" end="5" var="j">
			<c:if test="${i eq j}" var="rs">
					 1&nbsp;
				</c:if>
			<c:if test="${not rs }">	
						0&nbsp;
				</c:if>
		</c:forEach>
		<br />
	</c:forEach>

	<h4>연습문제02</h4>
	<!-- 앞의 문제를 choose~when~otherwise문으로 변경하시오 -->
		<c:forEach begin="1" end="5" var="i">
		<c:forEach begin="1" end="5" var="j">
			<c:choose>
				<c:when test="${ i eq j }"> 1&nbsp;</c:when>
				<c:otherwise> 0&nbsp;</c:otherwise>
			</c:choose>			
		</c:forEach>
		<br />
	</c:forEach>
	
</body>
</html>