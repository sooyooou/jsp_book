<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Member.MemberDBBean"%>
<%@ page import="Member.MemberDataBean" %>

<%
	request.setCharacterEncoding("utf-8");
	
%>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	MemberDataBean mdb = MemberDataBean.getInstance1();
	MemberDBBean logon = MemberDBBean.getInstance();
	mdb.setId(id);
	int check = logon.userCheck(id, passwd);
	mdb.setLogin(check);
	int mng = logon.mngCheck(id);
	mdb.setMng(mng);
	if (check == 1) {
		session.setAttribute("id", id);
		response.sendRedirect("main.jsp");
		mdb.setLogin(1);
	} else if (check == 0) {
%><script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("아이디가 맞지 않습니다.");
	history.go(-1);
</script>
<%
	}
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
