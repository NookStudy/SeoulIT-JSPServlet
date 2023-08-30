<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<h4>OtherPage.jsp</h4>
<ul>
	<!-- request 영역에 저장된 변수값 출력 -->
	<li>리퀘스트 영역에 저장된 값: ${requestVar }</li>
	<li>페이지 영역에 저장된 값: ${pageVar }</li>
	<!-- ㅍ라미터로 전달된 값 출력. 해당 파라미터는 <param> 태그를 통해 전달 -->
	<li>매개변수1: ${param.user_param1 }</li>
	<li>매개변수2: ${param.user_param2 }</li>
</ul>
