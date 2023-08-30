<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	HTML 주석 : 보통의 경우 인클루드되는 JSP파일은 HTML태그 없이 순수한JSP 코드만
		작성하는 것이 좋다. 포함되었을 때 html태그가 중복될수 있기 대문이다.
 -->
 <%-- 
 	JSP 주석 : 포함되는 페이지를 만들대에도 반드시 page지시어는 있어야 한다.
 	page 시시어가 없는 JSP파일은 오류가 발생한다.
  --%>
<%
LocalDate today = LocalDate.now();//오늘날짜
LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);//내일 날짜
%>
