package com.pknu.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//필수
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8"); // 문자 인코딩
		PrintWriter out = response.getWriter(); // 필수
		
		
		String msg   = "<html>";
			   msg  += "<head>";
			   msg  += "<meta charset='utf-8'>";
			   msg  += "</head>";
			   msg  += "<body>";
		String title = "Hello 서블릿!";
	      	   msg  += "<h1>"+ title +"</h1>";
	      	   msg  += "</body>";
	      	   msg  += "</html>";
		
		out.print(msg);
		
		out.flush();
		out.close();
	}
	
	// 필수
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
