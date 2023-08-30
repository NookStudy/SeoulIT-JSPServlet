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
	<h2>액션 태그로 폼값 한번에 받기</h2>
	
	<form action="UseBeanAction.jsp" method="post">
		<!-- 폼값의 name이 javaBean(class)의 멤버변수명과 동일해야 
				받는페이지에서 폼값을 입력받을 수 있다. -->
		이름 : <input type="text" name="name" id="" /><br>
		나이 : <input type="text" name="age" id="" /><br>
		<input type="submit" value="폼값 전송" />
	</form>
</body>
</html>