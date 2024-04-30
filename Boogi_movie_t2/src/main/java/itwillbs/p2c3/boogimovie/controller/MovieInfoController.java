package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MovieInfoController {
	@GetMapping("movieInfo1")
	public String movieInfo1() {
		
		return "movie/movie_info_1";
	}
	
	@GetMapping("movieInfo2")
	public String movieInfo2() {
		
		return "movie/movie_info_2";
	}
	
	@GetMapping("movieInfo3")
	public String movieInfo3() {
		
		return "movie/movie_info_3";
	}

	@GetMapping("movieInfo4")
	public String movieInfo4() {
		
		return "movie/movie_info_4";
	}
	
	@GetMapping("movieInfo5")
	public String movieInfo5() {
		
		return "movie/movie_info_5";
	}

}
