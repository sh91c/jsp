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
		alert('���̵� �Ǵ� ��й�ȣ�� Ʋ���ϴ�.');
	}
</script>
<script>
	var loginOk = function(){
		// 1. ���̵� �Է� Ȯ��
		var idVal = $('#userId').val();
		
		if( idVal.length < 4 ){
			alert('ID�� �ּ� 4�ڸ� �̻� �Է��ϼ���.');
			return;
		}
		
		// 2. ��й�ȣ �Է� Ȯ��
		var pwVal = $('#userPw').val();
		if( pwVal.length < 4 ){
			alert('��ȣ�� �ּ� 4�ڸ� �̻� �Է��ϼ���.');
			return;
		}
		loginForm.submit();
	};
	
	$( function(){		
		// 1. Click event for btnLogin ( �α��� )
		$('#btnLogin').click( function(){
			loginOk();
		});
		
		
		// 2. Click event for btnChk ( �ߺ�üũ )
		$('#btnChk').click( function(){
			$.ajax({
				url      : './checkId.jsp',
				type     : 'GET',
				datatype : 'json', 	    // �������� �޾ƿ��� data type : json, xml
				data     : 'userId=' + $('#userId').val(), // data �Ӽ�: get������� �Ѿ�� value
				success  : function(datas){                // success �Ӽ� : checkId.jsp���� �������� �� ������
					var result = datas[0].CNT;             // �迭Ÿ���� datas �Ű������� �ްԵ�
					if( result == '1' ){
						// �ߺ�
						$('#chkmsg').html('����� �� ���� ID�Դϴ�.');
					} else {
						// ��� ����
						$('#chkmsg').html('����� �� �ִ� ID�Դϴ�.');
					}
				},
				error    : function(err){
					alert('����');
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
					<div>���̵�</div>
					<div>
					<input type="text" id="userId" name="userId" />
					<input type="button" id="btnChk" value="�ߺ�Ȯ��" />
					<span id="chkmsg"></span>
					</div>
				</li>
				<li>
					<div>��й�ȣ</div>
					<div><input type="password" id="userPw" name="userPw" /></div>
				</li>
				<li>
					<input type="button" value="Ȯ��" id="btnLogin"/>
				</li>
			</ul>
		</div>
	</form>
</body>
</html>