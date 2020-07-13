<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.rec{
		width: 200px;
		height: 200px;
		border: 1px dashed black;
		background-color : lightgray;
	}
	.drop{
		width: 800px;
		height: 400px;
		border: 1px dashed red;
		background-color : pink;
	}
	
	.at{
		background-color: red;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$( function(){
		$('#rect').draggable({
			helper : 'original',
		});
		
		$('#ddd').droppable({
			activeClass : 'at'
			hoverClass : 'ht',
			activate : function(event, ui){
				alert('activate');
			},
			create : function(event, ui){
				alert('create');
			},
			drop : function(event, ui){
				alert('drop');
			},
			out : function(event, ui){
				alert('out');
			},
			over : function(event, ui){
				alert('over');	
			}
		});
	});
</script>
</head>
<body>
	<div class="rec" id="rect">
	
	</div>
	<div class="drop" id="ddd">
	
	</div>
</body>
</html>