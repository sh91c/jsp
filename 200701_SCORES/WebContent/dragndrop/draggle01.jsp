<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Draggable + Sortable</title>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css"> -->
<style>
	ul { list-style-type: none; margin: 0; padding: 0; margin-bottom: 10px; }
	li { margin: 5px; padding: 5px; width: 150px; }
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$( function() {
		$( "#b" ).sortable({
			  revert: true
		});
		$( "#a" ).draggable({
			  connectToSortable: "#b",
			  helper: "clone",
			  revert: "invalid"
		});
		$( "ul, li" ).disableSelection();
	} );
</script>
</head>
<body>
	<ul>
		<li id="a" class="ui-state-highlight">Drag me down</li>
	</ul>
		 
	<ul id="b">
		 <li class="ui-state-default">Item 1</li>
		 <li class="ui-state-default">Item 2</li>
		 <li class="ui-state-default">Item 3</li>
		 <li class="ui-state-default">Item 4</li>
		 <li class="ui-state-default">Item 5</li>
	</ul>
</body>
</html>