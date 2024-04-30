package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TheaterController {
	
	@GetMapping("theater_main")
	public String theater_main() {
		System.out.println("theater_main");
		return "theater/theater_main";
	}
}
