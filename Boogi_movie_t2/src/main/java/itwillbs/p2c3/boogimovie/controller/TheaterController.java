package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TheaterController {
	
	@GetMapping("theater")
	public String theater() {
		System.out.println("theater");
		return "theater/theater_main";
	}
	
	@GetMapping("theater_detail")
	public String theaterDetail() {
		System.out.println("theaterDetail");
		return "theater/theater_detail";
	}
}
