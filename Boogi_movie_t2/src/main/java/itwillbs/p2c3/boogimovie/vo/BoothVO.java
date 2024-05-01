package itwillbs.p2c3.boogimovie.vo;

public class BoothVO {
	private int booth_num;
	private String theater_num;
	private String booth_cinema_num;
	private String booth_seat_row;
	private String booth_seat_col;
	public int getBooth_num() {
		return booth_num;
	}
	public void setBooth_num(int booth_num) {
		this.booth_num = booth_num;
	}
	public String getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(String theater_num) {
		this.theater_num = theater_num;
	}
	public String getBooth_cinema_num() {
		return booth_cinema_num;
	}
	public void setBooth_cinema_num(String booth_cinema_num) {
		this.booth_cinema_num = booth_cinema_num;
	}
	public String getBooth_seat_row() {
		return booth_seat_row;
	}
	public void setBooth_seat_row(String booth_seat_row) {
		this.booth_seat_row = booth_seat_row;
	}
	public String getBooth_seat_col() {
		return booth_seat_col;
	}
	public void setBooth_seat_col(String booth_seat_col) {
		this.booth_seat_col = booth_seat_col;
	}
	@Override
	public String toString() {
		return "BoothVO [booth_num=" + booth_num + ", theater_num=" + theater_num + ", booth_cinema_num="
				+ booth_cinema_num + ", booth_seat_row=" + booth_seat_row + ", booth_seat_col=" + booth_seat_col + "]";
	}
	
	
}
