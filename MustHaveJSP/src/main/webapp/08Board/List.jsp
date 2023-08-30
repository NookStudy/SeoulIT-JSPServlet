<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
//DB 연결 및 CRUD작읍을 위한 DAO 객체 생성
BoardDAO dao = new BoardDAO(application);

//검색어가 있으면 클라이언트가 선택한 필드명과 검색어를 저장할
//Map컬렉션 생성
Map<String, Object> param = new HashMap<String, Object>();

/*
	검색 폼에서 입력한 검색어와 필드명을 파라미터로 받아옴.
	해당 <form>의 전송방식은 get, action 속성은 없는 상태이므로
	현재 페이지로 폼값이 전송된다.
*/
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
//사용자가 입력한 검색어 존재....
if (searchWord != null) {
	//Map 컬랙션에 컬럼명과 검색어를 추가한다.
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}
//Map 콜럭션을 인수로 게시물 갯수 카운트
int totalCount = dao.selectCount(param);
//목록에 출력할 게시물을 추출하여 반환
List<BoardDTO> boardLists = dao.selectList(param);
//자원해제
dao.close();

String showId = (String)session.getAttribute("UserId");
if(showId != null)
	System.out.println("현재 접속된 아이디: "+showId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<!-- 공통 링크 -->
	<jsp:include page="../Common/Link.jsp" />

	<h2>목록 보기(List)</h2>
	<!-- 검색 폼 -->
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<!--
							 NOOK_add  value에 보드테이블에 컬럼에 해당하는 값을 적어주면
							 seachField가 컬럼이므로 컬럼값에 자동입력된다.
						-->
						<option value="id">작성자</option>
				</select> <input type="text" name="searchWord" /> <input type="submit"
					value="검색하기" /></td>
			</tr>
		</table>
	</form>
	<!-- 게시물 목록 테이블(표) -->
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		<!--  목록의 내용 -->
		<%
		if (boardLists.isEmpty()) {
		%>
		<!-- 내용이 읎으면 -->
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다^^*</td>
		</tr>
		<%
		} else {
		//현재 출력한
		int virtualNum = 0;
		//출력게시물 존재시 확장 for문으로 List컬렉션에 저장된 갯수만큼 반복하여 출력.
		for (BoardDTO dto : boardLists) {
			//현재 출력한 게시물의 갯수에 따라 출력번호는 달라지므로(검색등) 
			//totalCount를 사용하여 가상번호를 부여한다.
			virtualNum = totalCount--;
		%>
		<tr align="center">
			<!-- 게시물 가상번호 및 아이디 조회수 작성일 -->
			<td><%=virtualNum%></td>
			<!--  a태그로 게시물 클릭시 게시번호로 따라가게 만듬. a링크 내부에는 title입력 -->
			<td align="left"><a href="View.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a>
			</td>
			<td align="center"><%=dto.getId()%></td>
			<td align="center"><%=dto.getVisitcount()%></td>
			<td align="center"><%=dto.getPostdate()%></td>
		</tr>
		<%
			}
		}
		%>
	</table>

	<table border="1" width="90%">
		<tr align="right">
			<td><button type="button" onclick="location.href='Write.jsp';">글쓰기
				</button></td>
		</tr>
	</table>

</body>
</html>