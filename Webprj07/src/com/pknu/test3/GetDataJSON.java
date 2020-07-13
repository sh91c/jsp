package com.pknu.test3;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/GetDataJSON")
public class GetDataJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String msg = "";
		msg += "[\r\n" + 
				"{  \"num\": 1 , \"name\": \"효성\", \"age\":21  },\r\n" + 
				"{  \"num\": 2 , \"name\": \"영효\", \"age\":22  },\r\n" + 
				"{  \"num\": 3 , \"name\": \"상훈\", \"age\":23  },\r\n" + 
				"{  \"num\": 4 , \"name\": \"태화\", \"age\":25  }\r\n" + 
				"]";
		
		out.print(msg);
		
		out.flush(); // 버퍼를 사용하는 모든 출력장치에서 버퍼에 남아있는 데이터를 모두 출력
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
