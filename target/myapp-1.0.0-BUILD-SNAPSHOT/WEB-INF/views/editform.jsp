<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="/editsave" method="post">
<!-- <form action="/editsave" method="post"> -->
<input type="hidden" name="id" value="${music.id }">
아티스트 : <input type="text" name="artist" value="${music.artist }" > <br>
제목 : <input type="text" name="title" value="${music.title }"><br>
동영상 주소 : <input type="text" name="url" value="${music.url }"><br>
<input type="submit">
</form>
</body>
</html>