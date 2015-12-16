<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("utf-8");%>
<%
	String user_name = request.getParameter("user_name");
	String user_picture = request.getParameter("user_picture");
	
	session.setAttribute("user_name", user_name);
	session.setAttribute("user_picture", user_picture);
%>
