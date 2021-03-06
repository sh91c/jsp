<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
<%@ page language="java" import="org.json.simple.parser.JSONParser" %>

<%	
	request.setCharacterEncoding("UTF-8");

	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");

	String strJSONDatas = request.getParameter("jsonDatas");
	
	out.println(strJSONDatas);
	
	JSONParser parser = new JSONParser();
	
	JSONObject jsonObj = (JSONObject)parser.parse(strJSONDatas);
	
	JSONArray arrAppend = (JSONArray)jsonObj.get("appended");
	JSONArray arrUpdate = (JSONArray)jsonObj.get("updated");
	JSONArray arrDelete = (JSONArray)jsonObj.get("deleted");
	
	
	// append
	int appendSize = arrAppend.size();
	String strProcName = " CALL PKG_SCORES.PROC_INS_COM( ?, ?, ?, ? )";
	String[] strInParams = new String[4];
	for(int i = 0; i < appendSize; i++){
		JSONObject obj = (JSONObject)arrAppend.get(i);
		
		String strGrpID = (String)obj.get("grp_id");
		String strComID = (String)obj.get("com_id");
		String strComVal = (String)obj.get("com_val");
		String strComLvl = (String)obj.get("com_lvl");
		String strParentID = (String)obj.get("parent_id");
		String strStatus = (String)obj.get("status");
		
		strInParams[0] = strGrpID; 
		strInParams[1] = strComVal; 
		strInParams[2] = strComLvl; 
		strInParams[3] = strParentID; 
		db.setUpdate(strProcName, strInParams);
	} // end append
	
	
	// delete
	int deleteSize = arrDelete.size();
	
	String strProcName2 = " CALL PKG_SCORES.PROC_DEL_COM( ?, ? )";
	String[] strInParams2 = new String[2];
	
	for(int i = 0; i < deleteSize; i++){
		JSONObject obj = (JSONObject)arrDelete.get(i);
		
		String strGrpID = (String)obj.get("grp_id");
		String strComID = (String)obj.get("com_id");
		String strComVal = (String)obj.get("com_val");
		String strComLvl = (String)obj.get("com_lvl");
		String strParentID = (String)obj.get("parent_id");
		String strStatus = (String)obj.get("status");
		
		strInParams[0] = strGrpID; 
		strInParams[1] = strComID;  
		db.setUpdate(strProcName2, strInParams2);
	} // end delete
	
	
	// update
	int updateSize = arrUpdate.size();	
	
	String strProcName3 = " CALL PKG_SCORES.PROC_UP_COM( ?, ?, ?, ? )";
	String[] strInParams3 = new String[4];
	
	for(int i = 0; i < updateSize; i++){
		JSONObject obj = (JSONObject)arrUpdate.get(i);
		
		String strGrpID = (String)obj.get("grp_id");
		String strComID = (String)obj.get("com_id");
		String strComVal = (String)obj.get("com_val");
		String strComLvl = (String)obj.get("com_lvl");
		String strParentID = (String)obj.get("parent_id");
		String strStatus = (String)obj.get("status");
		
		strInParams[0] = strGrpID; 
		strInParams[1] = strComID;
		strInParams[2] = strComVal;
		strInParams[3] = strComLvl;
		
		db.setUpdate(strProcName3, strInParams3);
	} // end update
	
%>