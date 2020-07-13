<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- Page directive? 페이지 지시자 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var today = new Date();
	var msg   = '클라이언트 시간: ' + today.toLocaleString();				// 클라이언트측 시간
	
	window.onload = function () {  // window.onload : 브라우저가 HTML을 다 그리고 난 뒤에 발생하는 이벤트
		document.getElementById('div1').innerHTML = msg;
		};
</script>
</head>
<body>
	<h1>Hello</h1>
	<h2><%
	java.util.Date today = new java.util.Date();
	out.print("서버 시간: ");
	out.print(today.toLocaleString());			// 서버측 시간
	System.out.println(today.toLocaleString());
	%></h2>
	<div id = "div1"></div>
	<div id = "div2"></div>
<script>
	var div2 = document.getElementById('div2');
	div2.innerHTML = '<h3>div2 테스트</h3>';
</script>
</body>
</html>