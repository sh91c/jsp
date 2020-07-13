<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
<%	
    request.setCharacterEncoding("UTF-8");

	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
	
	String strProcName = " CALL PKG_SCORES.PROC_SEL_YEAR(?) ";
	
	String[] strInParams = {""};
	String[] strInOut  = {"OUT"};
	int[] sqlTypes = {oracle.jdbc.OracleTypes.CURSOR};
	
	ResultSet rs = db.getResultSet(strProcName, strInParams, sqlTypes, strInOut);
	
	JSONArray arr = new JSONArray();
	while(rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("syear", rs.getString("SYEAR"));
		obj.put("tyear", rs.getString("TYEAR"));
		
		arr.add(obj);
	}
	
	response.setContentType("Application/json");
	out.println(arr);
%>