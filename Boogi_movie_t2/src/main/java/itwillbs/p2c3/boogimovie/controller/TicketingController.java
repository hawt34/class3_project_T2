package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class TicketingController {

	@GetMapping("tic_ticketing")
	public String ticketing() {
		System.out.println("tic_ticketing()");
		
		
		return "ticketing/tic_ticketing";
	}
	
	
	@PostMapping("tic_choose_seat")
	public String choose_seat() {
		System.out.println("choose_seat()");
		
		
		return "ticketing/tic_choose_seat";
	}
	
	
}
