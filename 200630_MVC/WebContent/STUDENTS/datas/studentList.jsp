<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
<%
/*  첫 번째 클래스 인스턴스화 방법
	DBCon dbCon = new DBCon();
	dbCon.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
	dbCon.setUserID("testdb2");
	dbCon.setUserPW("oracle");
*/
	// 두 번째 클래스 인스턴스화 방법
	DBCon dbCon = new DBCon("jdbc:oracle:thin:@localhost:1521:xe","testdb2","oracle");
	String sql = " SELECT SID, SNAME, DAGE FROM STUDENTS ORDER BY SID DESC ";
	ResultSet rs = dbCon.getResultSet(sql);
	
	JSONArray arr = new JSONArray();
	
	while(rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("sid",rs.getString("SID"));
		obj.put("sname",rs.getString("SNAME"));
		obj.put("sage",rs.getString("DAGE"));
		
		arr.add(obj);
	}
	
	response.setContentType("Application/json");
	out.println(arr);
%>