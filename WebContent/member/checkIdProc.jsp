
<%@page import="com.tunea.jdbcdao.JdbcMemberDao"%>
<%@page import="com.tunea.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDao dao = new JdbcMemberDao();

int checkId=0;
String checkMsg="";


String id = request.getParameter("Id");
checkId=dao.checkId(id);
if(checkId==2){
	checkMsg="중복된 아이디입니다.";
}	else{
	checkMsg="사용 가능한 아이디입니다.";
}




if (!checkMsg.equals("")) {
	request.setAttribute("checkMsg", checkMsg);
	RequestDispatcher dispatcher = request
	.getRequestDispatcher("join.jsp");

	dispatcher.forward(request, response);
}



//response.sendRedirect("join.jsp");
%>