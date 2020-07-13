<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.5.1.min.js"></script>
<script>
	/* 	
	var students = [
		{sid : 'S001', sname : 'hong'},
		{sid : 'S002', sname : 'lee'},
		{sid : 'S003', sname : 'choi'},
		{sid : 'S004', sname : 'park'}
	]; 
	*/
	
	var students = [];
	
	// 1. btnSearch click event
	$( function(){
		$('#getData').click( function(){
			$.ajax({
				url      : './students_make_json.jsp',
				type     : 'get',
				datatype : 'json',
				data     : '',
				success  : function(datas){
					students = datas;
					alert('가져오기 성공!');
				},
				errer    : function(){
					alert('err!');
				}
			});
		});		
		
		$('#btnSearch').click( function(){
			var strHTML = '';
			$.each(students, function(index, item){
				strHTML += '<div>' + item.sid + ' - ' + item.sname + '</div>';
			});
			$('#list').html(strHTML);
		});
	});
</script>
</head>
<body>
	<div id="wrap">
	<div>
		<input type="button" value="데이터 가져오기" id="getData" />
		<input type="button" value="조회" id="btnSearch"/>
	</div>
	<div id="list"></div>
	<!-- 
		<div>
			번호 : S001 - 이름 : hong
		</div>
	 -->
	</div>
</body>
</html>