<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String favoriteNumber = request.getParameter("fruit");
	int  favNumber      =  Integer.valueOf(favoriteNumber);
 	String [] fruits    = {"Apple", "Banana", "Kiwi", "Mango"};
 	String [] selFruits = request.getParameterValues("fruits");
 	String    str = "";
 	for(int i=0;i < selFruits.length;i++) {
 		str += selFruits[i] + ",";
 	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div>제일좋아하는과일:<%=fruits[ favNumber ]  %></div>
  <div>좋아하는과일목록:<%=str  %></div>
</body>
</html>