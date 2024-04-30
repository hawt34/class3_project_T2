package itwillbs.p2c3.boogimovie.VO;

import java.sql.Date;

public class memberVO {
	private String id;
	private String name;
	private String pwd;
	private String email;
	private String tel;
	private String addr;
	private String movie;
	private String status;
	private String my_theater;
	private String point;
	private String accumulate_point;
	private String grade;
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

	public String getMovie() {
		return movie;
	}

	public void setMovie(String movie) {
		this.movie = movie;
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

	public String getAccumulate_point() {
		return accumulate_point;
	}

	public void setAccumulate_point(String accumulate_point) {
		this.accumulate_point = accumulate_point;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
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

	public memberVO(String id, String name, String pwd, String email, String tel, String addr, String movie,
			String status, String my_theater, String point, String accumulate_point, String grade, Date reg_date,
			Date withdraw_date, String birth) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
		this.movie = movie;
		this.status = status;
		this.my_theater = my_theater;
		this.point = point;
		this.accumulate_point = accumulate_point;
		this.grade = grade;
		this.reg_date = reg_date;
		this.withdraw_date = withdraw_date;
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "memberVO [id=" + id + ", name=" + name + ", pwd=" + pwd + ", email=" + email + ", tel=" + tel
				+ ", addr=" + addr + ", movie=" + movie + ", status=" + status + ", my_theater=" + my_theater
				+ ", point=" + point + ", accumulate_point=" + accumulate_point + ", grade=" + grade + ", reg_date="
				+ reg_date + ", withdraw_date=" + withdraw_date + ", birth=" + birth + "]";
	}
	
	
	
}
