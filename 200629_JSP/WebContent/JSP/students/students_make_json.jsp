<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>

<%
	String url    = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "testdb2";
	String userpw = "oracle";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = DriverManager.getConnection(url, userid, userpw);
	
	String sql = " SELECT SID, SNAME FROM STUDENTS ORDER BY SID ASC ";
	PreparedStatement psmt = conn.prepareStatement(sql);
	ResultSet rs = psmt.executeQuery();
	
	// AJAX를 하기 위해선
	// DB의 ROW를 불러와서 JSON 배열과 JSON 타입으로 데이터를 만들어줘야함!
	JSONArray arr = new JSONArray();
	while( rs.next() ){
		JSONObject obj = new JSONObject();
		obj.put("sid", rs.getString("SID"));
		obj.put("sname", rs.getString("SNAME"));
		
		arr.add(obj);
	}
	response.setContentType("application/json");
	out.println(arr);
%>