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

	<!--map -->
	<article class="post">
		<div class="container">
			<div class="bread">
				<ol>
					<li><a href="main.jsp">TOP</a></li>
					<li><a href="map.jsp">찾아오는 길</a></li>
				</ol>
			</div>
			<h1>찾아오는 길</h1>
			<p>
			MindBook에 대해 문의가 있다면 <br>다음 연락처로 문의해주세요.
			</p>
		</div>
	</article>
	<bside class="ask">
		<div class="container">
			<div class="box">
				<ol class="call">
					<li><i class="fas fa-phone"></i></li>
					<li><h2>Call</h2></li>
					<li><h2>000-1234-5678</h2></li>
				</ol>
				<ol class="email">
					<li><i class="fas fa-envelope"></i></li>
					<li><h2>E-mail</h2></li>
					<li><h2>mblove@mindbook.com</h2></li>
				</ol>
			</div>
		</div>
	</bside>
	<map>
		<div class="maps">
			<h2>찾아오시는 길</h2>
			<div class="home">
			<!-- * 카카오맵 - 지도퍼가기 -->
			<!-- 1. 지도 노드 -->
			<div id="daumRoughmapContainer1575887608060" class="root_daum_roughmap root_daum_roughmap_landing"></div>

			<!--
			2. 설치 스크립트
			* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
			-->
			<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

			<!-- 3. 실행 스크립트 -->
			<script charset="UTF-8">
			new daum.roughmap.Lander({
			"timestamp" : "1575887608060",
			"key" : "w6m3",
			"mapWidth" : "640",
			"mapHeight" : "360"
			}).render();
			</script>
			</div>
		</div>
	</map>
	
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>
