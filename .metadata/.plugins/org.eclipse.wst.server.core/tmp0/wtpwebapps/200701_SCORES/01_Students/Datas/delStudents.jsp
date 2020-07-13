<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.parser.JSONParser" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>

<%	
	request.setCharacterEncoding("UTF-8");

	String strStu_ids = request.getParameter("jsondata");

	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
	
	JSONParser jsonPaser = new JSONParser();
	JSONArray arr        = (JSONArray)jsonPaser.parse(strStu_ids);
	int arrSize          = arr.size();
	String[] arrSTU_ID   = new String[arrSize];	
	
	String[] strInParams = new String[1];
	
	String strProcName = " CALL PKG_STUDENTS.PROC_DEL_STUDENTS(?) ";
	
	for(int i=0; i<arr.size(); i++){
		JSONObject obj = (JSONObject)arr.get(i);
		
		arrSTU_ID[i] = (String)obj.get("stu_id");

		strInParams[0] = arrSTU_ID[i];

		db.setUpdate(strProcName, strInParams);
	}

	System.out.println(strStu_ids);
	//response.sendRedirect("./studentList.jsp");
%>