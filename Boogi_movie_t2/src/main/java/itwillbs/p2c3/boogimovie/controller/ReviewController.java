package itwillbs.p2c3.boogimovie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import itwillbs.p2c3.boogimovie.service.ReviewService;
import itwillbs.p2c3.boogimovie.vo.ReviewVO;
@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	
	@PostMapping("reviewPro")
	public String reviewInfo(Model model, ReviewVO review) {
	 
		System.out.println("리뷰" + review);

		int insertCount = service.registReview(review);
		System.out.println("실행결과" + insertCount);
		
		int movieNum = review.getMovie_num();
	    return "redirect:/movieInfo?movie_num=" + movieNum;
		
	}
	@PostMapping("reviewUpdate")
	public String reviewUpdate(ReviewVO review2, Model model) {
		//여기 팝업창이라서 팝업창을 클로즈함.
		//System.out.println("리뷰업데이트 데이터 확인" + review2 ); 데이터 전송확인 완료 주석처리함.
		int updateCount = service.updateReview(review2);
		if(updateCount > 0) {
			model.addAttribute("msg", "성공적으로 수정했습니다!");
			return "error/close";
		} else {
			model.addAttribute("msg", "별점 및 관람평 수정실패!");
			return "error/fail";
		}
					
	}
	
	@GetMapping("deleteReview")
	public String deleteReview(int review_num, Model model) {
		System.out.println("삭제리뷰"+ review_num);
		int deleteCount = service.deleteReview(review_num);
		if(deleteCount > 0) {
			model.addAttribute("msg", "성공적으로 삭제했습니다!");
			return "error/close";
		} else {
			model.addAttribute("msg", "삭제실패!");
			return "error/fail";
		}
		
	}
		

}
