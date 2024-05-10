package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.ReviewVO;

@Mapper
public interface ReviewMapper {

	int insertReview(ReviewVO review);
	List<ReviewVO> selectReviewList(int movie_num);
	List<ReviewVO> selectReviewId(int review_num);
	int updateReview(ReviewVO review2);
	int deleteReview(int review_num);
}
