package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MovieInfoController {
	@GetMapping("movieInfo1")
	public String movieInfo() {
		
		return "movie/movie_info_1";
	}
}
