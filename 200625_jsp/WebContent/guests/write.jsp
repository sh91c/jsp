<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 글쓰기</title>
<style>
	.col1 {
		width: 500px;
		height: 30px;
		text-align: center;
		line-height: 30px;
	}
	.col2 {
		width: 150px;
		height: 30px;
		text-align: center;
		line-height: 30px;
	}
	.col3 {
		width: 400px;
		height: 30px;
		text-align: center;
		line-height: 30px;
	}
	.inp {
		width: 400px;
		font-size: 20px;
		border: 1px solid gray;
	}
	.txt {
		width: 400px;
		height: 100px;
	}
	.btn {
		width: 100px;
		height: 25px;
		background-color: #aaaaaa;
		color: #555555;
		border: 1px solid gray;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
 	var checkValue = function(){
 		var nameVal = $('#name').val();
 		var contentsVal = $('#contents').val();
 		
 		if(nameVal.length < 2) {
 			$('#msg').html('이름을 2자 이상 입력하세요.');
 			return;
 		}
 		if( contentsVal < 6 ) {
 			$('#msg').html('내용을 5자 이상 입력하세요.');
 			return;
 		}
 		
 		frmWrite.submit();
 	}
</script>
</head>
<body>
	<form name="frmWrite" action="./write_ok.jsp" method="POST">
		<table cellpadding="0" cellspacing="0" border="1" width="500" align=c"enter">
			<tr>
				<td colspan="2" class="col1">방명록</td>
			</tr>
			<tr>
				<td class="col2">작성자</td>
				<td class="col3">
					<input type="text" name="name" id="name" class="inp"/>
				</td>
			</tr>
			<tr>
				<td class="col2">글내용</td>
				<td class="col3">
					<textarea class="txt" id="contents" name="contents"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="col1"><input type="button" id="btnSubmit" class="btn" value="글쓰기"
				onclick="checkValue()"/></td>
			</tr>
			<tr>
				<td colspan="2" class="col1">
					<span id="msg" style="font-size: 20px; color: orange; font-weight: bold;"></span>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>