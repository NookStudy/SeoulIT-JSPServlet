<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page import="java.util.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>회원 목록 조회 테스트(excuteQuery() 사용)</h2>
	<%
	JDBConnect jdbc = new JDBConnect();
	
	// 인파라미터가 없는 정적 쿼리문을 작성한다.
	String sql = "select id, pass, name, regidate from member";
	// 정적쿼리 실행을 위한 statement객체를 생성한다.
	jdbc.stmt = jdbc.con.createStatement();
	//행에 영향이 없는 select 계열의 쿼리문은 excuteQuerty() 메서드를 통해 실행한다.
	//이때 반환타입은 ResultSet 이다.
	jdbc.rs = jdbc.stmt.executeQuery(sql);
	
	//반환받은 결과의 갯수만큼 반복하여 출력한다.
	while(jdbc.rs.next()){
		//각 컬럼에 접근시 1부터 시작하는 인덱스나 컬럼명 둘다 사용할 수 있다.
		String id = jdbc.rs.getString(1);
		String pwd = jdbc.rs.getString(2);
		String name = jdbc.rs.getString("name");
		java.sql.Date regidate = jdbc.rs.getDate("regidate");
		
		out.println(String.format("%s %s %s %s", id, pwd, name, regidate)+"<br/>");
	}
	
	//자원 해제
	jdbc.close();
	out.println(jdbc.stmt.toString());
	%>
	
	
	

</body>
</html>