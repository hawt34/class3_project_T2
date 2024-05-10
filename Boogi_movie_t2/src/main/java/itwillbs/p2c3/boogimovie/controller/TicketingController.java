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
import itwillbs.p2c3.boogimovie.service.TicketingService;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieGenreVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.MyTheaterVO;
import itwillbs.p2c3.boogimovie.vo.ScreenSessionVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Controller
public class TicketingController {
	
	@Autowired
	private MovieInfoService movieService;
	@Autowired
	private TheaterService theaterService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private TicketingService ticketingService;
	
	
	
	
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
	public List<MyTheaterVO> theaterMyTheater(@RequestParam String sId){
		MemberVO member = memberService.selectTheatersMyTheater(sId);
		List<MyTheaterVO> myTheaters = new ArrayList<MyTheaterVO>();
		myTheaters.add(new MyTheaterVO(member.getMember_my_theater1()));
		myTheaters.add(new MyTheaterVO(member.getMember_my_theater2()));
		myTheaters.add(new MyTheaterVO(member.getMember_my_theater3()));
		
		
		return myTheaters;
	}
	
	
	@ResponseBody
	@GetMapping(value = "api/finalList", produces = "application/json")
	public void finalList(@RequestParam String selectedMovie,@RequestParam String selectedTheater,@RequestParam String selectedDay){
		//가져온 영화이름정보로 무비번호 가져오기
		MovieVO movie = new MovieVO();
		movie.setMovie_name(selectedMovie);
		MovieVO dbMovie = movieService.getMovieInfo(movie);
		int movie_num = dbMovie.getMovie_num();
		
		//가져온 극장 정보로 극장번호 가져오기
		TheaterVO theater = new TheaterVO();
		theater.setTheater_name(selectedDay);
		int theater_num = theaterService.getTheaterName(selectedTheater);
		
		//종합한 정보를 vo에 담아 db접근
		ScreenSessionVO scs = new ScreenSessionVO();
		scs.setMovie_num(movie_num);
		scs.setTheater_num(theater_num);
		scs.setSelect_date(selectedDay);
		ScreenSessionVO dbScs = ticketingService.finalListSelect(scs);
		System.out.println(dbScs);
		
		
		
		
		
		
		
		
	}
	
		
		
}
