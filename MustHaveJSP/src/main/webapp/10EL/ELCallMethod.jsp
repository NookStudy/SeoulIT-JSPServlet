<%@page import="el.MyELClass"%>
<%@ page import="java.util.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix ="mytag" uri="/WEB-INF/MyTagLib.tld" %>    
<%
//정적메소드가 아닌 일반적인 메서드는 객체를 통해 호출해야 하므로 
//객체를 생성한 후 EL에서 접근할 수 있도록 영역에 저장한다.
MyELClass myClass = new MyELClass();
pageContext.setAttribute("myClass", myClass); //page영역에 저징
%>    
<!DOCTYPE html>
<html>
<head>
<!-- BootStrap 5.3.1  및 4.6.2 적용 -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"  -->
<!-- integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"  -->
<!-- integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"  -->
<!-- integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous"> -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"  -->
<!-- integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous"> -->
<!-- jquery 3.7.0 적용 -->
<script  src="https://code.jquery.com/jquery-3.7.0.js"
  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>표현 언어(EL) - 메서드 호출</title>
</head>
<body>
	<!-- 일반적인 메서드 호출 -->
	<h3>영역에 저장 후 메소드 호출하기</h3>
	001225-3000000 => ${myClass.getGender("001225-3000000") } <br />
	001225-2000000 => ${myClass.getGender("001225-2000000") } <br />
	
	<!-- 정적메서드의 경우 객체생성없이 클래스명으로 직접 호출할 수 있다. -->
	<h3>클래스명을 통해 정적 메서드 호출하기</h3>
		${MyELClass.showGugudan(7) }
	
	<h3>JSP 코드를 통해 메서드 호출하기</h3>
	<%
	out.println(MyELClass.isNumber("백20") ? "숫자임" : "숫자아님");
	out.println("<br>");
	boolean isNumStr = MyELClass.isNumber("120");
	if(isNumStr==true)
		out.print("숫자입니다.");
	else
		out.print("숫자가 아닙니다.");
	%>
	
	<h3>TLD 파일 등록 후 정적 메서드 호출하기</h3>
	<ul>
		<li>mytag:isNumber("100") => ${mytag:isNumber("100") }</li>
		<li>mytag:isNumber("이백") => ${mytag:isNumber("이백") }</li>
	</ul>
</body>
</html>