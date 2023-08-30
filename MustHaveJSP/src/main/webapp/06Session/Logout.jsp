<%@ page import="java.util.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
// 로그아웃 처리를 위한 방법
// 1.회원인증 정보를 session 영역에서 삭제한다.(속성자체가 아니고 속성의 값이 사라짐)
session.removeAttribute("UserId");
session.removeAttribute("UserName");
System.out.println( session.getAttribute("UserId"));

//2.session 영역에 모든속성을 한꺼번에 삭제한다.(세션의 모든데이터 삭제(파라미터 자체 삭제))
session.invalidate();


// System.out.println( session.getAttribute("UserId"));//무효화되어서 가져올수조차없다.
response.sendRedirect("LoginForm.jsp");
%>