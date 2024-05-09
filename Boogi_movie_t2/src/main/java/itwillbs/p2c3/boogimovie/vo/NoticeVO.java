package itwillbs.p2c3.boogimovie.vo;

import java.sql.Timestamp;


import lombok.Data;

@Data
public class NoticeVO {
	private int notice_num;
	private String notice_subject;
	private String notice_content;
	private Timestamp notice_date;
	private String notice_category;
	private int theater_num;
	private String theater_name;
	
	
}
