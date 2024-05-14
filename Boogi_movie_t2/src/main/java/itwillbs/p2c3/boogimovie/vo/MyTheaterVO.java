package itwillbs.p2c3.boogimovie.vo;

import lombok.Data;

@Data
public class MyTheaterVO {
	private String member_my_theater;
	private int theater_num;

	public MyTheaterVO(String member_my_theater) {
		super();
		this.member_my_theater = member_my_theater;
	}

	
	public MyTheaterVO(String member_my_theater, int theater_num) {
		super();
		this.member_my_theater = member_my_theater;
		this.theater_num = theater_num;
	}
	
	
}
