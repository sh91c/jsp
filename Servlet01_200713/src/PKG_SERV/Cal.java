package PKG_SERV;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Cal")
public class Cal extends HttpServlet {
	
       
  
    public Cal() {
        super();
        
    }

    //Controller
    protected void service(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
		
    	String strGubun = request.getParameter("gubun");
    	
    	if(strGubun.equals("1")) {
    		cal(request,response);
    	}
    	if(strGubun.equals("2")) {
    		cal2(request,response);
    	}
    	if(strGubun.equals("3")) {
    		cal(request,response);
    	}
		
	}
    
    protected void cal(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	
    	String strURL = request.getParameter("strURL");
    	String strNum = request.getParameter("num");
    	int num = Integer.parseInt(strNum);
    	
    	int result = num * 2;
    	
    	
    	request.setAttribute("result", String.valueOf(result));
    	
    	String strGubun = request.getParameter("gubun");
    	
    	if(strGubun.equals("3"))
    	{
    		cal2(request, response);
    	}
    	else
    	{
    
	    	RequestDispatcher dispatcher = request.getRequestDispatcher(strURL);
			dispatcher.forward(request, response);
    	}
    }
    
    protected void cal2(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	
    	String strURL = request.getParameter("strURL");
    	String strNum = request.getParameter("num");
    	int num = Integer.parseInt(strNum);
    	
    	int result = num * 3;
    	
    	
    	request.setAttribute("result2", String.valueOf(result));
    	
    	
    	String strGubun = request.getParameter("gubun");
    	
    	if(strGubun.equals("3"))
    	{
    		//1번결과 찾자
    		String result1 = (String)request.getAttribute("result");
    		request.setAttribute("result1", result1);
    		
    		RequestDispatcher dispatcher = request.getRequestDispatcher(strURL);
			dispatcher.forward(request, response);
    	}
    	else
    	{
    
	    	RequestDispatcher dispatcher = request.getRequestDispatcher(strURL);
			dispatcher.forward(request, response);
    	}
    }
    
	/*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	*/
}