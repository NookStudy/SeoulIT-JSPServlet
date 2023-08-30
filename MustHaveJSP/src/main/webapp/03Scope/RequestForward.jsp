<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>    						
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 영역</title>
</head>
<body>
	<h2>포워드로 전달된 페이지		</h2>
	<h4>RequestMain 파일의 리퀘스트 영역 속성 읽기</h4>
	<%
	/*
		앞 페이지에서 포워드 한 페이지이므로 request영역이 공유되어 아래 속성값을
		문제없이 출력할 수 있다.
		NOOK_ 이 경우 페이지 속성을 지워지지만 request속성은 남아있게 된다.
			request는 하나의 요체ㅓㅇ에 의해 호출된 페이지와 포워드되 ㄴ페이지까지 공유된다.
	*/
	Person pPerson = (Person)(request.getAttribute("requestPerson"));
	%>
	<ul>
		<!-- 앞에서 remove되었으므로 null이 출력된다. -->
		<li>String 객체 : <%= request.getAttribute("requestString") %></li>
		<li>Person 객체 : <%= pPerson.getName()%>,<%=pPerson.getAge() %></li>
	</ul>
	<h4>매개변수로 전달된 값 출력하기</h4>
	<%
		request.setCharacterEncoding("UTF-8");
	//get방식으로 날아온 'paramxxx'출력
		out.println(request.getParameter("paramHan"));
		out.println(request.getParameter("paramEng"));
	%>
	
</body>
</html>