<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		width: 400px;
		border: 1px solid blue;
		padding : 20px;
		border-radius: 10px;
		margin : 10px;
		}
</style>
<script>
	var array   = ['사과', '바나나', '망고', '딸기'];
	var product = {
			제품명: '7D 건조 망고',
			유형  : '당절임',
			성분  : '망고, 설탕, 메타중아황산나트륨, 치자황색소',
			원산지: '필리핀'
	};
	var object = {
			'width space'          : 273,
			'width ~!@# $%^&*()_+' : 52
	};
	
	var obj = {
		number : 275,
		string : '객체 테스트',
		boolean : true,
		array : [52, 273, 103, 32],
		method : function() {
			alert('메세지')
		}
	};
	
	/*
	alert(array);
	alert(typeof(array));
	console.log(array);
	
	alert(product);
	alert(typeof(product));
	console.log(product);
	alert(product.제품명);
	alert(product['성분']); // 객체의 키를 접근할 때 자바의 map처럼 접근 가능하다.
	*/
	
	window.onload = function () {
		var div1       = document.querySelector('div');
		var msg = '';
		msg    += '제품명: ' + product.제품명 + '<br>';
		msg    += '유형: ' +product.유형 + '<br>';
		msg    += '성분: ' +product.성분 + '<br>';
		msg    += '원산지: ' +product.원산지 + '<br>';
		div1.innerHTML = msg;
		
		var array1 = document.querySelector("#array");
		var msg2   = '';
		msg2      += object['width space'] + '<br>';
		msg2      += object['width ~!@# $%^&*()_+'] + '<br>';
		array1.innerHTML = msg2;
		
		obj.method();
		
		var div3 = document.querySelector('div:nth-child(3)');
		var msg3 = '<ul>';
		/* for (var i = 0; i < obj.array.length; i++) {
			msg3 += '<li>' + obj.array[i] + '</li>';
		} */
		obj.array.forEach( function(value, index){
			/* msg3 += '<li>' + value + '</li>'; */
			msg3 += '<li>' + obj.array[index] + '</li>';
		});
		msg3 += '</ul>';
		div3.innerHTML = msg3;
		alert(obj);
		var objStr = JSON.stringify(obj);
		alert(objStr);
		console.log(objStr);
		var obj2 = JSON.parse(objStr);
		alert(obj2);
		console.log(obj2)
	}
	
</script>
</head>
<body>
	<div></div>
	<div id="array"></div>
	<div></div>
</body>
</html>