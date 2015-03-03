
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.tunea.jdbcdao.JdbcMemberDao"%>
<%@page import="com.tunea.dao.MemberDao"%>

<%@page import="com.tunea.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDao dao = new JdbcMemberDao();

	int checkId=0;
	String checkMsg="";
	String pw="";
	String msg="";
	String id = request.getParameter("Id");
	checkId=dao.checkId(id);
	
	if(checkId==1){
		checkMsg="사용 가능한 아이디입니다.";
	    
		
	}
	else if(id.equals(""))
	checkMsg="아이디를 입력 해 주세요.";
	else{
		checkMsg="중복된 아이디입니다.";

	}
	
	String firstpw = request.getParameter("Pw");
	String repw = request.getParameter("rePw");
	if(firstpw==repw){
		pw=firstpw;
	}else{
		msg = "두개의 비밀번호가 다릅니다.";
	}
	String nickname = request.getParameter("nicname");
	String email = request.getParameter("email");
	String famName = request.getParameter("fam_name");
	String lastName = request.getParameter("last_name");
	String name=famName+lastName;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
/* 	String birth = request.getParameter("Birth");
	
	SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd"); */
	
	Member m = new Member();
	m.setId(id);
	m.setPw(pw);
	m.setNickname(nickname);
	m.setEmail(email);
	m.setName(name);
	m.setPhone(phone);
	m.setAddress(address);
// 	m.setBirth(format.parse(birth)); 
	


	
	dao.insert(m);
	
	if (!checkMsg.equals("")) {
		request.setAttribute("checkMsg", checkMsg);
		RequestDispatcher dispatcher = request
		.getRequestDispatcher("join.jsp");

		dispatcher.forward(request, response);
	}

	if (!msg.equals("")) {
		request.setAttribute("msg", msg);
		RequestDispatcher dispatcher = request
		.getRequestDispatcher("join.jsp");

		dispatcher.forward(request, response);
	}

	response.sendRedirect("../index.jsp");
%>