package com.pknu.ex08;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/get")
public class GetData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// doGet, doPost는 HTML레벨에서 사용할 수 있는 두 가지 method이다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 넘어오는 data 처리
		request.setCharacterEncoding("utf-8"); // 문자 인코딩
		String userid   = request.getParameter("userid");
		String userpw   = request.getParameter("userpw1");
		String username = request.getParameter("username");
		
		// 출력할 HTML 모양을 만든다.(템플릿)
			// 출력될 내용을 HTML로 받아서 처리
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String html  = "<html>";
		html        += "<head>";
		html        += "<meta charset=\"utf-8\">";
		html        += "<body>";
		html        += "<div>아이디: " + userid   + "</div>";
		html        += "<div>암호: "   + userpw   + "</div>";
		html        += "<div>이름: "   + username + "</div>";
		html        += "</body>";
		html        += "</head>";
		html        += "</html>";
		
		out.print(html);
		
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	// 이 부분은 XmlHttpRequest로 호출할 수 있다.
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doHead(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doOptions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doTrace(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
