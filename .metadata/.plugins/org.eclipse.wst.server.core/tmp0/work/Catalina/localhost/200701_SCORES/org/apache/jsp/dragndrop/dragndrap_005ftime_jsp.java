/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.35
 * Generated at: 2020-07-10 06:31:32 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.dragndrop;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class dragndrap_005ftime_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>Insert title here</title>\n");
      out.write("<style>\n");
      out.write("\t#wrap{ clear: both; }\n");
      out.write("\t.subrow{ float: left; width: 300px; heigth: 500px; border: 1px solid black; }\n");
      out.write("\t.timerow{ float: left; width: 600px; heigth: 500px; border: 1px solid black; }\n");
      out.write("\t.sub{ display: block; width: 200px; height: 40px; border:1px solid gray; }\n");
      out.write("\t.row{ clear: both; }\n");
      out.write("\t.col{ float: left; width: 80px; height: 50px; border: 1px solid skyblue; }\n");
      out.write("</style>\n");
      out.write("<script src=\"https://code.jquery.com/jquery-1.12.4.js\"></script>\n");
      out.write("<script src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t<div id=\"wrap\">\n");
      out.write("\t\t<div id=\"subjects\" class=\"subrow\">\n");
      out.write("\t\t\t<a href=\"\" class=\"sub\">국어(3)</a>\n");
      out.write("\t\t\t<a href=\"\" class=\"sub\">수학(3)</a>\n");
      out.write("\t\t\t<a href=\"\" class=\"sub\">영어(3)</a>\n");
      out.write("\t\t\t<a href=\"\" class=\"sub\">과학(2)</a>\n");
      out.write("\t\t\t<a href=\"\" class=\"sub\">사회(2)</a>\n");
      out.write("\t\t\t<a href=\"\" class=\"sub\">체육(2)</a>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div id=\"time\" class=\"timerow\">\n");
      out.write("\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\">월</div>\n");
      out.write("\t\t\t\t<div class=\"col\">화</div>\n");
      out.write("\t\t\t\t<div class=\"col\">수</div>\n");
      out.write("\t\t\t\t<div class=\"col\">목</div>\n");
      out.write("\t\t\t\t<div class=\"col\">금</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t<div class=\"col\">1</div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t<div class=\"col\">2</div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"row\" >\n");
      out.write("\t\t\t\t<div class=\"col\">3</div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t<div class=\"col\">4</div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t<div class=\"col\">5</div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t<div class=\"col\">6</div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t<div class=\"col\">7</div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t<div class=\"col\">8</div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t\t<div class=\"col\"></div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
