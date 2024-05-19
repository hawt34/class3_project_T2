package itwillbs.p2c3.boogimovie.vo;

import lombok.Data;

@Data
public class CartItemVO {
	private String itemName;
    private int itemPrice;
    public CartItemVO(String itemName, int itemPrice) {
        this.itemName = itemName;
        this.itemPrice = itemPrice;
    }
    
}
