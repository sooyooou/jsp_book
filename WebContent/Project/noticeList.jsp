<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Notice.NoticeDBBean" %>
<%@ page import = "Notice.NoticeDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "Member.MemberDBBean" %>
<%@ page import = "Member.MemberDataBean" %>

<%!	
	int pageSize = 10;
	SimpleDateFormat sdf = 
		new SimpleDateFormat("yyyy-MM-DD HH:mm");
%>
	<%
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null){
			pageNum = "1";
			}
		
		MemberDataBean mdb = MemberDataBean.getInstance1();
		int mng = -1;
		int check = mdb.getLogin();
		String id = mdb.getId();
		mng = mdb.getMng();
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List<NoticeDataBean> articleList = null;
		
		NoticeDBBean nd = NoticeDBBean.getInstance();
		count = nd.getArticleCount();
		
		if(count>0){
			articleList = nd.getArticles(startRow, pageSize);
		}
		
		number = count - (currentPage-1)*pageSize;
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<jsp:include page="header.jsp" flush="false"/>
<div class="noticeWrap">
<h2 class="noticetitle">공지사항</h2>
<table>
<%for(int i =0; i<articleList.size(); i++){
	NoticeDataBean article = articleList.get(i);
	%>
		<tr height="30">
			<td width="50"><%=number-- %></td>
			<td width="250" align="left">
			<a href="noticecontent.jsp?num=<%=article.getNum() %>&pageNum=<%=currentPage %>">
			<%=article.getSubject() %></a>
			<%if(mng==1){
				%>
				<a href="#">[수정]</a>
				<a href="#">[삭제]</a>
			<%} %>
			</td>
			<td width="100" align="left">
				<%=article.getWriter() %></td>
			<td width="150"> <%=sdf.format(article.getReg_date()) %></td>
		</tr>
		<%} %>
	</table>
		<%if(mng==1) {
			%>
		<button id="write">글쓰기</button>
		<%} %>
		<%if (count>0) {
			int pageCount = count/pageSize + (count % pageSize == 0 ? 0:1 );
			int startPage = 1;
			
			if(currentPage % 10 !=0)
				startPage = (int) (currentPage / 10) * 10 +1;
			else 
				startPage = ((int) (currentPage / 10) - 1) * 10 +1;
				
				int pageBlock = 10;
				int endPage = startPage + pageBlock - 1;
				if(endPage > pageCount)
					endPage = pageCount;
					
				if(startPage>10) {
				%>
		<a href="noticeList.jsp?pageNum=<%=startPage - 10 %>">[이전]</a>
		<%} 
			for(int i = startPage; i<=endPage; i++) {
			%>
			<a href="noticeList.jsp?pageNum=<%=i %>">[<%=i %>]</a>
			<%}
				if(endPage < pageCount) {
				%>
			<a href="noticeList.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
			<%}
				}%>
		
	</div>
	<jsp:include page="footer.jsp" flush="false"/>
	 </body>
</html>