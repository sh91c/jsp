<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<style>
	a {
		/* display: block; */
		width: 50px;
		height: 20px;
		background-color: lightgray;
		border: 1px solid #999999;
		text-align: center;
		line-height: 20px;
		color: black;
		text-decoration: none;
	}
	
	.txt {
		width: 100%;
		height: 60px;
		border: 1px solid gray;
	}
</style>
<script src="../js/jquery-3.5.1.min.js"></script>
<script>
	var gUpdate = function(strID, strContent, strSpanID, spanConID, stridx){
		var txtID = "txt"+ stridx;
		var strHTML = "<textarea id ='" + txtID + "'>"+ strContent +"</textarea>";
		$('#'+strID).html(strHTML);
		
		// 1. 수정을 클릭하면 -> 확인을 보여주고
		$('#'+strSpanID).hide();
		// 2. 확인을 클릭하면 ->
		$('#'+spanConID).show();
		
	}
	
	var gupdate2 = function(strIDX){
		var txtID = "txt" + strIDX;
		var txtValue = $('#' + txtID).val();
		
		$('#hIdx').val(strIDX);
		$('#hContent').val(txtValue);
		
		hidForm.submit();
	}
</script>
</head>
<%
//1. connection
	String url    = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "testdb2";
	String userpw = "oracle";

	Connection conn = DriverManager.getConnection(url, userid, userpw);
	
	// 2. preparedStatement
	/*
	String sql = " SELECT IDX, NAME, CONTENTS, TO_CHAR(REGDATE, 'YYYY-MM-DD HH:MI:SS') AS REGDATE "
			   + " FROM GUESTS "
			   + " ORDER BY IDX DESC ";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	*/
	
	String strProc = "call PROC_SELECT(?, ?)";
	CallableStatement cstmt = conn.prepareCall(strProc);
	cstmt.setString(1, "");
	cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
	cstmt.execute();
	ResultSet rs = (ResultSet)cstmt.getObject(2);
%>

<body>
	<table border="0" cellpadding="0" cellspacing="0" width="500" align="center">
		<tr>
			<td colspan="2" width="500" align="right">
				<a href="./write.jsp">글쓰기</a>
			</td>
		</tr>
	<% while(rs.next()){ %>
		<tr>
			<td width="120" align="left" height="30"><%=rs.getString("NAME") %></td>
			<td width="380" height="30" align="right"><%=rs.getString("REGDATE") %></td>
		</tr>
		<tr>
			<td width="500" align="left" height="30" colspan="2">
				<% 
					String conID = "content" + rs.getString("IDX");
				%>
				<div id="<%=conID %>">
					<%=rs.getString("CONTENTS") %>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" width="500" height="1" style="background-color: lightgray;"></td>
		</tr>
		<tr>
			<td colspan="2" width="500" height="30" align="right">
				<%
					String spanID = "btnSpan" + rs.getString("IDX");
					String spanConID = "btnCon" + rs.getString("IDX");
				%>
				<span id="<%=spanID %>">
					<a href="javascript:gUpdate('<%=conID %>', '<%=rs.getString("CONTENTS") %>', '<%=spanID %>', '<%=spanConID %>', '<%=rs.getString("IDX") %>')">수정</a>
					<a href="./delete.jsp?idx=<%=rs.getString("IDX") %>">삭제</a>
				</span>
				<span id="<%=spanConID %>", style="display:none;">
					<a href="javascript:gupdate2('<%=rs.getString("IDX") %>')">확인</a>
				</span>
			</td>
		</tr>
	<% } %>
	</table>
	<form name="hidForm" action="./update.jsp" method="POST">
		<input type="hidden" id="hIdx" name="hIdx">
		<input type="hidden" id="hContent" name="hContent">		
	</form>
</body>
</html>