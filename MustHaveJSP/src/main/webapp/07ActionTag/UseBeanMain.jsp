<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - UseBean</title>
</head>
<body>
	<h2>useBean 액션 태그</h2>
	<h3>자바빈즈 생성하기</h3>
	<!-- 
		useBean 액션태그를 JSP로 표현하면 다음과 같다.
			import = "common.Person";
			Person person =(Person)request.getAttribute("person"); //request 영역에서 가져옴
			if(person ==null){		//없으면 새로 생성해서 저장 별표!!!! 기존 인스턴스를 확인함
			Person Person = new Person();
			request.setAttribute("person",person);
			}
	 -->
	<!-- 
	 	id="빈의 이름(참조변수명)" class="패키지를 포함한 클래스명"
	 	scope="저장할 영역명"//생략시 page
	  -->
	<jsp:useBean id="person" class="common.Person" scope="request" />
	<%-- 	<jsp:useBean id="person" class="common.Person" scope="request"/> 오류가 나브린다. --%>
	<jsp:useBean id="person2" class="common.Person" scope="request" />

	<h3>setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>
	<!-- DTO객체의 setter()메소드를 이용해서 값을 설정한다. 
		마찬가지로 원 class파일에 getter setter가 존재하지 않으면 실행 불가능하다.-->
	<!-- JSP로 표현하면 
			person.setName("임꺽정");
			person.setAge(41); 를 통해 값을 설정한다.
	-->
	<jsp:setProperty property="name" name="person" value="임꺽정" />
	<!-- DTO 객체의 getter()를 통해 값을 출력한다. -->
	<!-- 
		person.getName();
		person.getAge();
	 -->
	<%
	person.setName("홍길동");
	person2.setAge(12);
	person2.setName("고길동");
	%>
	<jsp:setProperty property="age" name="person" value="41" />
	<!-- NOOK_ 실제 class에 있는 property(멤버변수)가 아니면 저장하지 못한다. -->
	<%-- 	<jsp:setProperty property="job" name="person" value="lumber"/> --%>

	<h3>getProperty 액션 태그로 자바빈즈 속성 읽기</h3>
	<ul>
		<li>이름 : <jsp:getProperty name="person" property="name" /></li>
		<li>나이 : <jsp:getProperty name="person" property="age" /></li>
		<li>person2 나이 : <jsp:getProperty name="person2" property="age" /></li>
		<li>
			<%
			out.print("person2 이름 : " + person2.getName());
			%>
		</li>
	</ul>
	<!--Nook_ 이따구로 섞어 쓸 수도 있다. -->
	<!-- 그런데 와일드 카드를 쓰려면 useBean이 훨씬 유리하다. setxxx()를 반복할 필요가 읎다.  -->
</body>
</html>