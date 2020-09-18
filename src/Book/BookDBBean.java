package Book;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class BookDBBean {

	private static BookDBBean instance = new BookDBBean();

	// .jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
	public static BookDBBean getInstance() {
		return instance;
	}

	// 커넥션풀로부터 Connection객체를 얻어냄
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/mindbook");
		return ds.getConnection();
	}

	// board테이블에 글을 추가(inset문)<=writePro.jsp페이지에서 사용
	public void insertArticle(BookDataBean article, String booktype) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num = article.getNum();
		String sql = "";

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select max(num) from book");
			rs = pstmt.executeQuery();

			// 쿼리를 작성
			sql = "insert into book(name,writer,publisher,publication,reg_date,";
			sql += "content,money,image,booktype,mngpw) values(?,?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getName());
			pstmt.setString(2, article.getWriter());
			pstmt.setString(3, article.getPublisher());
			pstmt.setString(4, article.getPublication());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setString(6, article.getContent());
			pstmt.setInt(7, article.getMoney());
			pstmt.setString(8, article.getImage());
			pstmt.setString(9, booktype);
			pstmt.setString(10, "gwangjuwu");

			pstmt.executeUpdate();
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
	}

	public int getArticleCount(String booktype) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select count(*) from book where booktype = ?");
			pstmt.setString(1, booktype);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
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

	// 글의 목록(복수개의 글)을 가져옴(select문) <=list.jsp에서 사용
	public List<BookDataBean> getArticles(String booktype, int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BookDataBean> articleList = null;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from book where booktype = ? order by num desc limit ?,?;");
			pstmt.setString(1, booktype);
			pstmt.setInt(2, start - 1);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			BookDataBean article = new BookDataBean();

			if (rs.next()) {
				articleList = new ArrayList<BookDataBean>(end);
				do {
					article.setNum(rs.getInt("num"));
					article.setName(rs.getString("name"));
					article.setWriter(rs.getString("writer"));
					article.setPublisher(rs.getString("publisher"));
					article.setPublication(rs.getString("publication"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setContent(rs.getString("content"));
					article.setMoney(rs.getInt("money"));
					article.setImage(rs.getString("image"));
					article.setBooktype(rs.getString("booktype"));
					article.setMngpw(rs.getString("mngpw"));
					articleList.add(article);
				} while (rs.next());
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
		return articleList;
	}
	
	public String booktype(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String book = "";
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from book where num = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
					book = rs.getString("booktype");
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
		return book;
	}

	// 글의 내용을 보기(1개의 글)(select문)<=content.jsp페이지에서 사용
	public BookDataBean getArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BookDataBean article = null;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from book where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BookDataBean();
				article.setNum(rs.getInt("num"));
				article.setName(rs.getString("name"));
				article.setWriter(rs.getString("writer"));
				article.setPublisher(rs.getString("publisher"));
				article.setPublication(rs.getString("publication"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setContent(rs.getString("content"));
				article.setMoney(rs.getInt("money"));
				article.setImage(rs.getString("image"));
				article.setBooktype(rs.getString("booktype"));
				article.setMngpw(rs.getString("mngpw"));
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
		return article;
	}

	// 글 수정폼에서 사용할 글의 내용(1개의 글)(select문)<=updateForm.jsp에서 사용
	public BookDataBean updateGetArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BookDataBean article = null;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from book where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BookDataBean();
				article.setNum(rs.getInt("num"));
				article.setName(rs.getString("name"));
				article.setWriter(rs.getString("writer"));
				article.setPublisher(rs.getString("publisher"));
				article.setPublication(rs.getString("publication"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setContent(rs.getString("content"));
				article.setMoney(rs.getInt("money"));
				article.setImage(rs.getString("image"));
				article.setBooktype(rs.getString("booktype"));
				article.setMngpw(rs.getString("mngpw"));
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
		return article;
	}

	// 글 수정처리에서 사용(update문)<=updatePro.jsp에서 사용
	public int updateArticle(BookDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpasswd = "";
		String sql = "";
		int x = -1;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select mngpw from book where num = ?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("mngpw");
				if (dbpasswd.equals("gwangjuwu")) {
					sql = "update book set name=?,writer=?,publisher=?,publication=?";
					sql += ",content=?,money=?,image=?,booktype=? where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, article.getName());
					pstmt.setString(2, article.getWriter());
					pstmt.setString(3, article.getPublisher());
					pstmt.setString(4, article.getPublication());
					pstmt.setString(5, article.getContent());
					pstmt.setInt(6, article.getMoney());
					pstmt.setString(7, article.getImage());
					pstmt.setString(8, article.getBooktype());
					pstmt.setInt(9, article.getNum());
					
					pstmt.executeUpdate();
					x = 1;
				} else {
					x = 0;
				}
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

	// 글삭제처리시 사용(delete문)<=deletePro.jsp페이지에서 사용
	public int deleteArticle(int num, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select mngpw from book where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("mngpw");
				if (dbpasswd.equals(passwd)) {
					pstmt = conn.prepareStatement("delete from book where num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x = 1; // 글삭제 성공
				} else
					x = 0; // 비밀번호 틀림
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

	public String image(String book, int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String image = "";
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select image from book where booktype = ? and num = ? order by num desc");
			pstmt.setString(1, book);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				image = rs.getString("image");
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
		return image;
	}
	public void imagesave(HttpServletRequest request) throws IOException {
		String path = "D:/LeeHS/DownLoad/apache-tomcat-8.5.47/webapps/ROOT/img"; //파일 저장될 경로

		MultipartRequest multi = new MultipartRequest(request, path, 1024 * 1024 * 2, "UTF-8");
		//(리퀘스트, 저장경로, 허용파일크기, 인코딩타입, 파일명중복정책)
	}
}