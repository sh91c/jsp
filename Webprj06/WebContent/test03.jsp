<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>페이지 이동</h1>
	<pre>
	HTML 페이지 이동방법(+데이터의 이동도 생각해야함)
	ex) 이름, 전화번호 발송
	1. &lt;a href="" &gt;&lt;/a&gt; -> GET만 가능
	
	2. &lt;form action =""&gt; -> GET, POST 방식
		&lt;input type="submit"&gt;
		&lt;input type="image"&gt;
		&lt;button&gt; &lt;/button&gt;
	   &lt;/form&gt;
	
	자바스크립트에서 이동방법
	3. location.href=''; -> 페이지 이동
	4. document.forms[0].submit(); -> submit 버튼 구현 (GET, POST)
	</pre>
	
	<h2>1. a tag를 사용한 페이지 이동(GET 데이터 전송)</h2>
	<a href="http://localhost:9090/Webprj06/test03_proc.jsp?name=aaa&tel=010-1111-2222">서버로 이동</a>
	<pre>GET방식 단점: 정보 노출 및 전송할 수 있는 데이터의 양이 적음</pre>
	
	<h2>2. form tag를 사용한 페이지 이동(GET, POST 데이터 전송)</h2>

	<form action="http://localhost:9090/Webprj06/test03_proc.jsp" method="GET">
		<input type="text" name="name" value="한글">
		<input type="text" name="tel" value="010-2112-3124">
		<input type="submit" value="GET">
	</form>
	
	<form action="http://localhost:9090/Webprj06/test03_proc.jsp" method="POST">
		<input type="text" name="name" value="한글">
		<input type="text" name="tel" value="010-2112-3124">
		<input type="submit" value="POST">
	</form>
	
	<form action="http://localhost:9090/Webprj06/test03_proc.jsp?email=aaa@bbb.com" method="POST">
		<input type="text" name="name" value="aaa">
		<input type="text" name="tel" value="010-2112-3124">
		<input type="submit" value="GET + POST">
	</form>
	
	<h2>3. JAVASCRIPT사용한 페이지 이동(GET 데이터 전송)</h2>
	<input type="button" value="JS_GET_METHOD" onclick="send()">
	<script>
		function send(){
			location.href = 'http://localhost:9090/Webprj06/test03_proc.jsp?name=aaa&tel=010-1111-2222';
		}
	</script>
	
	<h2>4. JAVASCRIPT사용한 페이지 이동(POST 데이터 전송)</h2>
	<form method="POST">
		<input type="text" name="name" value="자바스크립트">
		<input type="text" name="tel" value="010-9999-8888">
		<input type="text" name="email" value="JS@email.com">		
		<input type="button" value="JS_POST_METHOD" onclick="send2()">
	</form>
	<script>
	function send2(){
		//document.forms[0].submit(); 구 코드
		var jsPostForm = document.querySelectorAll('form')[3]; // 해당 폼을 변수로 저장
		jsPostForm.action = 'http://localhost:9090/Webprj06/test03_proc.jsp'; // 요청할 경로로 이동
		jsPostForm.submit(); // 하면서 전달
	}
	</script>
	
</body>
</html>