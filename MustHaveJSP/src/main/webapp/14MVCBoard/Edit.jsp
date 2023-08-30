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
<script type="text/javascript" src="../naver-editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	/*
		패스워드 검증을 했으므로 패스워드는 제외
		다만 패스워드 수정이 불가...
	*/
	function validateForm(form){
		if(form.name.value==""){
			alert("작성자를 입력하세요");
			form.name.focus();
			return false;
		}
		if (form.title.value=="") {
			alert("제목을 입력하세요");
			form.title.focus();
			return false;
		}
		if (form.content.value=="") {
			alert("내용을 입력하세요");
			form.content.focus();
			return false;
		}
	}
	function form_check() {
    	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
    	
	    document.modify_form.submit();
    }

</script>
</head>
<body>
	<h2>파일 첨부형 게시판 - 수정하기(Edit)</h2>
	<!-- 
		글쓰기 페이지를 그대로 사용하되 action부분만 수정.
		수정시에도 파일엌ㅁ부가 있으므로 enctype속성은 유지되어야 한다.
	 -->
	<form action="../mvcboard/edit.do" onsubmit="return validateForm(this);"
		name="wrtieFrm" method="post" enctype="multipart/form-data"> 
	<!-- 게시물 수정을 위한 일련번호 -->
	<input type="hidden" name="idx" value="${dto.idx }" />
	<!-- 기존의 원본파일명 : 기존파일을 유지할때와 새로업로드할때를 위해 따로 설정-->
	<input type="hidden" name="prevOfile" value="${dto.ofile }" />
	<!-- 기존은 서버저장 파일명 -->
	<input type="hidden" name="prevSifle" value="${dto.sfile }"/>
	<br />
<%-- 	검증된 패스워드 : ${ pass } --%>
<%-- 	param 패스 : ${ param.pass } --%>
<!-- 	<br /> -->
<%-- 	세션영역 패스 : ${sessionScope.pass } --%>
<%-- 	리퀘스트영역 패스 : ${requestScope.pass }		 --%>
	<table border="1" style="width:90%;">
		
		<tr>
			<td>작성자</td>
			<td>
				<input type="text" name="name" style="width: 90%;" value="${dto.name }" />
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<input type="text"  name="title" style="width: 90%;" value="${dto.title }" />
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="content" style="width: 90%; height: 100px;">${dto.content }</textarea>
<%-- 				<textarea name="content" id="ir1" rows="10" cols="100" style="width: 90%; height: 100px;">${dto.content }</textarea> --%>
<!-- 				<script type="text/javascript"> -->
<!-- // 					var oEditors = []; -->
<!-- // 					nhn.husky.EZCreator.createInIFrame({ -->
<!-- // 					    oAppRef: oEditors, -->
<!-- // 					    elPlaceHolder: "ir1", -->
<!-- // 					    sSkinURI: "../naver-editor/SmartEditor2Skin.html", -->
<!-- // 					    fCreator: "createSEditor2" -->
<!-- // 					}); -->
<!-- 				</script> -->
			</td>
		</tr>
		<tr>
			<td>첨부 파일</td>
			<td>
				<input type="file"  name="ofile"/>
			</td>
		</tr>
		<!-- 패스워드 저장부분은 삭제한다_Nook_나는 넣을꺼다.. pass도 변경할수 있게 둬야지 -->
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="pass" id="" style="width:130px" value=${ sessionScope.pass } >
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" >작성완료</button>
				<button type="reset">RESET</button>
				<button type="button" onclick="location.href='../mvcboard/list.do';">목록 바로가기</button>
			</td>
		</tr>
	</table>	
	</form>
</body>
</html>