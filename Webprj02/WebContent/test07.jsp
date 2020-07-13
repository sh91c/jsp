<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="div1"></div>
<script>
	var div1 = document.getElementById('div1');
	// setInterval(함수, 시간)
	// 지정된 시간(ms)이 지나면 함수를 반복 수행한다. 무한 반복.
	var intervalID = setInterval( function( e ) {
		var now = new Date();
		div1.innerHTML = now.toLocaleString();
		div1.style.color = 'blue';
	}, 1000);
	
	// 10초 후 시계를 정지하려면? -> setTimeout
	setTimeout(function(){
		clearInterval(intervalID); // 타이머 종료
		div1.style.color = 'red';
	}, 10*1000);
</script>
<script>
	var stmt = 'var number = 10;';
	stmt    += 'number *= 3.5;';
	stmt    += 'alert(number);';
	eval(stmt);						// eval() :JS 명령어를 실행함
	alert(number);
</script>
</body>
</html>