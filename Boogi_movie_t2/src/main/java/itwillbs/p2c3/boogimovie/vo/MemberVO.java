package itwillbs.p2c3.boogimovie.vo;

import java.sql.Date;

public class MemberVO {
	private String member_id;
	private String member_name;
	private String member_pwd;
	private String member_email;
	private String member_tel;
	private String member_addr;
	private String member_movie_genre;
	private String member_status;
	private String member_my_theater;
	private String member_point;
	private Date member_reg_date;
	private Date member_withdraw_date;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_movie_genre() {
		return member_movie_genre;
	}
	public void setMember_movie_genre(String member_movie_genre) {
		this.member_movie_genre = member_movie_genre;
	}
	public String getMember_status() {
		return member_status;
	}
	public void setMember_status(String member_status) {
		this.member_status = member_status;
	}
	public String getMember_my_theater() {
		return member_my_theater;
	}
	public void setMember_my_theater(String member_my_theater) {
		this.member_my_theater = member_my_theater;
	}
	public String getMember_point() {
		return member_point;
	}
	public void setMember_point(String member_point) {
		this.member_point = member_point;
	}
	public Date getMember_reg_date() {
		return member_reg_date;
	}
	public void setMember_reg_date(Date member_reg_date) {
		this.member_reg_date = member_reg_date;
	}
	public Date getMember_withdraw_date() {
		return member_withdraw_date;
	}
	public void setMember_withdraw_date(Date member_withdraw_date) {
		this.member_withdraw_date = member_withdraw_date;
	}
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_name=" + member_name + ", member_pwd=" + member_pwd
				+ ", member_email=" + member_email + ", member_tel=" + member_tel + ", member_addr=" + member_addr
				+ ", member_movie_genre=" + member_movie_genre + ", member_status=" + member_status
				+ ", member_my_theater=" + member_my_theater + ", member_point=" + member_point + ", member_reg_date="
				+ member_reg_date + ", member_withdraw_date=" + member_withdraw_date + "]";
	}
	public MemberVO(String member_id, String member_name, String member_pwd, String member_email, String member_tel,
			String member_addr, String member_movie_genre, String member_status, String member_my_theater,
			String member_point, Date member_reg_date, Date member_withdraw_date) {
		super();
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_pwd = member_pwd;
		this.member_email = member_email;
		this.member_tel = member_tel;
		this.member_addr = member_addr;
		this.member_movie_genre = member_movie_genre;
		this.member_status = member_status;
		this.member_my_theater = member_my_theater;
		this.member_point = member_point;
		this.member_reg_date = member_reg_date;
		this.member_withdraw_date = member_withdraw_date;
	}
	
	public MemberVO() {}
	
}
