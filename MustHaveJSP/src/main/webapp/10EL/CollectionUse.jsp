<%@page import="common.Person"%>
<%@ page import="java.util.*"%>  
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
<title>표헌 언어(EL) - 컬렉션</title>
</head>
<body>
<h2>List 컬렉션</h2>
<%
//List컬렉션을 Object기반으로 생성한다.
List<Object> aList = new ArrayList<Object>();
//아래와 같이 타입 매개변수를 생략해도 Object 기반의 컬렉션이 된다.
// List aLsit2 = new ArrayList();

//String 객체 추가
aList.add("청해진");
//Person객체 추가
aList.add(new Person("장보고",28));
/*EL은 영역에 저장된 값을 대상으로 하므로 page 영역에 속성을 저장한다.*/
pageContext.setAttribute("Ocean", aList);
%>
<ul>
	<!-- String 객체가 출력된다. ArrayList는 배열의 특성을 가지고 있으므로
	인덱스로 접근할 수 있다. -->
	<li>0번째 요소 : ${Ocean[0] }</li>
	<!-- Person객체를 출력한다. 멤버변수명을 통해 getter()를 호출하여 출력한다.
		만약 Person클래스에 getter()가 정의되지 않으면 PropertyNotException이 발생하게 된다. -->
	<li>1번째 요소: ${Ocean[1].name} ,${Ocean[1].age }</li>
	<!-- 2번 인덱스에는 아무런 값도 없으므로 출력되지 않는다.
		Java코드라면 예외가 발생하겠지만 EL에서는 아무런 예외도 발생하지 않는다. -->
	<li>2번째 요소: ${Ocean[2]}</li>
</ul>
<h2>Map 컬렉션</h2>
<%
//한글을 key로 설정하여 값을 저장한다.
Map<String,String> map = new HashMap<String,String>();
//영문을 key로 사용한다.
map.put("한글","훈민정음");
// 페이지 영역에 저장한다.
map.put("Eng","English");
pageContext.setAttribute("King", map);
%>
<ul>
	<!-- 
		Key값이 영문인 경우에는 아래 3가지 방법 모두를 사용할 수 있다.
		단, 한글인 경우에는.(닷)으로 출력할 수 있다.
	 -->
	<li>영문 Key: ${King["Eng"] },${King['Eng'] },${King.Eng } </li>
	<!-- *EL 문법에서  '${ 앞에 ＼(역슬래시)가 붙으면 '${를 EL문법이 아닌 일반 텍스트로 취급한다.* -->
	<li>한글 Key: ${King["한글"] },${King['한글'] }, \${King.한글 }</li>
	<!-- \(주석)이 없으면 에러가 발생된다. -->
</ul>
</body>
</html>