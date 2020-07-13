package com.pknu.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/GetMember")
public class GetMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청온 정보
		String userid = request.getParameter("userid");
		
		// DB 조회 과정
		String msg = "";
		if(userid.equals("sky")) {
			msg += "<b class='red'>사용할 수 없는 아이디 입니다.</b>"; // 중복이 되었다
		} else {
			msg += "<b class='green'>사용가능한 아이디입니다.</b>"; // 중복되지 않음
		} // 쿼리스트링으로 비교가능함		
		
		// 응답해줄 정보
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(msg);
		
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
