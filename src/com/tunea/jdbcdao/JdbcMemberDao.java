package com.tunea.jdbcdao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tunea.dao.MemberDao;
import com.tunea.model.Member;

public class JdbcMemberDao implements MemberDao {

	@Override
	public Member getMember(String uid) {
		String sql = "select * from members where Id = ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, uid);
			
			ResultSet rs = st.executeQuery();
			
			Member n = new Member();

			rs.next();

			n.setId(rs.getString("Id"));
			n.setName(rs.getString("Name"));
			n.setPw(rs.getString("Pw"));
			
			
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
	public int insert(Member member) {
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		String sql = "insert into members(Id, Pw, Nickname, email, name, phone,address,birth,category,reporthit) values(?,?,?,?,?,?,?,?,1,0)";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
			PreparedStatement pst = con.prepareStatement(sql);

			pst.setString(1, member.getId());
			pst.setString(2, member.getPw());
			pst.setString(3, member.getNickname());
			pst.setString(4, member.getEmail());
			pst.setString(5, member.getName());
			pst.setString(6, member.getPhone());
			pst.setString(7, member.getAddress());
			pst.setDate(8, member.getBirth());
			
			int result = pst.executeUpdate();
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

	@Override
	public int delete(String uid) {
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		String sql = "update members set category=4 where Id=?";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, uid);

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
	public int update(Member member) {
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		String sql = "update members set pw=?, Nickname=? , Email=?, Phone=?, Address=? where id=?";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
			PreparedStatement st = con.prepareStatement(sql);

			

			st.setString(1, member.getPw());
			st.setString(2, member.getNickname());
			st.setString(3, member.getEmail());
			st.setString(4, member.getPhone());
			st.setString(5, member.getAddress());
			st.setString(6, member.getId());

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
	public List<Member> getMembers() {
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		String sql = "select * from members";

		int result=0;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
			Statement st = con.createStatement();	
			ResultSet rs = st.executeQuery(sql);
			
			List<Member> list=new ArrayList<Member>();
			
			while(rs.next()){
				Member member = new Member();
				member.setId(rs.getString("Id"));
				member.setNickname(rs.getString("Nickname"));
				
				list.add(member);
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



}
