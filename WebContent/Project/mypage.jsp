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
	int mng = -1;
	int check = mdb.getLogin();
	String id = mdb.getId();
	mng = mdb.getMng();
%>
</head>
<body>
	<jsp:include page="header.jsp" flush="false"/>
	<div class="mypage_box">
		<h2>나의 정보 수정</h2>
		<p>비밀번호를 입력해 주세요.</p>
		<form class="mypage_form" action="mypagePro.jsp">
			<input type="password" class="mp_passwd" name="mp_passwd"/>
			<input type="submit" value="확인" class="ck_mpwd" />
		</form>
	</div>
	<jsp:include page="footer.jsp" flush="false"/>
	
</body>
</html>