<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
	String strUserId = request.getParameter("userId");
	String strUserPw = request.getParameter("userPw");
	
	//out.println(strUserId + " / " + strUserPw);
	
	String url    = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "testdb2";
	String userpw = "oracle";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = DriverManager.getConnection(url, userid, userpw);
	
	String strProc = "call PKG_MEMBERS.PROC_LOGIN( ?, ?, ? ) ";
	
	CallableStatement cstmt = conn.prepareCall(strProc);
	cstmt.setString(1, strUserId);
	cstmt.setString(2, strUserPw);
	cstmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR);
	
	cstmt.execute();
	
	ResultSet rs = (ResultSet)cstmt.getObject(3);
	
	rs.next();
	
	String strCnt = rs.getString("CNT");
	
	if(strCnt == "1"){
		// 로그인 성공 -> 메인 페이지로 이동	
	} else {
		// 로그인 실패
		response.sendRedirect("./login.jsp?msg=" + "fail");
	}
%>