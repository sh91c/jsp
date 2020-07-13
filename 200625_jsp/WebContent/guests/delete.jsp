
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
	// 0. [값 받아오기] Client의 요청을 받아야함.
	String idx      = request.getParameter("idx");
	
	// 1. connection
	String url    = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "testdb2";
	String userpw = "oracle";

	Connection conn = DriverManager.getConnection(url, userid, userpw);
	
	// 2. preparedStatement
	String sql = " DELETE FROM GUESTS WHERE IDX = ? ";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
 	pstmt.setString(1, idx);

 	pstmt.executeUpdate();
	
	String sql2 = " UPDATE GUESTS SET IDX = IDX - 1 WHERE IDX > ? ";
	PreparedStatement pstmt2 = conn.prepareStatement(sql2);
	pstmt2.setString(1, idx);
	
	pstmt2.executeUpdate();
	
	conn.close();

	response.sendRedirect("./list.jsp");
%>