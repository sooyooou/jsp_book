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
	int check = mdb.getLogin();
	String id = mdb.getId();
	int mng = mdb.getMng();
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String book = request.getParameter("book");
%>
</head>
<body>
	<div id="popupLayer">

		<div class="popup_container">
			<img src="img/웹로고.gif" width="200" height="70" />
			<section>
				<form method="post" action="sessionLoginPro.jsp">
					<table>
						
						<tr>
							<td class="text"><h3>아이디</h3></td>
						</tr>
						<tr>
							<td><input type="text" name="id"></td>
						</tr>
						<tr>
							<td class="text"><h3>비밀번호</h3></td>
						</tr>
						<tr>
							<td><input type="password" name="passwd"></td>
						</tr>
					</table>
					<input type="submit" value="로그인" class="login_btn"> <input
						type="button" onclick="location.href='insertMemberForm.jsp'"
						value="회원가입" class="insert_loginbtn">
				</form>
			</section>
		</div>
		<footer>
			<input type="button" value="닫기" id="popup_close" />
		</footer>
	</div>
	
	<header>
	<div class="ub_top">
		<ul class="ub_menu">
			<li class="ub_home"><a href="main.jsp">홈으로</a></li>
			<%
				if (check == -1) {
			%>
			<li class="ub_login"><a href="#">로그인</a></li>
			<%
				} else if (check == 1) {
					if (session.getAttribute("id") == null) {
						mdb.setLogin(-1);
						response.sendRedirect("main.jsp");
					}
			%>
			
			<li class="ub_logout"><a href="main_logout.jsp">로그아웃</a></li>
			<li class="ub_my"><a href="#">마이페이지</a></li>
		</ul>
		<span class="ub_user"><strong><%=id%></strong>
			<%
				if (mng == 1) {
			%>관리자<%
				}
			%>님 어서오세요</span>
		<%
			}
		%>
	</div>
	<div class="header">
		<div class="hd_logo">
			<a href="main.jsp"> <img src="img/웹로고.gif" width="200"
				height="70" /></a>
		</div>
		<div class="menu">
			<ul id="gnb">
				<li><a href="#">소개</a>
					<ul class="lnb">
						<li><a href="introduce.jsp">설립목적</a></li>
						<li><a href="#">개발자</a></li>
						<li><a href="map.jsp">찾아오는 길</a></li>
					</ul>
				</li>
				<li><a href="#">서비스</a>
					<ul class="lnb">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</li>
				<li><a href="#">도서</a>
					<ul class="lnb">
						<li><a href="BestBooklist.jsp">베스트셀러</a></li>
						<li><a href="NewBooklist.jsp">새로나온책</a></li>
						<li><a href="NovelBooklist.jsp">소설</a></li>
						<li><a href="EssayBooklist.jsp">에세이</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	</header>

	<p>글삭제</p>
	<br>
	<form method="post" name="delForm"
		action="deletePro.jsp?pageNum=<%=pageNum%>&book=<%=book%>"
		onsubmit="return deleteSave()">
		<table>
			<tr height="30">
				<td align=center><b>관라지 비밀번호를 입력해주세요</b></td>
			</tr>

			<tr height="30">
				<td align=center>비밀번호: <input type="password" name="passwd"
					size="8" maxlength="12"> <input type="hidden" name="num"
					value="<%=num%>"></td>
			</tr>

			<tr height="30">
				<td align=center><input type="submit" value="글삭제"></td>
			</tr>

		</table>

	</form>
	
	<div class="footer">
		<div class="copyright">
			<div class="container">
				<div class="footA">
					<h3>MindBook</h3>
					<p>
						주소 : 대한상공회의소 광주인력개발원 <br> <a href="#">http://www.wwww.net</a>
					</p>
					<nav class="footD">
						<ul>
							<li><a href="#"> <span class="fab fa-twitter"
									title="Twitter"></span>
							</a></li>
							<li><a href="#"> <span class="fab fa-facebook-f"
									title="Facebook"></span>
							</a></li>
							<li><a href="#"> <span class="fab fa-google"
									title="Google"></span>
							</a></li>
							<li><a href="#"> <span class="fab fa-instagram"
									title="Instagram"></span>
							</a></li>
							<li><a href="#"> <span class="fab fa-youtube"
									title="Youtube"></span>
							</a></li>
						</ul>
					</nav>
				</div>
				<div class="footB">
					<div>
						<h3>ABOUT</h3>
						<ul>
							<li><a href="introduce.jsp">설립목적</a></li>
							<li><a href="#">개발자</a></li>
							<li><a href="map.jsp">찾아오는 길</a></li>
						</ul>
					</div>
					<div>
						<h3>CONTENTS</h3>
						<ul>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">고객센터</a></li>
						</ul>
					</div>
					<div>
						<h3>BOOK</h3>
						<ul>
							<li><a href="BestBooklist.jsp">베스트셀러</a></li>
							<li><a href="NewBooklist.jsp">새로나온책</a></li>
							<li><a href="NovelBooklist.jsp">소설</a></li>
							<li><a href="EssayBooklist.jsp">에세이</a></li>
						</ul>
					</div>

				</div>
				<div class="footC">@MindBook corp. all rights reserved.</div>
			</div>
		</div>
	</div>

</body>
</html>