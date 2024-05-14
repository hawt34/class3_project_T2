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
		System.out.println(scs);
		System.out.println(selected_seats);
		System.out.println(person_info);
		System.out.println(total_fee);
		return "payment/payment_reservation";
	}
}
//<input type="hidden" id="movie_name" name="movie_name" value="${scs.movie_name}">
//<input type="hidden" id="theater_name" name="theater_name" value="${scs.theater_name}">
//<input type="hidden" id="screen_cinema_num" name="screen_cinema_num" value="${scs.screen_cinema_num}">
//<input type="hidden" id="selected_seats" name="selected_seats">
//<input type="hidden" id="person_info" name="person_info">
//<input type="hidden" id="total_fee" name="total_fee">
//<input type="hidden" id="scs_start_date" name="scs_start_date" value="${start_date}">
//<input type="hidden" id="scs_end_date" name="scs_end_date" value="${end_date}">
