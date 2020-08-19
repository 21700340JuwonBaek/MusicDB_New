<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<style>
div:not(.wrapper){
width : 150px;
margin-bottom :px;
font-size : 30px;
}

input{
margin-bottom : 10px;
}
textarea{
vertical-align:top;
resize:none;
margin-bottom : 10px;
}
p{
display: inline-block;
margin-bottom : 0;
margin-top : 0;
}

.wrapper{
margin-left : 20px;

width: fit-content;
}

</style>
<body>
<h1 style="font-size:50px; margin-top: 10px; margin-left:10px">백주원의 음악 DB</h1>


<form action="/myapp/editsave" method="post">
<!-- <form action="/editsave" method="post"> -->
<div class="wrapper">
<input type="hidden" name="id" value="${music.id }">
<div>아티스트 </div><p> <input type="text" name="artist" value="${music.artist }" ></p> <br>
<div>제목 </div><p>  <input type="text" name="title" value="${music.title }"></p><br>
<div>동영상 주소  </div><p><textarea name="url" rows="2" cols="23">${music.url }</textarea></p><br>
<input type="submit" style="float:right">
</div>
</form>
</body>
</html>