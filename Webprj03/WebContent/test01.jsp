<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<script>
	function checkAll( sw ) {
		var chkBox = [
			document.getElementById('apple'),
			document.getElementById('mango'),
			document.getElementById('banana'),
			document.getElementById('orange'),
			document.getElementById('watermelon')
			];
		console.dir(chkBox);
		for (var i = 0; i < chkBox.length; i++) {
			chkBox[i].checked = sw;			
		}
	}

	function divDisplay( msg ) {
		var div1 = document.getElementById('div1');
		div1.innerHTML = msg;		
	}

	window.onload = function() {
		var person  = ['이순신', '김유신', '아이유'];
		
		var msg = '';
		msg    += person + '<br>';
		for (var i = 0; i < person.length; i++) {
			msg += person[i] + '<br>';
		}
		
		
		
		// object.. 객체
		var student = {
				num  : 1,
				name : '일순신',
				tel  : '010-1111-1234'
		};
		msg += '<hr>'
		msg += '번호: '     + student.num  + '<br>'; 
		msg += '이름: '     + student.name + '<br>'; 
		msg += '전화번호: ' + student.tel  + '<br>'; 

		
		msg += '<hr>';
		var fruits   = ["사과",  "망고",  "바나나", "오렌지", "수박"];
		var fruitsId = ["apple", "mango", "banana", "orange", "watermelon"]; 
		msg += '<ul>';
		for (var i = 0; i < fruits.length; i++) {
			msg += '<li>' + fruits[i] + '</li>';	
		}
		msg += '</ul>';
		
		msg += '<select>';
		for (var i = 0; i < fruits.length; i++) {
		msg += '<option>' + fruits[i] + '</option>';			
		}
		msg += '</select>';
		
		msg += '<br>';
		for (var i = 0; i < fruits.length; i++) {
		msg += '<input type="checkbox" id="' + fruitsId[i] + '">';
		msg += '<label for="' + fruitsId[i] + '">' + fruits[i] + '</label>';
		} // 글자만 클릭해도 체크박스 활성화되는 태그
		
		msg += '<hr> forEach()';
		msg += '<ul>';
		/* fruits.forEach( myFunc ); // 배열의 원소개수만큼 실행하고 원소 하나하나를 꺼냄 */
		fruits.forEach( function (value) {
			msg += '<li>' + value + '</li>';
		} ); // 배열의 원소개수만큼 실행
		msg += '</ul>';		
		
		/* function myFunc(value){
			msg += '<li>' + value + '</li>';
		} */
		
		var prod = ['사과','바나나','딸기'];
		msg += 'raw data: ' + prod + '<br>';
		prod.push('오렌지'); // stack에 data를 삽입할 때 push.. stack 크기 증가
		msg += 'push()  : ' + prod + '<br>';
		prod.pop();
		msg += 'pop()   : ' + prod + '<br>'; // pop시 stack 크기 감소 데이터 소멸
		msg += prod.length + '<br>';
		prod[999] = '두리안';			// 배열의 원소 위치를 임의로 할당가능
										// 크기는 마지막 첨자의 크기로 정해진다.
										// 그 사이에 존재하지 않는 데이터는 undefined이다.
		msg += prod.length + '<br>';
		
		var nums = [10, 8, 23, 5 ,4, 238];
		msg += '정렬 전 : ' + nums + '<br>';
		msg += '정렬 후(기본) : ' + nums.sort() + '<br>';    // sort()는 값을 문자열로 정렬한다.
										// 숫자를 정렬하고 싶으면 숫자를 정렬하는 익명함수를 작성해야함.
		
		var nums2 = [10, 8, 23, 5 ,4, 238];
		msg += '정렬 전 : ' + nums2 + '<br>';
		msg += '정렬 후(숫자변환) : ' + nums2.sort(function (x, y) {
			return x - y;				// 양수 -> 오름차순, 음수-> 내림차순
		}) + '<br>';
		
		var nums3 = [10, 8, 23, 5 ,4, 238];
		msg += '정렬 전 : ' + nums3 + '<br>';
		msg += '정렬 후(내림차순) : ' + nums3.sort(function (x, y) {
			return y - x;				// 양수 -> 오름차순, 음수-> 내림차순
		}) + '<br>';
		
		divDisplay(msg); // 출력만 해줌.
	}
</script>
</head>
<body>
	<h1>Hello</h1>
	<p><%= new java.util.Date() %></p>
	<div id="div1"></div>
	<button onclick="checkAll(true)">모두 체크</button>
	<button onclick="checkAll(false)">체크 해제</button>
</body>
</html>