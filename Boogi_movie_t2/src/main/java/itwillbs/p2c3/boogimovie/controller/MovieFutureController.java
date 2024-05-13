package itwillbs.p2c3.boogimovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import itwillbs.p2c3.boogimovie.service.MovieFutureService;
import itwillbs.p2c3.boogimovie.vo.MovieVO;


@Controller
public class MovieFutureController {
	@Autowired
	private MovieFutureService service;
	@GetMapping("movieFuture")
	public String movieFuture(Model model) {
		
		List<MovieVO> movieFuture = service.getMovieFuture();
		model.addAttribute("movieFuture", movieFuture);
		//System.out.println("여기는 무비퓨처" + movieFuture);확인완료
	    return "movie/movieFuture";
	}
}
