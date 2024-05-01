package itwillbs.p2c3.boogimovie.vo;

public class DiscountVO {
	private int discount_num;
	private String discount_value;
	
	
	public int getDiscount_num() {
		return discount_num;
	}
	
	public void setDiscount_num(int discount_num) {
		this.discount_num = discount_num;
	}
	
	public String getDiscount_value() {
		return discount_value;
	}
	
	public void setDiscount_value(String discount_value) {
		this.discount_value = discount_value;
	}
	
	@Override
	public String toString() {
		return "DiscountVO [discount_num=" + discount_num + ", discount_value=" + discount_value + "]";
	}
	
	
}
