<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var student = {};
	student.이름     = '형호';
	student.취미     = '악기';
	student.특기     = '프로그래';
	student.장래희망 = 'SW아키텍처';
	student.toString = function() {
		var msg = '';
		for ( var key in student) {
			if(key != 'toString') {
				msg += key + ' : ' +  student[key] + '\n';
			};
		}; 
		return msg;
	};
	
	console.log(student);
	alert(student.toString());
	delete(student.특기);
	alert(student.toString());

</script>
</head>
<body>

</body>
</html>