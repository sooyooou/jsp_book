<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "Member.MemberDataBean" %>
    <%@ page import = "Member.MemberDBBean" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    
    <%
    String id = (String)session.getAttribute("id");
    String passwd = request.getParameter("mp_passwd");
    
    try {
    	MemberDBBean md = MemberDBBean.getInstance();
    	int x = md.pwCheck(id, passwd);
    	
    	if(x==1) {
    		 %>
    		<script>window.location.href = 'upinfo.jsp'</script>
    	<% } else {%>
    		<script>alert('비밀번호가 틀렸습니다.');</script>
    	<%} %>
    <%}catch(Exception e){
    	e.printStackTrace();
    	}
    %>
    