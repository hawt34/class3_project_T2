package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalTime;

import lombok.Data;

@Data
public class TicketPayVO {
	private int ticket_pay_num;
	private int reservation_num;
	private String ticket_pay_type;
	private LocalTime ticket_pay_date;
	private String ticket_pay_status;
	private LocalTime ticket_pay_cancel_date;
	private String ticket_pay_price;
	private int coupon_num;
	
	
}
