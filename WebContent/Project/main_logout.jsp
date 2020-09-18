<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Member.MemberDBBean"%>
<%@ page import="Member.MemberDataBean" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MindBook</title>
</head>
<body>
	<%
		session.invalidate();
		MemberDataBean mdb = MemberDataBean.getInstance1();
		mdb.setLogin(-1);
	%>
	<script>
		alert("로그아웃 되었습니다.");
		location.href = "main.jsp";
	</script>
	
</body>
</html>
