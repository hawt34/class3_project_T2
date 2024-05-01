package itwillbs.p2c3.boogimovie.vo;

public class ScreenTimeVO {
	private int sct_num;
	private String movie_name;
	private String theater_name;
	private String round_num;
	private String booth_num;
	public int getSct_num() {
		return sct_num;
	}
	public void setSct_num(int sct_num) {
		this.sct_num = sct_num;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getRound_num() {
		return round_num;
	}
	public void setRound_num(String round_num) {
		this.round_num = round_num;
	}
	public String getBooth_num() {
		return booth_num;
	}
	public void setBooth_num(String booth_num) {
		this.booth_num = booth_num;
	}
	@Override
	public String toString() {
		return "ScreenTimeVO [sct_num=" + sct_num + ", movie_name=" + movie_name + ", theater_name=" + theater_name
				+ ", round_num=" + round_num + ", booth_num=" + booth_num + "]";
	}
	
	
	
}
