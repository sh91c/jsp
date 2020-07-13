<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
<%
	String strParams = request.getParameter("params");
	
	String url    = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "testdb2";
	String userpw = "oracle";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = DriverManager.getConnection(url, userid, userpw);
	
	String sql = " DELETE FROM MEMBERS WHERE USERID IN " + strParams;
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.executeUpdate();
%>