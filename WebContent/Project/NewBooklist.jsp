<%@page import="Member.MemberDataBean"%>
<%@page
	import="jdk.internal.org.objectweb.asm.util.CheckAnnotationAdapter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Member.MemberDBBean"%>
<%@ page import="Book.BookDBBean"%>
<%@ page import="Book.BookDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>

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

<%!int pageSize = 12;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>

<%
	String pageNum = request.getParameter("pageNum");

	if (pageNum == null) {
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	List<BookDataBean> articleList = null;
	
	String booktype = "NewBook";
	BookDBBean dbPro = BookDBBean.getInstance();
	count = dbPro.getArticleCount(booktype);
	
	if (count > 0) {
		articleList = dbPro.getArticles(booktype, startRow, pageSize);
	}
%>
</head>
<body>
	<jsp:include page="header.jsp" flush="false"/>

	<section class="book_list">
		<div class="container">
			<%
				if (articleList == null) {
			%>

			<table>
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>

			<%
				} else {
					for (int i = 0; i < articleList.size(); i++) {
						BookDataBean article = articleList.get(i);
						int book = article.getNum()+ (articleList.size() - i);
			%>
			<article>
				<a href="content.jsp?num=<%=book- 1%>&pageNum=<%=currentPage%>">
					<div class="photo">
						<img src="img/<%=dbPro.image(booktype, book - 1)%>" alt="booklist" />
					</div>
				</a>
			</article>
			<%

					}
				}
			%>
		</div>
		<div class="countnum">
			<%
				if (count > 0) {
					int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
					int startPage = 1;

					if (currentPage % 10 != 0)
						startPage = (int) (currentPage / 10) * 10 + 1;
					else
						startPage = ((int) (currentPage / 10) - 1) * 10 + 1;

					int pageBlock = 10;
					int endPage = startPage + pageBlock - 1;
					if (endPage > pageCount)
						endPage = pageCount;

					if (startPage > 10) {
			%>
			<a href="<%=booktype%>list.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
			<%
				}
					for (int i = startPage; i <= endPage; i++) {
			%>
			<a href="<%=booktype%>list.jsp?pageNum=<%=i%>">[<%=i%>]
			</a>
			<%
				}
					if (endPage < pageCount) {
			%>
			<a href="<%=booktype%>list.jsp?pageNum=<%=startPage + 10%>">[다음]]</a>
			<%
				}
				}
			%>

		</div>
		<%
			if (mng == 1) {
		%>
		<table>
			<tr>
				<td align="right"><a href="writeForm.jsp?booktype=<%=booktype%>">책
						등록</a></td>
			</tr>
		</table>
		<%
			}
		%>
	</section>

	<jsp:include page="footer.jsp" flush="false"/>

</body>
</html>