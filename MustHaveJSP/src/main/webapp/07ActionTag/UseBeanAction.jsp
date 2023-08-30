<%@ page import="java.util.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - useBean</title>
</head>
<body>
	<!-- 
		폼값을 전송하는 페이지에서 input태그의 name속성과 이를 저장할
		이티오 객체의 멤버변수명이 반드시 일치해야 하고, 또한 값설정을 위한
		getter,setter메소드가 반드시 정의되어 있어야 한다.
	 -->
<%-- 	 <%request.setCharacterEncoding("UTF-8"); %>	이거매번 귀찮으니까 웹에 박아버림 --%>
	<h3>액션 태그로 폼값 한번에 받기</h3>
	
	<jsp:useBean id="person" class="common.Person"/>
	<jsp:setProperty property="*" name="person"/>
	<!-- 전송된 폼값이 자바빈즈에 제대로 들어왔는지 확인해야 한다. -->
	<ul>
		<li>이름 : <jsp:getProperty name="person" property="name" /></li>
		<li>나이 : <jsp:getProperty name="person" property="age" /></li>
	</ul>
</body>
</html>