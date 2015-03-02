package com.tunea.jdbcdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tunea.dao.NoticeDao;
import com.tunea.model.Notice;

public class JdbcNoticeDao implements NoticeDao{

	@Override
	public Notice getNotice(String code) {
		// TODO Auto-generated method stub
		String sql = "select * from notices where code = '" + code + "'";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			rs.next();

			Notice n = new Notice();
			n.setCode(rs.getString("Code"));
			n.setTitle(rs.getString("Title"));
			n.setId(rs.getString("Id"));
			n.setHit(rs.getInt("Hit"));
			n.setContent(rs.getString("Content"));

			rs.close();
			st.close();
			con.close();

			return n;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List<Notice> getNotices(int page, String query, String field) {
		// TODO Auto-generated method stub
		int start = 1 + (page - 1) * 20;
		int end = 20 + (page - 1) * 20;

		String sql= "SELECT N.*FROM ("
				+"SELECT ("
				+" ROW_NUMBER() OVER (ORDER BY REGDATE DESC)"
				+") NUM, Notices.* FROM NOTICES WHERE "+field+" LIKE ? ) N "
				+" WHERE N.NUM BETWEEN ? AND ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%" + query + "%");
			st.setInt(2, start);
			st.setInt(3, end);

			ResultSet rs = st.executeQuery();
			
			List<Notice> list = new ArrayList<Notice>();

			while (rs.next()) {
				Notice n = new Notice();
				n.setCode(rs.getString("Code"));
				n.setTitle(rs.getString("Title"));
				n.setId(rs.getString("Writer"));
				n.setHit(rs.getInt("Hit"));
				n.setContent(rs.getString("Content"));
				list.add(n);
			}

			rs.close();
			st.close();
			con.close();

			return list;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}

	@Override
	public List<Notice> getNotices(int page, String query) {
		// TODO Auto-generated method stub
		return getNotices(page, query, "TITLE");
	}

	@Override
	public List<Notice> getNotices(int page) {
		// TODO Auto-generated method stub
		return getNotices(page, "");
	}

	@Override
	public int insert(Notice notice) {
		// TODO Auto-generated method stub
		String code = "?";

		String sql2 = "SELECT ISNULL(MAX(CAST(CODE AS INT)), 0)+1 CODE FROM NOTICES";
	
		String sql = "INSERT INTO NOTICES(CODE,TITLE,WRITER,CONTENT,REGDATE,HIT,REPORT) VALUES(?,?,?,?,GETDATE(),0,?)";

		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
			Statement stCode = con.createStatement();
			ResultSet rs = stCode.executeQuery(sql2);

			rs.next();
			String code2 = rs.getString("CODE");

			rs.close();
			stCode.close();

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, code2);
			st.setString(2, notice.getTitle());
			st.setString(3, notice.getId());
			st.setString(4, notice.getContent());
		

			int result = st.executeUpdate();

			st.close();
			con.close();

			return result;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int update(Notice notice) {
		// TODO Auto-generated method stub

	      String sql = "update notices set title=?, content=?  where code=?";
	      String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
			
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				Connection con = DriverManager.getConnection(url, "kenny", "computer");
	         PreparedStatement st = con.prepareStatement(sql);

	         // 모델 마련하기

	         st.setString(1, notice.getTitle());
	         st.setString(2, notice.getContent());
	         st.setString(3, notice.getCode());

	         int result = st.executeUpdate();
	         st.close();
	         con.close();
	         return result;

	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }

	      return 0;
	}

	@Override
	public int delete(String code) {
		// TODO Auto-generated method stub
		 String sql = "delete from notices where code=?";
		 String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
			
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				Connection con = DriverManager.getConnection(url, "kenny", "computer");
	         PreparedStatement st = con.prepareStatement(sql);

	         st.setString(1, code);

	         int result = st.executeUpdate();
	         st.close();
	         con.close();
	         return result;

	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }

	      return 0;

	}

	@Override
	public int getSize(String query, String field) {
		// TODO Auto-generated method stub
		String sql = "select count(*) CNT from notices where "+field+" LIKE ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
					PreparedStatement st = con.prepareStatement(sql);
					st.setString(1, "%"+query+"%");
					
					ResultSet rs = st.executeQuery();
					rs.next();

				
					int count = rs.getInt("CNT");
				
					rs.close();
					st.close();
					con.close();

					return count;
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				return 0;
	}

	@Override
	public int getSize(String query) {
		// TODO Auto-generated method stub
		return getSize(query, "TITLE");
	}

	@Override
	public String lastCode() {
		// TODO Auto-generated method stub
		String sql ="SELECT ISNULL(MAX(CAST(CODE AS INT)),0) CODE FROM NOTICES";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery(sql);

			rs.next();
			
			String code = rs.getString("CODE");

			rs.close();
			st.close();
			con.close();

			return code;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public Notice preNotice(String curCode) {
		// TODO Auto-generated method stub
		String sql="SELECT TOP 1 * FROM NOTICES WHERE REGDATE > (SELECT REGDATE FROM NOTICES WHERE CODE=?) ORDER BY REGDATE ASC";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, curCode);
			ResultSet rs = st.executeQuery();
			rs.next();

			Notice n = new Notice();
			n.setCode(rs.getString("Code"));
			n.setTitle(rs.getString("Title"));
			n.setId(rs.getString("Id"));
			n.setHit(rs.getInt("Hit"));
			n.setContent(rs.getString("Content"));

			rs.close();
			st.close();
			con.close();

			return n;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public Notice nextNotice(String curCode) {
		// TODO Auto-generated method stub
		String sql="SELECT TOP 1 * FROM NOTICES WHERE REGDATE < (SELECT REGDATE FROM NOTICES WHERE CODE=?) ORDER BY REGDATE DESC";
String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
					PreparedStatement st = con.prepareStatement(sql);
					
					st.setString(1, curCode);
					ResultSet rs = st.executeQuery();
					rs.next();

					Notice n = new Notice();
					n.setCode(rs.getString("Code"));
					n.setTitle(rs.getString("Title"));
					n.setId(rs.getString("Id"));
					n.setHit(rs.getInt("Hit"));
					n.setContent(rs.getString("Content"));

					rs.close();
					st.close();
					con.close();

					return n;
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				return null;
	}

}
