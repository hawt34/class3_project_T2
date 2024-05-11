package itwillbs.p2c3.boogimovie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import itwillbs.p2c3.boogimovie.service.MovieFutureInfoService;
import itwillbs.p2c3.boogimovie.vo.MovieVO;


@Controller
public class MovieFutureInfoController {
	
	@Autowired
	private MovieFutureInfoService service;
	@GetMapping("movieFutureInfo")
	public String movieFutureInfo(int movie_num, MovieVO futureMovie, Model model) {
		//System.out.println("여기는 상여예봉 무비" + movie_num); 정보확인완료
		MovieVO futureMov = service.getFutureMovieInfo(futureMovie);
		model.addAttribute("movieFutureInfo", futureMov);
		//System.out.println("각각의 개봉예정영화 정보" + futureMov);//정보확인완료
		
		return "movie/movieFuture_info";
	}
	
	

}
