<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String strName  = request.getParameter("stu_name");
	String strTel   = request.getParameter("tel");

	String strAddr1 = request.getParameter("addr1");
	String strAddr2 = request.getParameter("addr2");
	String strAddr3 = request.getParameter("addr3");
	String strAddr4 = request.getParameter("addr4");
	out.println(strAddr4);
	
	String strStuAddr = "";
	
	if(strAddr4.equals("-")){
		strStuAddr = strAddr3;
	} else {
		strStuAddr = strAddr4;	
	};

	String strDept1 = request.getParameter("dept1");
	String strDept2 = request.getParameter("dept2");

	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
	
	String[] strInParams = {strName, strTel, strStuAddr, "GRP001", strAddr1, "GRP002", strDept2};
	String strProcName = "CALL PKG_STUDENTS.PROC_SAVE_STUDENT(?, ?, ?, ?, ?, ?, ?) ";
	
	int updateCnt = db.setUpdate(strProcName, strInParams);
	
	response.sendRedirect("./studentList.jsp");
%>

