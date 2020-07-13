<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.5.1.min.js"></script>
<script>
	var members = [];
	
	var getList = function(){
		$.ajax({
			url      : './memberList.jsp',
			type     : 'GET',
			datatype : 'JSON',
			success  : function(datas){
				members = datas;
				setList(); // 가져온 데이터로 리스트 출력
			},
			error    : function(){
				alert('err!');	
			}
		});	
	}
	
	var setList = function(){
		var strHTML = '';
		$.each( members, function(index, item){
			strHTML += '<div> <input type="checkbox" name="chkDel" value="'+ item.userid +'"/> ' + item.username + '('+ item.userid +')' + '</div>';
		});
		$('#list').html(strHTML);
	}
	
	// 등록하는 함수
	var saveData = function(){
		var userId = $('#userId').val();
		var userPw = $('#userPw').val();
		var userName = $('#userName').val();
		var sendData = 'userId=' + userId + '&userPw=' + userPw + '&userName=' + userName;
		
		$.ajax({
			url      : './students_save.jsp',
			type     : 'POST',
			datatype : 'JSON',
			data     : sendData,
			success  : function(datas){
				if(datas[0].success == "1"){
					getList();
				} else {
					alert('failed..');
				}
			},
			error    : function(){
				alert('err!');
			}
		});
	}
	
	// 삭제 함수
	var delData = function(){
		var checkedValues = [];
		var chkObjs = $('input[name="chkDel"]');
		$(chkObjs).each( function(index, item){                // 체크된 태그만을 새로운 배열에 담음
			if(item.checked){
				checkedValues.push(item.value);
			}
		});
		
		var str = '';                                           // 75라인 주석 확인
		$(checkedValues).each( function(index, item){           //
			str += "'" + item + "'" + ',';					    //
		});													    //
		str = '(' + str.substr(0, str.lastIndexOf(',')) + ')'; // where in ( '*', '*', '*')의 형태로 만들기 위함
		
		$.ajax({
			url : './students_del.jsp',
			type : 'GET',
			datatype : 'JSON',
			data : 'params=' + str,
			success : function(datas){
				getList();
				alert('삭제 완료');
			},
			error   : function(){
				alert('Del_error!');
			}
		});
	}
	
	$( function(){
		getList(); // AJAX 호출 -> 데이터를 가져옴
		
		$('#btnSave').click( function(){
			saveData();
		});
		
		$('#btnDel').click( function(){
			delData();
		});
	});
</script>
</head>
<body>
	<div id="wrap">
		<div id="write">
			<div>
				회원 아이디 : <input type="text" id="userId" size="10"/>
			</div>
			<div>
				패스워드 : <input type="password" id="userPw" size="10"/>
			</div>
			<div>
				회원 이름 : <input type="text" id="userName" size="10"/>
			</div>
			<div>
				<input type="button" id="btnSave" value="저장"/>
				<input type="button" id="btnDel" value="삭제"/>
			</div>
		<div id="list"></div>
		</div>
	</div>
</body>
</html>