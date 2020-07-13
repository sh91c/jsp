<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/div.css">
<title>Insert title here</title>
<script>
	// 자바스크립트 생성자 함수
	function makeStudent(name, kor, eng, mat) {
		var obj = {
			name : name,
			kor : kor,
			eng : eng,
			mat : mat,
			getSum : function(){
				return this.kor + this.eng + this.mat
			},
			getAvg : function(){
				return this.getSum() / 3;
			},
			getGrade : function () {
				var grade = '';
				if( 90 <= this.getAvg() && this.getAvg() <= 100){
					grade = 'A';
				}else if(80 <= this.getAvg() && this.getAvg() < 90){
					grade = 'B';
				}else if(70 <= this.getAvg() && this.getAvg() < 80){
					grade = 'C';
				}else if(60 <= this.getAvg() && this.getAvg() < 70){
					grade = 'D';
				}else if(50 <= this.getAvg() && this.getAvg() < 60){
					grade = 'E';
				}else{
					grade = 'F';
				}
				return grade;
			},
			getHakjum : function() {
				
			},
			toString : function(){
				var msg = '';
				msg    += '<ul>';
				msg    += '<li>' + this.name + '</li>';
				msg    += '<li>' + this.kor + '</li>';
				msg    += '<li>' + this.eng + '</li>';
				msg    += '<li>' + this.mat + '</li>';
				msg    += '<li>' + this.getSum() + '</li>';
				msg    += '<li>' + this.getAvg().toFixed(2) + '</li>';
				msg    += '<li>' + this.getGrade() + '</li>';
				msg    += '</ul>';
				return msg;
			}
		};
		return obj;
	}
	
	window.onload = function () {
		var msg = '';
		var students = [];
		students.push(makeStudent('태화1', 100, 90, 80));
		students.push(makeStudent('태화2', 90, 40, 10));
		students.push(makeStudent('태화3', 80, 50, 20));
		students.push(makeStudent('태화4', 70, 60, 30));
		
		/*
		for (var i = 0; i < students.length; i++) {
			msg += '<div>';
			msg += students[i].toString();
			msg += '</div>';
		};
		*/
		
		students.forEach(function(value, index, array) { // value: student
			var student = value;
			msg += '<div>';
			msg += student.toString();
			msg += '</div>';
		});
		
		document.body.innerHTML += msg;			
		/*
		숙제: ABCD등급 출력
			  학점 출력
		*/
	}
</script>
</head>
<body>
	<h1>생성자 함수</h1>	
</body>
</html>