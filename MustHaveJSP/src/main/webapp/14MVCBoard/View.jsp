<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- core 라이브러리 적용 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
</head>
<body>
	<h2>파일 첨부형 게시판 - 상세보기(View)</h2>
	<table border="1" style="width: 90%">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="*" />
		</colgroup>
		<!-- 게시글 정보 -->
		<tr>
			<td>번호</td>
			<td>${dto.idx }</td>
			<td>작성자</td>
			<td>${dto.name }</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${dto.postdate }</td>
			<td>조회수</td>
			<td>${dto.visitcount }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${dto.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3" height="100">${dto.content }
				<c:if test="${isImage eq true }" var="isntImage">
					<p>
						<img src="../Uploads/${dto.sfile }" alt="" width="25%"/>
					</p>
				</c:if>
			</td>
		</tr>
		<!-- 첨부된 파일이 있는 경우에는 파일명과 다운로드 링크를 출력한다. 
			다운로드가 완료되면 다운로드 횟수를 1ㅡ증가시키기 위헤 게시물의 일련번호를 파라미터로 전달-->
		<c:if test="${not empty dto.ofile }">
			<tr>
				<td>첨부파일</td>
				<td>${dto.ofile } <a
					href="../mvcboard/download.do?ofile=${row.ofile }&sfile=${row.sfile}&idx=${row.idx}">
						[Download] </a>
				</td>
				<td>다운로드수</td>
				<td>${dto.downcount }</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="4" align="center">
				<button type="button"
					onclick="location.href='../mvcboard/pass.do?mode=edit&idx=${param.idx}';">수정하기
				</button>
				<button type="button"
					onclick="location.href='../mvcboard/pass.do?mode=delete&idx=${param.idx}';">삭제하기</button>
				<button type="button" onclick="location.href='../mvcboard/list.do';">목록
					바로가기</button>
			</td>
		</tr>
	</table>
</body>
</html>