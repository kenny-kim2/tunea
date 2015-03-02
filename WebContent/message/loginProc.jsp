
<%@page import="com.tunea.model.Member"%>
<%@page import="com.tunea.jdbcdao.JdbcMemberDao"%>
<%@page import="com.tunea.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");

	MemberDao dao = new JdbcMemberDao();

	Member m = dao.getMember(uid);
	String msg = "";

	if (m == null){
		msg = "회원이 존재하지 않습니다.";
		request.setAttribute("msg", msg);
	 	RequestDispatcher dispatcher = request
				.getRequestDispatcher("login.jsp");
	 	dispatcher.forward(request, response); 
		
	}
	else if (!m.getPw().equals(pwd)){
		msg = "비밀번호가 틀렸습니다.";
		request.setAttribute("msg", msg);
	 	RequestDispatcher dispatcher = request
				.getRequestDispatcher("login.jsp");
	 	dispatcher.forward(request, response); 
	}
	else {
		session.setAttribute("uid", uid);
		response.sendRedirect("../index.jsp");
	}

	if (!msg.equals("")) {
		request.setAttribute("msg", msg);
	 	RequestDispatcher dispatcher = request
				.getRequestDispatcher("list.jsp");

	 	dispatcher.forward(request, response); 
	}
	
	/* response.sendRedirect("../index.jsp"); */
	/* System.out.println(m.getId());
	System.out.println(m.getPw());
	System.out.println(m.getName()); */
%>