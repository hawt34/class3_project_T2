package itwillbs.p2c3.boogimovie.vo;

public class MyTheaterVO {
	private int theater_num;
	private String member_id;
	
	
	@Override
	public String toString() {
		return "MyTheaterVO [theater_num=" + theater_num + ", member_id=" + member_id + "]";
	}
	
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
