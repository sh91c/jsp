<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="PKG_DB.DBCon" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="org.json.simple.JSONArray" %>
<%@ page language="java" import="org.json.simple.JSONObject" %>
<%@ page language="java" import="org.json.simple.parser.JSONParser" %>

<%	
	request.setCharacterEncoding("UTF-8");

	String strAppend = request.getParameter("append");
	String strUpdate = request.getParameter("update");
	String strDelete = request.getParameter("delete");
	
	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");

	// JSON 분리
	JSONParser parser   = new JSONParser();

		// ################ append ################
	JSONArray appendArr = (JSONArray)parser.parse(strAppend);
	int appendSize = appendArr.size();
	
	String[] strGrpIDs    = new String[appendSize];
	String[] strGrpNames  = new String[appendSize];
	String[] strGrpStatus = new String[appendSize];
	
	String[] strAppendParams = new String[1];
	
	String strAppendProc = " CALL PKG_SCORES.PROC_INS_GRPCOM( ? ) ";
	
	for(int i = 0; i < appendSize; i++){
		JSONObject obj  = (JSONObject)appendArr.get(i);
		strGrpIDs[i]    = (String)obj.get("grp_id"); 
		strGrpNames[i]  = (String)obj.get("grp_name"); 
		strGrpStatus[i] = (String)obj.get("status");
		
		strAppendParams[0] = strGrpNames[i];
		db.setUpdate(strAppendProc, strAppendParams);
	}
	
		// ################ update ################
	 JSONArray updateArr = (JSONArray)parser.parse(strUpdate);
	int updateSize = updateArr.size();

	String[] strGrpIDs2    = new String[updateSize];
	String[] strGrpNames2  = new String[updateSize];
	
	String[] strUpdateParams = new String[2];
	
	String strUpdateProc = " CALL PKG_SCORES.PROC_UP_GRPCOM( ?, ? ) ";
	
	for(int i = 0; i < updateSize; i++){
		JSONObject obj  = (JSONObject)updateArr.get(i);
		strUpdateParams[0]  = (String)obj.get("grp_id"); 
		strUpdateParams[1]  = (String)obj.get("grp_name");
		
		db.setUpdate(strUpdateProc, strUpdateParams);
	}
	
	 	// ################ delete ################
	JSONArray deleteArr = (JSONArray)parser.parse(strDelete);
	int deleteSize = deleteArr.size();
	
	String[] strDeleteParams = new String[1];

	String strDeleteProc = " CALL PKG_SCORES.PROC_DEL_GRPCOM( ? ) ";
	
	for(int i = 0; i < deleteSize; i++){
		JSONObject obj  = (JSONObject)deleteArr.get(i);
		strDeleteParams[0]  = (String)obj.get("grp_id"); 
		
		db.setUpdate(strDeleteProc, strDeleteParams);
	}
	// 분리 끝 */

%>