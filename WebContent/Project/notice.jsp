<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MindBook</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="false"/>
		<form method="post" action="noticepro.jsp">
			제목:<input type="text" name="subject"><br>
			작성자:<input type="text" name="writer"><br><br>
			내용:<textarea name="content" cols="80" rows="10"></textarea><br>
			<input type="submit" value="확인">
		</form>
		
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>