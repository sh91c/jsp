<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page language="java" import="java.sql.*"%>   
<%@ page language="java" import="java.util.ArrayList"%>   
<%@ page language="java" import="PKG_STUDENT.*"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.col1 {
		width: 250px; height: 30px; float: left;
	}
	#rows {
		clear : both;
	}
</style>
<%
	ArrayList arr = (ArrayList)request.getAttribute("students");
	//ArrayList<Student> arr = (ArrayList)request.getAttribute("students");
%>
</head>
<body>
	<div>학생 리스트</div>
	<%
		//for(int i = 0; i < arr.size(); i++)
		for (Object obj : arr) {
			String strStu_id = ((Student)obj).getStu_id();
			String strStu_name = ((Student)obj).getStu_name();
			String strStu_tel = ((Student)obj).getStu_tel();
	%>
	
	<div id="rows">
		<div class="col1">아이디 : <a href="./Students?stu_id=<%=strStu_id %>&doWork=detail"><%=strStu_id %></a></div>
		<div class="col1">이름 : <%=strStu_name %></div>
		<div class="col1">연락처 : <%=strStu_tel %></div>
	</div>
	
	<%	
		}
	%>
		
	<div><a href="">학생 등록</a></div>
	<%-- 
	<div>학생 리스트</div>
	<%
		//for(int i = 0; i < arr.size(); i++)
		for (Student stud : arr) {
	%>
		<div>아이디 : <%=stud.getStu_id() %></div>
		<div>이름 : <%=stud.getStu_name() %></div>
		<div>연락처 : <%=stud.getStu_tel() %></div>
	<%	
		}
	%>
	 --%>
</body>
</html>