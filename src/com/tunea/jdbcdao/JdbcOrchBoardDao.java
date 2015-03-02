package com.tunea.jdbcdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tunea.dao.OrchBoardDao;
import com.tunea.model.OrchBoard;

public class JdbcOrchBoardDao implements OrchBoardDao {
	@Override
	public List<OrchBoard> getorchb(String area) {
		String sql = "select * from Orch_Board where Adress like ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, area + "%");

			ResultSet rs = st.executeQuery();
			// 모델 마련하기
			List<OrchBoard> orchblist = new ArrayList<OrchBoard>();

			while (rs.next()) {
				OrchBoard orchb = new OrchBoard();

				orchb.setId(rs.getString("Id"));
				orchb.setContent(rs.getString("content"));
				orchb.setHit(rs.getInt("hit"));
				orchb.setTitle(rs.getString("title"));
				orchb.setCategory(rs.getString("category"));
				orchb.setId(rs.getString("id"));
				orchb.setW_date(rs.getDate("w_date"));
				orchblist.add(orchb);
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
	public int insert(OrchBoard orchb) {
		String sql = "insert into Orch_Board values (?,?,?,?,?,?,?)";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, orchb.getCode());
			st.setString(2, orchb.getContent());
			st.setInt(3, orchb.getHit());
			st.setString(4, orchb.getTitle());
			st.setString(5, orchb.getCategory());
			st.setString(6, orchb.getId());
			st.setDate(7, orchb.getW_date());

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
	public int update(OrchBoard orchb) {
		String sql = "update Orch_Board set code = ?, content = ?, hit = ?, title = ?, id = ?, wdate=?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, orchb.getCode());
			st.setString(2, orchb.getContent());
			st.setInt(3, orchb.getHit());
			st.setString(4, orchb.getTitle());
			st.setString(5, orchb.getCategory());
			st.setString(6, orchb.getId());
			st.setDate(7, orchb.getW_date());

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
	public int delete(OrchBoard orchb) {

		String sql = "delete orchboards where code = ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, orchb.getCode());

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
	public List<OrchBoard> getOrchb() {
		return getorchb("%");
	}

	@Override
	public OrchBoard getOrchbDetail(String code) {
		String sql = "select * from Orch_board where code=?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=newlecdb";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, code);

			ResultSet rs = st.executeQuery();
			// 모델 마련하기

			rs.next();
			OrchBoard orchb = new OrchBoard();

			orchb.setId(rs.getString("Id"));
			orchb.setContent(rs.getString("content"));
			orchb.setHit(rs.getInt("hit"));
			orchb.setTitle(rs.getString("title"));
			orchb.setCategory(rs.getString("category"));
			orchb.setId(rs.getString("id"));
			orchb.setW_date(rs.getDate("w_date"));
			

			rs.close();
			st.close();
			con.close();
			return orchb;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
