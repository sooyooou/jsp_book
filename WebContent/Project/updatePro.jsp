<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Book.BookDBBean"%>
<%@ page import="Book.BookDataBean"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="article" scope="page" class="Book.BookDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>
<%
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	String book = request.getParameter("book");

	try {
		BookDBBean dbPro = BookDBBean.getInstance();
		int check = dbPro.updateArticle(article);

		if (check == 1) {
%>
<meta http-equiv="Refresh"
	content="0;url=<%=book%>list.jsp?pageNum=<%=pageNum%> %>" />
<%
	} else {
%>
<script>
	alert("데이터베이스 오류");
	history.go(-1);
</script>
<%
	}
%>
<%
	} catch (Exception e) {
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MindBook</title>
</head>
<body>

</body>
</html>
