<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
//Nook_ 위에 선언부 한개도 없어도 결과물은 똑같다.
//page 영역에 속성저장
pageContext.setAttribute("num1", 9);
pageContext.setAttribute("num2", "10");

//empty 연산자를 사용하기 위한 변수. 빈문자열, 원소가 없는 배열 등.
pageContext.setAttribute("nullStr", null);
pageContext.setAttribute("emptyStr", "");
pageContext.setAttribute("lengthZero", new Integer[0]);
pageContext.setAttribute("sizeZero", new ArrayList<Object>());
%>
<!DOCTYPE html>
<html>
<head>
<!-- BootStrap 5.3.1  및 4.6.2 적용 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<!-- jquery 3.7.0 적용 -->
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>표현 언어(EL) - 연산자</title>
</head>
<body>
	<!-- 
	null이거나, 빈문자열이거나, 길이가 0인 컬렉션 혹은 배열일 때
	empty 연산자는 true를 반환한다. 즉 객체가 비었는지 확인한다.
 -->
	<h3>empty 연산자</h3>
	empty nullStr:
	<%-- 	<%if( %> --%>
	<%-- 	${empty nullStr }  --%>
	<%-- 	<%){%> --%>
	<script>
		document.write("null이면 나오는 html jsp java의 콜라보레이션")
	</script>
	<%
	// 	}
	%>
	empty emptyStr: ${empty emptyStr }
	<br /> empty lengthZero: ${empty lengthZero }
	<br /> empty sizeZero: ${empty sizeZero }

	<h3>삼항 연산자</h3>
	<!-- EL식 내부에 Java와 동일한 형태로 기술하면 된다.-->
	num1 gt num2 ? "참" : "거짓" => ${ num1 gt num2 ? "num1이 크다": "num2가 크다" }

	<!-- 
 		EL에서 null을 0으로 판단한다. 따라서 아래의 결과는 10이 나오게 된다.
 		단, null과 정수를 연산하는 부분을 이클립스는 에러로 표시된다.
 		하지만 실행에는 전혀 문제가 없다.
 		아래 코드 때문에 프로젝트 전에체 에러가 표시되므로 JSP주석으로 막아둔다.
 	 -->
 	 <%-- 
	<h3>null 연산</h3>
	null +10: ${null+10 }
	<br /> nullStr +10: ${nullStr+10 }
	<br /> param.noVar > 10 : ${param.noVar >10 }
 	 --%>


</body>
</html>