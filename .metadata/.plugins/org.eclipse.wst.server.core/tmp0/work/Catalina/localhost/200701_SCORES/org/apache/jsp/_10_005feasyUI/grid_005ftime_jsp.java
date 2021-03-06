/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.35
 * Generated at: 2020-07-14 00:17:02 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp._10_005feasyUI;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class grid_005ftime_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/easyui.css\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/icon.css\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/demo.css\">\n");
      out.write("<script type=\"text/javascript\" src=\"../js/jquery-3.5.1.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"../js/jquery.easyui.min.js\"></script>\n");
      out.write("<script>\n");
      out.write("\tvar editIndex = undefined;\n");
      out.write("    function endEditing(){\n");
      out.write("        if (editIndex == undefined){return true}   \n");
      out.write("        if ($('#dg').datagrid('validateRow', editIndex)){\n");
      out.write("            $('#dg').datagrid('endEdit', editIndex);\n");
      out.write("            editIndex = undefined;\n");
      out.write("            return true;\n");
      out.write("        } else {\n");
      out.write("            return false;\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("\tfunction onClickCell(index, field){\n");
      out.write("\t    if (editIndex != index){\n");
      out.write("\t        if (endEditing()){\n");
      out.write("\t            $('#dg').datagrid('selectRow', index)\n");
      out.write("\t                    .datagrid('beginEdit', index);\n");
      out.write("\t            var ed = $('#dg').datagrid('getEditor', {index:index,field:field});\n");
      out.write("\t            if (ed){\n");
      out.write("\t                ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();\n");
      out.write("\t            }\n");
      out.write("\t            editIndex = index;\n");
      out.write("\t        } else {\n");
      out.write("\t            setTimeout(function(){\n");
      out.write("\t                $('#dg').datagrid('selectRow', editIndex);\n");
      out.write("\t            },0);\n");
      out.write("\t        }\n");
      out.write("\t    }\n");
      out.write("\t}\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\tfunction onEndEdit(index, row){\n");
      out.write("\t\t\n");
      out.write("\t    var ed = $(this).datagrid('getEditor', {\n");
      out.write("\t        index: index,\n");
      out.write("\t        field: 'stu_id'\n");
      out.write("\t    });\n");
      out.write("\t    row.stu_name = $(ed.target).combobox('getText');\n");
      out.write("\t\n");
      out.write("\t    var ed2 = $(this).datagrid('getEditor', {\n");
      out.write("\t        index: index,\n");
      out.write("\t        field: 'sub_id'\n");
      out.write("\t    });\n");
      out.write("\t    row.sub_name = $(ed2.target).combobox('getText');\n");
      out.write("\t    \n");
      out.write("\t    if(row.status != 'P'){\n");
      out.write("\t    \trow.status = 'U';\n");
      out.write("\t    }\n");
      out.write("\t}\n");
      out.write("\t\n");
      out.write("\t// 추가\n");
      out.write("\tfunction append(){\n");
      out.write("        if (endEditing()){\n");
      out.write("            $('#dg').datagrid('appendRow',{status:'P'});\n");
      out.write("            editIndex = $('#dg').datagrid('getRows').length-1;\n");
      out.write("            $('#dg').datagrid('selectRow', editIndex)\n");
      out.write("                    .datagrid('beginEdit', editIndex);\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("\t\n");
      out.write("\t// 삭제\n");
      out.write("\tfunction removeit(){\n");
      out.write("        if (editIndex == undefined){return}\n");
      out.write("        $('#dg').datagrid('cancelEdit', editIndex)\n");
      out.write("                .datagrid('deleteRow', editIndex);\n");
      out.write("        editIndex = undefined;\n");
      out.write("    }\n");
      out.write("\t\n");
      out.write("\t// 저장\n");
      out.write("\tfunction acceptit(){ // DB와는 상관없음\n");
      out.write("\t\t\n");
      out.write("\t\tvar updateArr = [];\n");
      out.write("\t\tvar appendArr = [];\n");
      out.write("\t\tvar deleteArr = [];\n");
      out.write("\t\t\n");
      out.write("        if (endEditing()){ // endEditing : 수정이 끝났을 때 동작\n");
      out.write("        \tvar rows = $('#dg').datagrid('getChanges');\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t$.each(rows, function(index, item){\n");
      out.write("\t\t\t\tif(item.status == 'U'){\n");
      out.write("\t\t\t\t\tupdateArr.push(JSON.Stringify(item));\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t\telse if(item.status == 'P'){\n");
      out.write("\t\t\t\t\tappendArr.push(JSON.Stringify(item));\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t\telse {\n");
      out.write("\t\t\t\t\tdeleteArr.push(JSON.Stringify(item));\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t});\n");
      out.write("    \n");
      out.write("\t\t$('#dg').datagrid('acceptChanges');\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("\t\n");
      out.write("\t// 취소\n");
      out.write("\tfunction reject(){\n");
      out.write("        $('#dg').datagrid('rejectChanges');\n");
      out.write("        editIndex = undefined;\n");
      out.write("    }\n");
      out.write("\t\n");
      out.write("\t// 변경 결과\n");
      out.write("    function getChanges(){\n");
      out.write("        var rows = $('#dg').datagrid('getChanges');\n");
      out.write("        alert(rows.length+' rows are changed!');\n");
      out.write("    }\n");
      out.write("\t\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<!-- url: '../01_Students/Datas/getTimeList.jsp', -->\n");
      out.write("\t<table id=\"dg\" class=\"easyui-datagrid\" title=\"학생별 시간표 리스트\" style=\"width:100%;height:300px;\"\n");
      out.write("            data-options=\"\n");
      out.write("                iconCls: 'icon-edit',\n");
      out.write("                singleSelect: true,\n");
      out.write("                url: '../Students',\n");
      out.write("                method: 'get',\n");
      out.write("             \tonClickCell: onClickCell,\n");
      out.write("             \tonEndEdit : onEndEdit,\n");
      out.write("             \ttoolbar : '#tb'\n");
      out.write("            \">\n");
      out.write("\t\t<thead>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t    <th data-options=\"field:'stu_id',width:'20%',align:'center',\n");
      out.write("\t\t\t    \tformatter:function(value, row){\n");
      out.write("                            return row.stu_name;\n");
      out.write("                        },\n");
      out.write("                        editor:{\n");
      out.write("                            type:'combobox',\n");
      out.write("                            options:{\n");
      out.write("                                valueField:'stu_id',\n");
      out.write("                                textField:'stu_name',\n");
      out.write("                                method:'get',\n");
      out.write("                                url:'../01_Students/Datas/getStuCom.jsp',\n");
      out.write("                                required:true\n");
      out.write("                            }\n");
      out.write("                        }\n");
      out.write("\t\t\t    \">학생</th>\n");
      out.write("\t\t\t    <th data-options=\"field:'sub_id',width:'25%',align:'left',\n");
      out.write("\t\t\t    \tformatter:function(value, row){\n");
      out.write("                            return row.sub_name;\n");
      out.write("                        },\n");
      out.write("                        editor:{\n");
      out.write("                            type:'combobox',\n");
      out.write("                            options:{\n");
      out.write("                                valueField:'sub_id',\n");
      out.write("                                textField:'sub_name',\n");
      out.write("                                method:'get',\n");
      out.write("                                url:'../01_Students/Datas/getSubCom.jsp',\n");
      out.write("                                required:true\n");
      out.write("                            }\n");
      out.write("                        }\n");
      out.write("\t\t\t    \">과목</th>\n");
      out.write("\t\t\t    <th data-options=\"field:'do_year',width:'15%',align:'right', editor:'textbox'\">년도</th>\n");
      out.write("\t\t\t    <th data-options=\"field:'semester',width:'15%',align:'right', editor: {type:'numberbox',options:{precision:2}}\">학기</th>\n");
      out.write("\t\t\t    <th data-options=\"field:'reg_date',width:'15%',align:'center', editor:'textbox'\">신청날짜</th>\n");
      out.write("\t\t\t    \n");
      out.write("\t\t\t    <!-- 수정하기 위한 오리지널 값 -->\n");
      out.write("\t\t\t    <th data-options=\"field:'o_stu_id',hidden:'true',align:'center', editor:'textbox'\"></th>\n");
      out.write("\t\t\t    <th data-options=\"field:'o_sub_id',hidden:'true',align:'center', editor:'textbox'\"></th>\n");
      out.write("\t\t\t    <th data-options=\"field:'o_do_year',hidden:'true',align:'center', editor:'textbox'\"></th>\n");
      out.write("\t\t\t    <th data-options=\"field:'o_semester',hidden:'true',align:'center', editor:'textbox'\"></th>\n");
      out.write("\t\t\t    <th data-options=\"field:'status',width:'5%',align:'center', editor:'textbox'\"></th>\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t</thead>\n");
      out.write("    </table>\n");
      out.write("    \n");
      out.write("    <div id=\"tb\" style=\"height:auto\">\n");
      out.write("        <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-add',plain:true\" onclick=\"append()\">Append</a>\n");
      out.write("        <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-remove',plain:true\" onclick=\"removeit()\">Remove</a>\n");
      out.write("        <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-save',plain:true\" onclick=\"acceptit()\">SAVE</a>\n");
      out.write("        <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-undo',plain:true\" onclick=\"reject()\">Reject</a>\n");
      out.write("        <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-search',plain:true\" onclick=\"getChanges()\">GetChanges</a>\n");
      out.write("    </div>\n");
      out.write("    \n");
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
