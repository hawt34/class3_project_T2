package itwillbs.p2c3.boogimovie.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import itwillbs.p2c3.boogimovie.service.AdminService;
import itwillbs.p2c3.boogimovie.service.MovieInfoService;
import itwillbs.p2c3.boogimovie.service.ReviewService;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.ReviewVO;


@Controller
public class MovieController {
	@Autowired
	private MovieInfoService movieService;
	
	@Autowired
	AdminService adminService;
	
	
	@Autowired
	private ReviewService serviceReview;
	
	@GetMapping("movie")
	public String home(Model model , HttpSession session,MemberVO member, MovieVO movieTrail,Map<String, Object> map) {
		List<MovieVO> movieInfo = movieService.getMovieList();
		movieTrail = movieService.getMovieTrail();
		//System.out.println("무비트레일러"+movieTrail);
		model.addAttribute("movieTrail", movieTrail);
		model.addAttribute("movieInfo", movieInfo);
		String member_id = (String) session.getAttribute("sId");
		member = adminService.SelectMember(member_id);
		model.addAttribute("member", member);
		System.out.println("여기 영화인데 멤버 상세정보가 필요해"+member.getMember_movie_genre());
	
		
		 String member_movie_genre = member.getMember_movie_genre();
		    System.out.println("사용자의 선호 장르: " + member_movie_genre);
		    
		    // 테스트 목적으로 map에 선호 장르 데이터 넣기
		    
		    // 테스트 데이터 넣기
		    map.put(member_movie_genre, member_movie_genre);
		    
		    // map 출력하여 데이터 확인
		    System.out.println("맵의 내용: " + map);
		    
		    // 사용자의 선호 장르를 기반으로 영화 리스트 가져오기
		    List<MovieVO> genreBasedMovieList = movieService.getMovieListGenre(map);
		    
		    // genreBasedMovieList 출력하여 데이터 확인
		    System.out.println("선호 장르 기반 영화 리스트: " + genreBasedMovieList);
		    
		
		
		
		
		
		
		
		
		
		
		
		movieService.getMovieListGenre(null);
		
		
		
		
		
		model.addAttribute("member_id", member_id);
		//System.out.println(movieInfo);
		
		
		return "movie/movie";
	}
	
	
	@GetMapping("movieFutureInfo")// 상영예정작 상세보기
	public String movieFutureInfo(int movie_num, MovieVO futureMovie, Model model) {
		//System.out.println("여기는 상여예봉 무비" + movie_num); 정보확인완료
		MovieVO futureMov = movieService.getFutureMovieInfo(futureMovie);
		model.addAttribute("movieFutureInfo", futureMov);
		//System.out.println("각각의 개봉예정영화 정보" + futureMov);//정보확인완료
		
		return "movie/movieFuture_info";
	}
	

	@GetMapping("movieInfo")
    public String movieInfo(@RequestParam("movie_num") int movie_num, 
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
            Model model, MovieVO movie) {
        //System.out.println(movie_num); 확인완료 주석처리
		//System.out.println("여기는 무비인포 현재로그인한 " +member_id); 확인완료 주석처리.
        System.out.println("여기는 영화 상세페이지 " + pageNum);
        int listLimit = 5;
		
		int startRow = (pageNum - 1) * listLimit;
        MovieVO movie2 = movieService.getMovieInfo(movie);
		model.addAttribute("movie", movie2);
		//System.out.println(movie2); 확인완료 주석처리
        
        List<ReviewVO> reviews = serviceReview.getReviewList(movie_num, startRow, listLimit);
        int totalReviews = serviceReview.getTotalReviews(movie_num);
        int maxPage = (int) Math.ceil((double) totalReviews / listLimit);
        model.addAttribute("maxPage", maxPage);
        model.addAttribute("pageNum", pageNum);
        

        //System.out.println(reviews+"리뷰리스트확인"); 확인완료 주석처리
        model.addAttribute("reviews", reviews);
        return "movie/movie_info"; 
    }
	
	
	@GetMapping("movieFuture")// 상영예정작리스트
	public String movieFuture(Model model,MovieVO futureMovieTrail) {
		futureMovieTrail = movieService.getMovieFutureTrail();
		//System.out.println("무비트레일러"+movieTrail);
		model.addAttribute("futureMovieTrail", futureMovieTrail);
		List<MovieVO> movieFuture = movieService.getMovieFuture();
		model.addAttribute("movieFuture", movieFuture);
		//System.out.println("여기는 무비퓨처" + movieFuture);확인완료
	    return "movie/movieFuture";
	}
	@GetMapping("boxoffice")
	public String boxoffice() {
		
		return"movie/boxoffice";
	}
	

}
