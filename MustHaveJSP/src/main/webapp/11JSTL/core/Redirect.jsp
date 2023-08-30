<%@page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- core 라이브러리 적용 --%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - redirect</title>
</head>
<body>
	<!-- 
		redirect 태그: 태그가 실행되는 즉시 페이지가 이동된다.
			새로운 페이지에 대한 요청이므로 request영역은 공유되지 않는다. 
			절대 경로 사용시 컨텍스트루 경로는 제외한다.
	 -->
	 <!-- request영역에 변수를 저장한다. -->
	<c:set var="requestVar" value="MustHave" scope="request"/>
	<!-- 페이지 이동 시 파라미터를 전달한다. -->
	<c:redirect url="/11JSTL/inc/OtherPage.jsp">
		<c:param name="user_param1">출판사</c:param>
		<c:param name="user_param2">골든래빗</c:param>
	</c:redirect>
	<!-- 
		response내장객체를 통한 이동시에는 컨텍스트루트 경로를 반드시 기술해야 한다.
		또한 파라미터가 한글인 경우 깨짐 현상이 발생하므로 URLEncode 클래스를 통해 인코딩 처리를 해야한다.
	 -->
	<h4>JSP 내장객체를 통한 페이지 이동</h4>
	<%
// 	String p1 = URLEncoder.encode("서울아이티");
// 	String p2 = URLEncoder.encode("홍대지점");
// 	response.sendRedirect(request.getContextPath()+"/11JSTL/inc/OtherPage.jsp?user_param1="+p1+"&user_param2="+p2);
	%>
</body>
</html>