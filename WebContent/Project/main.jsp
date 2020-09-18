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

	<div class="best_img">
		<div id="slide_best">
			<img src="img/sam1.jpg" width="1000" height="300" /> <img
				src="img/sam2.jpg" width="1000" height="300" /> <img
				src="img/sam5.jpg" width="1000" height="300" />
		</div>
	</div>
	<div class="new_img">
		<div id="slide_new">
			<img src="img/sam2.jpg" width="1000" height="300" /> <img
				src="img/sma3.jpg" width="1000" height="300" /> <img
				src="img/sma4.jpg" width="1000" height="300" />
		</div>
	</div>
	<div class="advertisement">
		<ul>
			<li><a href="#"><img src="img/ad1.jpg" width="300" height="170"/>광고1</a></li>
			<li><a href="#"><img src="img/ad2.png" width="300" height="170"/>광고2</a></li>
			<li><a href="#"><img src="img/ad3.png" width="300" height="170"/>광고3</a></li>
		</ul>
	</div>
	
	<jsp:include page="footer.jsp" flush="false"/>
	
</body>
</html>
