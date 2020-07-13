<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
	String strIDX = request.getParameter("hIdx");
	String strContent = request.getParameter("hContent");
	
	//out.println( strIDX + " " + strContent );
	
	 // 1. connection
	String url    = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "testdb2";
	String userpw = "oracle";

	Connection conn = DriverManager.getConnection(url, userid, userpw);
	
	// 2. preparedStatement
	String sql = " UPDATE GUESTS SET CONTENTS = ? WHERE IDX = ? ";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, strContent);
 	pstmt.setString(2, strIDX);

 	pstmt.executeUpdate();
 	
 	response.sendRedirect("./list.jsp");
%>