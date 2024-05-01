package itwillbs.p2c3.boogimovie.vo;

public class EventTypeVO {
	private int event_type_num;
	private String event_type_name;
	private int coupon_num;
	public int getEvent_type_num() {
		return event_type_num;
	}
	public void setEvent_type_num(int event_type_num) {
		this.event_type_num = event_type_num;
	}
	public String getEvent_type_name() {
		return event_type_name;
	}
	public void setEvent_type_name(String event_type_name) {
		this.event_type_name = event_type_name;
	}
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
	@Override
	public String toString() {
		return "EventTypeVO [event_type_num=" + event_type_num + ", event_type_name=" + event_type_name
				+ ", coupon_num=" + coupon_num + "]";
	}
	
	
}
