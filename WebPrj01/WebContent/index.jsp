<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* jsp : 자바 명령어 코딩*/
	String name = "상훈";
	String msg  = "JSP 잘되나";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

</style>
<script>

</script>
</head>
<body>
	<h1>Hello JSP 한글 확인 테스트</h1>
	<%
		out.print(name + "<br>"); // 웹에 출력하는 명령어
		out.print(msg);
	%><br>
	<%=msg %>
</body>
</html>