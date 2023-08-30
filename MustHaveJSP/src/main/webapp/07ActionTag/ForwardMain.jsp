<%@ page import="java.util.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
pageContext.setAttribute("pAttr", "김유신");
request.setAttribute("rAttr", "계백");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - forward</title>
</head>
<body>
	<!-- 
		페이지 이동의 경우 새로운 페이지에 대한 요청이 발생하게 되므로
		완전히 서로 다른 페이지를 의미한다. 
		따라서 page영역, request영역 모두 공유되지 않는다.
	 -->
	 <%
//  	response.sendRedirect("FowardSub.jsp");
	 %>
	 <!-- error:응답이 이미 커밋된 후에는 forward할 수 없습니다. -->
	 
	 <!-- 
	 	포워드 된 페이지에서는 request영역이 공유된다.
	 	주소표시줄에는 최초 요청한 페이지의 경로가 보여지지만, 
	 	사용자는 foward된 페이지의 내용을 보게 된다. 
	 	  즉, 하나의 요청을 두개의 페이지가 공유하는 개념이다.
	  -->
	  <!--  NOOK_ forward시 response를 하지 않음으로써 request영역을 계속 공유하게 되는것.
	  		따라서 연속된페이지에서 forward사용시  request의 리소스가 계속 이어나가는것을 볼수있다.
	  		
	  		response.sendRedirect의 경우 response를 통해 응답하게되므로 클라이언트와 서버간 통신이 종료되어
	  		더이상 객체 리소스가 이어나가지 못한다. 
	    -->
	<h2>액션 태그를 이용한 포워딩</h2>
<%-- 	<jsp:forward page="/07ActionTag/ForwardSub.jsp"/> --%>
	<%
	/*
		액션 태그를 이용하면 JSP코드보다 훨씬 간결하게 코드를 표현할 수 있다.
	*/
		request.getRequestDispatcher("ForwardSub.jsp").forward(request, response);
	%>
</body>
</html>