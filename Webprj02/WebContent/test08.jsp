<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var won    = '1000원';
	var doller = '1.5$';
	var doller2 = '$18.6';
	alert( Number(won) + ' : ' + Number(doller));
	alert( parseInt(won) + ' : ' + parseInt(doller));
	alert( parseFloat(won) + ' : ' + parseFloat(doller));
	alert( Number(doller2) + ' : ' + parseFloat(doller2));
</script>
</head>
<body>
<script>
	const multiply = (a,b) => a * b;
	alert(multiply(1,2));
	alert(multiply(3,4));
</script>
</body>
</html>