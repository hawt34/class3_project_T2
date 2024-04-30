package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MovieFutureInfoController {
	@GetMapping("movieFutureInfo1")
	public String movieFutureInfo1() {
		
		return "movie/movieFuture_info_1";
	}
	
	@GetMapping("movieFutureInfo2")
	public String movieFutureInfo2() {
		
		return "movie/movieFuture_info_2";
	}
	
	@GetMapping("movieFutureInfo3")
	public String movieFutureInfo3() {
		
		return "movie/movieFuture_info_3";
	}

	@GetMapping("movieFutureInfo4")
	public String movieFutureInfo4() {
		
		return "movie/movieFuture_info_4";
	}
	
	@GetMapping("movieFutureInfo5")
	public String movieFutureInfo5() {
		
		return "movie/movieFuture_info_5";
	}

}
