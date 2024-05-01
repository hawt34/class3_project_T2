package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CscController {
	
	// csc 연결
		@GetMapping("csc_main")
		public String cscMain() {
			return "csc/csc_main";
		}
		@GetMapping("csc_faq")
		public String cscFAQ() {
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
	
	
	
}
