<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    buffer="1kb"
    autoFlush="true"%><!-- 버퍼 설정  -->
 	<!-- 
 		JSP는 홤녀상에 내용을 출력할 땨ㅐ 항상 버퍼에 먼저 저장함.
 		buffer속성을 통해 버퍼 용량을 저장할 수 있는데,
 		autoFlush속성을 통해 버퍼가 꽉 찬 격우 내보내기 할지를 설정한다.
  	-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - buffer, auto Flush속성</title>
</head>
<body>

<%
/* 
	for문을 통해 10글자(10byte)를 100번 반복해서 출력하므로 1,000byte가 된다.
	여기에 HTML태그들이 있으므로 해당 페이지의 용량은 1kbyte를 초과하게되어
	실행시 에러가 난다.
*/

for(int i= 1; i<=100; i++){
	out.println("abcde12345");
}
/* 
위와 같은 이유로 JSP에서 buffer의 용량을 지정하는 경우는 거의 없다.
단,JSP가 웹브라우저에 내용을 출력할 때 버퍼를 사용한는 것을 인지하고
이를통해 에러페이지 처리나 포워드 등의 기능을 수행할 수 있게 된다.
*/

%>
</body>
</html>