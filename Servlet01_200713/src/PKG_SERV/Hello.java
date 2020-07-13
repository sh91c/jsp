package PKG_SERV;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hi")
public class Hello extends HttpServlet{ //-> 확장자가 .hello, 서블릿으로 작성하면 모두 여기서 실행
										// 그리고 doGet, doPost 실행
	/*
	protected void service(HttpServletRequest request, HttpServletResponse response)
		// JSP에서 form태그로 GET, POST로 데이터를 보내면 서블릿 클래스의 request, response가 동작함
	throws ServletException, IOException{
		
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
		
			PrintWriter out = response.getWriter();
			String userID = request.getParameter("id");
			String btn1 = request.getParameter("btn1");
			String btn2 = request.getParameter("btn2");

			out.println("Hello" + btn1);
			out.println("Hello" + btn2);
			
			request.setAttribute("id", userID);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/01_test/list.jsp");
			dispatcher.forward(request, response);
	}
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
	
		PrintWriter out = response.getWriter();
		String userID = request.getParameter("id");
		String btn1 = request.getParameter("btn1");
		String btn2 = request.getParameter("btn2");

		out.println("Hello" + btn1);
		out.println("Hello" + btn2);
		
		request.setAttribute("id", userID);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/01_test/list.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		
	}
}
