package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalTime;

import lombok.Data;

@Data
public class OTOReplyVO {
	private int OTO_reply_num;
	private int OTO_num;
	private String OTO_reply_content;
	private LocalTime OTO_reply_date;
	
}
