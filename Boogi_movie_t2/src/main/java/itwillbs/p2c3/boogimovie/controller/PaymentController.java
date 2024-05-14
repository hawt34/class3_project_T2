package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import itwillbs.p2c3.boogimovie.vo.ScreenSessionVO;

@Controller
public class PaymentController {
	
	@GetMapping("payment")
	public String payment() {
		System.out.println("payment");
		return "payment/payment_reservation";
	}
	
	@PostMapping("payment")
	public String payment2(ScreenSessionVO scs, String selected_seats, String person_info, String total_fee) {
		
		return "payment/payment_reservation";
	}
}
