<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>소셜 로그인 - 구글3</title>
	<script src="http://code.jquery.com/jquery.js"></script>
	<meta name="google-signin-client_id"
		content='288185885862-873t4c0m5g9bltqacs56mev5e8nra5a2.apps.googleusercontent.com'>
	<script >
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			$('#my-signin2').css('display','none');
			$('#logou').css('display','block');
			$('#upic').attr('src',profile.getImageUrl());
			$('#uname').html('['+profile.getName()+']');
		}
		function onFailure(error) {
			
		}
		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function () {
				$('#my-signin2').css('display','block');
			$('#logout').css('display','none');
			$('#upic').attr('src','');
			$('#uname').html('');
			});
		}
		function renderButton() {
			gapi.signin2.render('my-sginin2',{
				'scope': 'profile email',
				'width': 240,
				'height': 50,
				'longtitle': true,
				'theme': 'dark',
				'onsuccess': onSignIn,
				'onfailure': onfailure
			});
		}
		$(document).ready(function () {
			
		});
	</script>
</head>
<body>
	<div id="my-signin2"></div>
	<div id="logout" style="display: none;"></div>
	<input type="button" value="로그아웃"  onclick="signOut();"/> <br />
	
	<img src="" alt="" id="upic" /> <br />
	<span id="uname"></span>
	<script src="https://apis.google.com/js/platform.js?onlad=renderButton" async defer></script>
</body>
</html>