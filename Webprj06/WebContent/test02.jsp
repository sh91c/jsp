<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function winOpen(){
		var html     = 'http://www.naver.com';
		var name     = '';
		var features = 'height=500, width=500';
		var child    = window.open('',name,features); // 팝업창 띄우는 window.open()메소드
		if( child ) {
			var newHtml = '<h1>주소찾기</h1>';
			newHtml    += '<input type="text" name="dong">';
			child.document.write(newHtml);
		} else {
			alert('팝업차단을 해제해주세요.');
		}
	}
</script>
</head>
<body> <!-- window.open(), location(), history.go(), history.back()에 대해서 공부 -->
	<input type="button" onclick="winOpen()" value="Find address!"><br>
	<input type="button" onclick="location.href='http://www.naver.com'" value="go Naver"><br>
	<input type="button" onclick="document.url='http://www.naver.com'" value="go Naver"><br>
	<input type="button" onclick="location.assign='http://www.naver.com'" value="go Naver"><br>
	<input type="button" onclick="history.back()" value="페이지 뒤로 가기."><br>
	<input type="button" onclick="history.go(+1)" value="페이지 앞으로 가기."><br>
	<!-- history.go(-1)은 뒤로  -->
	
	<!--
	HTML 페이지 이동방법
	1. <a href="" > </a> -> GET만 가능
	
	2. <form action =""> -> GET, POST 방식
		<input type="submit">
		<input type="image">
		<button></button>
	   </form>
	
	자바스크립트에서 이동방법
	3. location.href=''; -> 페이지 이동
	4. document.forms[0].submit(); -> submit 버튼 구현 (GET, POST)
	 -->
</body>
</html>