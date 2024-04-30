package itwillbs.p2c3.boogimovie.vo;

import java.sql.Date;

public class memberVO {
	private String id;
	private String name;
	private String pwd;
	private String email;
	private String tel;
	private String addr;
	private String movie_genre;
	private String status;
	private String my_theater;
	private String point;
	private Date reg_date;
	private Date withdraw_date;
	private String birth;
	
	
	public memberVO() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMy_theater() {
		return my_theater;
	}

	public void setMy_theater(String my_theater) {
		this.my_theater = my_theater;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}


	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getWithdraw_date() {
		return withdraw_date;
	}

	public void setWithdraw_date(Date withdraw_date) {
		this.withdraw_date = withdraw_date;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getMovie_genre() {
		return movie_genre;
	}

	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}

	@Override
	public String toString() {
		return "memberVO [id=" + id + ", name=" + name + ", pwd=" + pwd + ", email=" + email + ", tel=" + tel
				+ ", addr=" + addr + ", movie_genre=" + movie_genre + ", status=" + status + ", my_theater="
				+ my_theater + ", point=" + point + ", reg_date=" + reg_date + ", withdraw_date=" + withdraw_date
				+ ", birth=" + birth + "]";
	}

	public memberVO(String id, String name, String pwd, String email, String tel, String addr, String movie_genre,
			String status, String my_theater, String point, Date reg_date, Date withdraw_date, String birth) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
		this.movie_genre = movie_genre;
		this.status = status;
		this.my_theater = my_theater;
		this.point = point;
		this.reg_date = reg_date;
		this.withdraw_date = withdraw_date;
		this.birth = birth;
	}

	


}
