package com.tunea.jdbcdao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.tunea.dao.MessageDao;
import com.tunea.model.Member;
import com.tunea.model.Message;

public class JdbcMessageDao implements MessageDao {

	@Override
	public Message getMessage(String code) {
		String sql = "select * from notices where code=?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
			PreparedStatement pst = con.prepareStatement(sql);
			
			Message n = new Message();
            pst.setString(1,code);
	
			
			
			ResultSet rs = pst.executeQuery();
			rs.next();
			
			n.setCode(rs.getString("Code"));
			n.setSendid(rs.getString("SendId"));
			n.setReceiveId(rs.getString("ReceiveId"));
			n.setContent(rs.getString("Content"));
			n.setMsgDate(rs.getDate("MSGDate"));
			n.setRead(1);
			

			rs.close();
			pst.close();
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
	public List<Message> getMessages(String uid, int page, Date dateStart, Date dateEnd) {
		int start = 12 * (page - 1) + 1;
		int end = 12 * (page - 1) + 12;

		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
    	String sql = "select * from (select (row_number() over (order by REGDATE desc))"
				+ " num, messages.* from messages WHERE ? < MSGDate and MSGDate < ?"
			    + ") n where ReceiveId=? n.num between ? and ?";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
			PreparedStatement st = con.prepareStatement(sql);
			// �� �����ϱ�

			st.setDate(1, dateStart);
			st.setDate(2, dateEnd);
			st.setString(3, uid);
			st.setInt(4, start);
			st.setInt(5, end);

			ResultSet rs = st.executeQuery();

			List<Message> list = new ArrayList<Message>();

			while (rs.next()) {
				Message m = new Message();

				m.setCode(rs.getString("Code"));
				m.setSendid(rs.getString("SendId"));
				m.setReceiveId(rs.getString("ReceiveId"));
				m.setContent(rs.getString("Content"));
				m.setMsgDate(rs.getDate("MSGDate"));
				m.setRead(rs.getInt("Read"));
				list.add(m);
			}
			rs.close();
			st.close();
			con.close();

			return list;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Message> getMessages(String uid, int page) {
		Calendar cal = Calendar.getInstance();
		
		java.util.Date date = cal.getTime();
		Date sqlDate = new Date(date.getTime());
		 cal.add(Calendar.YEAR, -1);
		 java.util.Date date1 = cal.getTime();
		 Date sqlDate2 = new Date(date1.getTime());
		
		return getMessages(uid, page,sqlDate,sqlDate2);
	}

	@Override
	public int insert(Message message) {
		
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		String sql = "insert into Messages(Code, SendId, ReceiveId, Content, MSGDate, Read) values(?,?,?,?,GETDATE(),0)";
		String sqlCode = "SELECT isnull(MAX(CAST(CODE as int)),0)+1 CODE FROM Messages";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "kenny", "computer");
			PreparedStatement pst = con.prepareStatement(sql);
			
		
			Statement stCode = con.createStatement();
			ResultSet rsCode = stCode.executeQuery(sqlCode);
			rsCode.next();
			String code = rsCode.getString("CODE");
			rsCode.close();
			stCode.close();

			pst.setString(1, code);
			pst.setString(2, message.getSendid());
			pst.setString(3, message.getReceiveId());
			pst.setString(4, message.getContent());

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
	public int delete(String code) {
		
		
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tunea";
		String sql = "delete from messages where code=?";

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


}
