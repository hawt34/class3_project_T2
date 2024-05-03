package itwillbs.p2c3.boogimovie.controller;

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
	
	
	@GetMapping("movieInfo")
    public String movieInfo(int movie_num,MovieVO movie, Model model) {
        System.out.println(movie_num);
        
        MovieVO movie2 = service.getMovieInfo(movie);
        
		model.addAttribute("movie", movie2);
		System.out.println(movie2);
        
        
        return "movie/movie_info"; // 뷰 이름은 적절하게 변경해야 합니다.
    }
	

}
