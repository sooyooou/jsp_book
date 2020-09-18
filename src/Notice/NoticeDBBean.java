package Notice;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Notice.NoticeDataBean;

public class NoticeDBBean {
	
	private static NoticeDBBean instance = new NoticeDBBean();
	
	public static NoticeDBBean getInstance() {
		return instance;
	}
	
	private NoticeDBBean() {}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/mindbook");
		
		return ds.getConnection();
	}
	
	public void insertArticle(NoticeDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = article.getNum();
		int number = 0;
		String sql = "";
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select max(num) from notice");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1)+1;
			}else
				number = 1;
			
			sql="insert into notice(writer,subject,content,reg_date) values(?,?,?,?)";
			
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,article.getWriter());
				pstmt.setString(2, article.getSubject());
				pstmt.setString(3, article.getContent());
				pstmt.setTimestamp(4, article.getReg_date());
				
				
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				
				if(rs!=null)try {rs.close();}catch(SQLException e) {}
				if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
				if(conn!=null)try {conn.close();}catch(SQLException e) {}
			}
	}
	
	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			conn = getConnection();
			
			ps = conn.prepareStatement("select count(*) from notice");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException e) {}
			if(ps!=null)try {ps.close();}catch(SQLException e) {}
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
		return x;
	}
	
	public List<NoticeDataBean> getArticles(int start, int end) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NoticeDataBean> articleList = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"select*from notice order by ref num asc limit ?,?");
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				articleList = new ArrayList<NoticeDataBean>(end);
				do{
					NoticeDataBean article = new NoticeDataBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setSubject(rs.getString("subject"));;
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setContent(rs.getString("content"));
					
					articleList.add(article);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException e) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		return articleList;
	}
	
	public NoticeDataBean getArticle(int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeDataBean article = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"select*from notice where num = ?");
			pstmt.setInt(1, num);
			
			if(rs.next()) {
				article = new NoticeDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setSubject(rs.getString("subject"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setContent(rs.getString("content"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException e) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		return article;
	}
	
	public NoticeDataBean updateGetArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		NoticeDataBean article = null;
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement("select*from Notice where num = ?");
			ps.setInt(1, num);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				article = new NoticeDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setSubject(rs.getString("subject"));
				article.setContent(rs.getString("content"));
				article.setReg_date(rs.getTimestamp("reg_date"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException e) {}
			if(ps!=null)try {ps.close();}catch(SQLException e) {}
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		return article;
	}
}
 