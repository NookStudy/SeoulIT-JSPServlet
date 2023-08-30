<%@page import="utils.BoardPage"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
//DB 연결 및 CRUD작업을 위한 DAO 객체 생성
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


/**페이처리 start**/
//web.xml에 설정한 컨텍스트 초기화 파라미터를 읽어와서 산술연산을 위해 
//정수(int)로 변환한다.
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
/*
	전체 페이지수를 계산한다.
	(전체게시물 갯수/페이지당 출력할 게시물 갯수) => 결과값의 올림처리
	가령 게시물의 갯수가 51개라면 나눴을 때 결과가 5.1이 된다.
	이 때 무조건 올림처리 하여 6페이지ㅏ 나오게 된다.
	만약 totalcount를 더블로 형변환하지 않으면 정수의 결과가 나오게 되므로 
	6페이지가 아니라 5페이지가 된다. 
	따라서 주의해야 된다.
*/
int totalPage = (int)Math.ceil((double)totalCount/pageSize);

/*
	목록에 처음 진입했을 때는 페이지관련 파라미터가 없는 상태이므로 무조건
	1page로 지정한다. 만약  pageNum이 있다면 request 내장객체를 통해 받아온 후
	페이지번호로 지정한다.
	List.jsp 	=> 이와같이 파라미터가 없는 상태일 때는 null
	List.jsp?pageNum=   => 이와같이 파라미터는 있는데 값이없을 때는 빈값으로 체크된다.
		따라서 아래 if문은 2개의 조건으로 구성해야 한다.
*/
int pageNum =1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals("")){
	pageNum = Integer.parseInt(pageTemp); //요청받은 페이지로 수정
}
/*
	게시물의 구간을 계산한다.
	각 페이지의 시작번호와 종료번호를 현재페이지번호와 페이지사이즈를 통해
	계산한 후 DAO로 전달하기 위해 Map컬렉션에 추가한다.
*/
int start = (pageNum -1 ) * pageSize +1;
int end = pageNum * pageSize;
param.put("start", start);
param.put("end", end);
/**페이처리 end**/

//목록에 출력할 게시물을 추출하여 반환
List<BoardDTO> boardLists = dao.selectListpage(param);
//자원해제
dao.close();

String showId = (String)session.getAttribute("UserId");
if(showId != null)
	System.out.println("현재 접속된 아이디: "+showId);
%>
<!DOCTYPE html>
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.7.0.js"
  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<!-- 공통 링크 -->
	<jsp:include page="../Common/Link.jsp"/> 
	
	<!-- 앞에서 계산해둔 전체페이지수와 파라미터를 통해 얻어온 현재 페이지번호를 출력 -->
	<h2>목록 보기(List) - 현재페이지: <%=pageNum %>(전체: <%=totalPage %>)</h2>
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
		
		//페이지가 적용된 가상번호를 계산하기 위해 생성한 변수
		int virtualNum = 0;
		int countNum=0;
		
		//출력게시물 존재시 확장 for문으로 List컬렉션에 저장된 갯수만큼 반복하여 출력.
		for (BoardDTO dto : boardLists) {
			//현재 출력한 게시물의 갯수에 따라 출력번호는 달라지므로(검색등) 
			//totalCount를 사용하여 가상번호를 부여한다.
// 			virtualNum = totalCount--;;
			
			//현재 페이지번호를 적용한 가상번호 계산하기.
			//전체 게시물 수 - (((현재페이지-1)*한페이지 출력갯수)+countNum증가치)
			virtualNum = totalCount-(((pageNum-1)*pageSize)+countNum++);
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
		<tr align="center">
			<td>
			<!-- 
				totalCount : 전체 게시물 갯수
				pageSize : 한페이지에 출력할 게시물의 갯수
				blockPage : 한블럭당 출력할 페이지번호의 갯수
				pageNum : 현재페이지 번호
				request.getRequestURI() : request 내장객체를 통해 현재페이지의 Host를 제외한
						나머지 경로면을 얻어올 수 있다. 여기서 얻은 경로명을 통해 
						"경로명.jsp?pageNum=페이지번호"와 같은 바로가기링크를 생성한다.
			 -->
				<%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI())%>
			</td>
			<!-- 글쓰기 버튼 -->
			<td><button type="button" onclick="location.href='Write.jsp';">글쓰기
				</button></td>
		</tr>
	</table>

</body>
</html>