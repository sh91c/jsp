/*
 * 2020-06-30
 * 작성자 : 홍길동
 */
// 0. AJAX common function
	var setAjax = function(strURL, strType, strDataType, strData){
		var studentList = null;
		$.ajax({
			url      : strURL,
			type     : strType,
			datatype : strDataType,
			data     : strData,
			async    : false,
			success  : function(datas){
				studentList = datas;
			},
			error    : function(){
				alert('getList() error!');
			}
		});
		return studentList;
	}

// 1-1. 학생 조회 함수(일반)
	var getList = function(strURL, strType, strDataType,strData){
		studentList = setAjax(strURL, strType, strDataType,strData);

		var strHTML = '';
		$.each( studentList, function(index, item){
			strHTML  +='<div id="rows">'
				     + 	 '<div id="tSid" class="sTd">'
				     + 	 	item.sid
				     + 	 '</div>'
				     + 	 '<div id="tSname" class="sTd">'
				     +	 	item.sname
				     + 	 '</div>'
				     + 	 '<div id="tAge" class="sTd">'
				     +   	item.sage
				     + 	 '</div>'
		 	         + '</div>'
		});
		return strHTML;
	}
	// 1-2. 학생 조회 함수 (배열)
	var getList_arr = function(arrParams){
		var studentList = setAjax(arrParams[0], arrParams[1], arrParams[2],arrParams[3]);
		
		var strHTML = '';
		$.each( studentList, function(index, item){
			strHTML += '<div id="rows">'
				     + 	 '<div id="tSid" class="sTd">'
				     + 	 	item.sid
				     + 	 '</div>'
				     + 	 '<div id="tSname" class="sTd">'
				     +	 	item.sname
				     + 	 '</div>'
				     + 	 '<div id="tAge" class="sTd">'
				     +   	item.age
				     + 	 '</div>'
		 	         + '</div>'
		});
		return strHTML;
	}
	
	// 1-3. 학생 조회 함수 (객체)
	var getList_obj = function(objParams){
		var studentList = setAjax(objParams.strURL, objParams.strType, objParams.strDataType, objParams.strData);
		
		var strHTML = '';
		$.each( studentList, function(index, item){
			strHTML += '<div id="rows">'
				     + 	 '<div id="tSid" class="sTd">'
				     + 	 	item.sid
				     + 	 '</div>'
				     + 	 '<div id="tSname" class="sTd">'
				     +	 	item.sname
				     + 	 '</div>'
				     + 	 '<div id="tAge" class="sTd">'
				     +   	item.age
				     + 	 '</div>'
		 	         + '</div>'
		});
		return strHTML;
	}