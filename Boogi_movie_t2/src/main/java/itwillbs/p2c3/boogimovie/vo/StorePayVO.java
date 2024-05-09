package itwillbs.p2c3.boogimovie.vo;

import java.time.LocalTime;

import lombok.Data;

@Data
public class StorePayVO {
	private int store_pay_num;
	private int order_num;
	private String store_pay_type;
	private LocalTime store_pay_date;
	private String store_pay_status;
	private LocalTime store_pay_cancel_date;
	private int coupon_num;
	private String store_pay_price;
	
}
