<%@ page import="java.util.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
//Java코드를 통한 일반적인 변수 선언
int num =3;
// page 영역에 속성값 저장
pageContext.setAttribute("num2", 4);
pageContext.setAttribute("num3", "5");
pageContext.setAttribute("num4", "8");
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
<title>표현 언어(EL) - 연산자</title>
</head>
<body>
	<!-- 
		EL 및 JSTL은 영역에 저장된 속성들을 이용해서 연산하거나 출력한다.
		따라서 스크립틀렛에서 선언한 num1은 가져올 수 없다.
	 -->
	<h3>변수 선언 및 할당</h3>
	<!-- num1은 가져오지 못한다. -->
	스크립틀릿에서 선언한 변수; ${ num1 }<br>
	page 영역에 저장된 변수: ${num2 } <br />
	<!-- 
		톰켓8.0부터는 EL에서 변수할당을 할 수 있다.
		하지만 할당과 동시에 출력되므로, 할당문 뒤에 ;''를 붙여줘야 출력되지 않는다.
		즉, El에서 변수할당은 많이 사용되지 않는다.
	 -->
	변수 할당 및 즉시 출력: ${num1=7 } <br />
	변수 할당 및 별도 출력: ${num2=8 ;'' } => ${num2 } <br />
<%-- 	영역할당 : ${session.Str1 = "할당해봄";'' } => ${ Str1} --%>
	num1 = ${num1 },num2= ${num2 }, num3= ${num3 },num4=${num4}
	
	<h3>산술 연산자</h3>
	num1 + num2: ${num1 + num2 } <br />
	num1  - num2: ${num1 - num2 } <br />
	num1  * num2: ${num1 * num2 } <br />
	num1  / num2: ${num1 / num2 } <br />
	<!-- 나눗셈에서 /와 div연산자를 사용할 수 있다.
	또한 자동 형변환이 되므로 정수끼리의 연산에서 실수의 결과가 나올 수 있다. -->
	num1 div  num2: ${num1 div num2 } <br />
	num1  % num2: ${num1 % num2 } <br />
	num1  mod num2: ${num1 mod num2 } <br />
	
	<!--  EL에서는 +는 덧셈연산만 가능하고, 문자열의 연결에는 사용되지 않는다. -->
	<h3> + 연산자는 덧셈만 가능</h3>
	num1 +"34": ${num1+"34" } <br />
	<!-- 숫자와 문자열 혹은 문자열과 숫자열의 경우에는 연산이 불가능 하므로 예외발생함 -->
	num2 + "이십" : \${num2+"이십" } <br />
	"삼십" + "사십" : \${"삼십"+"사십" } <br />
	
	<!-- 
		> : gt(Greater then) 
		>= : ge(Greater then Equal)
		<  : lt(Less then)
		<= : le(less then)
		== : eq(equal)
		!= : ne(Not Equal)
		Java에서 사용하던 기본적인 비교연산자와 문자형태의 연산자 두가지 모두 사용할 수 있다.
	 -->
	<h3>비교 연산자</h3>
	num4 > num3: ${num4 gt num3 } <br />
	num1 < num3: ${num1 lt num3 } <br />
	num2 >= num3: ${ num2 ge num4 } <br />
	num1 == num4: ${ num1 eq num4 } <br />
	
	<h3>논리연산자</h3>
	num3 <= num4 && num3 == num4: ${num3 le num4 and num3 eq num4 } <br />
	num3 >= num4 || num3 != num4: ${ num3 ge num3 or num3 ne num3 }
	
</body>
</html>