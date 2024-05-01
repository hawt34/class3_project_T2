package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalTime;

public class TicketPayVO {
	private int ticket_pay_num;
	private int reservation_num;
	private String ticket_pay_type;
	private LocalTime ticket_pay_date;
	private String ticket_pay_status;
	private LocalTime ticket_pay_cancel_date;
	private String ticket_pay_price;
	private int coupon_num;
	
	
	public int getTicket_pay_num() {
		return ticket_pay_num;
	}
	public void setTicket_pay_num(int ticket_pay_num) {
		this.ticket_pay_num = ticket_pay_num;
	}
	public int getReservation_num() {
		return reservation_num;
	}
	public void setReservation_num(int reservation_num) {
		this.reservation_num = reservation_num;
	}
	public String getTicket_pay_type() {
		return ticket_pay_type;
	}
	public void setTicket_pay_type(String ticket_pay_type) {
		this.ticket_pay_type = ticket_pay_type;
	}
	public LocalTime getTicket_pay_date() {
		return ticket_pay_date;
	}
	public void setTicket_pay_date(LocalTime ticket_pay_date) {
		this.ticket_pay_date = ticket_pay_date;
	}
	public String getTicket_pay_status() {
		return ticket_pay_status;
	}
	public void setTicket_pay_status(String ticket_pay_status) {
		this.ticket_pay_status = ticket_pay_status;
	}
	public LocalTime getTicket_pay_cancel_date() {
		return ticket_pay_cancel_date;
	}
	public void setTicket_pay_cancel_date(LocalTime ticket_pay_cancel_date) {
		this.ticket_pay_cancel_date = ticket_pay_cancel_date;
	}
	public String getTicket_pay_price() {
		return ticket_pay_price;
	}
	public void setTicket_pay_price(String ticket_pay_price) {
		this.ticket_pay_price = ticket_pay_price;
	}
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
	
	@Override
	public String toString() {
		return "TicketPayVO [ticket_pay_num=" + ticket_pay_num + ", reservation_num=" + reservation_num
				+ ", ticket_pay_type=" + ticket_pay_type + ", ticket_pay_date=" + ticket_pay_date
				+ ", ticket_pay_status=" + ticket_pay_status + ", ticket_pay_cancel_date=" + ticket_pay_cancel_date
				+ ", ticket_pay_price=" + ticket_pay_price + ", coupon_num=" + coupon_num + "]";
	}
	
	
}
