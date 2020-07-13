package com.pknu.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/GetMemberXML")
public class GetMemberXML extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청온 정보
		String userid = request.getParameter("userid");
		
		// DB 조회 과정
		String xml = "<member>"
				   + "<class>red</class>"
				   + "<msg>사용할 수 없는 아이디입니다.</msg>"
				   + "</member>";
		
		// 응답해줄 정보
		response.setContentType("text/xml; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(xml);
		
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
