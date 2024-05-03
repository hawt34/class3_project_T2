package itwillbs.p2c3.boogimovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import itwillbs.p2c3.boogimovie.service.MovieInfoService;
import itwillbs.p2c3.boogimovie.vo.MovieVO;


@Controller
public class MovieController {
	@Autowired
	private MovieInfoService service;
	
	@GetMapping("movie")
	public String movie(Model model) {
		List<MovieVO> movieInfo = service.getMovieList();
		model.addAttribute("movieInfo", movieInfo);
		//System.out.println(movieInfo);
		
		return "movie/movie";
	}

//	 @GetMapping("movie")
//	    public String movie(Model model, @RequestParam(name = "movie_num", required = false) Integer movie_num) {
//	        
//	        if(movie_num == null) {
//	            // movie_num이 null인 경우 처리할 내용
//	        } else {
//	            MovieVO movieInfo = service.getMovieList(movie_num);
//	            model.addAttribute("movieInfo", movieInfo);
//	            System.out.println(movieInfo);
//	        }
//	        
//	        return "movie/movie";
//	    }

}
