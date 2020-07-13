<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
	
</style>
<script src="../js/jquery-3.5.1.min.js"></script>
<script>
	<% String reqMsg = request.getParameter("msg"); %>
	if('<%=reqMsg %>' == 'fail'){
		alert('아이디 또는 비밀번호가 틀립니다.');
	}
</script>
<script>
	var loginOk = function(){
		// 1. 아이디가 입력 확인
		var idVal = $('#userId').val();
		
		if( idVal.length < 4 ){
			alert('ID는 최소 4자리 이상 입력하세요.');
			return;
		}
		
		// 2. 비밀번호 입력 확인
		var pwVal = $('#userPw').val();
		if( pwVal.length < 4 ){
			alert('암호는 최소 4자리 이상 입력하세요.');
			return;
		}
		loginForm.submit();
	};
	
	$( function(){		
		// 1. Click event for btnLogin ( 로그인 )
		$('#btnLogin').click( function(){
			loginOk();
		});
		
		
		// 2. Click event for btnChk ( 중복체크 )
		$('#btnChk').click( function(){
			$.ajax({
				url      : './checkId.jsp',
				type     : 'GET',
				datatype : 'json', 	    // 서버에서 받아오는 data type : json, xml
				data     : 'userId=' + $('#userId').val(), // data 속성: get방식으로 넘어가는 value
				success  : function(datas){                // success 속성 : checkId.jsp에서 응답으로 온 데이터
					var result = datas[0].CNT;             // 배열타입인 datas 매개변수로 받게됨
					if( result == '1' ){
						// 중복
						$('#chkmsg').html('사용할 수 없는 ID입니다.');
					} else {
						// 사용 가능
						$('#chkmsg').html('사용할 수 있는 ID입니다.');
					}
				},
				error    : function(err){
					alert('에러');
				}
			});
		});
	});
</script>
</head>
<body>
	<form name="loginForm" method="POST" action="login_ok.jsp">
		<div id="wrap">
			<ul>
				<li>
					<div>아이디</div>
					<div>
					<input type="text" id="userId" name="userId" />
					<input type="button" id="btnChk" value="중복확인" />
					<span id="chkmsg"></span>
					</div>
				</li>
				<li>
					<div>비밀번호</div>
					<div><input type="password" id="userPw" name="userPw" /></div>
				</li>
				<li>
					<input type="button" value="확인" id="btnLogin"/>
				</li>
			</ul>
		</div>
	</form>
</body>
</html>