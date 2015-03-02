package com.tunea.jdbcdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tunea.dao.OrchInfoDao;
import com.tunea.model.OrchInfo;

public class JdbcOrchInfoDao implements OrchInfoDao{
	@Override
	public List<OrchInfo> getOrch(String area) {
		String sql = "select * from OrchInfos where Adress like ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, area + "%");

			ResultSet rs = st.executeQuery();
			// 모델 마련하기
			List<OrchInfo> orchlist = new ArrayList<OrchInfo>();

			while (rs.next()) {
				OrchInfo orch = new OrchInfo();

				orch.setId(rs.getString("Id"));
				orch.setName(rs.getString("Name"));
				orch.setBirth(rs.getDate("Birth"));
				orch.setConductor(rs.getString("Conductor"));
				orch.setCategory(rs.getInt("Category"));
				orch.setImg(rs.getString("Img"));
				orch.setPracticetime(rs.getString("PracTime"));
				orch.setAgree(rs.getInt("Agree"));
				orch.setAdress(rs.getString("Adress"));
				orchlist.add(orch);
			}
			rs.close();
			st.close();
			con.close();
			return orchlist;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List<OrchInfo> getOrch() {
		return getOrch("%");
	}

	@Override
	public OrchInfo getOrchDetail(String code) {
		String sql = "select * from OrchInfos where code=?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=newlecdb";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, code);

			ResultSet rs = st.executeQuery();
			// 모델 마련하기

			rs.next();
			OrchInfo orch = new OrchInfo();

			orch.setId(rs.getString("Id"));
			orch.setName(rs.getString("Name"));
			orch.setBirth(rs.getDate("Birth"));
			orch.setConductor(rs.getString("Conductor"));
			orch.setCategory(rs.getInt("Category"));
			orch.setImg(rs.getString("Img"));
			orch.setPracticetime(rs.getString("PracTime"));
			orch.setAgree(rs.getInt("Agree"));
			orch.setAdress(rs.getString("Adress"));

			rs.close();
			st.close();
			con.close();
			return orch;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public int insert(OrchInfo orch) {
		String sql = "insert into OrchInfos values (?,?,?,?,?,?,?,?,?)";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, orch.getId());
			st.setString(2, orch.getName());
			st.setDate(3, orch.getBirth());
			st.setString(4, orch.getConductor());
			st.setInt(5, orch.getCategory());
			st.setString(6, orch.getImg());
			st.setString(7, orch.getPracticetime());
			st.setInt(8, orch.getAgree());
			st.setString(9, orch.getAdress());

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
	public int update(OrchInfo orch) {
		String sql = "update OrchInfos set name = ?, birth = ?, conductor = ?, category = ?, img = ?, practicetime=?,agree=?,adress=? where id = ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, orch.getName());
			st.setDate(2, orch.getBirth());
			st.setString(3, orch.getConductor());
			st.setInt(4, orch.getCategory());
			st.setString(5, orch.getImg());
			st.setString(6, orch.getPracticetime());
			st.setInt(7, orch.getAgree());
			st.setString(8, orch.getAdress());
			st.setString(9, orch.getId());

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
	public int delete(OrchInfo orch) {
		String sql = "delete orchinfos where id = ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, orch.getId());

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
	public int delegate(String oldId, String newId) {
		String sql = "update OrchInfos set id = ? where id = ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, newId);
			st.setString(2, oldId);

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