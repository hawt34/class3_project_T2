package itwillbs.p2c3.boogimovie.controller;

import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.x.protobuf.MysqlxCrud.Collection;

import itwillbs.p2c3.boogimovie.service.MovieInfoService;
import itwillbs.p2c3.boogimovie.service.TheaterService;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Controller
public class TicketingController {
	
	@Autowired
	private MovieInfoService movieService;
	@Autowired
	private TheaterService theaterService;
	
	
	@GetMapping("tic_ticketing")
	public String ticketing(HttpSession session, Model model) {
		System.out.println("tic_ticketing()");
		
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요");
			model.addAttribute("targetURL", "member_login");
			return "error/fail";
		}
		
		List<MovieVO> movieList = movieService.getMovieList();
		List<TheaterVO> theaterList = theaterService.searchTheaters();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("theaterList", theaterList);
		
		return "ticketing/tic_ticketing";
	}
	
	
	@PostMapping("tic_choose_seat")
	public String choose_seat() {
		System.out.println("choose_seat()");
		
		
		return "ticketing/tic_choose_seat";
	}
	
	@ResponseBody
	@GetMapping(value = "api/movieAbc", produces = "application/json")
	public List<MovieVO> movieAbc(){
		List<MovieVO> movies = movieService.getMovieListAbc();
		return movies; 
	}
	
	@ResponseBody
	@GetMapping(value = "api/movieLike", produces = "application/json")
	public List<MovieVO> movieLike(){
		List<MovieVO> movies = movieService.getMovieListLike();
		return movies; 
	}
}
