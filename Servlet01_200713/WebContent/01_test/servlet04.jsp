<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String result1 = (String)request.getAttribute("result1");
	String result2 = (String)request.getAttribute("result2");

%>
<body>
	<%=result1 %>
	<%=result2 %>
</body>
</html>