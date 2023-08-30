<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- core 라이브러리 적용 --%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FrontController.jsp</title>
</head>
<body>
	<h3>한번의 매핑으로 여러가지 요청 처리하기</h3>
	${resultValue }
	<ol>
		<li>URI: ${uri }</li>
		<li>요청명: ${commandStr }</li>
	</ol>
	<!--  
		요청명은 일괄적으로 .one으로 끝나는 형태로 생성한 후 링크를 건다.
		이처럼 요청명은 사용자가 임의로 정할 수 있다.
	-->
	<ul>
		<li><a href="../13Servlet/regist.one">회원가입</a></li>
		<li><a href="../13Servlet/login.one">로그인</a></li>
		<li><a href="../13Servlet/freeboard.one">자유게시판</a></li>
	</ul>
</body>
</html>