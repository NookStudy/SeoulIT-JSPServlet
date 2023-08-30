<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LifeCycle.jsp</title>
</head>
<body>
	<script>
	/*
		폼값 전달 방식을 결정한다.
	*/
		function requestAction(frm,met) {
			if(met==1){
				frm.method = 'get';
			}else{
				frm.method='post';
			}
			frm.submit();
		}
	</script>
	
	<h2>서블릿 수명주기(Life Cycle) 메서드</h2>
	<!--  
		자바스크립터를 통해 폼값을 전달하므로 input태그는 button 타입으로 선언하고,
			onclick 이벤트핸들러에서 함수를 호출한다.
	-->
	<form action="./LifeCycle.do">
		<!-- 함수 호출시 form태그의 DOM을 인수로 전달한다. -->
		<input type="button" value="Get방식 요청하기" onclick="requestAction(this.form,1);"/>
		<input type="button" value="Post방식 요청하기" onclick="requestAction(this.form,2);" />		
	</form>
</body>
</html>