package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalTime;

import lombok.Data;

@Data
public class TicketVO {
	private int ticket_num;
	private int ticket_info_num;
	private LocalTime ticket_reservation_date;
	private String ticket_seat_info;
	private int reservation_num;
	
}
