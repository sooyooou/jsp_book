<%@page
	import="jdk.internal.org.objectweb.asm.util.CheckAnnotationAdapter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Member.MemberDBBean"%>
<%@page import="Member.MemberDataBean"%>
<%@page import="Book.BookDBBean" %>
<%@page import="Book.BookDataBean" %>

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
	<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String book = request.getParameter("book");
try {
	BookDBBean dbPro = BookDBBean.getInstance();
	BookDataBean article = dbPro.updateGetArticle(num);

%>
	<p>글수정</p>
	<br>
	<form method="post" name="writeform"
		action="updatePro.jsp?pageNum=<%=pageNum%>&book=<%=book %>&num=<%=num %>"
		onsubmit="return writeSave()" class="update_container">
		<table class="write_table">
			<tr>
				<td class="book_chek">책 분류</td>
				<td>
					<p class="book_chek" id="book_chek">
						<label> <input type="checkbox" name="booktype" value="BestBook" />
							베스트셀러
						</label> <br> <label> <input type="checkbox" name="booktype"
							value="NewBook" /> 신간 도서
						</label> <br> <label> <input type="checkbox" name="booktype"
							value="NovelBook" /> 소설
						</label> <br> <label> <input type="checkbox" name="booktype"
							value="EssayBook" /> 에세이
						</label> <br>
					</p>
				</td>
				<!-- active:한글 -->
			</tr>
			<tr id="book_name">
				<td width="70">책 제목</td>
				<td><input type="text" name="name" style="ime-mode: active;">
				</td>
				<!-- active:한글 -->
			</tr>
			<tr id="book_writer">
				<td width="70">저자</td>
				<td><input type="text" name="writer" style="ime-mode: active"></td>
			</tr>
			<tr id="book_publisher">
				<td width="70">출판사</td>
				<td><input type="text" name="publisher"
					style="ime-mode: inactive;"></td>
				<!-- inactive:영문 -->
			</tr>
			<tr id="book_publication">
				<td width="70">출판일</td>
				<td><input type="text" name="publication"
					style="ime-mode: inactive;"></td>
				<!-- inactive:영문 -->
			</tr>
			<tr id="book_money">
				<td width="70">가격</td>
				<td><input type="text" name="money" style="ime-mode: inactive;">
				</td>
				<!-- inactive:영문 -->
			</tr>
			<tr id="book_content">
				<td width="70">내용</td>
				<td><textarea name="content" style="ime-mode: active;"></textarea>
				</td>
			</tr>
			<tr id="book_image">
				<td><script>
					$(function() {

						$('#inputFile').on('change', function() {

							readURL(this);

						});

					});

					function readURL(input) {

						if (input.files && input.files[0]) {

							var filename = input.files[0].name;

							var ext = filename.substr(filename.length - 3,
									filename.length);

							if (ext.toLowerCase() != "jpg"
									&& ext.toLowerCase() != "gif"
									&& ext.toLowerCase() != "png") {

								alert("그림파일만 선택하세요");

							}

							else {

								//파일 읽을 수 있는 객체 생성

								var reader = new FileReader();

								//선택한 파일 읽기

								reader.readAsDataURL(input.files[0]);

								//파일을 전부 읽으면

								reader.onload = function(e) {

									//img라는 아이디를 가진 객체의 src에 대입하기

									$('#image_upload_preview').attr('src',
											e.target.result);

								}

							}

						}

					}
				</script> <input type="file" id="inputFile" name="image" /> <br /> <img
					id="image_upload_preview" src="img/book1.jpg" alt="your image"
					width="250" height="400" /></td>
			</tr>
			<tr id="write_suc">
				<td><input type="submit" value="작성 완료"><input
					type="reset" value="다시 작성"></td>
			</tr>


		</table>
	</form>
<%
} catch(Exception e) {}
%>
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
