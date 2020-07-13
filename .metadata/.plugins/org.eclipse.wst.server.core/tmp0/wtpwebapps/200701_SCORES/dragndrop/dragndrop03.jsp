<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.rec {
		width: 150px; height: 30px;
		border:3px dotted tomato;
	}
	.rec2 {
		width: 150px; height: 30px;
		border:3px dashed gray;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$( function(){
		$('.rec').draggable();
		
		$('.rec2').sortable();
	});
</script>
</head>
<body>
	<div id="a" style="width:150px;height:100px;border:1px solid black;">
		<div class="rec">1</div>
		<div class="rec">2</div>
	</div>
	<div id="b" style="width:150px;height:100px;border:1px solid yellow;">
		<div class="rec2">1</div>
		<div class="rec2">2</div>
	</div>
</body>
</html>