package com.tunea.jdbcdao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.tunea.dao.ConcertDao;
import com.tunea.model.Concert;

public class JdbcConcertDao implements ConcertDao {

	@Override
	public Concert getConcert(String code) {
		String sql = "select * from ConInfos where Code= ? ";
		String imgSql = "select * from ConInfoImages where ConCode=?";

		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			PreparedStatement st = con.prepareStatement(sql);
			PreparedStatement imgSt = con.prepareStatement(imgSql);

			st.setString(1, code);
			imgSt.setString(1, code);

			ResultSet rs = st.executeQuery();
			ResultSet imgRs = imgSt.executeQuery();

			Concert c = new Concert();

			rs.next();
			List<String> imgs = new ArrayList<String>();

			while (imgRs.next()) {
				imgs.add(imgRs.getString("Img"));
			}

			c.setImgs(imgs);

			c.setCode(rs.getString("Code"));
			c.setConDate(rs.getDate("ConDate"));
			c.setPlace(rs.getString("Place"));
			c.setTitle(rs.getString("Title"));
			c.setImg(rs.getString("Img"));
			c.setContent(rs.getString("Content"));
			c.setId(rs.getString("Id"));

			rs.close();
			st.close();
			con.close();

			return c;

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
	public List<Concert> getConcert(int page, String query, String field, Date fromDate, Date toDate) {

		int start = 9 * (page - 1) + 1;
		int end = 9 * (page - 1) + 9;

		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		String sql = "select * from (select (row_number() over (order by ConDate desc))"
				+ " num, ConInfos.* from ConInfos WHERE "
				+ field
				+ " like ? and ? < ConDate and ConDate > ?) n where n.num between ? and ?";
		
		 /*  String sql = "select * from (select (row_number() over (order by REGDATE desc))"
            + " num, messages.* from messages WHERE ? < MSGDate and MSGDate < ?"
             + ") n where ReceiveId=? n.num between ? and ?";*/

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, "%" + query + "%");
			st.setDate(2, fromDate);
			st.setDate(3, toDate);
			st.setInt(4, start);
			st.setInt(5, end);
			
			ResultSet rs = st.executeQuery();

			List<Concert> list = new ArrayList<Concert>();

			while (rs.next()) {
				Concert c = new Concert();

				c.setCode(rs.getString("Code"));
				c.setConDate(rs.getDate("ConDate"));
				c.setPlace(rs.getString("Place"));
				c.setTitle(rs.getString("Title"));
				c.setImg(rs.getString("Img"));
				c.setContent(rs.getString("Content"));
				c.setId(rs.getString("Id"));

				list.add(c);
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
	public List<Concert> getConcert(int page, String query, String field) {
		
		Calendar cal = Calendar.getInstance();
		
		java.util.Date date = cal.getTime();
	    Date sqlDate = new Date(date.getTime());
	    cal.add(Calendar.MONTH, -1);
	    java.util.Date date1 = cal.getTime();
	    Date sqlDate2 = new Date(date1.getTime());
	    
	    return getConcert(page, query, field, sqlDate, sqlDate2);
	}

	@Override
	public List<Concert> getConcert(int page, String query) {
		return getConcert(page, query, "서울");
	}

	@Override
	public List<Concert> getConcert(int page) {
		return getConcert(page, "");
	}

	@Override
	public int insert(Concert concert) {

		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		String sqlCode = "SELECT isnull(MAX(CAST(Code as int)),0)+1 Code FROM ConInfos";
		String sql = "insert into ConInfos(Code, ConDate, Place, Title, Img, Content, Id) values(?,?,?,?,?,?,?)";
		
		String sqlCode2 = "SELECT isnull(MAX(CAST(Code as int)),0)+1 Code FROM ConInfoImages";
		String sql2 = "insert into ConInfoImages(Code, ConCode, Img) values(?,?,?)";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			PreparedStatement pst = con.prepareStatement(sql);

			Statement stCode = con.createStatement();
			ResultSet rsCode = stCode.executeQuery(sqlCode);
			rsCode.next();

			String code = rsCode.getString("Code");
			rsCode.close();
			stCode.close();

			pst.setString(1, code);
			pst.setDate(2, concert.getConDate());
			pst.setString(3, concert.getPlace());
			pst.setString(4, concert.getTitle());
			pst.setString(5, concert.getImg());
			pst.setString(6, concert.getContent());
			pst.setString(7, concert.getId());

			int result = pst.executeUpdate();

			for (int i = 0; i < concert.getImgs().size(); i++) {
				Statement stCode2 = con.createStatement();

				ResultSet rsCode2 = stCode2.executeQuery(sqlCode2);

				rsCode2.next();

				String code2 = rsCode2.getString("Code");

				rsCode2.close();
				
				PreparedStatement pst2 = con.prepareStatement(sql2);
				pst2.setString(1, code2);
				pst2.setString(2, code);
				pst2.setString(3, concert.getImgs().get(i));

				stCode.close();

				int result2 = pst.executeUpdate();
			}

			pst.close();
			con.close();
			return result;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	/*
	 * @Override public int insertImg(Images images) {
	 * 
	 * String url =
	 * "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea"; String sql
	 * = "insert into ConInfoImage(Code, ConCode, Img) values(?,?,?)"; String
	 * sqlCode =
	 * "SELECT isnull(MAX(CAST(Code as int)),0)+1 Code FROM ConInfoImages";
	 * String sqlConCode =
	 * "SELECT MAX(CAST(Code as int)) ConCode FROM ConInfos";
	 * 
	 * try { Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	 * Connection con = DriverManager.getConnection(url, "kenny", "computer");
	 * 
	 * PreparedStatement pst = con.prepareStatement(sql); Statement stCode =
	 * con.createStatement();
	 * 
	 * ResultSet rsCode = stCode.executeQuery(sqlCode); ResultSet rsConCode =
	 * stCode.executeQuery(sqlConCode);
	 * 
	 * rsCode.next(); rsConCode.next();
	 * 
	 * String code = rsCode.getString("Code"); String conCode =
	 * rsConCode.getString("ConCode");
	 * 
	 * rsCode.close(); rsConCode.close();
	 * 
	 * stCode.close();
	 * 
	 * pst.setString(1, code); pst.setString(2, conCode); pst.setString(3,
	 * images.getImg());
	 * 
	 * int result = pst.executeUpdate();
	 * 
	 * pst.close(); con.close(); return result;
	 * 
	 * } catch (ClassNotFoundException e) { e.printStackTrace(); } catch
	 * (SQLException e) { e.printStackTrace(); }
	 * 
	 * return 0; }
	 */

	@Override
	public int delete(String code) {

		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		String sql = "delete from ConInfos where Code=?";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
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
	public int update(Concert concert) {

		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		String sql = "update ConInfos set ConDate=?, Place=?, Title=?, Img=?, Content=?  where Code=?";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			PreparedStatement st = con.prepareStatement(sql);

			st.setDate(1, concert.getConDate());
			st.setString(2, concert.getPlace());
			st.setString(3, concert.getTitle());
			st.setString(4, concert.getImg());
			st.setString(5, concert.getContent());

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

		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		String sql = "SELECT count(*) count FROM ConInfos WHERE " + field
				+ " like ?";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, "%" + query + "%");

			ResultSet rs = st.executeQuery();

			rs.next();
			int count = rs.getInt("count");

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
		return getSize(query, "서울");
	}

	

}
