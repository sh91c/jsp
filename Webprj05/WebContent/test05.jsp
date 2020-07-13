<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/div.css">
<script>
	var studs = [];
	studs.push({ 이름: '형오1', 국어 : 100, 영어 : 100, 수학 : 100});
	studs.push({ 이름: '형오2', 국어 : 90, 영어 : 100, 수학 : 65});
	studs.push({ 이름: '형오3', 국어 : 80, 영어 : 100, 수학 : 100});
	studs.push({ 이름: '형오4', 국어 : 70, 영어 : 45, 수학 : 100});
	studs.push({ 이름: '형오5', 국어 : 75, 영어 : 100, 수학 : 100});
	studs.push({ 이름: '형오6', 국어 : 85, 영어 : 100, 수학 : 55});
	studs.push({ 이름: '형오7', 국어 : 60, 영어 : 100, 수학 : 100});
	studs.push({ 이름: '형오8', 국어 : 30, 영어 : 45, 수학 : 100});
	studs.push({ 이름: '형오9', 국어 : 75, 영어 : 100, 수학 : 45});
	studs.push({ 이름: '형오10', 국어 : 90, 영어 : 100, 수학 : 100});
	
	window.onload = function () {
		var msg = '';
		
		// 1. 총점, 평균을 구하기
			// 1.1 총점 함수, 평균 함수 만들기
		for(var i in studs){ // 현재 studs는 배열로 선언되었음.
			studs[i].getSum = function() {
				return this.국어 + this.영어 + this.수학; // this는 studs[i]로 원소번호의 .객체이름을 불러옴
			}
			studs[i].getAvg = function() {
				return this.getSum() / 3;
			}
			studs[i].toString = function () {
				var msg = '';
				msg    += '<ul>'; 
				msg    += '<li>' + this.이름 + '</li>';
				msg    += '<li>' + this.getSum() + '</li>';
				msg    += '<li>' + this.getAvg().toFixed(2) + '</li>';
				msg    += '</ul>';
				return msg;
			}
		}
		// 2. 출력
		for (var i = 0; i < studs.length; i++) {
			msg += '<div>';
			msg += studs[i].toString();
			msg += '</div>';
		}
		
		document.body.innerHTML = msg;
	}
</script>
</head>
<body>
</body>
</html>