<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ page language="java" import="java.sql.*"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	ResultSet rs = (ResultSet)request.getAttribute("ResultSet");
%>
</head>
<body>
	<div>학생 리스트</div>
	<% while( rs.next() ){ %>
	<div>
		<div>아이디 : <%=rs.getString("STU_ID") %></div>
		<div>이름 : <%=rs.getString("STU_NAME") %></div>
		<div>연락처 : <%=rs.getString("STU_TEL") %></div>
	</div>
	<% } %>
</body>
</html>