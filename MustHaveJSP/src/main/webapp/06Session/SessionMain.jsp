<%@ page import="java.util.*"%> 
<%@ page import="java.text.SimpleDateFormat"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
<%
// 세션 유지시간 설정1(메서드 사용)
session.setMaxInactiveInterval(60*10);

//시간 서식지정
SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

//세션 요청(시작)시간
long creationTime = session.getCreationTime();
String creationTimeStr = dateFormat.format(new Date(creationTime));

//마지막 시간
long lastTime = session.getLastAccessedTime();
String lastTimeStr = dateFormat.format(new Date(lastTime));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<h2>Session 설정 확인</h2>
	<!-- 
		세션 유지 시간은 별도의 설정이 없으면 30분(1800)초로 지정된다.
		web.xml에서 <session-config> 엘리먼트를 통해 분 단위로 지정할 수 있다.
	 -->
	<ul>
		<li>세션 유지 시간: <%= session.getMaxInactiveInterval() %> </li>
		<li>세션 아이디 : <%=session.getId() %></li>
		<li>최초 요청 시각 : <%= creationTimeStr %></li>
		<li>마지막 요청 시각 : <%= lastTimeStr %></li>
		<!-- 마지막 요청시가 이후 timeout시간이 넘어가면 세션은 자동으로 닫히게 된다. -->
	</ul>
</body>
</html>