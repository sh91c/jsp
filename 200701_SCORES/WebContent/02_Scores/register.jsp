<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/scores.css" />
<style>
	#dept {
		display: none;
	}
	
	#student {
		display: none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="../js/scores.js"></script>
<script>
	$( function(){
		// 시험학기(년도, 학기)
		getYear('year');
		
		getCollege('college');
		
		// CHANGE 이벤트 등록 
		$('#college').change( function(){
			var selectedValue = $('#college').val();
			getDept(selectedValue, 'dept'); // selectedValue로 학과 정보를 가져와야함
			//$('#dept').show();
			$('#dept').css('display','inline');
		});
		
		$('#dept').change( function(){
			var selectedValue = $('#dept').val();
			getStudents(selectedValue, 'student');
			$('#student').show();
		});
		
		$('#student').change( function(){
			var stu_id   = $('#student').val();
			var syear    = $('#year').val();
			var semester = $('#semester').val(); // 선택된 값들을 변수에 담아서
			getSubjects(stu_id, syear, semester, 'subject'); // 인자로 넘겨 과목 조회
		});
		
		$('#btnSave').click( function(){
			frm.submit();
		});
	});
</script>
</head>
<body>
	<form action="./register_ok.jsp" method="POST" id="frm">	
		<table border="1" width="90%" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="30%">
					시험학기
				</td>
				<td width="70%">
					<select id="year" name="year">
						
					</select>
					년
					&nbsp;&nbsp;&nbsp;
					<select id="semester" name="semester">
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
					학기
					&nbsp;&nbsp;&nbsp;
					<select id="gubun" name="gubun">
						<option value="1">중간고사</option>
						<option value="2">기말고사</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="30%">
					학과 및 학생이름
				</td>
				<td width="70%">
					<select id="college" name="college">
					
					</select>
					<select id="dept" name="dept">
					
					</select>
					<select id="student" name="student">
					
					</select>
				</td>
			</tr>
			<tr>
				<td width="30%">
					시험과목
				</td>
				<td width="70%">
					<select id="subject" name="subject">
						
					</select>
				</td>
			</tr>
			<tr>
				<td width="30%">
					시험점수
				</td>
				<td width="70%">
					<input type="text" id="score" name="score" />
				</td>
			</tr>
			<tr>
				<td width="30%">
					시험날짜
				</td>
				<td width="70%">
					<input type="text" id="examdate" name="examdate" />
				</td>
			</tr>
			<tr>
				<td width="100%" colspan="2" align="center">
					<input type="button" id="btnSave" name="btnSave" value="저장" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>