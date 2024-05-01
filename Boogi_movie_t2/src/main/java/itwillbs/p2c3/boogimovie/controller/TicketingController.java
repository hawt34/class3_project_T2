package itwillbs.p2c3.boogimovie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class TicketingController {
	@GetMapping("tic_ticketing")
	public String ticketing(HttpSession session, Model model) {
		System.out.println("tic_ticketing()");
		
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요");
			model.addAttribute("targetURL", "member_login");
			return "error/fail";
		}
		
		
		return "ticketing/tic_ticketing";
	}
	
	
	@PostMapping("tic_choose_seat")
	public String choose_seat() {
		System.out.println("choose_seat()");
		
		
		return "ticketing/tic_choose_seat";
	}
	
	
}
