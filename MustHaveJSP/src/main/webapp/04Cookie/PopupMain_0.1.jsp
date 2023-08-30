<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
String popupMode = "on";
%>    						
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>PopupMain_0.1</title>
<style>
/*
	스킨만 적용된 팝업창
*/
	div#popup{
		position: relative; background-color: gray; top: 100px;left: 50px;
		color: yellow ; width: 270px; height: 100px;
	}
	div#popup>div{
		position: relative; background-color: #ffffff; top: 0px; border: 1px solid gray;
		padding: 10px; color: black;
	}
</style>
<script>
	$(function(){
		$('#closeBtn').click(function(){
			$('#popup').hide();
		});
	});
</script>
</head>
<body>
	<h2>팝업 메인 페이지(ver 0.1)</h2>
	<%
		for(int i= 1; i<=10;i++){
			out.print("현재 팝업창은 " +popupMode+"상태입니다.<br>");
		}
		if(popupMode.equals("on")){
	%>
		<div id="popup">
			<h2 align="center">공지사항 팝업</h2>
			<div align="right"><form name="popFrm">
				<input type="checkbox" value="1" id="inactiveToday" />
				하루동안 열지않음
				<input type="button" value="닫기" id="closeBtn" />
			</form>
			</div>
		</div>
	<%
		}
	%>
</body>
</html>