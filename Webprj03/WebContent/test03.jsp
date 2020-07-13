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
		var msg  = '';
		
		var nums = [45, 4, 7, 120, 30];
		for (var i = 0; i < nums.length; i++) {
			msg += nums[i] + '&nbsp;&nbsp;';
		}
		msg += '<br>';
		
		nums.forEach( myFunc1 );
		function myFunc1 ( value, index, array ) {
			msg += value + '&nbsp;&nbsp;';
		}
		msg += '<br>';
		
		nums.forEach( function (value, index, array) { // forEach 익명함수의 인자 3가지는 고정임
			msg += value + '&nbsp;&nbsp;';
			//alert(array);
		});
		msg += '<br>';
		
		// map: 각 배열의 요소에 함수의 결과를 실행한 후 새로운 배열을 만들어서 사용
		var nums2 = nums.map( function (value, index, array) {
			return value * 2;
		});
		msg += '<br>' + nums2 + '<br>';
		
		// 필터 값을 정하고 그것에 참인 데이터를 새로운 배열로 만듬
		var nums3 = nums.filter(function (value, index, array) {
			//return value > 40;
			return value % 2 == 0; // 짝수만 반환
		});
		msg += '<br>' + nums3 + '<br>';
		
		div1.innerHTML = msg;
	}
</script>
</head>
<body>
	<h2>배열 출력</h2>
	<div id="div1"></div>
</body>
</html>