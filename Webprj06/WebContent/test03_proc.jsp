<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// POST방식의 한글 처리.. GET방식은 완벽하게 처리가 되지않는다!!!! -> server.xml을 세팅해야함
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name"); // 무조건 String으로 값을 받는다.
    String tel  = request.getParameter("tel");
	String email = request.getParameter("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>넘어온 정보</h1>
	<div>이름: <%=name %></div>
	<div>전화: <%=tel %></div>
	<div>이메일: <%=email %></div>
</body>
</html>