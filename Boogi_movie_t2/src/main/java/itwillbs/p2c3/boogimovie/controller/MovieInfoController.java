package itwillbs.p2c3.boogimovie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import itwillbs.p2c3.boogimovie.service.MovieInfoService;
import itwillbs.p2c3.boogimovie.service.ReviewService;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.ReviewVO;


@Controller
public class MovieInfoController {
	@Autowired
	private MovieInfoService service;
	@Autowired
	private ReviewService serviceReview;
	
	@GetMapping("movieInfo")
    public String movieInfo(HttpSession session,int movie_num,MovieVO movie, Model model) {
        //System.out.println(movie_num); 확인완료 주석처리
        String member_id = (String) session.getAttribute("sId");
		System.out.println("여기는 무비인포 현재로그인한 " +member_id); 
        MovieVO movie2 = service.getMovieInfo(movie);
		model.addAttribute("movie", movie2);
		//System.out.println(movie2); 확인완료 주석처리
        
        List<ReviewVO> reviews = serviceReview.getReviewList(movie_num);
		
        //System.out.println(reviews); 확인완료 주석처리
        model.addAttribute("reviews", reviews);
        return "movie/movie_info"; // 뷰 이름은 적절하게 변경해야 합니다.
    }
	
//	@GetMapping("movieInfo")
//	public String movieInfo1(Model model) {
		
		
//		List<MovieVO> movieInfo = service.getMovieList();
//		model.addAttribute("movieInfo", movieInfo);
//		System.out.println(movieInfo);
		
		
		
		
//		return "movie/movie_info";
//	}
	

}
