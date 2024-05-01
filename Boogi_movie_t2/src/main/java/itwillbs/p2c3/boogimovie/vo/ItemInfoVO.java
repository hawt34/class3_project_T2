package itwillbs.p2c3.boogimovie.vo;

public class ItemInfoVO {
	private int item_info_num;
	private String item_info_type;
	private String item_info_name;
	private String item_info_image;
	private String item_info_price;
	public int getItem_info_num() {
		return item_info_num;
	}
	public void setItem_info_num(int item_info_num) {
		this.item_info_num = item_info_num;
	}
	public String getItem_info_type() {
		return item_info_type;
	}
	public void setItem_info_type(String item_info_type) {
		this.item_info_type = item_info_type;
	}
	public String getItem_info_name() {
		return item_info_name;
	}
	public void setItem_info_name(String item_info_name) {
		this.item_info_name = item_info_name;
	}
	public String getItem_info_image() {
		return item_info_image;
	}
	public void setItem_info_image(String item_info_image) {
		this.item_info_image = item_info_image;
	}
	public String getItem_info_price() {
		return item_info_price;
	}
	public void setItem_info_price(String item_info_price) {
		this.item_info_price = item_info_price;
	}
	@Override
	public String toString() {
		return "ItemInfoVO [item_info_num=" + item_info_num + ", item_info_type=" + item_info_type + ", item_info_name="
				+ item_info_name + ", item_info_image=" + item_info_image + ", item_info_price=" + item_info_price
				+ "]";
	}
	
	
}
