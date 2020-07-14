package PKG_STUDENT;

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

@WebServlet("/Students")
public class Students extends HttpServlet {

    public Students() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		try {
			do_work(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		try {
			do_work(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void do_work(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException, SQLException {
		String strDoWork = request.getParameter("doWork");
		
		if(strDoWork.equals("list")) {
			student_List(request, response);
		}

		if(strDoWork.equals("detail")) {
			student_detail(request, response);
		}
		
		
	}
	
	protected void student_List(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
		String sql = " SELECT * FROM STUDENTS_TBL ORDER BY STU_ID ASC ";
		ResultSet rs = db.getResultSet(sql);
		
		ArrayList arrStudents = new ArrayList();
		//ArrayList<Student> arrStudents = new ArrayList<>();
		
		while( rs.next() ) {
		Student student = new Student();
		student.setStu_id(rs.getString("STU_ID")); // PKG_STUDENT.Student의 getter에 DB의 컬럼명을 지정
		student.setStu_name(rs.getString("STU_NAME"));
		student.setStu_tel(rs.getString("STU_TEL"));
		
		arrStudents.add(student);
		}
		
		request.setAttribute("students", arrStudents);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/02_Students/students_list.jsp");
		// setAttribute로 가져온 값들은 forward의 request에 들어감
		dispatcher.forward(request, response);
	}
	
	protected void student_detail(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		// 1. db연결 후 원하는 데이터 가져오기
		String strStu_ID = request.getParameter("stu_id");
		
		DBCon db = new DBCon("jdbc:oracle:thin:@localhost:1521:xe", "testdb2", "oracle");
		String sql = " SELECT * FROM STUDENTS_TBL WHERE STU_ID = '"+ strStu_ID +"' ORDER BY STU_ID ASC ";
		ResultSet rs = db.getResultSet(sql);
		rs.next();
		
		Student stud = new Student();
		stud.setStu_id(rs.getString("STU_ID"));
		stud.setStu_name(rs.getString("STU_NAME"));
		stud.setStu_tel(rs.getString("STU_TEL"));
		
		request.setAttribute("student", stud);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/02_Students/students_detail.jsp");
		dispatcher.forward(request, response);
		
	}
}
