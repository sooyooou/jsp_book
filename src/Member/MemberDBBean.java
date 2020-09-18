package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.org.apache.bcel.internal.generic.RETURN;

import Book.BookDataBean;


public class MemberDBBean {
	private static MemberDBBean instance = new MemberDBBean();
	

	public static MemberDBBean getInstance() {
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/mindbook");
		return ds.getConnection();
	}

	public void insertMember(MemberDataBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into member values (?,?,?,?,?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setTimestamp(4, member.getReg_date());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getTel());
			pstmt.setString(7, member.getDob());
			pstmt.setInt(8, member.getMng());
			pstmt.executeUpdate();
			
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
	}

	public int userCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select passwd from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(passwd)) {
					x = 1;
				} else {
					x = 0;
				}
			} else {
				x = -1;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException sqle) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				}

			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle) {
				}

		}
		return x;
	}
	
	public int mngCheck(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = 0;
		
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select mng from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbpasswd = rs.getString("mng");
				if(dbpasswd.equals("1")) {
					x = 1;
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException sqle) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				}

			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle) {
				}

		}
		return x;
	}
	

	public int pwCheck(String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
	
			pstmt = conn.prepareStatement("select passwd from member where passwd = ?");
			pstmt.setString(1, passwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(passwd)) {
					x = 1;
				} else {
					x = 0;
				}
			} else {
				x = -1;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException sqle) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				}
	
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle) {
				}
	
		}
		return x;
	}

	public int pwCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
	
			pstmt = conn.prepareStatement("select passwd from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(passwd)) {
					x = 1;
				} else {
					x = 0;
				}
			} else {
				x = -1;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException sqle) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				}
	
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle) {
				}
	
		}
		return x;
	}
	public MemberDataBean getMember(String id) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		MemberDataBean list = null;
		
		try {
		conn = getConnection();
		ps = conn.prepareStatement("select *from member where id =?");
		ps.setString(1, id);
		rs = ps.executeQuery();
		
			if(rs.next()) {
				list = new MemberDataBean();
				list.setId(rs.getString("id"));
				list.setPasswd(rs.getString("passwd"));
				list.setName(rs.getString("name"));
				list.setReg_date(rs.getTimestamp("reg_date"));
				list.setAddress(rs.getString("address"));
				list.setTel(rs.getString("tel"));
				list.setDob(rs.getString("dob"));
				list.setMng(rs.getInt("mng"));
			}
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException sqle) {
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException sqle) {
				}

			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle) {
				}

		}
		return list;
	}
	
	public int updateArticle(MemberDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int x = -1;
		
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from member where id = ?");
			pstmt.setString(1, article.getId());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				sql = "update member set id=?,passwd=?,name=?";
				sql += ",address=?,tel=?,dob=?,mng=? where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, article.getId());
				pstmt.setString(2, article.getPasswd());
				pstmt.setString(3, article.getName());
				//pstmt.setTimestamp(4, article.getReg_date());
				pstmt.setString(4, article.getAddress());
				pstmt.setString(5, article.getTel());
				pstmt.setString(6, article.getDob());
				pstmt.setInt(7, article.getMng());
				pstmt.setString(8, article.getId());
				pstmt.executeUpdate();
				x=1;
		} else {
			x=0;
		}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

}
