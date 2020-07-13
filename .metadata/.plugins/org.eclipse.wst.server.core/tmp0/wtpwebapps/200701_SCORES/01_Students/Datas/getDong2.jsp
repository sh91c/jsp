<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
<%
	String strDong = request.getParameter("in_Dong");

	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
	
	String strProcName = "call PKG_STUDENTS.PROC_SEL_DONG2(?, ?) ";
	//String[] strInTypes = null;
	
	Connection con = db.getConnection();

	CallableStatement cstmt = con.prepareCall(strProcName);
	
	cstmt.setString(1, strDong);
	cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
	cstmt.execute();
	
	ResultSet rs = (ResultSet)cstmt.getObject(2);
	
	
	JSONArray arr = new JSONArray();
	while(rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("com_id",rs.getString("COM_ID"));
		obj.put("grp_id",rs.getString("GRP_ID"));
		obj.put("com_val",rs.getString("COM_VAL"));
		
		arr.add(obj);
	}
	
	response.setContentType("Application/json");
	out.println(arr);
%>