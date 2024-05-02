package itwillbs.p2c3.boogimovie.vo;

public class EventVO {
	private int event_num;
	private int event_type_num;
	private String event_name;
	private String event_image;
	public int getEvent_num() {
		return event_num;
	}
	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}
	public int getEvent_type_num() {
		return event_type_num;
	}
	public void setEvent_type_num(int event_type_num) {
		this.event_type_num = event_type_num;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getEvent_image() {
		return event_image;
	}
	public void setEvent_image(String event_image) {
		this.event_image = event_image;
	}
	@Override
	public String toString() {
		return "EventVO [event_num=" + event_num + ", event_type_num=" + event_type_num + ", event_name=" + event_name
				+ ", event_image=" + event_image + "]";
	}
	
	
}
