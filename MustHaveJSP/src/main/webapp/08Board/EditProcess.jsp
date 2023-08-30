<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page import="java.util.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<% 
//수정폼에서 입력한 내용을 파라미터로 받는다.
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

//DTO객체에 수정할 내용을 세팅한다.
BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

//DAO객체 생성을 통해 오라클에 연결한다.
BoardDAO dao = new BoardDAO(application);
//update문을 실행하여 게시물을 수정한다.
int changeResult = dao.updateEdit(dto);
//자원해제
dao.close();

if(changeResult==1){
	//수정 성공시 수정된 내용을 확인하기 위해 상세 내용보기 페이지로 이동
		response.sendRedirect("View.jsp?num="+dto.getNum());
}else{
	//실패하면 알러트창 띄우고 전페이지로 돌아가기.
	JSFunction.alertBack("수정하기에 실패하였습니다.", out);
}
%>    