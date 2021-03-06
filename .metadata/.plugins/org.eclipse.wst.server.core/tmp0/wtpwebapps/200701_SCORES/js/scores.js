/**
 *  2020-07-06 scores
 */

var getCollege = function(vID){
	$.ajax({
		url      : './Datas/college_list.jsp',
		type     : 'GET',
		//data     : '',
		datatype : 'JSON',
		success  : function(datas){
			var strHTML = '<option value="">선택하세요</option>';
			$.each( datas, function(index, item){
				strHTML += '<option value="'+ item.com_id +'">'+ item.com_val +'</option>';
			});
			$('#'+vID).html(strHTML);
		},
		error    : function(){
			alert('getCollege() err!');
		}
	});
}

var getDept = function(selectedValue, vID){
	//alert(selectedValue + '--' + vID);
	$.ajax({
		url      : './Datas/dept_list.jsp',
		type     : 'GET',
		data     : 'selectedValue='+selectedValue,
		datatype : 'JSON',
		success  : function(datas){
			var strHTML = '<option value="">선택하세요</option>';
			$.each( datas, function(index, item){
				strHTML += '<option value="'+ item.com_id +'">'+ item.com_val +'</option>';
			});
			$('#'+vID).html(strHTML);
		},
		error    : function(){
			alert('getDept() err!');
		}
	});
}

var getStudents = function(selectedValue, vID){
	$.ajax({
		url		 : './Datas/getStudents.jsp',
		type     : 'GET',
		data     : 'selectedDept='+selectedValue,
		datatype : 'JSON',
		success  : function(datas){
			var strHTML = '<option value="">선택하세요</option>';
			$.each( datas, function(index, item){
				strHTML += '<option value="'+ item.stu_id +'">'+ item.stu_name +'</option>';
			});
			$('#'+vID).html(strHTML);
		},
		error    : function(){
			alert('getStudent() err!');
		}
	});
}

var getYear = function(vID){
	$.ajax({
		url      : './Datas/getYears.jsp',
		type     : 'GET',
		//data     : '',
		datatype : 'JSON',
		success  : function(datas){
			var strHTML = '<option value="">선택하세요</option>';
			$.each( datas, function(index, item){
				strHTML += '<option value="'+ item.syear +'">'+ item.syear +'</option>';
			});
			$('#'+vID).html(strHTML);
			
			$('#'+vID).val(datas[0].tyear);
		},
		error    : function(){
			alert('getYear() err!');
		}
	});
}

var getSubjects = function(stu_id, syear, semester, vID){
	$.ajax({
		url      : './Datas/getSubjects.jsp',
		type     : 'GET',
		data     : 'stu_id='+stu_id + '&syear='+syear + '&semester='+semester,
		datatype : 'JSON',
		success  : function(datas){
			var strHTML = '<option value="">선택하세요</option>';
			$.each( datas, function(index, item){
				strHTML += '<option value="'+ item.sub_id +'">'+ item.sub_name +'</option>';
			});
			$('#'+vID).html(strHTML);
		},
		error    : function(){
			alert('getSubjects() err!');
		}
	});
}