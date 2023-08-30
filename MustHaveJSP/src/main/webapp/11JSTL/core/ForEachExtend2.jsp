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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<!-- jQuery 3.7.0 적용 -->
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>JSTL - forEach 2</title>
</head>
<body>
	<h4>List 컬렉션 사용하기</h4>
	<%
	//list계열의 컬렉션을 생성한다.
	LinkedList<Person> lists = new LinkedList<Person>();
	//3개의 person객체를 추가한다.
	lists.add(new Person("맹사성", 34));
	lists.add(new Person("장영실", 44));
	lists.add(new Person("신숙주", 54));
	%>
	<c:set var="lists" value="<%=lists%>" />
	<ul> <!--  ul 없으면 앞에 줄당 태그가 안생김 -->
	<!-- set 태그로 page영역에 속성(변수)를 저장한다. -->
		<c:forEach items="${lists }" var="list">
			<!-- 해당 변수를 통해 확장 for문을 실행한다. items에 지정한 컬렉션에 
	저장된 객체의 갯수만큼 반복하여 list로 하나씩 전달한다. -->
			<li>이름 : ${list.name }, 나이: ${list.age }</li>
		</c:forEach>
	</ul>
	
	<!-- 추가 -->
	<h4> Java코드를 통한 출력</h4>
	<%
	/*Java코드를 사용하면 출력할 객체를 명시하고, getter()메서드를 직접 호출해야 한다.*/
	for(Person p: lists){
		out.println("이름: "+p.getName()+", 나이: "+p.getAge()+"<br>");
	}
	
	%>
	
	
	<h4>Map 컬렉션 사용하기</h4>
	<%
	//Map계열의 컬렉션을 생성한다. Key는 String, Value는 Person 타입으로 지정한다.
	Map<String,Person> maps = new HashMap<String,Person>();
	maps.put("1st", new Person("맹사성",34));
	maps.put("2nd", new Person("장영실", 44));
	maps.put("3rd", new Person("신숙주", 54));
	%>
	<!-- JSTL을 통한 변수 저장 -->
	<c:set var='maps' value="<%=maps %>"/>
	<!-- Map컬렉션 사용시 Key를 별도로 얻어올 필요없이 객체.key 혹은
	객체.value를 통해 값을 출력할 수 있다. -->
	<ul>
	<c:forEach items='${maps  }'	var="map">
		<li>Key=> ${map.key } <br />
			Value => 이름: ${map.value.name }, 나이 : ${map.value.age }</li>
	</c:forEach>
	</ul>
	
	<h4>Java코드를 통한 출력</h4>
	<%
	//Map컬렉션은 항상 Key 를 먼저 얻어와야 한다.
	Set<String> keys = maps.keySet();
	//앞에서 얻어오 key의 갯수만큼 반복한다.
	for(String key: keys){
		//key를 통해 value를 얻어온다.
		Person p = maps.get(key);
		//Key와 value를 출력한다. 여기서 value는 Person 객체이므로 
		//멤버변수를 통해 값을 출력할 수 있다.
		out.println("Key=> "+key+"<br>");
		out.println("Value=> 이름: "+p.getName()+", 나이: "+p.getAge()+"<br>");
	}
	/*
		JSTL의 확장 for문을 사용하면 Key를 별도로 얻어와야 하는 번거로움이 
		없으므로 편리하다.
	*/
	%>
</body>
</html>