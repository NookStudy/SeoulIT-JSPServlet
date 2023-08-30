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
<title>DirectServletPrint.jsp</title>
</head>
<body>
<!-- 
	컨텍스트 루트를 제외한 상대경로로 링크한다.
 -->
	<h2>web.xml에서 매핑 후 SErvlet에서 직접 출력하기</h2>
	<form action="../13Servlet/DirectServletPrint.do" method="post">
		<input type="submit" value="바로가기" />
	</form>
</body>
</html>