<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" type="text/css" href="./css/students.css" />
<script src="./js/jquery-3.5.1.min.js"></script>
<script src="./js/students2.js"></script>
<script>
	$( function(){
		// 1-1. 페이지가 열리자마자 조회 -> ajax async: false로 해야해서 실패
		/*var strURL      = './datas/studentList.jsp';
		var strType     = 'POST';
		var strDataType = 'JSON';
		var strData     = ''; // 조회만 할거니까 없음
		var strHTML = getList(strURL, strType, strDataType, strData);
		$('#list').html(strHTML);*/
		
		// 1-2. 매개변수들을 배열로 하면 어떨까
		/* var arrParams = [];
		arrParams[0] = './datas/studentList.jsp';
		arrParams[1] = 'POST';
		arrParams[2] = 'JSON';
		arrParams[3] = ''; */
		//getList_arr(arrParams);
		
		// 1-3. object를 활용한 호출 --> 최근 경향
		var objParams = {
			strURL      : './datas/studentList.jsp',
			strType     : 'POST',
			strDataType : 'JSON',
			strData     : '',
			objHTML     : $('#list')
		};
		var strHTML = getList_obj(objParams);
	});
</script>
</head>
<body>
	<div id="wrap">
		<div id="titleRow">
			<div id="tSid" class="tTd">
				학생 아이디
			</div>
			<div id="tSname" class="tTd">
				성명
			</div>
			<div id="tAge" class="tTd">
				나이
			</div>
		</div>
		<!-- 여기서 부터 반복 -->
		<div id="list">
			<!-- 
			<div id="rows">
				<div id="tSid" class="sTd">
				
				</div>
				<div id="tSname" class="sTd">
				
				</div>
				<div id="tAge" class="sTd">
				
				</div>
			</div>
			 -->
		</div>
		<!-- 반복 끝 -->
	</div>
</body>
</html>