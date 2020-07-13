<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
<%
	String strStu_id   = request.getParameter("student");
	String strSub_id   = request.getParameter("subject");
	String strYear     = request.getParameter("year");
	String strSemester = request.getParameter("semester");
	String strGubun    = request.getParameter("gubun");
	String strScore    = request.getParameter("score");
	String strExamDate = request.getParameter("examdate");
	
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
	
	String strProcName = " CALL PKG_SCORES.PROC_INS_SCORES(?, ?, ?, ?, ?, ?, ?, ?) ";
	
	String[] strInParams = {strStu_id, strSub_id, strYear, strSemester, strGubun,  strScore, strExamDate, ""};
	String[] strInOut  = {"IN", "IN", "IN", "IN", "IN", "IN", "IN", "OUT"};
	int[] sqlTypes = {0, 0, 0, 0, 0, 0, 0, oracle.jdbc.OracleTypes.CURSOR};
	
	ResultSet rs = db.getResultSet(strProcName, strInParams, sqlTypes, strInOut);
	
	rs.next();
	
	String strResult = rs.getString("RST");
	if(strResult.equals("SUCCESS")){
		response.sendRedirect("./score_list.jsp");
	} else {
		response.sendRedirect("./register.jsp");
	};
%>