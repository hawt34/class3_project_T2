package itwillbs.p2c3.boogimovie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import itwillbs.p2c3.boogimovie.service.ReviewService;
import itwillbs.p2c3.boogimovie.vo.ReviewVO;
@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	
	@PostMapping("reviewPro")
	private String reviewInfo(Model model, ReviewVO review) {
	 
		System.out.println("리뷰" + review);

		int insertCount = service.registReview(review);
		System.out.println("실행결과" + insertCount);
		
		int movieNum = review.getMovie_num();
	    return "redirect:/movieInfo?movie_num=" + movieNum;
		
	}
}
