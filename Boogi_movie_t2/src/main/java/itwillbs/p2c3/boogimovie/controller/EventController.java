package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EventController {

	// 관리자 고객센터
		@GetMapping("event")
		public String eventMain() {
			return "event/event_main";
		}
}
