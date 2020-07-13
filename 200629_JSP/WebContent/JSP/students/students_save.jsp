<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
<%
	String strUserId = request.getParameter("userId");
	String strUserPw = request.getParameter("userPw");
	String strUserName = request.getParameter("userName");
	
	//out.println(strUserId + "-" + strUserPw + "-" + strUserName );
	
	String url    = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "testdb2";
	String userpw = "oracle";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = DriverManager.getConnection(url, userid, userpw);
	
	String sql = "INSERT INTO MEMBERS (USERID, USERPASS, USERNAME) VALUES (?, ?, ?) ";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, strUserId);
	psmt.setString(2, strUserPw);
	psmt.setString(3, strUserName);
	
	psmt.executeUpdate();
	
	JSONArray arr = new JSONArray();
	JSONObject obj = new JSONObject();
	obj.put("success", "1");
	arr.add(obj);
	
	response.setContentType("Application/json");
	out.println(arr); // INSERT 되면 datas에 1을 보냄(int type)
%>