package itwillbs.p2c3.boogimovie.vo;

import lombok.Data;

@Data
public class CartVO {
	
	// 테이블 컬럼
	private int cart_num;
	private String cart_id;
	private String item_info_num;
	private int item_quantity;
	private int item_total_price;
	private String member_id;
	
	
	// --------------------------
	
	private String itemName;
    private int itemPrice;
    public CartVO(String itemName, int itemPrice) {
        this.itemName = itemName;
        this.itemPrice = itemPrice;
    }
    
}
