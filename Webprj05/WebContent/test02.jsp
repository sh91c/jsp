<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var msg = '';
	var student = {
		이름 : '이영효',
		국어 : 92,
		영어 : 96,
		수학 : 90,
		과학 : 90
	};
	
	function is_object_in() {
		// student 객체안에 '이름'속성이 존재하는지 여부확인
		msg += "'이름'" + ('이름' in student) + '\n'; // true
		msg += "'성별'" + ('성별' in student) + '\n'; // false : 성별 key(속성)가 없음
		alert(msg); 
	};
	
	function func1() {
		var div1 = document.getElementById('div1');
		var msg  = '';
		msg     += '이름 : ' + student.이름 + '<br>';
		msg     += '국어 : ' + student.국어 + '<br>';
		msg     += '영어 : ' + student.영어 + '<br>';
		msg     += '수학 : ' + student.수학 + '<br>';
		msg     += '과학 : ' + student.과학 + '<br>';
		student.tot  = (student.국어 + student.영어 + student.수학 + student.과학);
		msg     += '총점 : ' + student.tot + '<br>';
		student.avg = student.tot / 4; // 객체 추가시 변수 타입 선언하면 에러임.
		msg     += '평균 : ' + student.avg + '<br>';		
		div1.innerHTML = msg;
	};
	
	function func2() { // 이런것도 있다는 느낌으로 보자.
		var msg = '';
		with(student){ // 객체명
			msg += '이름: ' + 이름 + '<br>';
			msg += '국어: ' + 국어 + '<br>';
			msg += '영어: ' + 영어 + '<br>';
			msg += '수학: ' + 수학 + '<br>';
			msg += '과학: ' + 과학 + '<br>';
			msg += '총점: ' + tot  + '<br>';
			msg += '평균: ' + avg  + '<br>';
		}
		var div2 = document.getElementById('div2');
		div2.innerHTML = msg;
	}
	
	window.onload = () => {
		is_object_in();
		func1();
		func2();
	};
	
</script>
</head>
<body>
	<div id="div1"></div>
	<div id="div2"></div>
</body>
</html>