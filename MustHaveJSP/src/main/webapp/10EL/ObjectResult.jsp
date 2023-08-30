<%@page import="common.Person"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery 3.7.0 적용 -->
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<!-- BootStrap 5.3.1  및 4.6.2 적용 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<script type="text/javascript">

	console.log("${Login}");
</script>
<title>표현 언어(EL) - 객체 매개변수</title>

</head>

<body>
	<h2>영역을 통해 전달된 객체 읽기</h2>
	<!-- 
		영역에 저장된 속성에 EL로 접근할 때는 속성명이 중복되지 않는 경우라면
		EL내장객체 없이 속성명 만으로 접근할 수 있다.
		즉 requestScope.personObj.nam형태로 기술하지 않아도 된다.
	 -->
	<ul>
		<!-- 
			"속성명.멤버변수"형태로 기술하면 객체에 선언된 getter()를 자동으로 호출하여
			값을 출력한다. 즉 아래문장은 getter()를 호출하므로 Person클래스에서 
			getName()을 주석처리하면 에러가 발생한다.
			또한 출력시 자동형변환이 이루어지므로 더욱 편리하다.
		 -->
		<li>Person 객체 => 이름 : ${ personObj.name }, 나이: ${ personObj.age }</li>
		<!-- 리퀘스트 영역을 지정하는 requestScope는 생략할 수 있다. -->
		<li>String 객체 => ${requestScope.stringObj }</li>
		<li>Integer 객체 => ${ integerObj }</li>
	</ul>
	<h2>JSP 내장객체를 통해 영역의 값을 읽어오기</h2>
	<%
	//영역에는 모든 객체를 저장할 수 있는 공간이므로 Object형으로 저장된다.
	Object object = request.getAttribute("personObj");
	//따라서 영역에서 객체를 꺼낸 후 사용시에는 원래의 타입으로 형변환해야 한다.
	Person person = (Person) object;
	//출력시에는 멤버변수에 직접 접근할 수 없으므로 getter()를 사용한다.
	out.println("이름: "+person.getName());
	out.println("나이: "+person.getAge());
	//이 절차를 EL에서는 자동 박싱,언박싱을 통해 알아서 구현한다.
	%>
	<!-- 
		파라미터로 전달된 값을 읽을 때 아래 2가지 방법을 사용할 수 있다.
			param.파라미터명
			param['파라미터명']
			param["파라미터명"]
	 -->
	<h2>매개변수로 전달된 값 읽기</h2>
	<ul>
		<!-- 
			EL에서 산술연산이 가능하므로 아래에서는 30이 출력된다.
			또한 파라미터로 전달된 문자열을 정수로 자동변환 해준다.
		 -->
		<li>${param.firstnum+param['secondnum'] }</li>
		<!-- 단순한 출력이므로 10+20 이 출력된다. -->
		<li>${param.firstnum}+${ param.secondnum }</li>
	</ul>
	
	
	
</body>
</html>