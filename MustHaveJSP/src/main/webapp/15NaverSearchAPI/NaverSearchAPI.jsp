<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- core 라이브러리 적용 --%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<!-- jQuery 3.7.0 적용 --> 
<!-- <script  src="https://code.jquery.com/jquery-3.7.0.js" -->
<!--   	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="  -->
<!--   	crossorigin="anonymous"> </script>   -->
<!-- BootStrap 5.3.1  및 4.6.2 적용 --> 
<!-- <script  -->
<!-- 	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"  -->
<!-- 	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"  -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <script  -->
<!-- 	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"  -->
<!-- 	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"  -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <link rel="stylesheet"  -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"  -->
<!-- 	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"  -->
<!-- 	crossorigin="anonymous"> -->
<!-- <link  -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"  -->
<!-- 	rel="stylesheet"  -->
<!-- 	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"  -->
<!-- 	crossorigin="anonymous"> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>네이버 블로그 검색 API</title>
<script type="text/javascript">
	$(function() {
	  $.ajaxSetup({
		 url : "../NaverSearchAPI.do",
		 type: "get",
		 contentType : "text/html;charset:utf-8;",
		 dataType: "json",
		 success : sucFuncJson,
		 error: errFunc
	  });
	  $('#searchBtn').click(function () {
		$.ajax({
			data : {
				keyword: $('#keyword').val(),
				startNum: $('#startNum option:selected').val()
				},
			});
		});
	  	$('#startNum').change(function() {
	  	 	$.ajax({
				data: {
	  	 			keyword: $('#keyword').val(),
					startNum: $('#startNum option:selected').val()
	  	 		},
	  	 	});
	  	});
	});
	
	function sucFuncJson(d) {
		console.log("성공",d);
		var str = "";
		
		console.log("검색결과",d.total);
		$.each(d.items, function(i, item) {
		 	str+="<ul>";
		 	str+="	<li>"+(i+1)+"</li>";
		 	str+="	<li>"+item.title+"</li>";
		 	str+="	<li>"+item.description+"</li>";
		 	str+="	<li>"+item.bloggername+"</li>";
		 	str+="	<li>"+item.bloggerlink+"</li>";
		 	str+="	<li>"+item.postdate+"</li>";
		 	str+="	<li><a href='"+item.link+"' target='_blank'>바로가기</a></li>";
		 	str+="</ul>";
		});
		
		$('#searchResult').html(str);
	}
	function errFunc(e) {
		alert("실패:"+e.status);
	}
</script>
<style type="text/css">
	ul{
		border: 2px #cccccc solid;
	}
</style>
</head>
<body>
	<div class="container">
	<div class="row">
		<a href="../NaverSearchAPI.do?keyword=합정역맛집&startNum=1">
			네이버검색정보JSON바로가기
           </a>
	</div>	
	<div class="row">
		<form id="searchFrm">			
			한페이지에 20개씩 노출됨 <br />
			
			<select id="startNum">
				<option value="1">1페이지</option>
				<option value="21">2페이지</option>
				<option value="41">3페이지</option>
				<option value="61">4페이지</option>
				<option value="81">5페이지</option>
			</select>
			
			<input type="text" id="keyword" size="30" value="네이버API" />
			<button type="button" class="btn btn-info" id="searchBtn">
				Naver검색API요청하기
			</button>		
		</form>	
	</div>
	
	<div class="row" id="searchResult">
		요기에 정보가 노출됩니다
	</div>		
</div>	
</body>
</html>