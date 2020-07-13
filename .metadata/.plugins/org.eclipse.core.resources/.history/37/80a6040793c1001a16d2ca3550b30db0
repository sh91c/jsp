<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>

<%	
	request.setCharacterEncoding("UTF-8");

	String strGrpName = request.getParameter("grp_name");

	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
	
	String strProcName = " CALL PKG_SCORES.PROC_SEL_GRPCOM( ?, ?) ";
	
	String[] strInParams = {strGrpName, ""};
	String[] strInOut  = {"IN", "OUT"};
	int[] sqlTypes = {0, oracle.jdbc.OracleTypes.CURSOR};
	
	ResultSet rs = db.getResultSet(strProcName, strInParams, sqlTypes, strInOut);
	
	JSONArray arr = new JSONArray();
	while(rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("grp_id", rs.getString("GRP_ID"));
		obj.put("grp_name", rs.getString("GRP_NAME"));
		
		
		arr.add(obj);
	}
	
	response.setContentType("Application/json");
	out.println(arr);
%>