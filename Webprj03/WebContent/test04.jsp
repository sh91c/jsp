<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = () => {
		var div1 = document.getElementById('div1');
		var msg = '';
		
		// get 함수들
		var today = new Date();
		msg += '<ul>';
		msg += '<li>' + '오늘 날짜: ' + today + '</li>';
		msg += '<li>' + '오늘 날짜: ' + today.toLocaleString() + '</li>';
		msg += '<li>' + '년도(Full): '+ today.getFullYear() + '</li>';
		msg += '<li>' + '년도 : '     + today.getYear() + '</li>';
		msg += '<li>' + '월 : '       + ( today.getMonth() + 1 ) + '</li>';
		msg += '<li>' + '일 : '       + today.getDate() + '</li>';
		msg += '<li>' + '요일 : '     + today.getDay() + '</li>'; // 숫자로 출력된다. 일요일: 0
		msg += '<li>' + '시 : '       + today.getHours() + '</li>';
		msg += '<li>' + '분 : '       + today.getMinutes() + '</li>';
		msg += '<li>' + '초 : '       + today.getSeconds() + '</li>';
		msg += '<li>' + '밀리초 : '   + today.getMilliseconds() + '</li>'; // 1970년 1월 1일부터 초로 계산
		msg += '<li>' + 'getTime() : '+ today.getTime() + '</li>';
		
		// set 함수들
		var xmas = new Date(2020, 11, 25);
		msg += '<li>' + 'Xmas : '   + xmas.toLocaleString() + '</li>';
	    xmas.setDate(1);
	    msg += '<li>' + 'Xmas달의 첫날 : '   + xmas.toLocaleString() + '</li>';
	    
	    var t1 = today.getTime();
	    for (var i = 0; i < 100000; i++) {
			var sum = i * 1.5 * 12.4 / 3.0 + 2.7;
		}
	    var t2 = today.getTime(); // 이건 잘못된 시간 체크인듯
	    msg += '<li>' + '경과시간: ' + (t2 - t1) + '</li>';
	    
		msg += '</ul>';
		div1.innerHTML = msg;
	}
</script>
</head>
<body>
	<h1>날짜 시간 함수들</h1>
	<div id="div1"></div>
</body>
</html>