<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
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
margin-bottom : 10px;
font-size:30px;
}

input{
margin-bottom : 10px;
}

p{
margin-bottom: 0;
margin-top:0;
}

textarea{
vertical-align: top;
resize:none;
margin-bottom : 10px;


}

.wrapper{
margin-left : 20px;
width: fit-content;
}

</style>

<script>
var doubleSubmitFlag = false;
function doubleSubmitCheck(){
    if(doubleSubmitFlag){
        return doubleSubmitFlag;
    }else{
        doubleSubmitFlag = true;
        return false;
    }
}

function insert(){
    if(doubleSubmitCheck()){ 
        alert("잠시만 기다려주세요~");
        return;}

    alert("DB에 등록을 시작합니다");
    document.addform.submit();
    

}

</script>
<body>
<h1 style="font-size:50px; margin-top: 0; margin-left:0">백주원의 음악 DB</h1>
<form action="/myapp/save" method="post" name="addform">
<div class="wrapper">
<div>아티스트 </div><p style="display:inline-block"> <input type="text" name="artist"> </p><br>
<div>제목 </div><p style="display:inline-block"> <input type="text" name="title"></p><br>
<div>동영상 주소  </div><p style="display:inline-block"> <textarea  name="url" rows="2" cols="23" ></textarea></p><br>
<button  type="button" style="float:right" onclick="insert();">제출</button>
</div>
</form>
</body>
</html>