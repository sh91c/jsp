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
<script>
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
    
	function onClickCell(index, field){
	    if (editIndex != index){
	        if (endEditing()){
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
	
	
	function onEndEdit(index, row){
		
	    var ed = $(this).datagrid('getEditor', {
	        index: index,
	        field: 'stu_id'
	    });
	    row.stu_name = $(ed.target).combobox('getText');
	
	    var ed2 = $(this).datagrid('getEditor', {
	        index: index,
	        field: 'sub_id'
	    });
	    row.sub_name = $(ed2.target).combobox('getText');
	    
	    if(row.status != 'P'){
	    	row.status = 'U';
	    }
	}
	
	// 추가
	function append(){
        if (endEditing()){
            $('#dg').datagrid('appendRow',{status:'P'});
            editIndex = $('#dg').datagrid('getRows').length-1;
            $('#dg').datagrid('selectRow', editIndex)
                    .datagrid('beginEdit', editIndex);
        }
    }
	
	// 삭제
	function removeit(){
        if (editIndex == undefined){return}
        $('#dg').datagrid('cancelEdit', editIndex)
                .datagrid('deleteRow', editIndex);
        editIndex = undefined;
    }
	
	// 저장
	function acceptit(){ // DB와는 상관없음
		
		var updateArr = [];
		var appendArr = [];
		var deleteArr = [];
		
        if (endEditing()){ // endEditing : 수정이 끝났을 때 동작
        	var rows = $('#dg').datagrid('getChanges');
			
			$.each(rows, function(index, item){
				if(item.status == 'U'){
					updateArr.push(JSON.Stringify(item));
				}
				else if(item.status == 'P'){
					appendArr.push(JSON.Stringify(item));
				}
				else {
					deleteArr.push(JSON.Stringify(item));
				}
			});
    
		$('#dg').datagrid('acceptChanges');
        }
    }
	
	// 취소
	function reject(){
        $('#dg').datagrid('rejectChanges');
        editIndex = undefined;
    }
	
	// 변경 결과
    function getChanges(){
        var rows = $('#dg').datagrid('getChanges');
        alert(rows.length+' rows are changed!');
    }
	
</script>
</head>
<body>
<!-- url: '../01_Students/Datas/getTimeList.jsp', -->
	<table id="dg" class="easyui-datagrid" title="학생별 시간표 리스트" style="width:100%;height:300px;"
            data-options="
                iconCls: 'icon-edit',
                singleSelect: true,
                url: '../Students',
                method: 'get',
             	onClickCell: onClickCell,
             	onEndEdit : onEndEdit,
             	toolbar : '#tb'
            ">
		<thead>
			<tr>
			    <th data-options="field:'stu_id',width:'20%',align:'center',
			    	formatter:function(value, row){
                            return row.stu_name;
                        },
                        editor:{
                            type:'combobox',
                            options:{
                                valueField:'stu_id',
                                textField:'stu_name',
                                method:'get',
                                url:'../01_Students/Datas/getStuCom.jsp',
                                required:true
                            }
                        }
			    ">학생</th>
			    <th data-options="field:'sub_id',width:'25%',align:'left',
			    	formatter:function(value, row){
                            return row.sub_name;
                        },
                        editor:{
                            type:'combobox',
                            options:{
                                valueField:'sub_id',
                                textField:'sub_name',
                                method:'get',
                                url:'../01_Students/Datas/getSubCom.jsp',
                                required:true
                            }
                        }
			    ">과목</th>
			    <th data-options="field:'do_year',width:'15%',align:'right', editor:'textbox'">년도</th>
			    <th data-options="field:'semester',width:'15%',align:'right', editor: {type:'numberbox',options:{precision:2}}">학기</th>
			    <th data-options="field:'reg_date',width:'15%',align:'center', editor:'textbox'">신청날짜</th>
			    
			    <!-- 수정하기 위한 오리지널 값 -->
			    <th data-options="field:'o_stu_id',hidden:'true',align:'center', editor:'textbox'"></th>
			    <th data-options="field:'o_sub_id',hidden:'true',align:'center', editor:'textbox'"></th>
			    <th data-options="field:'o_do_year',hidden:'true',align:'center', editor:'textbox'"></th>
			    <th data-options="field:'o_semester',hidden:'true',align:'center', editor:'textbox'"></th>
			    <th data-options="field:'status',width:'5%',align:'center', editor:'textbox'"></th>
			</tr>
		</thead>
    </table>
    
    <div id="tb" style="height:auto">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">Append</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">Remove</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="acceptit()">SAVE</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject()">Reject</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="getChanges()">GetChanges</a>
    </div>
    
</body>
</html>