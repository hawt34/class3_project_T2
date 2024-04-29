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
	public String cscMain_header() {
		return "csc/csc_main";
	}
	@GetMapping("csc_faq")
	public String cscFaq_header() {
		return "csc/csc_faq";
	}
	@GetMapping("csc_notice")
	public String cscNotice_header() {
		return "csc/csc_notice";
	}
	@GetMapping("csc_oto")
	public String cscOto_header() {
		return "csc/csc_oto";
	}
	
	// event 연결
	@GetMapping("event_main")
	public String eventMain() {
		return "event/event_movie";
	}
	
}
	
	
	
