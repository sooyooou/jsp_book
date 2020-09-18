<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import = "Notice.NoticeDBBean" %>


<%request.setCharacterEncoding("utf-8");%>

<%
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	Timestamp reg_date = new Timestamp(System.currentTimeMillis());
		
	%>
	
		<jsp:useBean id="notice" scope="page" class="Notice.NoticeDataBean">
	</jsp:useBean>
	
	<%
		notice.setWriter(writer);
		notice.setSubject(subject);
		notice.setContent(content);
		notice.setReg_date(reg_date);
		
		NoticeDBBean noticeProcess = NoticeDBBean.getInstance();
		
		noticeProcess.insertArticle(notice);%>