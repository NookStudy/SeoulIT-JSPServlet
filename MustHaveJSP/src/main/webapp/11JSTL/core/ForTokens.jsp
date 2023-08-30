<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- core 라이브러리 적용 --%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
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
<script  src="https://code.jquery.com/jquery-3.7.0.js"
  	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" 
  	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>JSTL - forTokens</title>
</head>
<body>
	<!-- 
		forTokens 태그: 문자열에서 특정 '구분자'를 통해 '반환된 배열의 크기'만큼 '반복'해야할 때 사용.
			속성]
				items: 구분자를 포함한 문자열을 지정한다. 단, 컬렉션이나 배열을 사용불가.
				delims(delimiter): 구분자를 지정한다.(여러가지 특수기호를 사용할 수 있다.)
				var: 구분자를 통해 잘라낸 토큰을 저장한다.
				
				*토큰이란? : 문법적으로 의미있는 최소단위를 말한다. 
					하이픈으로 구분되어 있는 전화번로를 분리했을 때 각각의 번호가 토큰이 된다.			
	 -->
	<%
	String rgba = "Red,Green,Blue,Black";
	%>
	<h4>JSTL의 forToken 태그 사용</h4>
	<c:forTokens items="<%=rgba %>" delims=", " var="color">
		<span style="color:${color};">${color }</span> <br />
	</c:forTokens>
	
	<h4>StringTokenizer 클래스 사용</h4>
	<%
	StringTokenizer tokens = new StringTokenizer(rgba,",");
	out.println("토큰수: "+tokens.countTokens()+"<br>");
	while(tokens.hasMoreTokens()){
		String token = tokens.nextToken();
		out.println(token+"<br>");
	}
	%>
	
	<h4>String 클래스의 split() 메서드 사용</h4>
	<%
	String[] colorArr = rgba.split(",");
	for(String s: colorArr){
		out.println(s+"<br>");
	}
	%>

</body>
</html>