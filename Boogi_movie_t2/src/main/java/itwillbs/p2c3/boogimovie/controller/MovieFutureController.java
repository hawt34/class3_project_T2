package itwillbs.p2c3.boogimovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MovieFutureController {
	@GetMapping("movieFuture")
	public String movieFuture(Model model) {
		
	    return "movie/movieFuture";
	}
}
