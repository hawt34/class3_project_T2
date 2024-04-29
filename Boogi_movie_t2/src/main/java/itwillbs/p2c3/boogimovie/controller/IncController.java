package itwillbs.p2c3.boogimovie.controller;

<<<<<<< HEAD
public class IncController {
=======
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
	
	
	
	
>>>>>>> branch 'main' of https://github.com/hawt34/class3_project_T2.git
	
}
