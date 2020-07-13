<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		ul, li { padding: 0; margin: 0; }
		li { list-style-type: none; }
	</style>
	<script>
		window.onload = () => {
			var btn = document.getElementById('btnSubmit');
			btn.onclick = () => alert('정답');
		}
		document.write(`asdasdasd`);
	</script>
</head>

<body>
	<h1>정보 처리</h1>
	<div>
		<h3>다음 중 자바의 연산자가 아닌 것은?</h3>
		<ul>
			<li>
				<input id="a1_1" type="radio" name="a1" value="a1_1">
				<label for="a1_1">+</label>
			</li>
			<li>
				<input id="a1_2" type="radio" name="a1" value="a1_2">
				<label for="a1_2">**</label>
			</li>
			<li>
				<input id="a1_3" type="radio" name="a1" value="a1_3">
				<label for="a1_3">~</label>
			</li>
			<li>
				<input id="a1_4" type="radio" name="a1" value="a1_4">
				<label for="a1_4">!</label>
			</li>
		</ul>
	</div>
	<input id="btnSubmit" type="button" value="제출">
</body>

</html>