<!-- page 지시어 선언  -->
<%@page import="common.MyClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<%--
	선언부(Declaration) : 스크립틀릿이나 표현식에서 사용할 메서드를 선언할 때 사용한다.
	선언부에서 선언된 메서드는 해당 JSP가 서블릿(java파일)으로 벼환될 때
	멤버메서드 형태로 선언된다.
 --%>
<%!
 //2개의 정수의 합을 반환하는 메서드 정의
public int add(int num1, int num2){
	return num1+ num2;
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트요소</title>
</head>
<body>
<!-- 
	스크립틀릿(scriptlet): 주로 JSP코드를 작성하고 실행할 때 사용한다.
		스크립틀릿은 body, head 어디서든 사용할 수 있다. 
		또한 <scirpt> <style> 태그 내부에서도 사용할 수 있다.
		여기에 기술된 코드는 _jspService()메서드 내에 포함된다.
		그러므로 해당 영역에는 메서드를 선언할 수 있다.
	표현식(Expression): 변수를 웹브라우저상에 출력할 때 사용한다.
		JS의 document.write()와 동일한 역할을 한다. 표현식 사용시 주의할 점은
		문장끝에 ;(세미콜론)붙이지 않는다.
 -->
	<%
	int result = add(10,20);
	%>
	덧셈 결과 1 : <%= result %><br/>
	덧셈 결과 2 : <%= add(30,40) %>
	
	<h2>내가 만든 JAVA클래스의 메서드 호출하기</h2>
	<%
	int sum = MyClass.myFunc(1,100);
	out.println("1~100까지의 합: "+sum);
	%>
	
</body>
</html>