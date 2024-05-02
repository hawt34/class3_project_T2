package itwillbs.p2c3.boogimovie.vo;

public class ItemOrderVO {
	private int order_num;
	private String member_id;
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "ItemOrderVO [order_num=" + order_num + ", member_id=" + member_id + "]";
	}
	
	
}
