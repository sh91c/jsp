package PKG_SERV;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import PKG_DB.DBCon;

@WebServlet("/Students")
public class Students extends HttpServlet {  
    public Students() {
        super();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=utf-8");

    	String strStu_id = request.getParameter("stu_id");
    	String strSub_id = request.getParameter("sub_id");

    	DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
    	
    	String strProcName = " CALL PKG_STUDENTS.PROC_SEL_TIME(?, ?, ?) ";
    	
    	String[] strInParams = {strStu_id,  strSub_id, ""};
    	String[] strInOut = {"IN", "IN", "OUT"};
    	int[] sqlTypes = {0,0, oracle.jdbc.OracleTypes.CURSOR};
    	
    	ResultSet rs = db.getResultSet(strProcName, strInParams, sqlTypes, strInOut);
    	
    	JSONArray arr = new JSONArray();
    	try {
			while(rs.next()){
				JSONObject obj = new JSONObject();
				obj.put("stu_id", rs.getString("STU_ID"));
				obj.put("o_stu_id", rs.getString("O_STU_ID"));
				obj.put("stu_name", rs.getString("STU_NAME"));
				obj.put("sub_id", rs.getString("SUB_ID"));
				obj.put("o_sub_id", rs.getString("O_SUB_ID"));
				obj.put("sub_name", rs.getString("SUB_NAME"));
				obj.put("do_year", rs.getString("DO_YEAR"));
				obj.put("o_do_year", rs.getString("O_DO_YEAR"));
				obj.put("semester", rs.getString("SEMESTER"));
				obj.put("o_semester", rs.getString("O_SEMESTER"));
				obj.put("reg_date", rs.getString("REG_DATE"));
				
				
				arr.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	
    	PrintWriter out = response.getWriter();
    	out.println(arr);
    	
	}
    
    
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//	}

}
