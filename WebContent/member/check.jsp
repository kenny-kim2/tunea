<%@page import="com.tunea.jdbcdao.JdbcMemberDao"%>
<%@page import="com.tunea.model.Member"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%



  List<Member> list = new JdbcMemberDao().getMembers();
  
String data = "[";

for(int i=0; i<list.size(); i++)
{
	Member m =list.get(i);
	
	data += String.format("{'Id' : '%s', 'Nickname' : '%s'}"
			, m.getId(),m.getNickname());
	if(i<=list.size())
		data += ",";
}

data += "]";

out.write(data);

 /* } */
%>