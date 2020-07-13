// 생성자-'함수'가 되어 객체가 만들어짐
	function Student(name, kor, eng, mat){
		// Field
		this.name = name;
		this.kor  = kor;
		this.eng  = eng;
		this.mat  = mat;
	}
	
	// method
	// this를 그냥 제일 밖으로 빼면 window Object를 가리킴 -> 프로토 타입 생성
	// 자바랑 다르게 모든 객체에 변수와 함수가 한 곳에 저장되기때문에,, 효율이 낮아짐
	// 모든 자바스크립트의 객체는 프로토타입을 가질 수 있음(함수를 보관하기 위해 공통된 영역인 프로토타입을 사용함),,
	// 메모리 효율 UP
	Student.prototype.getSum = function () { 
		return this.kor + this.eng + this.mat;
	}
	Student.prototype.getAvg = function () {
		return this.getSum() / 3;
	}
	Student.prototype.toString = function () {
		var msg = '';
		msg    += '이름: ' + this.name + '<br>';
		msg    += '총점: ' + this.getSum() + '<br>';
		msg    += '평균: ' + this.getAvg().toFixed(2) + '<br>';
		return msg;
	}
	
	window.onload = () => {
		var s1 = new Student('은영1', 100, 60, 90);
		var s2 = new Student('은영2', 70, 100, 30);
		var s3 = new Student('은영3', 80, 100, 70);
		var s4 = new Student('은영4', 100, 30, 60);
		var s5 = new Student('은영5', 50, 100, 90);
		
		console.log(s1);
		
		var studs = [];
		studs.push(s1);
		studs.push(s2);
		studs.push(s3);
		studs.push(s4);
		studs.push(s5);
				
		var msg = '';
		for ( var i in studs) {
			msg += '<div>';
			msg += studs[i].toString();	
			msg += '</div>';
		}
		// 출력 부분		
		var divs = document.getElementsByTagName('div');
		divs[0].innerHTML = msg;
		
		// 스타일 부분
		var innerDivs = document.querySelectorAll('div > div');
		innerDivs.forEach(function(elt, i, array) {
			var div = elt;
			div.style.border = '1px dashed blue';
			div.style.margin = '10px';
			div.style.padding = '10px';
			div.style.width = '400px';
			div.style.float = 'left';
			div.style.borderRadius = '15px';
		});
	}