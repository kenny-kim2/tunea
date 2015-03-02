package com.tunea.jdbcdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tunea.dao.GroupVideoDao;
import com.tunea.model.GroupVideo;

public class JdbcGroupVideoDao implements GroupVideoDao{

	@Override
	public List<GroupVideo> GroupVideo(String area) {
		String sql = "select * from groupvideos where Adress like ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, area + "%");

			ResultSet rs = st.executeQuery();
			// 모델 마련하기
			List<GroupVideo> gvlist = new ArrayList<GroupVideo>();

			while (rs.next()) {
				GroupVideo gv = new GroupVideo();

				gv.setCode(rs.getString("code"));
				gv.setContent(rs.getString("content"));
				gv.setHit(rs.getInt("hit"));
				gv.setTitle(rs.getString("title"));
				gv.setUpload_url(rs.getString("upload_url"));
				gv.setId(rs.getString("id"));
				gv.setW_date(rs.getDate("w_date"));
				
			}
			rs.close();
			st.close();
			con.close();
			return gvlist;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<GroupVideo> GroupVideo() {
		return GroupVideo("%");
	}

	@Override
	public GroupVideo getgroupvideo(String code) {
		String sql = "select * from groupvideos where code=?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=newlecdb";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, code);

			ResultSet rs = st.executeQuery();
			// 모델 마련하기

			rs.next();
			GroupVideo gv = new GroupVideo();

			gv.setCode(rs.getString("code"));
			gv.setContent(rs.getString("content"));
			gv.setHit(rs.getInt("hit"));
			gv.setTitle(rs.getString("title"));
			gv.setUpload_url(rs.getString("upload_url"));
			gv.setId(rs.getString("id"));
			gv.setW_date(rs.getDate("w_date"));

			rs.close();
			st.close();
			con.close();
			return gv;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int insert(GroupVideo gv) {
		String sql = "insert into groupvideos values (?,?,?,?,?,?,?)";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, gv.getCode());
			st.setString(2, gv.getContent());
			st.setInt(3, gv.getHit());
			st.setString(4, gv.getTitle());
			st.setString(5, gv.getUpload_url());
			st.setString(6, gv.getId());
			st.setDate(7,  gv.getW_date());
			

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
	public int update(GroupVideo gv) {
		String sql = "update groupvideos set code = ?, content = ?, hit = ?, title = ?, id = ?, wdate=?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, gv.getCode());
			st.setString(2, gv.getContent());
			st.setInt(3, gv.getHit());
			st.setString(4, gv.getTitle());
			st.setString(5, gv.getUpload_url());
			st.setString(6, gv.getId());
			st.setDate(7,  gv.getW_date());
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
	public int delete(GroupVideo gv) {
		String sql = "delete groupvideos where code = ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, gv.getCode());

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
