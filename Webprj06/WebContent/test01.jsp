<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function() {
		console.log(window);
		var msg = '';
		for(var key in window){
			msg += key + ':' + window[key] + '\n';
		}
		document.body.innerHTML = msg.replace(/\n/gim, '<br>');
	}
</script>
</head>
<body>

</body>
</html>