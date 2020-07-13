package PKG_STUDENT;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PKG_DB.DBCon;

@WebServlet("/Students")
public class Students extends HttpServlet {

    public Students() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		do_work(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		do_work(request, response);
	}
	
	protected void do_work(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		/* DATA OUTPUT TEST
		String strID = "STU001";
		String strName = "홍길동01";
		String strTel = "010-5555-4414";
		
		request.setAttribute("ID", strID);
		request.setAttribute("NAME", strName);
		request.setAttribute("TEL", strTel);
		*/

		DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
		String sql = " SELECT * FROM STUDENTS_TBL ORDER BY STU_ID ASC ";
		ResultSet rs = db.getResultSet(sql);
		
		request.setAttribute("ResultSet", rs);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/02_Students/students_list.jsp");
		// setAttribute로 가져온 값들은 forward의 request에 들어감
		dispatcher.forward(request, response);
	}

}
