package itwillbs.p2c3.boogimovie.vo;

public class FAQVO {
	private int FAQ_num;
	private String FAQ_subject;
	private String FAQ_content;
	private String FAQ_category;
	private int FAQ_read_count;
	public int getFAQ_num() {
		return FAQ_num;
	}
	public void setFAQ_num(int fAQ_num) {
		FAQ_num = fAQ_num;
	}
	public String getFAQ_subject() {
		return FAQ_subject;
	}
	public void setFAQ_subject(String fAQ_subject) {
		FAQ_subject = fAQ_subject;
	}
	public String getFAQ_content() {
		return FAQ_content;
	}
	public void setFAQ_content(String fAQ_content) {
		FAQ_content = fAQ_content;
	}
	public String getFAQ_category() {
		return FAQ_category;
	}
	public void setFAQ_category(String fAQ_category) {
		FAQ_category = fAQ_category;
	}
	public int getFAQ_read_count() {
		return FAQ_read_count;
	}
	public void setFAQ_read_count(int fAQ_read_count) {
		FAQ_read_count = fAQ_read_count;
	}
	
	@Override
	public String toString() {
		return "FAQVO [FAQ_num=" + FAQ_num + ", FAQ_subject=" + FAQ_subject + ", FAQ_content=" + FAQ_content
				+ ", FAQ_category=" + FAQ_category + ", FAQ_read_count=" + FAQ_read_count + "]";
	}
	
	
}
