<%@page import="common.Person"%>
<%@ page import="java.util.*"%>  
<!-- core 태그를 위한 taglib 지시어를 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- BootStrap 5.3.1  및 4.6.2 적용 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<!-- jquery 3.7.0 적용 -->
<script  src="https://code.jquery.com/jquery-3.7.0.js"
  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>JSTL - set 1</title>
</head>
<body>
<!-- 
	set태그 : 변수를 선언할 때 사용한다. JSP의 setAttribute()와 동일한 기능을 한다.
		4가지영역에 새로운 속성을 추가한다.
		속성정리
			var: 속성명(변수명). 즉 영역에 저장될 이름
			value:  속성값
			scope: 4가지 영역명을 지정. 미지정시 가장 좁은 page영역에 저장됨.
			target: set태그를 통해 생성된 자바빈즈의 이름을 지정함.
			property: target으로 지정한 자바빈즈의 멤버변수(property)값을 지정함. 
 -->
 
	<!-- 변수선언 -->
	<!-- 1.일반값을 사용함. -->
	<c:set var="directVar" value="100"/>
	<!-- 2.EL을 사용함 -->
	<c:set var="elVar" value="${directVar mod 5 }"/>
	<!-- 3.JSP 표현식(스클립틀릿)을 사용함 -->
	<c:set var="expVar" value="<%=new Date() %>"/>
	<!-- 4.value 속성을 대신하여 태그사이에 값을 지정함 -->
	<c:set var="betweenVar">변수값 요렇게 설정</c:set>
	<!-- 위 4개의 변수는 scope 지정이 없으므로 가장 좁은 page영역에 저장된다. -->
	
	<!-- 속성명이 중복되지 않는다면 영역을 표시하는 내장객체를 생략할 수 있다. -->
	<h4>EL을 이용해 변수 출력</h4>
	<ul>
		<li>directVar : ${pageScope.directVar }</li>
		<li>elVar: ${elVar}</li>
		<li>expVar: ${expVar }</li>
		<li>betweenVar: ${betweenVar }</li>
	</ul>	
	
	<!-- 클래스의 생성자를 통해 객체를 생성한 후 request영역에 저장한다. -->
	<h4>자바빈즈 생성 1 - 생성자 사용</h4>
	<!-- 
		JSTL은 JSP코드이므로 value속성에 기술할 때 객체를 생성하기 위한 더블쿼테이션이
		겹쳐지는 경우가 생성한다. 
			이때는 value를 싱글쿼테이션(')으로 감싸서 겹쳐지지 않게 처리해야 한다.
			or 더블쿼테이션 앞에 역슬래쉬(\)를 붙여서 사용한다. 
	 -->
	 <!-- 셋 다 사용가능 -->
	<c:set var="personVar1" value="<%= new Person(\"박문수\",50) %>" scope="request"/>
	<c:set var="personVar1" value='<%= new Person("박문수",50) %>' scope="request"/>
	<c:set var="personVar1" value='<%= new Person(\"박문수\",50) %>' scope="request"/>
	
	<ul>
		<!-- 
			자바빈즈의 getter()를 통해  
		      request영역에 저장된 자바빈즈를 출력 
      	-->
		<li>이름: ${requestScope.personVar1.name }</li>
		<li>나이: ${personVar1.age }</li>
	</ul>

	<!-- 빈 객체를 생성한 후 target, property를 통해 멤버변수의 값을 저장한다. -->	
	<h4>자바빈즈 생성2 - target,property 사용</h4>
	<c:set var="personVar2" value="<%= new Person() %>" scope="request"/>
	<!-- 
		자바빈즈의 setter를 통해 초기화 한다. 
		값을 나중에 설정하려면 target과 property 속성을 사용한다.
		target : 객체 이름     property: 멤버변수명 
	-->
	<c:set target="${personVar2 }" property="name" value="정약용"/>	
	<c:set target="${personVar2 }" property="age" value="60"/>
	<ul>
		<li>이름: ${personVar2.name }</li>
		<li>나이: ${requestScope.personVar2.age }</li>
	</ul>	
	
	<h4>NOOK_개인추가</h4>
		<!-- 재선언시 그대로 써주면 된다. -->
		<c:set var="directVar" value="change"></c:set>
		
		<ul><li>개추: ${directVar }</li></ul>	
</body>
</html>