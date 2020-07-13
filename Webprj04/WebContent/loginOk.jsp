<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userid = request.getParameter("userid"); // 요청을 날리는 태그의 name을
	String passwd = request.getParameter("passwd"); // request.getParameter()로 넘겨받는다.
	
	boolean bLogin = false;
	if( userid.equals("temp") && passwd.equals("1234") ){
		bLogin = true;
	} // 유저가 1명인 temp / 1234 만 회원가입이 되어있다고 가정할 때
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if( bLogin ) { %>
	넘어온  <br/>
	아이디	<% out.print(userid); %><br/>
	암호    <%=passwd %><br/>
	입니다
<%} else { %>
	로그인 실패 : 아이디와 암호를 확인하세요..
<%}; %>
</body>
</html>