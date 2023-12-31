<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>
	<h2>3.요청 헤더 정보 출력하기</h2>
	
	<%
	/* 
		getHeaderNames() : 사용자의 요청헤드를 얻어올 때 사용하는 메서드로 반환타입은
			Enumeration객체이다.
		hasMoreElements(): 출력할 정보가 있는지 확인하여 boolean값으로 반환한다.
		 nextElement(): 헤더명을 반환한다.
	*/
	Enumeration headers = request.getHeaderNames();
	while(headers.hasMoreElements()){
		String headerName = (String)headers.nextElement();
		String headerValue = request.getHeader(headerName);
		out.println("헤더명: " +headerName+", 헤더값: "+headerValue+"<br/>");
	}
	%>
	<p>이 파일을 직접 실행하면 referer 정보는 출력되지 않습니다.</p>
</body>
</html>