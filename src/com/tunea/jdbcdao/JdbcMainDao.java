package com.tunea.jdbcdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tunea.dao.MainDao;
import com.tunea.model.Concert;
import com.tunea.model.GroupVideo;
import com.tunea.model.Notice;
import com.tunea.model.OrchInfo;

public class JdbcMainDao implements MainDao {

	@Override
	public List<GroupVideo> getMainVideos() {
		String sql1 = "select top(2) * from GroupVideos order by hit desc";
		String sql2 = "select top(1) * from MemVideos order by hit desc";

		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			Statement st = con.createStatement();

			List<GroupVideo> glist = new ArrayList<GroupVideo>();
			ResultSet rs = st.executeQuery(sql1);
			// 모델 마련하기

			while (rs.next()) {
				GroupVideo gvideo = new GroupVideo();

				gvideo.setCode(rs.getString("code"));
				gvideo.setContent(rs.getString("content"));
				gvideo.setHit(rs.getInt("Hit"));
				gvideo.setTitle(rs.getString("title"));
				gvideo.setUpload_url(rs.getString("uploadURL"));
				gvideo.setId(rs.getString("id"));
				gvideo.setW_date(rs.getDate("WDate"));

				glist.add(gvideo);
			}
			rs = st.executeQuery(sql2);

			while (rs.next()) {
				GroupVideo gvideo = new GroupVideo();

				gvideo.setCode(rs.getString("code"));
				gvideo.setContent(rs.getString("content"));
				gvideo.setHit(rs.getInt("Hit"));
				gvideo.setTitle(rs.getString("title"));
				gvideo.setUpload_url(rs.getString("uploadURL"));
				gvideo.setId(rs.getString("id"));
				gvideo.setW_date(rs.getDate("WDate"));

				glist.add(gvideo);
			}
			rs.close();

			st.close();
			con.close();
			return glist;

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
	public Concert getMainConcert() {
		String sql = "SELECT TOP(1) * FROM ConInfos ORDER BY NEWID()";

		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery(sql);

			// 모델 마련하기

			Concert concert = new Concert();
			rs.next();
			concert.setCode(rs.getString("code"));
			concert.setConDate(rs.getDate("ConDate"));
			concert.setPlace(rs.getString("place"));
			concert.setTitle(rs.getString("title"));
			concert.setImg(rs.getString("img"));
			concert.setContent(rs.getString("content"));
			concert.setId(rs.getString("id"));

			rs.close();

			st.close();
			con.close();
			return concert;

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
	public List<Concert> getMainConcerts() {
		String sql = "select * from ConInfos where ConDate > getdate() order by ConDate asc;";

		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery(sql);

			// 모델 마련하기

			List<Concert> concerts = new ArrayList<Concert>();
			while (rs.next()) {
				Concert concert = new Concert();
				concert.setCode(rs.getString("code"));
				concert.setConDate(rs.getDate("ConDate"));
				concert.setPlace(rs.getString("place"));
				concert.setTitle(rs.getString("title"));
				concert.setImg(rs.getString("img"));
				concert.setContent(rs.getString("content"));
				concert.setId(rs.getString("id"));
				concerts.add(concert);
			}

			rs.close();

			st.close();
			con.close();
			return concerts;

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
	public OrchInfo getMainOrchInfo() {
		String sql = "SELECT TOP(1) * FROM OrchInfos where agree != 1 ORDER BY NEWID()";

		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery(sql);

			// 모델 마련하기

			OrchInfo info = new OrchInfo();
			rs.next();
			
			info.setId(rs.getString("id"));
			info.setName(rs.getString("Name"));
			info.setBirth(rs.getDate("birth"));
			info.setConductor(rs.getString("Conductor"));
			info.setCategory(rs.getInt("Category"));
			info.setImg(rs.getString("img"));
			info.setPracticetime(rs.getString("PracTime"));
			info.setAdress(rs.getString("Adress"));
			info.setContent(rs.getString("Content"));

			rs.close();

			st.close();
			con.close();
			return info;

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
	public List<Notice> getNewNotices() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Notice> getPupNotices() {
		// TODO Auto-generated method stub
		return null;
	}

}
