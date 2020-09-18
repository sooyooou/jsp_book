<%@page
	import="jdk.internal.org.objectweb.asm.util.CheckAnnotationAdapter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Member.MemberDBBean"%>
<%@page import="Member.MemberDataBean"%>
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
	MemberDBBean md = MemberDBBean.getInstance();
	String id2 = (String) session.getAttribute("id");
	MemberDataBean list = null;
	int mng = -1;
	int check = mdb.getLogin();
	String id = mdb.getId();
	mng = mdb.getMng();
	
%>
	
	<%
		list = md.getMember(id2);
		%>
</head>
<body>
	<jsp:include page="header.jsp" flush="false"/>
	<div class="upinfo_box">
		<h2>나의 회원 정보 수정</h2>
		<form class="upinfo_form" action="upinfoPro.jsp">
			<table>
				<tr>
					<td><input type="hidden" name="id" value="<%=id2%>"/></td>
				</tr>
				<tr>
					<td><h4>비밀번호</h4></td>
					<td><input type="password" name="passwd" value="<%=list.getPasswd()%>"/></td>
				</tr>
				<tr>
					<td><h4>이름</h4></td>
					<td><input type="text" name="name" value="<%=list.getName()%>"/></td>
				</tr>
				<tr>
					<td><input type="hidden" name="tel" value="<%=list.getAddress()%>"/></td>
				</tr>
				<tr>
					<td><h4>이메일 주소</h4></td>
					<td><input type="text" name="address" value="<%=list.getAddress() %>"/></td>
				</tr>
				<tr>
					<td><h4>전화번호</h4></td>
					<td><input type="text" name="tel" value="<%=list.getTel()%>"/></td>
				</tr>
				<tr>
					<td><input type="hidden" name="dob" value="<%=list.getDob()%>"/></td>
				</tr>
				<tr>
					<td><input type="hidden" name="mng" value="<%=mng %>"/></td>
				</tr>
			</table>
			<input type="submit" value="확인" class="ck_info" />
		</form>
	</div>
	<jsp:include page="footer.jsp" flush="false"/>
	
</body>
</html>
