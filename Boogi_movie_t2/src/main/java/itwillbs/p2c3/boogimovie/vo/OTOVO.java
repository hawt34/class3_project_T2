package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class OTOVO {
	private int OTO_num;
	private int theater_num;
	private String OTO_subject;
	private String OTO_content;
	private String member_id;
	private String OTO_category;
	private String OTO_reply_status;
	private LocalDateTime OTO_date;
	
	public int getOTO_num() {
		return OTO_num;
	}
	public void setOTO_num(int oTO_num) {
		OTO_num = oTO_num;
	}
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public String getOTO_subject() {
		return OTO_subject;
	}
	public void setOTO_subject(String oTO_subject) {
		OTO_subject = oTO_subject;
	}
	public String getOTO_content() {
		return OTO_content;
	}
	public void setOTO_content(String oTO_content) {
		OTO_content = oTO_content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getOTO_category() {
		return OTO_category;
	}
	public void setOTO_category(String oTO_category) {
		OTO_category = oTO_category;
	}
	public String getOTO_reply_status() {
		return OTO_reply_status;
	}
	public void setOTO_reply_status(String oTO_reply_status) {
		OTO_reply_status = oTO_reply_status;
	}
	public LocalDateTime getOTO_date() {
		return OTO_date;
	}
	public void setOTO_date(LocalDateTime oTO_date) {
		OTO_date = oTO_date;
	}
	
	@Override
	public String toString() {
		return "OTOVO [OTO_num=" + OTO_num + ", theater_num=" + theater_num + ", OTO_subject=" + OTO_subject
				+ ", OTO_content=" + OTO_content + ", member_id=" + member_id + ", OTO_category=" + OTO_category
				+ ", OTO_reply_status=" + OTO_reply_status + ", OTO_date=" + OTO_date + "]";
	}
	
	
	
	
}
