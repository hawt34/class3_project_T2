package itwillbs.p2c3.boogimovie.vo;

import lombok.Data;

@Data
public class FAQVO {
	private int FAQ_num;
	private String FAQ_subject;
	private String FAQ_content;
	private String FAQ_category;
	private int FAQ_read_count;
}
