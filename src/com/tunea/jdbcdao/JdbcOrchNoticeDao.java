package com.tunea.jdbcdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tunea.dao.OrchNoticeDao;
import com.tunea.model.OrchNotice;

public class JdbcOrchNoticeDao implements OrchNoticeDao{

	@Override
	public List<OrchNotice> getorchn(String area) {
		String sql = "select * from OrchNotices where Adress like ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, area + "%");

			ResultSet rs = st.executeQuery();
			// 모델 마련하기
			List<OrchNotice> orchblist = new ArrayList<OrchNotice>();

			while (rs.next()) {
				OrchNotice orchn = new OrchNotice();

				orchn.setId(rs.getString("Id"));
				orchn.setContent(rs.getString("content"));
				orchn.setHit(rs.getInt("hit"));
				orchn.setTitle(rs.getString("title"));
				orchn.setCategory(rs.getString("category"));
				orchn.setId(rs.getString("id"));
				orchn.setW_date(rs.getDate("w_date"));
				orchblist.add(orchn);
			}
			rs.close();
			st.close();
			con.close();
			return orchblist;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public int insert(OrchNotice orchn) {
		String sql = "insert into OrchNotices values (?,?,?,?,?,?,?)";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, orchn.getCode());
			st.setString(2, orchn.getContent());
			st.setInt(3, orchn.getHit());
			st.setString(4, orchn.getTitle());
			st.setString(5, orchn.getCategory());
			st.setString(6, orchn.getId());
			st.setDate(7,  orchn.getW_date());
			

			int returnInteger = st.executeUpdate();
			// 모델 마련하기

			st.close();
			con.close();
			return returnInteger;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int update(OrchNotice orchn) {
		String sql = "update OrchNotices set code = ?, content = ?, hit = ?, title = ?, id = ?, wdate=?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, orchn.getCode());
			st.setString(2, orchn.getContent());
			st.setInt(3, orchn.getHit());
			st.setString(4, orchn.getTitle());
			st.setString(5, orchn.getCategory());
			st.setString(6, orchn.getId());
			st.setDate(7, orchn.getW_date());

			int returnInteger = st.executeUpdate();
			// 모델 마련하기

			st.close();
			con.close();
			return returnInteger;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int delete(OrchNotice orchn) {
		String sql = "delete OrchNotices where code = ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, orchn.getCode());

			int returnInteger = st.executeUpdate();
			// 모델 마련하기

			st.close();
			con.close();
			return returnInteger;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}


	@Override
	public List<OrchNotice> getOrchn() {
		return getorchn("%");
	}


	@Override
	public OrchNotice getOrchDetail(String code) {
		String sql = "select * from OrchNotices where code=?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=newlecdb";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, code);

			ResultSet rs = st.executeQuery();
			// 모델 마련하기

			rs.next();
			OrchNotice orchn = new OrchNotice();

			orchn.setId(rs.getString("Id"));
			orchn.setContent(rs.getString("content"));
			orchn.setHit(rs.getInt("hit"));
			orchn.setTitle(rs.getString("title"));
			orchn.setCategory(rs.getString("category"));
			orchn.setId(rs.getString("id"));
			orchn.setW_date(rs.getDate("w_date"));

			rs.close();
			st.close();
			con.close();
			return orchn;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
