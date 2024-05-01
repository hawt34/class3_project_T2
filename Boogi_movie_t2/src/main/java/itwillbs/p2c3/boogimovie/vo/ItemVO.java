package itwillbs.p2c3.boogimovie.vo;

public class ItemVO {
	private int item_num;
	private String item_name;
	private int item_info_num;
	private String item_image;
	private int order_num;
	
	
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_info_num() {
		return item_info_num;
	}
	public void setItem_info_num(int item_info_num) {
		this.item_info_num = item_info_num;
	}
	public String getItem_image() {
		return item_image;
	}
	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	@Override
	public String toString() {
		return "ItemVO [item_num=" + item_num + ", item_name=" + item_name + ", item_info_num=" + item_info_num
				+ ", item_image=" + item_image + ", order_num=" + order_num + "]";
	}
	
	
}
