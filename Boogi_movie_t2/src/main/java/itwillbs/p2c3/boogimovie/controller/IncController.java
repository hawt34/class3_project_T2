package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IncController {
	
	@GetMapping("./")
	public String home() {
		return "movie/movie";
	}
	
	// csc 연결
	@GetMapping("csc_main")
	public String cscMain() {
		return "csc/csc_main";
	}
	@GetMapping("csc_faq")
	public String cscFaq() {
		return "csc/csc_faq";
	}
	@GetMapping("csc_notice")
	public String cscNotice() {
		return "csc/csc_notice";
	}
	@GetMapping("csc_oto")
	public String cscOto() {
		return "csc/csc_oto";
	}
	
	// admin 연결
	@GetMapping("admin_main")
	public String adminMain() {
		return "admin/admin_main/admin_main";
	}
	
	
	// event 연결
	@GetMapping("event_main")
	public String eventMain() {
		return "event/event_movie";
	}
	
	
	
	
	
}
