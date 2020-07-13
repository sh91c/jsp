<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
	String strSid    = request.getParameter("sid"); // 태그의 name 속성을 받아온다.
	String strSname  = request.getParameter("sname");
	String strAge    = request.getParameter("sage"); // 클라이언트에서 넘어온 숫자도 String으로 받으면 된다. 의미가 없기 때문
	String strGender = request.getParameter("gender"); // 2개지만 클라이언트에서 선택한 radio - value값이 넘어온다.
	
	// 데이터베이스 students 테이블에 데이터(ROW)를 INSERT 구현하기.
	// 데이터베이스를 연동할 때 사용하는 Java Package : java.sql.*
	
	
	// 0. Oracle을 연결하기 위한 연결 정보 작성
	String url    = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "testdb2";
	String userpw = "oracle";
	
	// 1. DB Connection을 위한 Class : Connection
	Connection conn = DriverManager.getConnection(url, userid, userpw);
	
	// 2. PreparedStatement Class
	String sql = "INSERT INTO STUDENTS(SID, SNAME, DID, DAGE, DGEN) " + 
	             "VALUES(?, ?, ?, ?, ?)";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, strSid);
	psmt.setString(2, strSname);
	psmt.setString(3, "D004");
	psmt.setString(4, strAge);
	psmt.setString(5, strGender);
	
	psmt.executeUpdate();
	
	response.sendRedirect("./list.jsp");
%>