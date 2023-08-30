<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file = "IncludeFile.jsp" %>
<%-- 
	include 지시어를 통해 파일을 포함시키면 컴파일 되지 않은 원본상태의 코드가
	그대로 포함된 후 컴파일 지행.
	따라서 아래에서 사용된 변수들은 해당문서에 포함된 상태로 인식되므로
	문제없이 실행됨.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>include 지시어</title>
</head>
<body>
<%
out.println("오늘날짜: "+ today);
out.println("<br/> ");
out.println("내일날짜: "+ tomorrow);
%>
</body>
</html>