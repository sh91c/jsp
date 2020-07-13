<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../css/easyui.css">
    <link rel="stylesheet" type="text/css" href="../css/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/demo.css">
    <script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/students.js?v<%=System.currentTimeMillis() %>"></script>
</head>
<body>
	<h2>CheckBox Selection on DataGrid</h2>
    <p>Click the checkbox on header to select or unselect all selections.</p>
    <div style="margin:20px 0;"></div>
    
    <table id="dg" class="easyui-datagrid" title="학생 정보" style="width:800px;height:400px"
            data-options="singleSelect:true
                          ,url:'../01_Students/Datas/getStudents.jsp'
                          ,collapsible:true
                          ,method:'get'
                          ">
        <thead>
            <tr>
            	<th data-options="field:'ck',checkbox:true"></th>
                <th data-options="field:'stu_id',width:80,align:'center'">ID</th>
                <th data-options="field:'stu_name',width:80,align:'center'">이름</th>
                <th data-options="field:'stu_tel',width:120,align:'center'">연락처</th>
                <th data-options="field:'stu_addr',width:250,align:'center'">주소</th>
                <th data-options="field:'stu_dept',width:250,align:'center'">단과대학 / 학과</th>
            </tr>
        </thead>
    </table>
    <div style="margin:10px 0;">
        <span>Selection Mode: </span>
        <select onchange="$('#dg').datagrid({singleSelect:(this.value==0)})">
            <option value="0">Single Row</option>
            <option value="1">Multiple Rows</option>
        </select><br/>
        SelectOnCheck: <input type="checkbox" checked onchange="$('#dg').datagrid({selectOnCheck:$(this).is(':checked')})"><br/>
        CheckOnSelect: <input type="checkbox" checked onchange="$('#dg').datagrid({checkOnSelect:$(this).is(':checked')})">
    </div>
</body>
</html>