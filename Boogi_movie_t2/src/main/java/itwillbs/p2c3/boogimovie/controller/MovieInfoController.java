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
		//System.out.println("여기는 무비인포 현재로그인한 " +member_id); 확인완료 주석처리.
        
        MovieVO movie2 = service.getMovieInfo(movie);
		model.addAttribute("movie", movie2);
		//System.out.println(movie2); 확인완료 주석처리
        
        List<ReviewVO> reviews = serviceReview.getReviewList(movie_num);
		
        //System.out.println(reviews); 확인완료 주석처리
        model.addAttribute("reviews", reviews);
        return "movie/movie_info"; 
    }
	
	@GetMapping("reviewModify")
	public String reviewModify(int review_num, Model model) {
		//System.out.println("여기는 리뷰모디파이"+ review_id); 확인완료주석처리
		
		List<ReviewVO> reviews = serviceReview.getReviewId(review_num);
		model.addAttribute("reviews", reviews);
		//System.out.println(reviews); 확인완료 주석처리
		
		
		return "movie/review_modify";
	}


}
