<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <style>
      body {
         margin:0px; padding:0px;
      }
      #wrap {
         width:100%; height:400px;
         clear:both;
      }
      .grpcommon {
         width:40%; height:400px;
         padding:10px;
         background-color: lightgray;
         float:left;
      }
      .common {
         width:60%; height:400px;
         padding:10px;
         background-color: lightgray;
         float:left;
      }
   </style>
   <link rel="stylesheet" type="text/css" href="../css/easyui.css">
   <link rel="stylesheet" type="text/css" href="../css/icon.css">
   <link rel="stylesheet" type="text/css" href="css">
   <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
   <script type="text/javascript" src="../js/jquery.min.js"></script>
   <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
   <script>
      $(document).ready (
         function() {
            
         }      
      );
      
      var editIndex = undefined;
      function endEditing(){
            if (editIndex == undefined){
               return true;
            }
            
            if ($('#dg').datagrid('validateRow', editIndex)){
                $('#dg').datagrid('endEdit', editIndex);
                editIndex = undefined;
                return true; // 수정 완료 -> 커서가 수정하는 로우에서 빠져나옴
            }
            else {
                return false;
            }
        } // 수정을 끝냈는지 확인하는 함수
      
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
                }
                else {
                    setTimeout(function(){
                        $('#dg').datagrid('selectRow', editIndex);
                    },0);
                }
            }
        }
      
        function onEndEdit(index, row){
        	if(row.status != 'P'){
        		row.status = 'U';
        	}
        	if(row.status == 'P'){
        		row.grp_id = '';
        	}
        }
        
        function append(){
            if (endEditing()){
                $('#dg').datagrid('appendRow',{status:'P'});
                editIndex = $('#dg').datagrid('getRows').length-1;
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
        
        function saveit(){
            if (endEditing()){
            	var appendJsons = [];
            	var updateJsons = [];
            	var deleteJsons = [];
            	
            	var rows = $('#dg').datagrid('getChanges');
            	
            	for (var i = 0; i < rows.length; i++) {
					// 1. append
					if(rows[i].status == 'P'){
						// 추가된 데이터 ROW들의 JSON 배열
						appendJsons.push(rows[i]);
					}
					// 2. update
					else if(rows[i].status == 'U'){
						updateJsons.push(rows[i]);
					}
					// 3. delete
					else{
						deleteJsons.push(rows[i]);
					}
				}
            	
                $('#dg').datagrid('acceptChanges');
				
                appendJsons = JSON.stringify(appendJsons);
                updateJsons = JSON.stringify(updateJsons);
                deleteJsons = JSON.stringify(deleteJsons);
                grpSaveAjax(appendJsons, updateJsons, deleteJsons);
                
                
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
        
        function grpSaveAjax(appendJsons, updateJsons, deleteJsons){
        	$.ajax({
        		url      : './Datas/saveGrpCom.jsp',
        		type     : 'POST',
        		data     : 'append=' + appendJsons + '&update=' + updateJsons + '&delete=' + deleteJsons,
        		datatype : 'JSON',
        		success  : function(datas){
        			$('#dg').datagrid();
        		},
        		error    : function(){
        			alert('grpSaveAjax() err!')
        		}
        	});	
        }
        
        function onSelect(index, row){
        	var selectedGrpId = row.grp_id;
        	
        	$('#dg2').datagrid({
       			url:'./Datas/getCommons.jsp?grp_id=' + selectedGrpId,
                method:'get'
        	});
        }
        
        /////////////////////////////////////////////////////
        /////////////////////////////////////////////////////
        /////////////////////////////////////////////////////
        
        var editIndex2 = undefined;
     	function endEditing2(){
            if (editIndex2 == undefined){
               return true;
            }
            
            if ($('#dg2').datagrid('validateRow', editIndex2)){
                $('#dg2').datagrid('endEdit', editIndex2);
                editIndex2 = undefined;
                return true; // 수정 완료 -> 커서가 수정하는 로우에서 빠져나옴
            }
            else {
                return false;
            }
        }
        
        function onClickCell2(index, field){
            if (editIndex2 != index){
                if (endEditing2()){
                    $('#dg2').datagrid('selectRow', index)
                             .datagrid('beginEdit', index);
                    var ed = $('#dg2').datagrid('getEditor', {index:index,field:field});
                    if (ed){
                        ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                    }
                    editIndex2 = index;
                }
                else {
                    setTimeout(function(){
                        $('#dg2').datagrid('selectRow', editIndex2);
                    },0);
                }
            }
        }
        
        var selectedRow = {};
        function onSelect2(index, row){
        	selectedRow.index = index;
        	selectedRow.com_lvl = Number(row.com_lvl);
        	selectedRow.grp_id = row.grp_id;
        	selectedRow.com_id = row.com_id;
        }
        
        function append2(){
            if (endEditing2()){
                //$('#dg2').datagrid('appendRow',{status:'P'});
                editIndex2 = selectedRow.index;
                
                $('#dg2').datagrid('insertRow', {
                	index : editIndex2 + 1,
                	row   : {
                		grp_id  : selectedRow.grp_id,
                		com_id  : '',
                		com_val : '',
                		com_lvl : selectedRow.com_lvl + 1,
                		parent_id : selectedRow.com_id,
                		status  : 'P'
                	}
                });
                /*
                editIndex2 = $('#dg2').datagrid('getRows').length-1;
                $('#dg2').datagrid('selectRow', editIndex2)
                         .datagrid('beginEdit', editIndex2);
                */
                $('#dg2').datagrid('selectRow', editIndex2 + 1)
                		 .datagrid('beginEdit', editIndex2 + 1);
            }
        }
        
        function removeit2(){
            if (editIndex2 == undefined){return}
            $('#dg2').datagrid('cancelEdit', editIndex2)
                    .datagrid('deleteRow', editIndex2);
            editIndex2 = undefined;
        }
        
        
        function reject2(){
            $('#dg2').datagrid('rejectChanges');
            editIndex2 = undefined;
        }
        
        function onEndEdit2(index, row){
        	if(row.status != 'P'){
        		row.status = 'U';
        		row.parent_id = '';
        	}
        	if(row.status == 'P'){
        		row.com_id = 'DB생성';
        	}
        }
        
        function saveit2(){
        	var appendRows = [];
        	var updateRows = [];
        	var deleteRows = [];
        	var jsonDatas  = {};
        	
            if (endEditing2()){
            	var rows = $('#dg2').datagrid('getChanges');
            	$.each( rows, function(index, item){
            		if(item.status == 'P'){
            			appendRows.push(item);
            		}
            		else if(item.status == 'U'){
            			updateRows.push(item);
            		}
            		else{
            			deleteRows.push(item);
            		}
            	});
            	
            	jsonDatas.appended = appendRows;
            	jsonDatas.updated  = updateRows;
            	jsonDatas.deleted  = deleteRows;  // -> jsonDatas = { appended : [], updated : [], deleted: [] };
            	
            	$('#dg2').datagrid('acceptChanges');
            	var strJSON = JSON.stringify(jsonDatas);
            	grpSaveAjax2(strJSON);
            }
        }
        
        function grpSaveAjax2(jsonDatas){
        	$.ajax({
        		url      : './Datas/saveCommon.jsp',
        		type     : 'POST',
        		data     : 'jsonDatas=' + jsonDatas,
        		datatype : 'JSON',
        		success  : function(datas){
        			$('#dg2').datagrid();
        		},
        		error    : function(){
        			alert('grpSaveAjax2() err!');
        		}
        	});	
        }
        
        
   </script>
</head>
<body>
   <div id="wrap">
      <div id="grpcommon" class="grpcommon">
         <table id="dg" class="easyui-datagrid" title="공통코드 관리" style="width:'100%';height:100%"
                  data-options="singleSelect:true,
	                            collapsible:true,
	                            url:'./Datas/getGrpCode.jsp',
	                            method:'get',
	                            onClickCell: onClickCell,
	                            onEndEdit: onEndEdit,
	                            onSelect : onSelect,
	                            toolbar:'#toolbar01'
	                            ">
              <thead>
                  <tr>
                      <th data-options="field:'grp_id',width:'40%',align:'center'">GRP 코드</th>
                      <th data-options="field:'grp_name',width:'50%',align:'center',editor:'textbox'">GRP 이름</th>
                      <th data-options="field:'status',width:'10%'"></th>
                  </tr>
              </thead>
          </table>
      </div>
      
      <div id="common" class="common">
      	<table id="dg2" class="easyui-datagrid" title="공통코드" style="width:'100%';height:100%"
                  data-options="singleSelect:true,
                                collapsible:true,
                                onClickCell: onClickCell2,
                                onEndEdit: onEndEdit2,
                                onSelect : onSelect2,
                                toolbar : '#toolbar02'
                               ">
              <thead>
                  <tr>
                      <th data-options="field:'grp_id',width:'15%',align:'center'">GRP 코드</th>
                      <th data-options="field:'com_id',width:'15%',align:'center'">COM 코드</th>
                      <th data-options="field:'com_val',width:'15%',align:'center',editor:'textbox'">COM 이름</th>
                      <th data-options="field:'com_lvl',width:'10%',align:'center',editor:'textbox'">단계</th>
                      <th data-options="field:'parent_id',width:'15%'"></th>
                      <th data-options="field:'status',width:'10%'"></th>
                  </tr>
              </thead>
          </table>
      </div>
   </div>
   <div id="toolbar01" style="height:auto">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">추가</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">삭제</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="saveit()">저장</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject()">취소</a>
    </div>
   <div id="toolbar02" style="height:auto">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append2()">추가</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit2()">삭제</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="saveit2()">저장</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject2()">취소</a>
    </div>
</body>
</html>