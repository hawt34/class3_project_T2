package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {
	
	@GetMapping("payment")
	public String payment() {
		System.out.println("payment");
		return "payment/payment1";
	}
	
	
}
