<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/students.css">
<title>학생리스트</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="../js/students.js"></script>
<script>
	$( function(){
		getStudentsList("", "", "list");
		
		// 1. 검색(btnSearch) Click Event
		$('#btnSearch').click( function(){
			var v_selSearch = $('#selSearch').val();
			var v_txtSearch = $('#txtSearch').val();
			getStudentsList(v_selSearch, v_txtSearch, "list");
		});
		// 2. 체크박스 클릭 이벤트
		$('#chk').click( function(){
			if( $(this).prop('checked') ) {
				checkedFunc(true);
			} else {
				checkedFunc(false);
			}
		});
		
		$('#btnDel').click( function(){
			delStudents();
		});
		
		$('#btnMod').click( function(){
			var chkVal = $('input[type="checkbox"]:checked').val();
			modStudent(chkVal);
		});
		
	});
</script>
<script>

</script>
</head>
<body>
	<div id="wrap">
		<div>학생리스트</div>
		<div>
			검색 :<select id="selSearch" name="selSearch">
				<option value="stu_name">이름</option>
				<option value="stu_addr">주소</option>
				<option value="stu_dept">학과</option>
				<option value="all">이름 + 주소 + 학과</option>
			</select>
			<input type="text" id="txtSearch" name="txtSearch" />
			<input type="button" value="검색" id="btnSearch"/>
			<input type="button" value="저장" id="btnSave"/>
			<input type="button" value="수정" id="btnMod"/>
			<input type="button" value="삭제" id="btnDel"/>
		</div>
		<div id="title" class="title">
			<div class="cchk"><input type="checkbox" id="chk"/></div>
			<div class="cid">아이디</div>
			<div class="cname">이름</div>
			<div class="ctel">연락처</div>
			<div class="caddr">주소</div>
			<div class="cdept">학과</div>
		</div>
		<div id="list">
			<!-- <div class="list">
				<div class="cid">아이디</div>
				<div class="cname">이름</div>
				<div class="ctel">연락처</div>
				<div class="caddr">주소</div>
				<div class="cdept">학과</div>
			</div>	 -->	
		</div>
	</div>
</body>
</html>