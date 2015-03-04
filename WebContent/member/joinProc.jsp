
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.tunea.jdbcdao.JdbcMemberDao"%>
<%@page import="com.tunea.dao.MemberDao"%>

<%@page import="com.tunea.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDao dao = new JdbcMemberDao();


	String pw="";
	String msg="";
	String id = request.getParameter("Id");

	
	
	
	String firstpw = request.getParameter("Pw");
	String repw = request.getParameter("rePw");
	if(firstpw.equals(repw)){
		pw=firstpw;
	}else{
		msg = "두개의 비밀번호가 다릅니다.";
	}
	String nickname = request.getParameter("nickname");
	String email = request.getParameter("email");
	String famName = request.getParameter("fam_name");
	String lastName = request.getParameter("last_name");
	String name=famName+lastName;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
 	String birth = request.getParameter("birth");
	
	SimpleDateFormat sdformat=new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date birthday=sdformat.parse(birth);
	
	java.sql.Date birthD=new java.sql.Date(birthday.getTime());
	Member m = new Member();
	m.setId(id);
	m.setPw(pw);
	m.setNickname(nickname);
	m.setEmail(email);
	m.setName(name);
	m.setPhone(phone);
	m.setAddress(address);
 	m.setBirth(birthD); 
	


	
	dao.insert(m);
	


	if (!msg.equals("")) {
		request.setAttribute("msg", msg);
		RequestDispatcher dispatcher = request
		.getRequestDispatcher("join.jsp");

		dispatcher.forward(request, response);
	}

	response.sendRedirect("../index.jsp");
%>