<%@page import="com.mysql.jdbc.UpdatableResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "Member.MemberDBBean"%>
<%@ page import = "Member.MemberDataBean" %>
<% request.setCharacterEncoding("utf-8"); %>
		
	<jsp:useBean id="article" scope="page" class="Member.MemberDataBean">
		<jsp:setProperty name="article" property="*" />
	</jsp:useBean>
	
	<%
	try {
		MemberDBBean mdb = MemberDBBean.getInstance();
		int x = mdb.updateArticle(article);
		out.println(article.getReg_date());
		if(x ==1){
			
		%>
		<script>alert('회원정보 수정이 완료되었습니다.')</script>
		<script>window.location.href('main.jsp')</script>	
	<% } else{%>
		<script>alert('회원정보 수정에 실패하였습니다.')</script>
	<%}
	} catch(Exception e) {
		e.printStackTrace();
	}
	%>
	
