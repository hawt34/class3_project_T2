package itwillbs.p2c3.boogimovie.vo;

public class TheaterImageVO {
	private int theater_num;
	private String theater_image_src;
	
	
	@Override
	public String toString() {
		return "TheaterImageVO [theater_num=" + theater_num + ", theater_image_src=" + theater_image_src + "]";
	}
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public String getTheater_image_src() {
		return theater_image_src;
	}
	public void setTheater_image_src(String theater_image_src) {
		this.theater_image_src = theater_image_src;
	}
	
	
}
