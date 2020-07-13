<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
<%
	String strUserId = request.getParameter("userId"); // [{"CNT":"0"}], "hong"; -> [{"CNT":"1"}] 
	
	// 1. DB Connection
	String url    = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "testdb2";
	String userpw = "oracle";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = DriverManager.getConnection(url, userid, userpw);
	
	String strProc = " call PKG_MEMBERS.PROC_CHKID( ?, ?) ";
	
	CallableStatement cstmt = conn.prepareCall(strProc);
	cstmt.setString(1, strUserId);
	cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
	
	cstmt.execute();
	
	ResultSet rs = (ResultSet)cstmt.getObject(2);
	
	// 2. rs에 있는 데이터를 JSON으로 바꿔서 웹페이지로 돌려줘야함.
	JSONArray arr = new JSONArray();
	while(rs.next()){
		JSONObject obj = new JSONObject();  // JSON type
		obj.put("CNT",rs.getString("CNT")); // key, value
		arr.add(obj);
	}
	
	response.setContentType("application/json");
	
	out.println(arr); // login.jsp 에서 AJAX success키의 fucntion(datas)로 넘겨준다.
%>