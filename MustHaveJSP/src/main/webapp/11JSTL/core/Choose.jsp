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
<title>JSTL - choose/when/otherwise</title>
</head>
<body>
<!-- 
	choose태그: 하위에 when, otherise태그를 가짐.
		여러조건이 있는경우 사용하기 적합하다.(switch)
 -->
 	<!-- 변수 선언 -->
	<c:set var="number" value="100"></c:set>
	
	<h4>choose 태그로 홀짝 판단하기</h4>
	<!-- 
		choose태그와 when태그 사이에 HTML주석을 기술하면 에러발생 
		또한 when태그와 ohterwise사이에도 기술하면 안된다. 
		결론: 태그시작하고 끝나는 사이에만 주석달아라. choose내부에 주석달지마라
	-->
	<c:choose>
		<c:when test="${ number %2 ==0 }">
			<!-- number를 2로 나눈 나머지가 0이면 짝수 -->
			${number }는 짝수입니다.
		</c:when>
		<c:otherwise>
			<!-- else와 동일 -->
			${number }는 홀수입니다.
		</c:otherwise>
	</c:choose>
	
	<h4>국,영,수 점수를 입력하면 평균을 내어 학점 출력</h4>
	<!-- form태그에 속성이 없으면 get방식으로 현재페이지로 폼값이 전송된다. -->
	<form action="">
		국어: <input type="text" name="kor" id="" />  <br />
		영어: <input type="text" name="eng" id="" /> <br />
		수학: <input type="text" name="math" id="" /> <br />
		<input type="submit" value="학점 구하기" />
	</form>
	
	<!-- 3과목 전부 입력되어야 조건만족 -->
	<c:if test='${not(empty param.kor or empty param.eng or empty param.math)}'>
		<!-- 3과목의 점수를 더한후 평균값을 구함. 이 값을 avg변수에 저장 -->
		<c:set var="avg" value='${(param.kor+param.eng+param.math)/3 }'/>
		평균점수: ${avg } <br /> 학점 :
		<!-- 평균점수를 통해 학점을 정한다. -->
		<c:choose>
			<c:when test='${ avg>100 }'> <br /> <span style="color:red;"> 잘못된 입력</span></c:when>
			<c:when test='${ avg>=90 and 100>= avg }'> A학점</c:when>
			<c:when test='${ avg>=80 }'> B학점 </c:when>
			<c:when test='${ avg ge 70 }'> C학점 <!-- ge는 >=와 같다 --> </c:when>
			<c:when test='${ avg ge 60 }'> D학점</c:when>
			<c:otherwise>F 학점</c:otherwise>
		</c:choose>
			입니다.
	</c:if>
		
</body>
</html>