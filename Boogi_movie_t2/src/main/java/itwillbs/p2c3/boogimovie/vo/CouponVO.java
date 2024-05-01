package itwillbs.p2c3.boogimovie.vo;

public class CouponVO {
	private int coupon_num;
	private String coupon_name;
	private int discount_num;
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public int getDiscount_num() {
		return discount_num;
	}
	public void setDiscount_num(int discount_num) {
		this.discount_num = discount_num;
	}
	@Override
	public String toString() {
		return "CouponVO [coupon_num=" + coupon_num + ", coupon_name=" + coupon_name + ", discount_num=" + discount_num
				+ "]";
	}
	
	
}
