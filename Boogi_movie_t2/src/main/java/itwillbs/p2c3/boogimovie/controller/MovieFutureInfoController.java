package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MovieFutureInfoController {
	@GetMapping("movieFutureInfo1")
	public String movieFutureInfo1() {
		
		return "movie/movieFuture_info_1";
	}
	
	

}
