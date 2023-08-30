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
<!-- jquery 3.7.0 적용 -->
<script  src="https://code.jquery.com/jquery-3.7.0.js"
  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>표현 언어(EL) - 폼값 처리</title>
</head>
<body>
<!-- 
		폼값으로 전송된 파라미터를 받을 때 EL의 내장객체를 사용할 수 있다.
		param : 단일값을 받을 때 사용한다.
		paramValues : 2개이상의 값을 받을 때 사용한다.
						단, 이 경우 배열을 통해 값을 구분해야 한다.
	 -->
	<h3>EL로 폼값 받기</h3>
	<ul>
		<li>이름: ${ param.name }</li>
		<li>성별: ${ param.gender }</li>
		<li>학력: ${ param.grade }</li>
		<!-- 
			checkbox의 경우 체크한 값만 서버로 전송되는데,
			EL은 NullpointerException이 발생하지 않으므로 아래와 같이 기술해도 문제없다.
		 -->
		<li>관심사항: ${paramValues.inter[0] }  
			${ paramValues.inter[1] } 
			${ paramValues.inter[2] }  
			${ paramValues.inter[3] }&nbsp;
		</li>
	</ul>
	<h3>JSP 내장객체를 통해 폼값 받기</h3>
	<%
	String name = request.getParameter("name");
	String[] interArr = request.getParameterValues("inter");
	
	out.println("이름: "+ name+"<br>");
	out.println("성별: "+ request.getParameter("gender"));
	out.println("관심사항1: "+interArr[0]);
	out.println("관심사항2: "+interArr[1]);
	out.println("<br>");
	out.println("<br>");
	%>
	<h4>for문으로 돌려서 뽑아내기</h4>
	<% 
	for(int i=0; i< interArr.length; i++){
		out.println("관심사항"+(i+1)+": "+interArr[i]+"<br>");
	}
	/*
		JSP내장객체를 통해 폼값을 받은 후 출력하는 경우 선택된 값이 1개밖에 없다면
		예외가 발생하게 된다. 이 경우 if문으로 값의 유무를 체크하거나 예외처리를 해야하므로
		EL에 비해서는 불편한 점이 있다.
	*/
	%>
	
</body>
</html>