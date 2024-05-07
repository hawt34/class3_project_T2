package itwillbs.p2c3.boogimovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import itwillbs.p2c3.boogimovie.service.MovieInfoService;
import itwillbs.p2c3.boogimovie.vo.MovieVO;


@Controller
public class MovieInfoController {
	@Autowired
	private MovieInfoService service;
	
	
	@GetMapping("movieInfo1")
	public String movieInfo1(Model model) {
		
		
//		List<MovieVO> movieInfo = service.getMovieList();
//		model.addAttribute("movieInfo", movieInfo);
//		System.out.println(movieInfo);
		
		
		
		
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
