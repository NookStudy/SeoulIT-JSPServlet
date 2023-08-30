<%@page import="java.sql.PreparedStatement"%>
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
	<h2>회원 추가 테스트(executeUpdate() 사용)</h2>
	<%
	JDBConnect jdbc = new JDBConnect();
	
	//입력할 회원데이터 준비(하드코딩)
	String id = "test1";
	String pass = "1111";
	String name = "테스트1회원";
	
	//인파라미터가 있는 동적 쿼리문을 준비한다.
	String sql = "insert into member values (?,?,?, sysdate)";
// 	String sql = "insert into member values (?,?,?, sysdate-7)";
// 	String sql = "insert into member values (?,?,?, '')";
// 	String sql = "insert into member values (?,?,?, '23/07/01')";
	//동적 쿼리문 실행을 위한 prepared 객체 생성
	PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
	//인파라미터 설정시 인덱스는 1부터 시작한다.
	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	pstmt. setString(3, name);
	
	//행에 변화를 주는 update,delete, insert 쿼리문은 
	//excuteUpdate() 메서드를 통해 실행한다.
	int inResult = pstmt.executeUpdate();
	out.println(inResult+"행이 입력되었습니다."	);
	
	//자원 소멸
	jdbc.close();
	%>
</body>
</html>