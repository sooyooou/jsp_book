<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>

<%@ page import="Book.BookDBBean"%>
<%@ page import="java.sql.Timestamp"%>
<%@page import="Member.MemberDataBean"%>
<%@page
	import="jdk.internal.org.objectweb.asm.util.CheckAnnotationAdapter"%>

<%@ page import="Member.MemberDBBean"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="article" scope="page" class="Book.BookDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MindBook</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/ff86e4fc33.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="script/main.js"></script>

<%
	MemberDataBean mdb = MemberDataBean.getInstance1();
	int check = mdb.getLogin();
	String id = mdb.getId();
	int mng = mdb.getMng();
	String booktype = request.getParameter("booktype");
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	BookDBBean dbPro = BookDBBean.getInstance();
%>
</head>

	<%
		try {
			dbPro.insertArticle(article, booktype);
			response.sendRedirect(booktype + "list.jsp");
		} catch (Exception e) {
		}
	%>

</html>