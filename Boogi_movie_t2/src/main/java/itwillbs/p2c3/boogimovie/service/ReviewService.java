package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.ReviewMapper;
import itwillbs.p2c3.boogimovie.vo.ReviewVO;

@Service
public class ReviewService {
	@Autowired
	private ReviewMapper mapper;
	
	public int registReview(ReviewVO review) {
		
		return mapper.insertReview(review);
	}
	
	public List<ReviewVO> getReviewList(int movie_num){
		
		return mapper.selectReviewList(movie_num);
	}

	public List<ReviewVO> getReviewId(int review_num) {

		return mapper.selectReviewId(review_num);
	}

	public int updateReview(ReviewVO review2) {
		
		return mapper.updateReview(review2);
	}
	
	public int deleteReview(int review_id) {
		
		return mapper.deleteReview(review_id);
	}
	
}
