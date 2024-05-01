package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalTime;

public class StorePayVO {
	private int store_pay_num;
	private int order_num;
	private String store_pay_type;
	private LocalTime store_pay_date;
	private String store_pay_status;
	private LocalTime store_pay_cancel_date;
	private int coupon_num;
	private String store_pay_price;
	public int getStore_pay_num() {
		return store_pay_num;
	}
	public void setStore_pay_num(int store_pay_num) {
		this.store_pay_num = store_pay_num;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getStore_pay_type() {
		return store_pay_type;
	}
	public void setStore_pay_type(String store_pay_type) {
		this.store_pay_type = store_pay_type;
	}
	public LocalTime getStore_pay_date() {
		return store_pay_date;
	}
	public void setStore_pay_date(LocalTime store_pay_date) {
		this.store_pay_date = store_pay_date;
	}
	public String getStore_pay_status() {
		return store_pay_status;
	}
	public void setStore_pay_status(String store_pay_status) {
		this.store_pay_status = store_pay_status;
	}
	public LocalTime getStore_pay_cancel_date() {
		return store_pay_cancel_date;
	}
	public void setStore_pay_cancel_date(LocalTime store_pay_cancel_date) {
		this.store_pay_cancel_date = store_pay_cancel_date;
	}
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
	public String getStore_pay_price() {
		return store_pay_price;
	}
	public void setStore_pay_price(String store_pay_price) {
		this.store_pay_price = store_pay_price;
	}
	@Override
	public String toString() {
		return "StorePayVO [store_pay_num=" + store_pay_num + ", order_num=" + order_num + ", store_pay_type="
				+ store_pay_type + ", store_pay_date=" + store_pay_date + ", store_pay_status=" + store_pay_status
				+ ", store_pay_cancel_date=" + store_pay_cancel_date + ", coupon_num=" + coupon_num
				+ ", store_pay_price=" + store_pay_price + "]";
	}
	
	
}
