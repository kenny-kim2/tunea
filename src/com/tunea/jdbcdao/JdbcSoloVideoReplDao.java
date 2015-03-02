package com.tunea.jdbcdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tunea.dao.OrchBoardReplDao;
import com.tunea.model.OrchBoardRepl;

public class JdbcSoloVideoReplDao implements OrchBoardReplDao {


	@Override
	public int replSize(String table) {

		String sql = "select count(*) from "+table;
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			Statement st = con.createStatement();
			

			ResultSet rs = st.executeQuery(sql);
			// 모델 마련하기
			
			rs.next();
			
			int results = rs.getInt("count(*)");

			
			rs.close();
			st.close();
			con.close();
			return results;

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
	public int insert(OrchBoardRepl repl, String table) {

		String sql = "insert into "+table+" values(?,?,?,?,?)";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		String sqlCode = "SELECT isnull(MAX(CAST(CODE as int)),0)+1 CODE FROM "+table;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			Statement st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery(sqlCode);
			
			rs1.next();
			String code = rs1.getString("code");
						
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, code);
			st.setString(2, repl.getBoardCode());
			st.setString(3, repl.getId());			
			st.setDate(4, repl.getW_date());
			st.setString(5, repl.getContent());
			
			
			int results = st.executeUpdate();
			// 모델 마련하기
			
			st.close();
			con.close();
			return results;

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
	public int update(OrchBoardRepl repl, String table) {

		String sql = "update "+table+" set content = ? where code = ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, repl.getContent());
			st.setString(2, repl.getCode());
			
			
			int results = st.executeUpdate();
			// 모델 마련하기
			
			st.close();
			con.close();
			return results;

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
	public int delete(String code, String table) {
		String sql = "delete from "+table+" where code = ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, code);
			
			int results = st.executeUpdate();
			// 모델 마련하기
			
			st.close();
			con.close();
			return results;

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
	public int report(OrchBoardRepl repl, String userId, String table, String content) {
		//메시지
		String sqlMessage = "insert into Messages values(?,?,?,?,getdate(),0)";
		String sqlMessageCode = "SELECT isnull(MAX(CAST(CODE as int)),0)+1 CODE FROM Messages";
		
		//맴버 숫자 올림
		String sqlMember = "update Members set reporthit = reporthit+1 where id = ?";
		
		//신고 테이블에 값 올림
		String sqlReport = "insert into Reports values (?,?,?,?,2,?,getdate(),?)";
		String sqlReportCode = "SELECT isnull(MAX(CAST(CODE as int)),0)+1 CODE FROM Reports";
		
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
			//메시지 테이블 code 생성			
			Statement stMessageCode = con.createStatement();
			ResultSet rsMessageCode = stMessageCode.executeQuery(sqlMessageCode);

			String messageCode = rsMessageCode.getString("Code");
			
			rsMessageCode.close();
			stMessageCode.close();
			//메시지 테이블 입력
			PreparedStatement stMessage = con.prepareStatement(sqlMessage);
			stMessage.setString(1, messageCode);
			stMessage.setString(2, userId);
			stMessage.setString(3, repl.getId());			
			stMessage.setString(4, content);
			
			stMessage.executeUpdate();
			stMessage.close();
			
			//맴버 테이블 값 올림
			PreparedStatement stMember = con.prepareStatement(sqlMember);
			stMember.setString(1, repl.getId());
			stMember.executeUpdate();
			
			stMember.close();
			
			//신고 테이블 코드 생성
			Statement stReportCode = con.createStatement();
			ResultSet rsReportCode = stMessageCode.executeQuery(sqlReportCode);

			String reportCode = rsReportCode.getString("Code");
			
			rsReportCode.close();
			stReportCode.close();
			//신고 테이블 입력
			PreparedStatement stReport = con.prepareStatement(sqlReport);
			stReport.setString(1, reportCode);
			stReport.setString(2, userId);
			stReport.setString(3, repl.getId());			
			stReport.setString(4, table);
			stReport.setString(5, repl.getCode());
			stReport.setString(6, content);
			
			int results = stReport.executeUpdate();
			stReport.close();
			
			con.close();
			return results;

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
	public List<OrchBoardRepl> getReplsLittle(String table) {
		int start = 1;
		int end = 3;

		String sql = "select * from (select (row_number() over (order by WDate desc)) num, "
				+ table + ".* from " + table+ ") n where n.num between ? and ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, start);
			st.setInt(2, end);

			ResultSet rs = st.executeQuery();
			// 모델 마련하기
			List<OrchBoardRepl> repls = new ArrayList<OrchBoardRepl>();

			while (rs.next()) {
				OrchBoardRepl r = new OrchBoardRepl();

				r.setCode(rs.getString("Code"));
				r.setBoardCode(rs.getString("BoardCode"));
				r.setId(rs.getString("Id"));
				r.setW_date(rs.getDate("WDate"));
				r.setContent(rs.getString("Content"));

				repls.add(r);
			}
			rs.close();
			st.close();
			con.close();
			return repls;

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
	public List<OrchBoardRepl> getReplsAll(String table) {

		String sql = "select * from (select (row_number() over (order by WDate desc)) num, "
				+ table	+ ".* from "+ table	+ ") n between 1 and 12";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny",
					"computer");
			Statement st = con.createStatement();


			ResultSet rs = st.executeQuery(sql);
			// 모델 마련하기
			List<OrchBoardRepl> repls = new ArrayList<OrchBoardRepl>();

			while (rs.next()) {
				OrchBoardRepl r = new OrchBoardRepl();

				r.setCode(rs.getString("Code"));
				r.setBoardCode(rs.getString("BoardCode"));
				r.setId(rs.getString("Id"));
				r.setW_date(rs.getDate("WDate"));
				r.setContent(rs.getString("Content"));

				repls.add(r);
			}
			rs.close();
			st.close();
			con.close();
			return repls;

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
