<%@ page import="java.util.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 액션 태그 - forward</title>
</head>
<body>

	<h2>포워드 결과(FowradSub)</h2>
	<ul>
	<!-- reqeust영역은 공유하지만 page는 다르다.  -->
		<li>
			page 영역: <%= pageContext.getAttribute("pAttr") %>
		</li>
		<li>
			request 영역: <%= request.getAttribute("rAttr") %>
		</li>
	</ul>
	
</body>
</html>