<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Basic TextBox - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="../css/easyui.css">
    <link rel="stylesheet" type="text/css" href="../css/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/demo.css">
    <script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/students.js?v<%=System.currentTimeMillis() %>"></script>
    <script>
	$( function(){
		/* 학생 주소 출력 함수 */ 
		getAddr('', 1, 'sido');
		
		$('#sido').change( function(){
			$('#gugun').html('');
			$('#dong').html('');
			$('#dong2').html('');
			getAddr($('#addr1').val(), 2, 'gugun');
		});
		
		$('#gugun').change( function(){
			$('#dong').html('');
			$('#dong2').html('');
			getAddr($('#addr2').val(), 3, 'dong');
		});
		
		$('#dong').change( function(){
			$('#dong2').html('');
			getAddr($('#addr3').val(), 4, 'dong2');
		});
		
		/* 학생 학과 출력 함수 */
		getDept('', 1, 'college');
		
		$('#college').change( function(){
			$('#dept').html('');
			getDept($('#dept1').val(), 2, 'dept');
		});
	});
</script>
</head>
<body>
    <h2>Basic TextBox</h2>
    <p>The textbox allows a user to enter information.</p>
    <div style="margin:20px 0;"></div>
    <div class="easyui-panel" title="Register" style="width:100%;max-width:400px;padding:30px 60px;">
        <div style="margin-bottom:20px">
            <input name="stu_name" class="easyui-textbox" label="학생 이름" labelPosition="top" data-options="prompt:'학생 이름을 입력하세요.',validType:'email'" style="width:100%;">
        </div>
        <!-- 
        <div style="margin-bottom:20px">
            <select class="easyui-combobox" name="state" label="State:" labelPosition="top" style="width:100%;">
            </select>
 	        <div>
 	         -->
	    <div id="gg" style="margin-bottom:20px">
			<span id="sido"></span>
			<span id="gugun"></span>
			<span id="dong"></span>
			<span id="dong2"></span>
		</div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" label="Last Name:" labelPosition="top" style="width:100%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" label="학생 연락처" labelPosition="top" style="width:100%;">
        </div>
        
        <div>
            <a href="#" class="easyui-linkbutton" iconCls="icon-ok" style="width:100%;height:32px">Register</a>
        </div>
    </div>
</body>
</html>