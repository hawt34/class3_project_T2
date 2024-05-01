package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalTime;

public class TicketVO {
	private int ticket_num;
	private int ticket_info_num;
	private LocalTime ticket_reservation_date;
	private String ticket_seat_info;
	private int reservation_num;
	public int getTicket_num() {
		return ticket_num;
	}
	public void setTicket_num(int ticket_num) {
		this.ticket_num = ticket_num;
	}
	public int getTicket_info_num() {
		return ticket_info_num;
	}
	public void setTicket_info_num(int ticket_info_num) {
		this.ticket_info_num = ticket_info_num;
	}
	public LocalTime getTicket_reservation_date() {
		return ticket_reservation_date;
	}
	public void setTicket_reservation_date(LocalTime ticket_reservation_date) {
		this.ticket_reservation_date = ticket_reservation_date;
	}
	public String getTicket_seat_info() {
		return ticket_seat_info;
	}
	public void setTicket_seat_info(String ticket_seat_info) {
		this.ticket_seat_info = ticket_seat_info;
	}
	public int getReservation_num() {
		return reservation_num;
	}
	public void setReservation_num(int reservation_num) {
		this.reservation_num = reservation_num;
	}
	@Override
	public String toString() {
		return "TicketVO [ticket_num=" + ticket_num + ", ticket_info_num=" + ticket_info_num
				+ ", ticket_reservation_date=" + ticket_reservation_date + ", ticket_seat_info=" + ticket_seat_info
				+ ", reservation_num=" + reservation_num + "]";
	}
	
	
}
