package itwillbs.p2c3.boogimovie.vo;

public class TicketInfoVO {
	private int ticket_info_num;
	private String ticket_info_age;
	private String ticket_info_price_date;
	private String ticket_info_holiday;
	private String ticket_info_dimension;
	private String ticket_info_price;
	public int getTicket_info_num() {
		return ticket_info_num;
	}
	public void setTicket_info_num(int ticket_info_num) {
		this.ticket_info_num = ticket_info_num;
	}
	public String getTicket_info_age() {
		return ticket_info_age;
	}
	public void setTicket_info_age(String ticket_info_age) {
		this.ticket_info_age = ticket_info_age;
	}
	public String getTicket_info_price_date() {
		return ticket_info_price_date;
	}
	public void setTicket_info_price_date(String ticket_info_price_date) {
		this.ticket_info_price_date = ticket_info_price_date;
	}
	public String getTicket_info_holiday() {
		return ticket_info_holiday;
	}
	public void setTicket_info_holiday(String ticket_info_holiday) {
		this.ticket_info_holiday = ticket_info_holiday;
	}
	public String getTicket_info_dimension() {
		return ticket_info_dimension;
	}
	public void setTicket_info_dimension(String ticket_info_dimension) {
		this.ticket_info_dimension = ticket_info_dimension;
	}
	public String getTicket_info_price() {
		return ticket_info_price;
	}
	public void setTicket_info_price(String ticket_info_price) {
		this.ticket_info_price = ticket_info_price;
	}
	@Override
	public String toString() {
		return "TicketInfoVO [ticket_info_num=" + ticket_info_num + ", ticket_info_age=" + ticket_info_age
				+ ", ticket_info_price_date=" + ticket_info_price_date + ", ticket_info_holiday=" + ticket_info_holiday
				+ ", ticket_info_dimension=" + ticket_info_dimension + ", ticket_info_price=" + ticket_info_price + "]";
	}
	
	
}
