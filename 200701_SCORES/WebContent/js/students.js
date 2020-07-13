var getAddr = function(selectedVal, lvl, objID){
	var strHTML = '';
	$.ajax({
		url      : './Datas/getAddr.jsp',
		type     : 'GET',
		data     : 'addr='+selectedVal + '&lvl='+lvl,
		datatype : 'JSON',
		success  : function(datas){
			strHTML += '<select id="addr'+ lvl +'" name="addr'+ lvl +'">';
			strHTML += '<option value="-">선택하세요</option>';
			$.each(datas, function(index, item){
				strHTML += '<option value="'+ item.val +'">'+ item.txt +'</option>';
			});
			strHTML += '</select>';
			
			$('#'+objID).html(strHTML);
			//$('#'+objID).addClass('class="easyui-combobox');			
		},
		error    : function(){
			alert('getAddr() err!');
		}
	});
}

// 학생 학과 가져오는 함수
var getDept = function(selectedVal, lvl, objID){
	var strHTML = '';
	$.ajax({
		url      : './Datas/getDept.jsp',
		type     : 'GET',
		data     : 'dept='+selectedVal + '&lvl='+lvl,
		datatype : 'JSON',
		success  : function(datas){
			strHTML += '<select id="dept'+ lvl +'" name="dept'+ lvl +'">';
			strHTML += '<option value="-">선택하세요</option>';
			$.each(datas, function(index, item){
				strHTML += '<option value="'+ item.val +'">'+ item.txt +'</option>';
			});
			strHTML += '</select>';
			
			$('#'+objID).html(strHTML);
		},
		error    : function(){
			alert('getAddr() err!');
		}
	});
}

var getDept2 = function(selectedVal, lvl, objID, sVal){
	var strHTML = '';
	$.ajax({
		url      : './Datas/getDept.jsp',
		type     : 'GET',
		data     : 'dept='+selectedVal + '&lvl='+lvl,
		datatype : 'JSON',
		success  : function(datas){
			strHTML += '<select id="dept'+ lvl +'" name="dept'+ lvl +'">';
			strHTML += '<option value="-">선택하세요</option>';
			$.each(datas, function(index, item){
				strHTML += '<option value="'+ item.val +'">'+ item.txt +'</option>';
			});
			strHTML += '</select>';
			
			$('#'+objID).html(strHTML);
			$('#dept'+lvl.toString()).val(sVal);
		},
		error    : function(){
			alert('getAddr() err!');
		}
	});
}

// SELECT
var getStudentsList = function(selSearch, txtSearch, objID){
	var strHTML = '';
	$.ajax({
		url      : './Datas/getStudents.jsp',
		type     : 'POST',
		data     : 'selSearch='+selSearch + '&txtSearch='+txtSearch,
		datatype : 'JSON',
		success  : function(data){
			$.each( data, function(index, item){
				var str = item.comid1 + '-' + item.comid2 + '-' + item.comid3 + '-' + item.comid4;
				strHTML += '<div class="list">';
				strHTML += '<div><input type="checkbox" id="chk" name="chk" class="cchk" value="'+ item.stu_id +'"/></div>';
				strHTML += '<div class="cid">'+ item.stu_id +'</div>';
				//strHTML += '<div class="cname">'+ item.stu_name +'</div>';
				strHTML += '<div class="cname"><input type="text" id="sName" value="'+ item.stu_name +'" /></div>';
				strHTML += '<div class="ctel">'+ item.stu_tel +'</div>';
				strHTML += '<div class="caddr" ondblclick="pop(\''+ str + '\')">'+ item.stu_addr +'</div>';
				strHTML += '<div class="cdept">'+ item.stu_dept +'</div>';
				strHTML += '</div>';
			});
			
			$('#'+objID).html(strHTML);
		},
		error    : function(){
			alert('getStudentsList() err!');
		}
	});
}

// checkbox 전체 체크 및 해제
var checkedFunc = function(b){
	$('.cchk').prop("checked", b);
};

var pop = function(comIDs){
	//var arrComID = comIDs.split("-");
	//alert(arrComID);
	window.open('../01_Students/students_addr_update.jsp?params="'+ comIDs +'"'
			    ,'updateWin'
			    ,'width=800,height=100,top=200,left=600');
}

var delStudents = function(){
	var checkedObj = $('input[type="checkbox"]:checked');
	
	var stuIDArr = [];
	for (var i = 0; i < checkedObj.length; i++) {
		var obj = {};
		obj.stu_id = checkedObj[i].value;
		stuIDArr[i] = obj;
	}
	
	var sendData = JSON.stringify(stuIDArr);
	
	//alert(sendData);
	
	$.ajax({
		url      : './Datas/delStudents.jsp',
		type     : 'POST',
		data     : 'jsondata='+sendData,
		datatype : 'JSON',
		success  : function(){
			location.reload();
		},
		error    : function(){
			alert('delStudents() err!');
		}
	});
}

var modStudent = function(chkVal){
	location.href = "modStudent.jsp?chkVal=" + chkVal;
}

var getSelStudent = function(stu_id){
	var returnData = null;
	
	$.ajax({
		url      : 'Datas/getSelStudent.jsp',
		type     : 'get',
		data     : 'stu_id='+stu_id,
		datatype : 'JSON',
		async    : false,
		success  : function(datas){
			returnData = datas[0];
		},
		error    : function(){
			alert('getSelStudent() err!');
		}
	});
	return returnData;
}

var getAddr2 = function(selectedVal, lvl, objID, sVal){
	var strHTML = '';
	$.ajax({
		url      : './Datas/getAddr.jsp',
		type     : 'GET',
		data     : 'addr='+selectedVal + '&lvl='+lvl,
		datatype : 'JSON',
		success  : function(datas){
			strHTML += '<select id="addr'+ lvl +'" name="addr'+ lvl +'">';
			strHTML += '<option value="-">선택하세요</option>';
			$.each(datas, function(index, item){
				strHTML += '<option value="'+ item.val +'">'+ item.txt +'</option>';
			});
			strHTML += '</select>';
			
			$('#'+objID).html(strHTML);
			$('#addr'+lvl.toString()).val(sVal);
		},
		error    : function(){
			alert('getAddr() err!');
		}
	});
}

//
//var getSido = function(){
//	var strHTML = '';
//	$.ajax({
//		url : './Datas/getSido.jsp',
//		type: 'POST',
//		//data: '',
//		datatype : 'JSON',
//		success  : function(datas){
//			$.each( datas, function(index, item){
//				strHTML += '<option value="'+ item.com_id +'">'+ item.com_val +'</option>';
//			});
//			
//			$('#sido').html(strHTML);
//		},
//		error    : function(){
//			alert('getSido() err!');
//		}
//	});
//}
//
//var getGugun = function(){
//	var strHTML = '';
//	$.ajax({
//		url : './Datas/getGugun.jsp',
//		type: 'POST',
//		data: 'in_Sido=' + $('#sido').val(),
//		datatype : 'JSON',
//		success  : function(datas){
//			strHTML += '<select id="sGugun">';
//			$.each( datas, function(index, item){
//				strHTML += '<option value="'+ item.com_id +'">'+ item.com_val +'</option>';
//			});
//			strHTML += '</select>';
//			$('#gugun').html(strHTML);
//		},
//		error    : function(){
//			alert('getGugun() err!');
//		}
//	});
//}


/*
var getDong = function(){
	var strHTML = '';
	$.ajax({
		url : './Datas/getDong.jsp',
		type: 'POST',
		data: 'in_Gugun=' + $('#sGugun').val(),
		datatype : 'JSON',
		success  : function(datas){
			strHTML += '<select id="sDong">';
			$.each( datas, function(index, item){
				strHTML += '<option value="'+ item.com_id +'">'+ item.com_val +'</option>';
			});
			strHTML += '</select>';
			$('#dong').html(strHTML);
		},
		error    : function(){
			alert('getDong() err!');
		}
	});
}

var getDong2 = function(){
	var strHTML = '';
	$.ajax({
		url : './Datas/getDong2.jsp',
		type: 'POST',
		data: 'in_Dong=' + $('#sDong').val(),
		datatype : 'JSON',
		success  : function(datas){
			strHTML += '<select id="sDong2">';
			$.each( datas, function(index, item){
				strHTML += '<option value="'+ item.com_id +'">'+ item.com_val +'</option>';
			});
			strHTML += '</select>';
			$('#dong2').html(strHTML);
		},
		error    : function(){
			alert('getDong() err!');
		}
	});
}
*/