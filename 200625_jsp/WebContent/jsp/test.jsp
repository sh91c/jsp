<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
	String testSid = request.getParameter("testsid");
	String strSid  = request.getParameter("sid");
	
	String url    = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "testdb2";
	String userpw = "oracle";
	
	Connection conn = DriverManager.getConnection(url, userid, userpw);
	
	String sql = "update students set sid = ? WHERE sid = ?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	
	psmt.setString(1, strSid);
	psmt.setString(2, testSid);
	
	psmt.executeUpdate();
	   
	response.sendRedirect("./list.jsp?sname=");
%>