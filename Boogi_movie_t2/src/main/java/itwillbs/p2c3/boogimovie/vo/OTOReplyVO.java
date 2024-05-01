package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalTime;

public class OTOReplyVO {
	private int OTO_reply_num;
	private int OTO_num;
	private String OTO_reply_content;
	private LocalTime OTO_reply_date;
	
	
	public int getOTO_reply_num() {
		return OTO_reply_num;
	}
	public void setOTO_reply_num(int oTO_reply_num) {
		OTO_reply_num = oTO_reply_num;
	}
	public int getOTO_num() {
		return OTO_num;
	}
	public void setOTO_num(int oTO_num) {
		OTO_num = oTO_num;
	}
	public String getOTO_reply_content() {
		return OTO_reply_content;
	}
	public void setOTO_reply_content(String oTO_reply_content) {
		OTO_reply_content = oTO_reply_content;
	}
	public LocalTime getOTO_reply_date() {
		return OTO_reply_date;
	}
	public void setOTO_reply_date(LocalTime oTO_reply_date) {
		OTO_reply_date = oTO_reply_date;
	}
	@Override
	public String toString() {
		return "OTOReplyVO [OTO_reply_num=" + OTO_reply_num + ", OTO_num=" + OTO_num + ", OTO_reply_content="
				+ OTO_reply_content + ", OTO_reply_date=" + OTO_reply_date + "]";
	}
	
	
}
