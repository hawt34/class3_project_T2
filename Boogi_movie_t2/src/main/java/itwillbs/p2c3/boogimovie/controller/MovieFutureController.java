package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MovieFutureController {
	@GetMapping("movieFuture")
	public String movieFuture() {
		
		return "movie/movieFuture";
	}
}