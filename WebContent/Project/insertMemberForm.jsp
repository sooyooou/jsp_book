<%@page import="Member.MemberDataBean"%>
<%@page
	import="jdk.internal.org.objectweb.asm.util.CheckAnnotationAdapter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Member.MemberDBBean"%>

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
%>
</head>
<body>
	<jsp:include page="header.jsp" flush="false"/>

	<div class="joinpage">
		<h1>회원가입</h1>
		<form class="joinform" action="insertMemberPro.jsp">
			<table class="jointable">
				<tr>
					<td class="td1"><h4>아이디</h4></td>
					<td><input class="in" name="id" type="text" maxlength="20" />
					</td>
				</tr>
				<tr>
					<td class="td1"><h4>비밀번호</h4></td>
					<td><input class="in" name="passwd" type="password"
						maxlength="20" /></td>
				</tr>
				<tr>
					<td class="td1"><h4>성명</h4></td>
					<td><input class="in" name="name" type="text" /></td>
				</tr>
				<tr>
					<td class="td1"><h4>생년월일(8자리)</h4></td>
					<td><input class="in" name="dob" type="text" /></td>
				</tr>
				<tr>
					<td class="td1"><h4>전화번호</h4></td>
					<td><input type="text" name="tel1" class="join_tel" /> <span>-</span>
						<input type="text" name="tel2" class="join_tel" /> <span>-</span>
						<input type="text" name="tel3" class="join_tel" /></td>
				</tr>
				<tr>
					<td class="td1"><h4>이메일 주소</h4></td>
					<td><input type="text" name="address1" class="in"/> <span>@</span> 
						<input type="text" name="address2" class="in"/></td>
				</tr>
			</table>
			<input type="submit" value="가입하기" class="btn" />
		</form>
	</div>

	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>