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

	<article class="post">
		<div class="container">
			<div class="bread">
				<ol>
					<li><a href="main.jsp">HOME</a></li>
					<li><a href="introduce.jsp">사이트 소개</a></li>
				</ol>
			</div>
			<h1>설립 목적에 대해서</h1>
			<p>
			&nbsp;지금은 인터넷에 검색하면 모든 정보를 얻을 수 있는 만큼 편리하고 좋은 세상입니다. <br>미디어의 발전 역시 큰 기여를 하고 있다고 볼 수 있습니다.
			</p>
			<div class="imgA">
			<img src="img/intro_1.jpg" class="A" width="450" height="250"  /></div>
		  	<p>&nbsp;이러한 사회에서 책을 읽는 사람은 점점 줄어 들고 있는 세상입니다. <br>영상으로 쉽게 접할 수 있을 뿐 아니라 스마트폰 안에서 전자 서적을 통해서도 충분히 책을 읽을 수 있는 시대가 되었기 때문입니다.
			</p>
			<p>&nbsp;우리 MindBook 홈페이지는 미디어에 익숙해진 사람들에게 책 자체의 매력과 다양한 정보, 지식을 제공함으로써 책의 매력을 어필하고자 설립하게 되었습니다.</p>
			<div class="imgB">
			<img src="img/intro_2.jpg" class="B" width="550" height="300" alt=""/></div>
			<strong><p>&nbsp;찾아주시는 모든 방문객분들과 회원분들에게 <br>항상 신선한 느낌을 줄 수 있고 책의 매력을 느끼실 수 있도록 <br>노력하는 MindBook이 되도록 하겠습니다.</p></strong>
		</div>
	</article>
	<aside class="history">
		<div class="container">
			<div class="photo"></div>
		 	<div class="text">
				<h2>History</h2>
				<table>
					<tr>
						<th>2019년<br>12월</th>
						<td>스토리보드 제작</td>
					</tr>
					<tr>
						<th>2020년<br>01월</th>
						<td>레이아웃 제작</td>
					</tr>
					<tr>
						<th>2020년<br>02월</th>
						<td>DB설계 및 연동</td>
					</tr>
					<tr>
						<th>2020년<br>02월</th>
						<td>세부디자인 제작</td>
					</tr>
				</table>
			</div>
		</div>
	</aside>
	
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>
