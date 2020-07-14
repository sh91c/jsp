package PKG;

public class Hello {

	public static void main(String[] args) {
	System.out.println("hi");

	I_FLY fly1 = new Overload();
	I_FLY fly2 = new Shuttle();
	
	Overload ol1 = new Overload();
	
	fly1.fly(); // -> 인터페이스 상속은 재정의된 메소드만 확인 가능
	ol1.fly(); // -> 클래스 상속은 클래스 안의 메소드를 전부 확인 가능
	
	int r1 = ol1.getSize();
	System.out.println(r1);
	ol1.setSize(27);
	int r2 = ol1.getSize();
	System.out.println(r2);
	}

}
