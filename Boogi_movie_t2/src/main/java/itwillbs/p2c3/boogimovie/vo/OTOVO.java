package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class OTOVO {
	private int oto_num;
	private int theater_num;
	private String oto_subject;
	private String oto_content;
	private String member_id;
	private String oto_category;
	private String oto_reply_status;
	private LocalDateTime oto_date;
	private String theater_name;
	
<<<<<<< HEAD
=======
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public int getOto_num() {
		return oto_num;
	}
	public void setOto_num(int oto_num) {
		this.oto_num = oto_num;
	}
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public String getOto_subject() {
		return oto_subject;
	}
	public void setOto_subject(String oto_subject) {
		this.oto_subject = oto_subject;
	}
	public String getOto_content() {
		return oto_content;
	}
	public void setOto_content(String oto_content) {
		this.oto_content = oto_content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getOto_category() {
		return oto_category;
	}
	public void setOto_category(String oto_category) {
		this.oto_category = oto_category;
	}
	public String getOto_reply_status() {
		return oto_reply_status;
	}
	public void setOto_reply_status(String oto_reply_status) {
		this.oto_reply_status = oto_reply_status;
	}
	public LocalDateTime getOto_date() {
		return oto_date;
	}
	public void setOto_date(LocalDateTime oto_date) {
		this.oto_date = oto_date;
	}
	@Override
	public String toString() {
		return "OTOVO [oto_num=" + oto_num + ", theater_num=" + theater_num + ", oto_subject=" + oto_subject
				+ ", oto_content=" + oto_content + ", member_id=" + member_id + ", oto_category=" + oto_category
				+ ", oto_reply_status=" + oto_reply_status + ", oto_date=" + oto_date + ", theater_name=" + theater_name
				+ "]";
	}
	
>>>>>>> branch 'main' of https://github.com/hawt34/class3_project_T2.git
	
	
	
	
	
	
}
