<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>

<%	
    request.setCharacterEncoding("UTF-8");

	String strAddr = request.getParameter("addr");
	String strLVL  = request.getParameter("lvl");


	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
	
	String strProcName = " CALL PKG_STUDENTS.PROC_SEL_ADDR(?, ?, ?) ";
	
	String[] strInParams = {strAddr, strLVL, ""};
	String[] strInOut  = {"IN", "IN", "OUT"};
	int[] sqlTypes = {0, 0, oracle.jdbc.OracleTypes.CURSOR};
	
	ResultSet rs = db.getResultSet(strProcName, strInParams, sqlTypes, strInOut);
	
	JSONArray arr = new JSONArray();
	while(rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("val", rs.getString("COM_ID"));
		obj.put("txt", rs.getString("COM_VAL"));
		
		arr.add(obj);
	}
	
	response.setContentType("Application/json");
	out.println(arr);
%>