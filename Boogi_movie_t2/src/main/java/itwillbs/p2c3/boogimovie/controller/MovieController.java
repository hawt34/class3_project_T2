package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MovieController {
	@GetMapping("movie")
	public String movie() {
		
		return "movie/movie";
	}
}
