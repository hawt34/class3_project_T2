package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import lombok.Data;

@Data
public class OTOVO {
	private int OTO_num;
	private int theater_num;
	private String OTO_subject;
	private String OTO_content;
	private String member_id;
	private String OTO_category;
	private String OTO_reply_status;
	private LocalDateTime OTO_date;
	
	
	
	
}
