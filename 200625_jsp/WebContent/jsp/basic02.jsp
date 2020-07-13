<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.title {
		width: 200px;
		height: 40px;
		border: 1px solid #888888;
		background-color: #eeeeee;
		float: left;
		text-align: center;
		line-height: 40px;
	}
	.content {
		width: 400px;
		height: 40px;
		border: 1px solid #888888;
		background-color: #eeeeee;
		float: left;
	}
	.row {
		clear: both;
	}
</style>
<script> // not use jquery

		// form 태그 - onsubmit 속성, 속성값으로 return checkValue()에서의 return false; 동작을 유의
	function checkValue(){ // 유효성 검사 함수
		// 1. 학생 아이디 유효성 검사: 4자 이고, S로 시작해야함.
		var objSid = document.getElementById('sid');
		if( objSid.value.length != 4 || objSid.value.substr(0,1) != 'S' ){
			alert('학생 아이디를 다시 입력하세요.');
			return false;
		}
	
		// 2. 학생 이름 유효성 검사 : 2자 이상.
		var objName = document.getElementById('sname');
		if( objName.value.length < 2 ){
			alert('학생 이름은 최소 2자 이상 입력하세요.');
			return false;
		}
		
		//frmStudent.submit(); // form태그는 원래 submit()을 가지고있음
	}
</script>
</head>
<body>
	<form onsubmit="return checkValue()" action="./write_ok.jsp" method="POST" name="frmStudent">
	<!-- form 태그의 onsubmit 속성은 함수이다. : onsubmit(return checkValue())
		 -> false가 리턴되면 onsubit(return false)가 되어 form 태그의 action속성이 동작하지 않는다.-->
		<div id="formWrap">
			<div class="row">
				<div class="title">
					학생 아이디
				</div>
				<div class="content">
					<input type="text" id="sid" name="sid" class="itext"/>
				</div>
			</div>
			<div class="row">
				<div class="title">
					학생 이름
				</div>
				<div class="content">
					<input type="text" id="sname" name="sname" class="itext"/>
				</div>
			</div>
			<div class="row">
				<div class="title">
					학생 나이
				</div>
				<div class="content">
					<input type="text" id="sage" name="sage" class="itext"/>
				</div>
			</div>
			<div class="row">
				<div class="title">
					학생 성별
				</div>
				<div class="content">
					<label><input type="radio" id="male" name="gender" value="M"/>남자</label>
					<label><input type="radio" id="female" name="gender" value="F"/>여자</label>
				</div>
			</div>
			<div class="row">
				<!-- <input type="button" value="등록" onclick="checkValue()"/> -->
				<!-- <input type="button" value="등록" onclick="checkValue()" /> -->
				<button value="등록" >등록</button>
				<a href="./list.jsp?sname=">학생 목록으로 이동</a>
			</div>
		</div>
	</form>
</body>
</html>