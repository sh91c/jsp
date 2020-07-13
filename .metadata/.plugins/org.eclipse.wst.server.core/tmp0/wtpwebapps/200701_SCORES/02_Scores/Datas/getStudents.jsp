<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
<%	
    request.setCharacterEncoding("UTF-8");

	String strSelectedDept = request.getParameter("selectedDept");

	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
	
	String strProcName = " CALL PKG_SCORES.PROC_SEL_STUDENTS(?, ?) ";
	
	String[] strInParams = {strSelectedDept, ""};
	String[] strInOut  = {"IN", "OUT"};
	int[] sqlTypes = {0, oracle.jdbc.OracleTypes.CURSOR};
	
	ResultSet rs = db.getResultSet(strProcName, strInParams, sqlTypes, strInOut);
	
	JSONArray arr = new JSONArray();
	while(rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("stu_id", rs.getString("STU_ID"));
		obj.put("stu_name", rs.getString("STU_NAME"));
		
		arr.add(obj);
	}
	
	response.setContentType("Application/json");
	out.println(arr);
%>