package itwillbs.p2c3.boogimovie.vo;

import java.util.Date;


import lombok.Data;

@Data
public class EventVO {
	private int event_num;
	private int event_type_num;
	private String event_subject;
	private String event_thumbnail;
	private String event_image;
	private int coupon_num;
	private Date event_reg_date;
	private Date event_start_date; 
	private Date event_end_date; 
	private String event_start;
	private String event_end;
	// 조인용 컬럼
	private String event_type_name;
	private String coupon_name;
	
}
