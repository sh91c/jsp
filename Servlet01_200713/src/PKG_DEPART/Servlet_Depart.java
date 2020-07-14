package PKG_DEPART;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PKG_DB.DBCon;

@WebServlet("/Depart") // mapping
public class Servlet_Depart extends HttpServlet {
    public Servlet_Depart() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			
			doWork(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			
			doWork(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void doWork(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String strDoWork = request.getParameter("doWork");
		
		if(strDoWork.equals("list")) {
			Depart_List(request, response);
		}
		
		if(strDoWork.equals("update")){
			Depart_Update(request, response);
		}
		
		if(strDoWork.equals("updateOK")) {
			Depart_UpdateOK(request, response);
		}
	}
	
	protected void Depart_List(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		// db connection
		DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
		
		String sql = " SELECT * FROM COMMONS_TBL\n" + 
					 "START WITH parent_id = 'ROOT'\n" + 
					 "AND GRP_ID = 'GRP002'\n" + 
					 "CONNECT BY PRIOR COM_ID = PARENT_ID AND GRP_ID = 'GRP002' ";
		ResultSet rs = db.getResultSet(sql);
		
		ArrayList arr = new ArrayList<>();
		
		while( rs.next() ) {
			DepartVO depart = new DepartVO();
			depart.setCom_id(rs.getString("COM_ID"));
			depart.setGrp_id(rs.getString("GRP_ID"));
			depart.setCom_val(rs.getString("COM_VAL"));
			depart.setCom_lvl(rs.getString("COM_LVL"));
			
			arr.add(depart);
		}
		
		request.setAttribute("departList", arr);		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/03_Departs/departs_list.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void Depart_Update(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
		
		String strGrp_id = request.getParameter("grp_id");
		String strCom_id = request.getParameter("com_id");
		
		String sql = " SELECT * FROM COMMONS_TBL WHERE GRP_ID = '"+ strGrp_id +"' AND COM_ID = '"+ strCom_id +"' ";
		ResultSet rs = db.getResultSet(sql);
		rs.next();
		
		DepartVO dpt = new DepartVO();
		dpt.setGrp_id(rs.getString("GRP_ID"));
		dpt.setCom_id(rs.getString("COM_ID"));
		dpt.setCom_val(rs.getString("COM_VAL"));
		dpt.setCom_lvl(rs.getString("COM_LVL"));
		
		request.setAttribute("depart", dpt);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/03_Departs/departs_update.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void Depart_UpdateOK(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
		
		String strGrpID = request.getParameter("grp_id");
		String strComID = request.getParameter("com_id");
		String strComVal = request.getParameter("com_val");
		String strComLvl = request.getParameter("com_lvl");
		
		String sql = " UPDATE COMMONS_TBL "
				   + " SET COM_VAL = '"+ strComVal +"', COM_LVL = '"+ strComLvl +"' "
				   + " WHERE GRP_ID = '"+ strGrpID +"' "
				   + " AND   COM_ID = '"+ strComID +"' ";
		
		db.setCUD(sql);
		
		Depart_List(request, response); // reDirection
	}
	
}
