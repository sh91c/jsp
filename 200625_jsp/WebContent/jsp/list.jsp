<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function Go_Del() {
		// 1. 체크된 ROW의 value값을 찾기.
		
		var checkedSids = [];
		var num = 0;
		
		var objChks = document.getElementsByName('chk');
		for (var i = 0; i < objChks.length; i++) {
			if( objChks[i].checked ){
				checkedSids[num] = objChks[i].value;
				num += 1;
			}
		}
		
		// 2. where in (field1, field2, ... );
		var serverParams = "(";
		for (var i = 0; i < checkedSids.length; i++) {
			if( i == checkedSids.length - 1 ){
				serverParams += "'"+ checkedSids[i] +"'";
			} else {
				serverParams += "'"+ checkedSids[i] +"',";
			}
		}
		serverParams += ")";
		
		// 서버로 전송(delete.jsp)
		location.href = "./delete.jsp?delsid=" + serverParams;
	}//Go_Del()
	
	
	function Go_Write(){
		location.href = "basic02.jsp";
	}//Go_Write()
	
	
</script>
<style>
	.cls0 {
		width: 60px;
		height: 30px;
		border: 1px solid #999999;
		text-align: center;
		line-height: 30px;
		font-size: 20px;
		float: left;
	}
	.cls1 {
		width: 100px;
		height: 30px;
		border: 1px solid #999999;
		text-align: center;
		line-height: 30px;
		font-size: 20px;
		float: left;
	}
	.cls2 {
		width: 100px;
		height: 30px;
		border: 1px solid #999999;
		text-align: center;
		line-height: 30px;
		font-size: 20px;
		float: left;
	}
	.cls3 {
		width: 100px;
		height: 30px;
		border: 1px solid #999999;
		text-align: center;
		line-height: 30px;
		font-size: 20px;
		float: left;
	}
	.cls4 {
		width: 100px;
		height: 30px;
		border: 1px solid #999999;
		text-align: center;
		line-height: 30px;
		font-size: 20px;
		float: left;
	}
	.row {
		clear: both;
	}
</style>
</head>
<%
	// 이름 검색 구현
	String strSName = request.getParameter("sname");
	/* if(strSName == null){
		strSName = "";
	} */
	out.println(strSName);


	String url    = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "testdb2";
	String userpw = "oracle";
	
	Connection conn = DriverManager.getConnection(url, userid, userpw);
	
	String sql = " SELECT 		SID, SNAME, DAGE, DECODE(DGEN, 'M', '남자', '여자') AS DGEN "
			   + " FROM 		STUDENTS "
			   + " WHERE 		SNAME LIKE '%"+ strSName +"%' "
			   + " ORDER BY 	SID ASC ";
	PreparedStatement psmt = conn.prepareStatement(sql);
	
	ResultSet rs = psmt.executeQuery();
%>
<body>
	<div id="wrap">
		<div>
			<form action="list.jsp" method="POST" >
				이름 검색 : <input type="text" name="sname" size="10" />
						   <input type="submit" value="검색" />
						   <input type="button" value="등록" onclick="Go_Write()"/>
						   <input type="button" value="삭제" onclick="Go_Del()"/>
		   </form>
		</div>
		<div id="" class="row">
			<div class="cls0"> </div>
			<div class="cls1">아이디</div>
			<div class="cls2">이름</div>
			<div class="cls3">나이</div>
			<div class="cls4">성별</div>
			<div class="cls4"></div>			
		</div>
		<%
			while(rs.next()){	
		%>
		<div id="" class="row">
			<div class="cls0"><input type="checkbox" name="chk" value="<%=rs.getString("sid") %>" /></div>
			<div class="cls1"><%=rs.getString("sid") %></div>
			<div class="cls2"><%=rs.getString("sname") %></div>
			<div class="cls3"><%=rs.getString("dage") %></div>
			<div class="cls4"><%=rs.getString("dgen") %></div> <!-- getString(필드이름) -->
			<div class="cls4"><a href="./update.jsp?sid=<%=rs.getString("sid") %>">수정</a></div>
		</div>
		<%
			};
		%>		
	</div>
</body>
</html>