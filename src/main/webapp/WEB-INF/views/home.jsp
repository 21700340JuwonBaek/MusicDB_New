<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<title>Home</title>
</head>

 <link
	href="https://fonts.googleapis.com/css2?family=Chilanka&display=swap"
	rel="stylesheet">
<!-- 영어 -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<!-- 한글 -->

<link href="<c:url value="/resources/css/font_bootstrap.css" />" rel="stylesheet">



<!--  합쳐지고 최소화된 최신 CSS
=<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

부가적인 테마
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

합쳐지고 최소화된 최신 자바스크립트
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	 -->
	


<body>

	<div class="bg-1">
		<h1>백주원의...음악취향 DB!</h1>

		<form action="login" method="post">
			<label style="font-size: 30px"> 아이디 </label><br> <input type="text" name="myId" ><br>

			<label style="font-size: 30px"> 비밀번호 </label><br> <input type="password" name="myPwd"><br>
			
			<button onclick="form.submit()">로그인</button>
		</form>


	</div>
</body>
</html>
