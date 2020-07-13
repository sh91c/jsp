<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
	String delSid = request.getParameter("delsid");

	//out.println(delSid);
	
	String url    = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "testdb2";
	String userpw = "oracle";
	
	Connection conn = DriverManager.getConnection(url, userid, userpw);
	
	String sql = "DELETE FROM STUDENTS WHERE sid IN " + delSid;
	PreparedStatement psmt = conn.prepareStatement(sql);
	
	psmt.executeUpdate();
	   
	response.sendRedirect("./list.jsp?sname=");
%>