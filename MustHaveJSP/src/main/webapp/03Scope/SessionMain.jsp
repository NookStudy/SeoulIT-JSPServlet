<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>    						
<!DOCTYPE html>
<%
/*
	session 영역: 클라이언트가 웹브라우저를 최초로 연 후 닫을때까지 요청되는 
		모든페이지는 session영역을 공유할 수 있다.
		 즉, 세션(session이란 클라이언트가 ) 
*/
ArrayList<String> lists = new ArrayList<String>();
lists.add("리스트");
lists.add("컬렉션");
session.setAttribute("lists", lists);
%>
<html>
<head>
<meta charset="UTF-8">
<title>session 영역</title>
</head>
<body>
	<h2>페이지 이동 후 session 영역의 속성 읽기</h2>
	<!-- 
		모든 실행창(웹브라우저)을 닫은 후 해당 페이지를 단독으로 실행하면
		NullpointException이 발생된다. 세션영역은 웹브라우저를 닫으면 소멸된다.
	 -->
	<a href="SessionLocation.jsp">SessionLocation.jsp 바로가기</a>
</body>
</html>