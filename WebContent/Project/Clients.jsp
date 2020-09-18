<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.noticeWrap {
		text-align:center;
		}
</style>
</head>
<body>
<jsp:include page="header.jsp" flush="false"/>
	<div class="noticeWrap">
		<img src="img/웹로고.gif" width="150" height="50">
		<h2><a href="#">고객센터</a></h2>
		<h3>무엇을 도와드릴까요??</h3>
		<button id= "clientswrite">글쓰기</button>
	</div>
<jsp:include page="footer.jsp" flush="false"/>
</body>
<script>
	$('#clientswrite').click(function () {
		window.location.href = "clientswrite.jsp";
	});
</script>
</html>