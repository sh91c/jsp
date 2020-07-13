<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var array1 = new Array();						// X 배열 0개 X
	var array2 = new Array(10);						// O 10개 (하나만 썼을 때는 배열 개수로 생성됨) O
	var array3 = new Array(273, 103, 57, 33);       // X 4개  (여러개를 썼을 때) X
	var array4 = [273, 103, 57, 33];				// O 자바스크립트 배열은 이렇게 씀 4개 O
	alert(array1 + '\n' + array2 + '\n' + array3 + '\n' + array4);
	alert(array1.length + '\n' + array2.length + '\n' + array3.length + '\n' + array4.length); // 0, 10, 4
	
	v2 = 6;     // 이 때는 6 출력
	alert(v2); // 호이스팅 : 변수를 아래에 선언했는데 위에서 선언한 것처럼 작동
	var v2 = 6; // 이 때는 undefined
</script>
</head>
<body>

</body>
</html>