package itwillbs.p2c3.boogimovie.vo;

public class SeatVO {
	private int seat_code;
	private String seat_row;
	private String seat_col;
	public int getSeat_code() {
		return seat_code;
	}
	public void setSeat_code(int seat_code) {
		this.seat_code = seat_code;
	}
	public String getSeat_row() {
		return seat_row;
	}
	public void setSeat_row(String seat_row) {
		this.seat_row = seat_row;
	}
	public String getSeat_col() {
		return seat_col;
	}
	public void setSeat_col(String seat_col) {
		this.seat_col = seat_col;
	}
	@Override
	public String toString() {
		return "SeatVO [seat_code=" + seat_code + ", seat_row=" + seat_row + ", seat_col=" + seat_col + "]";
	}
	
	
}
