package PKG;

public class Overload implements I_FLY{
	private int size;
	
	public void setSize(int size) {
		if(size < 10) {
			this.size = 0;
		}
		else {
		this.size = size;
		}
	}
	
	public int getSize() {
		return this.size;
	}
	
	@Override
	public String fly() {
		return "오버로드는 느리다";
	}
}
