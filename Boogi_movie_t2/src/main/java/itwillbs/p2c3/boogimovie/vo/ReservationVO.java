package itwillbs.p2c3.boogimovie.vo;

public class ReservationVO {
	private int reservation_num;
	private String member_id;
	private int movie_num;
	private int booth_num;
	
	public int getReservation_num() {
		return reservation_num;
	}
	public void setReservation_num(int reservation_num) {
		this.reservation_num = reservation_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public int getBooth_num() {
		return booth_num;
	}
	public void setBooth_num(int booth_num) {
		this.booth_num = booth_num;
	}
	@Override
	public String toString() {
		return "ReservationVO [reservation_num=" + reservation_num + ", member_id=" + member_id + ", movie_num="
				+ movie_num + ", booth_num=" + booth_num + "]";
	}
	
	
}
