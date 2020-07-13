<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var str = 'c:\\aaa\\bbb\\ccc\\asdqwdxcv\\a.txt';
	var i   = str.lastIndexOf('\\');
	var filename = str.substr(i + 1);
	var str2 = '123#4567890';
	
	alert(filename);
	var index = str2.lastIndexOf('#');
//	var result = str2.substr(index + 1, 2); // 개수만큼
	var result = str2.substr(index + 1); // 끝까지
	
	alert(result);
</script>
</head>
<body>

</body>
</html>