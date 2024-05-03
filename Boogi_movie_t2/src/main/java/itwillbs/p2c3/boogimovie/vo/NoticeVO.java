package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalTime;

public class NoticeVO {
	private int notice_num;
	private String notice_subject;
	private String notice_content;
	private int theater_num;
	private LocalTime notice_date;
	
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public LocalTime getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(LocalTime notice_date) {
		this.notice_date = notice_date;
	}
	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", notice_subject=" + notice_subject + ", notice_content="
				+ notice_content + ", theater_num=" + theater_num + ", notice_date=" + notice_date + "]";
	}
	
	
	
	
}
