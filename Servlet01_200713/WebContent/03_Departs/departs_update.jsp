<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>   
<%@ page language="java" import="java.util.ArrayList"%>   
<%@ page language="java" import="PKG_DEPART.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	DepartVO depart = (DepartVO)request.getAttribute("depart");
	
	String strGrpID = depart.getGrp_id();
	String strComID = depart.getCom_id();
	String strComVal= depart.getCom_val();
	String strComLvl= depart.getCom_lvl();
	
%>
</head>
<body>
	<form name="frm" method="post" action="./Depart?doWork=updateOK">
		<div>GRP_ID : <%=strGrpID %></div>
		<div>COM_ID : <%=strComID %></div>
		<div>COM_VAL : <input type="text" name="com_val" id="com_val" value="<%=strComVal%>"/></div>
		<div>COM_LVL : <input type="text" name="com_lvl" id="com_lvl" value="<%=strComLvl%>"/></div>
		<div>
			<input type="submit" value="수정 완료" />
		</div>
		<input type="hidden" name="doWork" value="updateOK" />
		<input type="hidden" name="grp_id" value="<%=strGrpID %>" />
		<input type="hidden" name="com_id" value="<%=strComID %>" />
	</form>
</body>
</html>