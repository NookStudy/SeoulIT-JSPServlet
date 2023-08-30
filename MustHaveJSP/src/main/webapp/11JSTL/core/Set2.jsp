<%@page import="common.Person"%>
<%@ page import="java.util.*"%>
<%-- core 라이브러리 적용 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- BootStrap 5.3.1  및 4.6.2 적용 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!-- jquery 3.7.0 적용 -->
<script  src="https://code.jquery.com/jquery-3.7.0.js"
  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>JSTL - set 2</title>
</head>
<body>
	<h4>List 컬렉션 이용하기</h4>
	<%
	/* Person객체를 저장할 수 있는 List계열의 컬렉션을 생성한다.*/
	ArrayList<Person> pList = new ArrayList<Person>();
	//List 컬렉션에 객체를 추가한다.
	pList.add(new Person("성삼문",55));
	pList.add(new Person("박팽년",60));
	%>
	<!-- List컬렉션을 request영역에 저장 -->	
	<c:set var="personList" value="<%= pList %>" scope="request"></c:set>
	<!-- 
		2개의 객체 중 0번 인덱스 출력.
		List이므로 인덱스 접근 간으.
		차후 forEach태그를 사용하면 2개의 객체전부를 반복출력 가능하다.
	 -->
	<ul>
		<li>이름: ${requestScope.personList[0].name }</li>
		<!-- 다른 영역에 같은이름으로 저장된 속성이 없으므로 scope범위 생략가능 -->
		<li>나이: ${personList[0].age }</li>
	</ul>
	
	<h4>Map 컬렉션 이용하기</h4>
	<%
	/*
		Map의 Key는 String타입, Value는 Person타입으로 정의한 후 2개의 Person객체를 저장한다.
	*/
	Map<String,Person> pMap = new HashMap<String,Person>();
	pMap.put("personArgs1", new Person("하위지",65));
	pMap.put("personArgs2", new Person("이개",67));
	%>
	<!-- request영역에 Map컬렉션을 저장한다. -->
	<c:set var="personMap" value="<%= pMap %>" scope="request"></c:set>
	<!-- Map컬렉션 이므로 key를 통해 접근하여 출력한다. -->
	<ul>
		<li>아이디: ${requestScope.personMap.personArgs2.name }</li>
		<!-- 다른 영역에 같은이름으로 저장된 속성이 없으므로 scope범위 생략가능 -->
		<li>비번: ${personMap.personArgs2.age }</li>
	</ul>
</body>
</html>