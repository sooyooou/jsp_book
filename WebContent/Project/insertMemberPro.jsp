<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	Timestamp register = new Timestamp(System.currentTimeMillis());
	String dob = request.getParameter("dob");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address = address1 + "@" + address2;
	int mng = 0;

	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String tel = tel1 + tel2 + tel3;

	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/mindbook";
		String dbId = "mindid";
		String dbPass = "mindpass";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String sql = "insert into member values (?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		pstmt.setTimestamp(4, register);
		pstmt.setString(5, address);
		pstmt.setString(6, tel);
		pstmt.setString(7, dob);
		pstmt.setInt(8, mng);
		if (id.equals("")) {
%>
<script>
	alert("입력하신 조건이 맞지 않습니다.");
	history.go(-1);
</script>
<%
	}
		pstmt.executeUpdate();
%>
<script>
	alert("회원가입이 완료되었습니다.");
	location.href = "main.jsp";
</script>
<%
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException sqle) {
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException sqle) {
			}
		}
	}
%>
