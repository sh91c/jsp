<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String strNum = request.getParameter("num");
		String strNum2 = (String)request.getAttribute("result2");
%>
<%=strNum %>
<%=strNum %>
<%=strNum2 %>
<%=strNum2 %>
</body>
</html>