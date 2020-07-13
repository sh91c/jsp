
var getList_obj = function(objParams){
	
	// 1. ajax 연결해서 데이터 가져오기
	$.ajax({
		url 	 : objParams.strURL,
		type     : objParams.strType,
		datatype : objParams.strDataType,
		data     : objParams.strData,
		success  : function(datas){
			var strHTML = '';
			$.each(datas, function(index, item){
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
					     + '</div>';
			});
			$(objParams.objHTML).html(strHTML);
		},
		error    : function(){
			alert('getList_obj() err!');
		}
	})
	.done( function(){
		
	});
	
}