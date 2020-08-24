<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
   integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
      <link rel="stylesheet" href=" https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   <%@page import="java.util.List" %>
      <%@page import="java.util.ArrayList" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link
	href="https://fonts.googleapis.com/css2?family=Chilanka&display=swap"
	rel="stylesheet">
<!-- 영어 -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<!-- 한글 -->

<link href="<c:url value="/resources/css/font_bootstrap.css" />" rel="stylesheet">

 
<!--  <link href="/resources/css/font_bootstrap.css" rel="stylesheet">
 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://www.youtube.com/iframe_api"></script>
    


<style>

td,th{
 text-align : center;
font-size:30px;
vertical-align: middle;/*먹히지 않는다..왜?*/
}
td{
position: relative;
}

/* p{
margin-top : 85px;
margin-bottom:85px;
} 
이 방법은....고정된 값이므로 사용 권장을 하지 않는다.
 */
 
 p{
 position:absolute;
 top:50%;
 left:50%;
 transform:translate(-50%,-50%)
 }


#add{
position: absolute;
font-size : 60px;
padding:5px;
left:100%;
 transform:translate(-100%,178%)

}


</style>

</head>
<body>
<%! int count = 1;
List<String> Id = new ArrayList<String>();%>
<h1 style="text-align:center">플레이리스트</h1>

<div>
<div style="width:350; height:200;" id="mv" ></div>
<c:forEach var="music" items="${list }">
<c:set var="curr" value="${music.url }"/>
<%String curURL = (String)pageContext.getAttribute("curr");
System.out.println(curURL);
String curId = "\""+curURL.substring(curURL.length()-11)+"\"";

Id.add(curId);%>
</c:forEach>
    <script>

      var playlist;
      function onYouTubeIframeAPIReady() {
          playlist=new YT.Player('mv', {
events:{'onReady':function(e) {
var p=e.target;
p.cuePlaylist(<%=Id%>);
p.setLoop(true);
p.setShuffle(true);
}}
});
<%Id.clear();%>
      }

     
    </script>



<!-- <button style="float:right; font-size : 60px; padding:5px" onclick="location.href='/myapp/add'" class="btn btn-light" >
<i class="fa fa-plus-square-o" aria-hidden="true" ></i>
</button> -->

<button onclick="location.href='/add'" class="btn btn-light" id="add">
<i class="fa fa-plus-square-o" aria-hidden="true" ></i>
</button>
</div>

<table class="table">
<thead class="thead-light"><tr><th><a href="successed">No<br>(등록순 정렬)</a></th><th><a href="artistOrder">아티스트</a></th>
<th><a href="titleOrder">제목</a></th>
<th>동영상(저작권문제로 유튜브로 이동하셔서 보셔야합니다!)</th><th>수정</th><th>삭제</th></tr></thead>
<c:forEach var="music" items="${list }">
<c:set var="curr" value="${music.url }"/>
<tr>
<td class="count"><p><%=count %></p></td>
<td><p>${music.artist}</p></td>
<td width=20%><p>${music.title}</p></td>
<td >
<iframe id='Music<%=count%>' width="350" height="200"
src="${music.url}" allowfullscreen >
</iframe>
</td>
<td><p><a href="editmusic/${music.id}">Edit</a></p></td>
<td><p>
<a href="#" onclick="Remove('${music.id}')">Delete</a></p></td>
</tr>
<%count++; %>
</c:forEach>

</table>
<%count=1;%>

  <script>
/*   <a href="deletemusic/${music.id}">Delete</a>
 */
 var doubleSortingFlag = false;
 var doubleSubmitFlag = false;


 		function checkRemove(id){
			var result = confirm("정말로 삭제하시겠습니까?");
			if(result){
				document.location.href="deletemusic/"+id;
				doubleSubmitFlag = true;
				}else{
					
				}
          }

 		 function Remove(id){
 		     if(doubleSubmitFlag){ 
 		         alert("잠시만 기다려주세요~");
 		         return;}

 		     checkRemove(id);
 		     

 		 }
    </script>
</body>


</html>
<!-- 뭐....그냥 까라면 까는 것이긴 한데.. 변수들을 내가 private로 설정했음에도 불구하고 직접 부를 수 있다는 것이...흠... -->