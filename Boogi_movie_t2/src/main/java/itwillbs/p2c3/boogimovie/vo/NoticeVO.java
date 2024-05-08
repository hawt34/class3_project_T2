package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalTime;

import lombok.Data;

@Data
public class NoticeVO {
	private int notice_num;
	private String notice_subject;
	private String notice_content;
	private int theater_num;
	private LocalTime notice_date;
	
	
}
