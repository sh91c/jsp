<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    <script>
       $(document).ready (
          function() {
             $("#btnSearch").click (
                function() {
                   $("#dg").datagrid({
                      url : "./datas/getSelStudent.jsp?stu_id=" +$("#stu_id").val()
                      , singleSelect:true
                      , rowStyler:function(index, row) {
                                if(row.stu_name.indexOf('홍') != -1) {
                                   return 'background-color:pink;'
                                }
                             }
                      , checkOnSelect:false
                      , selectOnCheck:false
                   });
                }      
             );
          }      
       );
       
       var editIndex = undefined;
       
       function endEditing(){
            if (editIndex == undefined){return true}
            if ($('#dg').datagrid('validateRow', editIndex)){
                $('#dg').datagrid('endEdit', editIndex);
                editIndex = undefined;
                return true;
            } else {
                return false;
            }
        }
       
       function endEdit(index, row){
            /*
          var ed = $(this).datagrid('getEditor', {
                index: index,
                field: 'productid'
            });
            row.productname = $(ed.target).combobox('getText');
            */
        }
        
       function clickCell(index, field){
            if(editIndex != index) {
                if(endEditing()) {
                    $('#dg').datagrid('selectRow', index)
                            .datagrid('beginEdit', index);
                    var ed = $('#dg').datagrid('getEditor', {index:index,field:field});
                    if (ed){
                        ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                    }
                    editIndex = index;
                } else {
                    setTimeout(function(){
                        $('#dg').datagrid('selectRow', editIndex);
                    },0);
                }
            }
        }
       
       function append(){
            if (endEditing()){
                $('#dg').datagrid('appendRow',{status:'P'});
                editIndex = $('#dg').datagrid('get Rows').length-1;
                $('#dg').datagrid('selectRow', editIndex)
                        .datagrid('beginEdit', editIndex);
            }
        }
       
        function removeit(){
            if (editIndex == undefined){return}
            $('#dg').datagrid('cancelEdit', editIndex)
                    .datagrid('deleteRow', editIndex);
            editIndex = undefined;
        }
        
        function acceptit(){
            if (endEditing()){
                $('#dg').datagrid('acceptChanges');
            }
        }
        
        function reject(){
            $('#dg').datagrid('rejectChanges');
            editIndex = undefined;
        }
        
        function getChanges(){
            var rows = $('#dg').datagrid('getChanges');
            alert(rows.length+' rows are changed!');
        }
    </script>
</head>
<body>
   <h2>Basic DataGrid</h2>
    <p> DB 프로시져가 중요하다 </p>
    <div style="margin:20px 0;"></div>
    <div>
       <input class="easyui-tetxtbox" name="stu_id" id="stu_id"/>
       <input type="button" id="btnSearch" value="검색"/>
    </div>
    <div style="margin:20px 0;"></div>
    <table class="easyui-datagrid" id="dg" title="Basic DataGrid" style="width:900px;height:500px"
           data-options="singleSelect:false,
                         collapsible:true,
                         url:'./Datas/getStudents.jsp',
                         method:'get',
                         rownumbers:true,
                         rowStyler:function(index, row) {
                            if(row.stu_name.indexOf('홍') == -1) {
                               return 'background-color:lavender;'
                            }
                         },
                         checkOnSelect:true,
                         selectOnCheck:true,
                         toolbar:'#tb',
                         onClickCell:clickCell,
                         onEndEdit:endEdit">
        <thead>
            <tr>
               <th data-options="field:'ck',checkbox:true"></th>
                <!-- <th data-options="field:'stu_id',width:100,align:'center'">아이디</th> -->
                <th data-options="field:'stu_id',width:100,align:'center'
                ,formatter : function(value, row){
               		return row.stu_name;
                }
                ,editor:{
               		type: 'combobox',
               		options:{
               			valueField : 'stu_id',
               			textField : 'stu_name',
               			method : 'get',
               			url : './Datas/getStudents.jsp',
               			required : true
                	}
                }
                ">이름</th>
                <th data-options="field:'stu_tel',width:150,align:'center',editor:'textbox'">연락처</th>
                <th data-options="field:'stu_addr',width:200,align:'center'
                ,formatter : function(value, row){
               		return row.stu_addr;
               	}
               	,editor:{
               		type: 'combobox',
               		options:{
               			valueField : 'stu_addr',
               			textField : 'stu_addr',
               			method : 'get',
               			url : './Datas/getStudents.jsp',
               			required : true
               		}
               	}
               	">주소</th>
                <th data-options="field:'stu_dept',width:200,align:'center'
                ,formatter : function(value, row){
               		return row.stu_dept;
               	}
               	,editor:{
               		type: 'combobox',
               		options:{
               			valueField : 'stu_dept',
               			textField : 'stu_dept',
               			method : 'get',
               			url : './Datas/getStudents.jsp',
               			required : true
               		}
               	}
               	">학과</th>
            </tr>
        </thead>
    </table>
    <!--
    <div style="margin:20px 0;"></div>
    <table class="easyui-datagrid" title="Basic DataGrid" style="width:850px;height:500px"
           data-options="singleSelect:false,
                         collapsible:true,
                         url:'./datas/getStudents.jsp',
                         method:'get',
                         rownumbers:true">
        <thead>
            <tr>
               <th data-options="field:'ck',checkbox:true"></th>
                <th data-options="field:'stu_id',width:100,align:'center'">아이디</th>
                <th data-options="field:'stu_name',width:100,align:'center',editor:'textbox'">이름</th>
                <th data-options="field:'stu_tel',width:150,align:'center',editor:'textbox'">연락처</th>
                <th data-options="field:'stu_addr',width:250,align:'center'">주소</th>
                <th data-options="field:'stu_dept',width:200,align:'center'">학과</th>
            </tr>
        </thead>
    </table>
    -->
    <div id="tb" style="height:auto">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">Append</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">Remove</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="acceptit()">Accept</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject()">Reject</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="getChanges()">GetChanges</a>
    </div>
</body>
</html>