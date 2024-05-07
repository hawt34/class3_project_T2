package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalDateTime;

public class OTOReplyVO {
	private int oto_reply_num;
	private int oto_num;
	private String oto_reply_content;
	private LocalDateTime oto_reply_date;
	
	public int getOto_reply_num() {
		return oto_reply_num;
	}
	public void setOto_reply_num(int oto_reply_num) {
		this.oto_reply_num = oto_reply_num;
	}
	public int getOto_num() {
		return oto_num;
	}
	public void setOto_num(int oto_num) {
		this.oto_num = oto_num;
	}
	public String getOto_reply_content() {
		return oto_reply_content;
	}
	public void setOto_reply_content(String oto_reply_content) {
		this.oto_reply_content = oto_reply_content;
	}
	public LocalDateTime getOto_reply_date() {
		return oto_reply_date;
	}
	public void setOto_reply_date(LocalDateTime oto_reply_date) {
		this.oto_reply_date = oto_reply_date;
	}
	@Override
	public String toString() {
		return "OTOReplyVO [oto_reply_num=" + oto_reply_num + ", oto_num=" + oto_num + ", oto_reply_content="
				+ oto_reply_content + ", oto_reply_date=" + oto_reply_date + "]";
	}
	
	
	
	
	
}
