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
<title>JSTL- if</title>
</head>
<body>
	<!-- 변수 선언 -->
	<!-- 
		if 태그 : 조건을 확인하여 실행여부를 판단한다.
		속성정리
			test : EL을 이용해서 조건식을 삽입한다.
			var : test속성에서 판단한 결과값을 저장한다.
	 -->
	<c:set var="number" value="100" />
	<c:set var="string" value="JSP" />

	<h4>JSTL의 if 태그로 짝수 /홀수 판단하기</h4>
	<%-- 	<c:if test='${number mod 2 eq 0 }' var="result"> --%>

	<!-- 
		if(number%2 ==0)과 동일한 조건의 if문.
		조건의 결과가 result에 저장된다. 
		나머지가 0이므로 true저장
	 -->
	<%-- 	<c:if test='${ number mod 2 eq 0 }' var="result"> --%>
	<%-- 		${number }는 짝수입니다. <br /> --%>
	<%-- 	</c:if> --%>
	<%-- 	result: ${result } --%>
	<!-- 	<br /> -->

	<!-- 
		Java에서는 비교연산자 ==과 equals()는 다르지만, 
		EL에서는 eq를 통해 값에 대한 비교와 문자열에 대한 비교 모두를 할 수 있다.
		여기서 사용한 eq는 Java의 comperTo()와 같이 사전순으로 문자열을 비교한다. 
	 -->
	<h4>문자열 비교와 if else 구문 흉내내기</h4>
	<!-- 첫번째 if문은 false의 결과가 나온다.-->
	<c:if test="${string eq 'Java' }" var="result2">
		<!-- false -->
		문자열은 Java입니다. <br />
	</c:if>
	<!-- 
		result2 가 true 면 비활성화, false면 활성화. 
		마치 else문과 같은 느낌이다. 
	-->
	<c:if test="${ not result2 }">
		<!-- true -->
		'Java'가 아닙니다. <br />
	</c:if>

	<h4>조건식 주의사항</h4>
	<c:if test="100" var="result3">
		EL이 아닌 정수를 지정하면 FALSE  false이므로 출력이 안됌.
	</c:if>
	<%-- 	<c:if test="0" var="result3-1"> --%>
	<!-- 		EL이 아닌 수를 쌍다옴표 없이 지정하면 error -->
	<!-- 		0도 false -->
	<!-- 		null은 error -->
	<%-- 	</c:if> --%>
	<%-- 	<c:if test="null" var="result32"> --%>
	<!-- 		EL이 아닌 수를 쌍다옴표 없이 지정하면 error -->
	<!-- 		0도 false -->
	<%-- 	</c:if> --%>
	RESULT 3: ${result3 }
	<%-- 	RESULT 3-1: ${result3-1 }
	RESULT 3-2: ${result32 } --%>
	<br />
	<c:if test="tRuE" var="result4">
		대소문자 구분없이 "tRuE"인 경우 true <br />
	</c:if>
	result 4 : ${result4 }
	<br />
	<!-- 
		test에는 (")더블쿼테이션 앞뒤에 하나라도 공백이 들어가면 무조건 false를 반환한다.
	 -->
	<c:if test="   ${ true }" var="result5">
		<%-- 	<c:if test="${ true }" var="result5">  이경우는 true임--%>
		EL 양쪽에 빈공백이 있는 경우 false <br />
	</c:if>
	result5: ${result5 }
	<br />

	<h4>연습문제: if 태그</h4>
	<!-- 
		아이디, 패스워드를 입력후 submit 버튼을 누르면 EL식을 통해 파라미터를 받은후 
		seoulit/1234 인 경우에는 'seoulit님, 반갑습니다~' 이라고 출력한다.
		만약 틀렸다면 "아이디/비번을 확인하세요" 라고 출력한다.
		EL과 JSTL의 if태그만을 이용할 것.
	 -->

	<form action="" name="login" method="post">
		아이디: <input type="text" name="id" id="" /> <br> 패스워드: <input
			type="text" name="pw" id="" /> <br /> <input type="submit"
			value="로그인" />
	</form>
	<!-- 
		최초 실행시에는 파라미터가 없는 상태이므로 아무 내용도 출력되지 않는다.
	 -->
	<c:if test="${ not empty param.id}">
	 	전송된 아이디: ${param.id } <br />
	 	전송된 패스워드: ${param.pw } <br />
	</c:if>

	<!-- 
	 		아이디 패스워드를 입력했을 때만 일치여부를 판단한 후 결과를 변수에 저장.
	 		if태그는 else문이 없으므로 not을 통해 if else문을 구현해야 한다.
	 	 -->

	<c:if test="${param.id eq 'seoulit' and param.pw eq '1234' }"
		var="loginResult">
	 	${param.id }님, 반값습니다~ <br />
	</c:if>
	<c:if test="${ not loginResult }">
	 	아이디/비번을 확인하세요(1) <br />
	</c:if>



	<!--기존 java를 이용한 방법
request.getParameter("name")
EL을 이용한 방법
${ param.name }  -->
	<c:if test="${request.id eq 'seoulit' and request.pw eq '1234' }"
		var="rs">
		seoulit님, 반갑습니다~
	</c:if>
	session.id : ${page.id }
	<br /> request.pw : ${request.pw }
	<br /> request.pw : ${session.pw }
	<br /> request.pw : ${application.pw }
	<br /> rs: ${rs }
	<br />
	<c:if test="${ not rs}">
		아이디/비번을 확인하세요
	</c:if>
</body>

</html>