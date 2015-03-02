package com.tunea.jdbcdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tunea.dao.SoloVideoDao;
import com.tunea.model.SoloVideo;

public class JdbcSoloVideoDao implements SoloVideoDao{

	@Override
	public List<SoloVideo> SoloVideo(String area) {
		String sql = "select * from solovideos where Adress like ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, area + "%");

			ResultSet rs = st.executeQuery();
			// 모델 마련하기
			List<SoloVideo> svlist = new ArrayList<SoloVideo>();

			while (rs.next()) {
				SoloVideo sv = new SoloVideo();

				sv.setCode(rs.getString("code"));
				sv.setContent(rs.getString("content"));
				sv.setHit(rs.getInt("hit"));
				sv.setTitle(rs.getString("title"));
				sv.setUpload_url(rs.getString("upload_url"));
				sv.setId(rs.getString("id"));
				sv.setW_date(rs.getDate("w_date"));
				
			}
			rs.close();
			st.close();
			con.close();
			return svlist;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<SoloVideo> SoloVideo() {
		
		
		return SoloVideo("%");
	}

	@Override
	public SoloVideo getsolovideo(String code) {
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
			SoloVideo sv = new SoloVideo();

			sv.setCode(rs.getString("code"));
			sv.setContent(rs.getString("content"));
			sv.setHit(rs.getInt("hit"));
			sv.setTitle(rs.getString("title"));
			sv.setUpload_url(rs.getString("upload_url"));
			sv.setId(rs.getString("id"));
			sv.setW_date(rs.getDate("w_date"));

			rs.close();
			st.close();
			con.close();
			return sv;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int insert(SoloVideo sv) {
		String sql = "insert into solovideos values (?,?,?,?,?,?,?)";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, sv.getCode());
			st.setString(2, sv.getContent());
			st.setInt(3, sv.getHit());
			st.setString(4, sv.getTitle());
			st.setString(5, sv.getUpload_url());
			st.setString(6, sv.getId());
			st.setDate(7,  sv.getW_date());
			

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
	public int update(SoloVideo sv) {
		String sql = "update solovideos set code = ?, content = ?, hit = ?, title = ?, id = ?, wdate=?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, sv.getCode());
			st.setString(2, sv.getContent());
			st.setInt(3, sv.getHit());
			st.setString(4, sv.getTitle());
			st.setString(5, sv.getUpload_url());
			st.setString(6, sv.getId());
			st.setDate(7,  sv.getW_date());
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
	public int delete(SoloVideo sv) {
		String sql = "delete solovideos where code = ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, sv.getCode());

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

}
