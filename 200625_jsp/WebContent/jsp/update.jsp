<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
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
<script>
	function checkValue(){ 
		var objSid = document.getElementById('sid');
		if( objSid.value.length != 4 || objSid.value.substr(0,1) != 'S' ){
			alert('학생 아이디를 다시 입력하세요.');
			return false;
		}

		var objName = document.getElementById('sname');
		if( objName.value.length < 2 ){
			alert('학생 이름은 최소 2자 이상 입력하세요.');
			return false;
		}
		
		location.href = "./test.jsp?testsid=" + ;
	}
</script>
</head>
<%
	// list.jsp에서 보낸 sid를 받아야 함.
	String strSid = request.getParameter("sid");

	String url    = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "testdb2";
	String userpw = "oracle";
	
	Connection conn = DriverManager.getConnection(url, userid, userpw);
	
	String sql = " SELECT SID, SNAME, DAGE, DGEN "
	           + " FROM STUDENTS "
	           + " WHERE SID = '"+ strSid +"' ";
	PreparedStatement psmt = conn.prepareStatement(sql);
	
	ResultSet rs = psmt.executeQuery();
	
	rs.next();
	
%>
<body>
	<form onsubmit="return checkValue()" action="./test.jsp" method="POST" name="frmStudent">
		<div id="formWrap">
			<div class="row">
				<div class="title">
					학생 아이디
				</div>
				<div class="content">
					<input type="text" id="sid" name="sid" class="itext" value="<%=rs.getString("sid") %>"/>
				</div>
			</div>
			<div class="row">
				<div class="title">
					학생 이름
				</div>
				<div class="content">
					<input type="text" id="sname" name="sname" class="itext" value="<%=rs.getString("sname") %>"/>
				</div>
			</div>
			<div class="row">
				<div class="title">
					학생 나이
				</div>
				<div class="content">
					<input type="text" id="sage" name="sage" class="itext" value="<%=rs.getString("dage") %>"/>
				</div>
			</div>
			<div class="row">
				<div class="title">
					학생 성별
				</div>
				<div class="content">
					<label><input type="radio" id="male" name="gender" value="M"
						<%
							if(rs.getString("dgen").equals("M")){
								out.println("checked");
							}
						%>
					/>남자</label>
					<label><input type="radio" id="female" name="gender" value="F"
						<%
							if(rs.getString("dgen").equals("F")){
								out.println("checked");
							}
						%>
					/>여자</label>
				</div>
			</div>
			<div class="row">
				<button>수정</button>
				<a href="./list.jsp?sname=">학생 목록으로 이동</a>
			</div>
		</div>
	</form>
</body>
</html>