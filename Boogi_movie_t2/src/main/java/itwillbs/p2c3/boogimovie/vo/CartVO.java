package itwillbs.p2c3.boogimovie.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartVO {
	private int cart_num;
	private String cart_id;
    private int item_info_num;
    private int item_quantity;
    private int item_total_price;
    private String member_id;

}
