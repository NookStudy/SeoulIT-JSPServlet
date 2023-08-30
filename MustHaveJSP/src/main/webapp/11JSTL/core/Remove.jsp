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
<!-- jquery 3.7.0 적용 -->
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>JSTL - remove</title>
<!-- 변수선언 -->
<!-- 동일한 이름으로 4가지 영역에 속성 저장 -->
<c:set var="scopeVar" value="Page Value"></c:set>
<c:set var="scopeVar" value="Request Value" scope="request"></c:set>
<c:set var="scopeVar" value="Session Value" scope="session"></c:set>
<c:set var="scopeVar" value="Application Value" scope="application"></c:set>
</head>
<body>
	<h4>출력하기</h4>
	<!-- 
		동일한 이름으로 저장했을으므로 영역명을 지정하지 않은 상태라면
		가장 좁은 page영역의 속성값이 출력된다.
	 -->
	<ul>
		<li>scopeVar: ${scopeVar }</li>
		<li>requestScope.scopeVar: ${requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar: ${sesssionScope.scopeVar }</li>
		<li>applicationScope.scopVar: ${applicationScope.scopeVar }</li>
	</ul>
	<h4>session영역에서 삭제하기</h4>
	<!-- 영역을 지정한 상태에서 속성 삭제. session만 삭제됨. -->
	<c:remove var="scopeVar" scope="session"></c:remove>
	<ul>
		<li>scopeVar: ${scopeVar }</li>
		<li>requestScope.scopeVar: ${requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar: ${sesssionScope.scopeVar }</li>
		<li>applicationScope.scopVar: ${applicationScope.scopeVar }</li>
	</ul>

	<h4>스코프 지정없이 삭제하기</h4>
	<!-- 모든영역에서 삭제된다. 주의할 것.  -->
	<c:remove var="scopeVar"></c:remove>
	<ul>
		<li>scopeVar: ${scopeVar }</li>
		<li>requestScope.scopeVar: ${requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar: ${sesssionScope.scopeVar }</li>
		<li>applicationScope.scopVar: ${applicationScope.scopeVar }</li>
	</ul>
</body>
</html>