<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
	// 0. Client의 요청을 받아야함.
	String name     = request.getParameter("name");
	String contents = request.getParameter("contents");
	
	
	// 1. connection
	String url    = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "testdb2";
	String userpw = "oracle";

	Connection conn = DriverManager.getConnection(url, userid, userpw);
	
	// 2. preparedStatement
	String idx = "SELECT NVL(MAX(IDX),0) + 1 AS NEWIDX FROM GUESTS ";
	PreparedStatement idxPs = conn.prepareStatement(idx);
	
	ResultSet idxRs = idxPs.executeQuery();
	idxRs.next();
	String strIdx = idxRs.getString("NEWIDX"); 
	
	//out.println(strIdx);
	
	String sql = " INSERT INTO GUESTS (IDX, NAME, CONTENTS, REGDATE) " 
	 		   + " VALUES (?, ?, ?, SYSDATE) ";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, strIdx);
	pstmt.setString(2, name);
	pstmt.setString(3, contents);
	// pstmt.setString(4, " TO_CHAR(TO_DATE(SYSDATE), YYYY-MM-DD) ");
	
	pstmt.executeUpdate();
	
	response.sendRedirect("./list.jsp");
%>