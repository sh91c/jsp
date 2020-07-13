<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   body {  font-size:24px;   }   
</style>
<script>
   
   window.onload = function() {
	  var val1   = document.getElementById('val1');
	  var val2   = document.getElementById('val2');
	  var btnAdd = document.getElementById('btnAdd');
	  btnAdd.onclick = function () {
		  var v1  = parseInt(val1.value);
		  var v2  = parseInt(val2.value);
		  var v   = v1 + v2;
		  var result  = document.getElementById('result');
		  result.innerHTML = v;
	  }	   	   
	  var btnSubtract = document.getElementById('btnSubtract');
	  btnSubtract.onclick = function () {
		  var v1  = parseInt(val1.value);
		  var v2  = parseInt(val2.value);
		  var v   = v1 - v2;
		  var result  = document.getElementById('result');
		  result.innerHTML = v;
	  }	   	   
   } 
   
</script>
</head>
<body>
  값1<input type="text" id="val1" /><br>
  값2<input type="text" id="val2" /><br>
  <input type="button" id="btnAdd"      value="   +   " />
  <input type="button" id="btnSubtract" value="   -   " />
  <input type="button" id="btnMultiply" value="   *   " />
  <input type="button" id="btnDivide"   value="   /   " /><br>
  결과<br>
  <div id="result"></div>
</body>
</html>