package itwillbs.p2c3.boogimovie.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import itwillbs.p2c3.boogimovie.service.MemberService;
import itwillbs.p2c3.boogimovie.service.MovieInfoService;
import itwillbs.p2c3.boogimovie.service.TheaterService;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieGenreVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Controller
public class TicketingController {
	
	@Autowired
	private MovieInfoService movieService;
	@Autowired
	private TheaterService theaterService;
	@Autowired
	private MemberService memberService;
	
	@GetMapping("tic_ticketing")
	public String ticketing(HttpSession session, Model model) {
		System.out.println("tic_ticketing()");
		
//		--로그인판별--
		
//		if(session.getAttribute("sId") == null) {
//			model.addAttribute("msg", "로그인 후 이용해주세요");
//			model.addAttribute("targetURL", "member_login");
//			return "error/fail";
//		}
		
		List<MovieVO> movieList = movieService.getMovieList();
		List<TheaterVO> theaterList = theaterService.getTheatersOrderbyName();
		
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
	
	@ResponseBody
	@GetMapping(value = "api/movieLikeMovie", produces = "application/json")
	public List<MovieVO> movieLikeMovie(@RequestParam String sId){
		String memberMovieGenre = memberService.movieGenreSearch(sId);
		MovieGenreVO movieGenre = new MovieGenreVO();
		movieGenre.setGenre_name(memberMovieGenre);
		int genre_num = movieService.getMovieGenreNum(movieGenre);
		List<MovieVO> movies = movieService.getMovieListGenre(genre_num);
		
		return movies;
	}
		
	@ResponseBody
	@GetMapping(value = "api/theaterMyTheater", produces = "application/json")
	public List<String> theaterMyTheater(@RequestParam String sId){
		MemberVO member = memberService.selectTheatersMyTheater(sId);
		List<String> Theaters = new ArrayList<String>();
		Theaters.add(member.getMember_my_theater1());
		Theaters.add(member.getMember_my_theater2());
		Theaters.add(member.getMember_my_theater3());
		
		return Theaters;
	}
	
		
		
}
