package itwillbs.project2.boogi_movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TheaterController {
	@RequestMapping("/TheaterMain") 
	public String theaterMain() {
		
		return "theater/theater_main";
	}

}
