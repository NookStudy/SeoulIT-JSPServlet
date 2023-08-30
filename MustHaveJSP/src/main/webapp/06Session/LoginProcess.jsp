<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page import="java.util.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
//로그인 폼에서 입력한 아이디, 패스워드를 받는다.
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");
System.out.println(userId+" : "+userPwd);

//web.xml에 입력한 컨텍스트 초기화 파라미터를 읽어온다.
//해당 정보는 오라클에 접속하기 위한 값으로 구성되어 있다.
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

//위 정보를 통해 DAO객체를 생성하고 이 때 오라클에 연결된다.
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
//폼값으로 받은 아이디, 패스워드를 인수로 전달하여 로그인 처리를 위한 쿼리를 실행한다.
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
///자원해제
dao.close();

if(memberDTO.getId()!=null){
	//로그인에 성공한 경우라면(테이블에서 데이터를 가져오는데 성공했다면)
	//세션영역에 회원아이디와 이름을 저장한다.
	//NOOK_session영역에 setattribute로 UserId라는 변수선언후 oracle에서 가져온 값으로 초기화.
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	//로그인 페이지로 이동한다
	response.sendRedirect("LoginForm.jsp");
}else{
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>
