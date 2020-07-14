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
<% ArrayList departList = (ArrayList)request.getAttribute("departList"); %>
</head>
<body>
	<table border="1" cellpadding="0" cellspacing="0" align="center" width="600px" >
		<tr>
			<td width="100" align="center">그룹 코드</td>
			<td width="100" align="center">학과 코드</td>
			<td width="300" align="center">학과명(단과대학)</td>
			<td width="100" align="center">레벨</td>
		</tr>
		
		<%
			for(int i = 0; i < departList.size(); i++){				
				String strCom_id = ((DepartVO)departList.get(i)).getCom_id();
				String strGrp_id = ((DepartVO)departList.get(i)).getGrp_id();
				String strCom_val = ((DepartVO)departList.get(i)).getCom_val();
				String strCom_lvl = ((DepartVO)departList.get(i)).getCom_lvl();
				
				int padding = Integer.parseInt(strCom_lvl) * 40;
		%>
		<tr>
			<td width="100" align="center"><%=strGrp_id %></td>
			<td width="100" align="center">
				<a href="./Depart?doWork=update&grp_id=<%=strGrp_id %>&com_id=<%=strCom_id %>"><%=strCom_id %></a>
			</td>
			<td width="300" align="left" style="padding-left:<%=padding%>px"><%=strCom_val %></td>
			<td width="100" align="center"><%=strCom_lvl %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>