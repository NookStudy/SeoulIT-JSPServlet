<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    trimDirectiveWhitespaces="true"
     %>
     <%-- trimDirectiveWhithespaces : 지시어 속성 중 상단의 불필요한 공백을 삭제한다.
    		콜백데이터는 해당페이지에 출력되는 모든 소스코드를 반환하게 되는데,
    		공백도 하나의 문자이므로 필요없는 경우제거하는 것이 좋다. --%>
<%@ page import="java.util.*"%>    						
<%
//하루동안 열지 않음 체크박스를 체크한 후 닫기 버튼을 누르면 값1이 파라미터로 전달됨.
String chkVal = request.getParameter("inactiveToday");
//파라미터의 값이 null 이 아니고, 동시에 1이면... 
if(chkVal != null&&chkVal.equals("1")){
	//쿠키는 생성자를 통해서만 생성할 수 있다. PopupClose라는 쿠키를 생성한다.
	Cookie cookie = new Cookie("PopupClose","off");
	//쿠키가 사용될 경로를 지정한다.
	cookie.setPath(request.getContextPath());
	//1일간
	cookie.setMaxAge(60*60*24);
	response.addCookie(cookie);
	
	
	
	out.println(request.getContextPath());
	out.println("쿠키: 하루동안 열지 않음");
}
%>